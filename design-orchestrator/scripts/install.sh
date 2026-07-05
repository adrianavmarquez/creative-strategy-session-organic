#!/usr/bin/env bash
# Design Orchestrator installer
# Instala el router + 24 sub-skills desde sus fuentes originales y corrige paths.
# Uso: bash scripts/install.sh [BASE]   (default BASE: ~/.claude/skills)
set -euo pipefail

BASE="${1:-$HOME/.claude/skills}"
DEST="$BASE/design-orchestrator"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

for bin in git node npx python3; do
  command -v "$bin" >/dev/null || { echo "FALTA: $bin"; exit 1; }
done

mkdir -p "$DEST/skills"
cp "$REPO_DIR/SKILL.md" "$DEST/SKILL.md"
echo "[1/6] Router copiado a $DEST"

cd "$TMP"
echo "[2/6] Instalando impeccable, taste pack y Emil Kowalski via skills CLI..."
npx -y skills add pbakaus/impeccable -y >/dev/null 2>&1 || npx -y skills add pbakaus/impeccable -y
npx -y skills add Leonxlnx/taste-skill -y >/dev/null 2>&1 || true
npx -y skills add emilkowalski/skill -y >/dev/null 2>&1 || true

echo "[3/6] Instalando web-design-guidelines (Vercel) y UI/UX Pro Max desde git..."
git clone --depth 1 https://github.com/vercel-labs/agent-skills.git vercel-skills >/dev/null 2>&1
git clone --depth 1 https://github.com/nextlevelbuilder/ui-ux-pro-max-skill.git uipromax >/dev/null 2>&1

# Mover skills del CLI al orchestrator (full-output-enforcement va a la raiz)
if [ -d .agents/skills ]; then
  for d in .agents/skills/*/; do
    name="$(basename "$d")"
    if [ "$name" = "full-output-enforcement" ]; then
      rm -rf "$BASE/full-output-enforcement"; cp -r "$d" "$BASE/full-output-enforcement"
    else
      rm -rf "$DEST/skills/$name"; cp -r "$d" "$DEST/skills/$name"
    fi
  done
fi

# Vercel web-design-guidelines
rm -rf "$DEST/skills/web-design-guidelines"
cp -r vercel-skills/skills/web-design-guidelines "$DEST/skills/web-design-guidelines"

echo "[4/6] Ensamblando ui-ux-pro-max (SKILL.md desde template + data + scripts)..."
UIPM="$DEST/skills/ui-ux-pro-max"
rm -rf "$UIPM"; mkdir -p "$UIPM"
cp -r uipromax/src/ui-ux-pro-max/scripts "$UIPM/scripts"
cp -r uipromax/src/ui-ux-pro-max/data "$UIPM/data"
rm -rf "$UIPM/scripts/__pycache__" 2>/dev/null || true
python3 - "$TMP/uipromax" "$UIPM" << 'PYEOF'
import json, sys
src, dest = sys.argv[1], sys.argv[2]
cfg = json.load(open(f'{src}/src/ui-ux-pro-max/templates/platforms/claude.json'))
content = open(f'{src}/src/ui-ux-pro-max/templates/base/skill-content.md').read()
quickref = open(f'{src}/src/ui-ux-pro-max/templates/base/quick-reference.md').read()
fm = cfg['frontmatter']
skill = f"---\nname: {fm['name']}\ndescription: {fm['description']}\n---\n\n"
body = content.replace('{{TITLE}}', cfg['title']).replace('{{DESCRIPTION}}', cfg['description']).replace('{{QUICK_REFERENCE}}', quickref)
open(f'{dest}/SKILL.md','w').write(skill + body)
PYEOF
# Sub-skills de UI/UX Pro Max con prefijo uipm- (evita colisiones de nombres genericos)
for d in uipromax/cli/assets/skills/*/; do
  name="$(basename "$d")"
  rm -rf "$DEST/skills/uipm-$name"; cp -r "$d" "$DEST/skills/uipm-$name"
done

echo "[5/6] Corrigiendo paths hardcodeados..."
# impeccable: .agents/skills/impeccable -> ruta absoluta final
grep -rl "\.agents/skills/impeccable" "$DEST/skills/impeccable" 2>/dev/null | while read -r f; do
  sed -i.bak "s|\.agents/skills/impeccable|$DEST/skills/impeccable|g" "$f" && rm -f "$f.bak"
done
# ui-ux-pro-max: referencias relativas -> ruta absoluta final
sed -i.bak "s|skills/ui-ux-pro-max/scripts/|$UIPM/scripts/|g; s|python scripts/search.py|python $UIPM/scripts/search.py|g; s|python3 scripts/search.py|python3 $UIPM/scripts/search.py|g" "$UIPM/SKILL.md" && rm -f "$UIPM/SKILL.md.bak"

echo "[6/6] Smoke tests..."
node "$DEST/skills/impeccable/scripts/context.mjs" >/dev/null 2>&1 && echo "  OK impeccable/context.mjs" || echo "  WARN: impeccable context.mjs (revisar node)"
python3 "$UIPM/scripts/search.py" "editorial minimal" --domain style >/dev/null 2>&1 && echo "  OK ui-ux-pro-max/search.py" || echo "  WARN: ui-ux-pro-max search.py (revisar python3)"

total=$(ls -d "$DEST/skills"/*/ 2>/dev/null | wc -l | tr -d ' ')
echo ""
echo "Listo: $total sub-skills en $DEST/skills (esperados: 24)"
echo "Reinicia tu sesion de Claude Code para que registre el orchestrator."
