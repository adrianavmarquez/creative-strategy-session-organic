# Instalación en Claude Code

## Rápida (recomendada)

```bash
cd design-orchestrator
bash scripts/install.sh
```

Instala en `~/.claude/skills/`. Requiere git, node y python3. Al terminar, reinicia la sesión de Claude Code.

## Verificación

```bash
ls ~/.claude/skills/design-orchestrator/skills | wc -l   # debe dar 24
node ~/.claude/skills/design-orchestrator/skills/impeccable/scripts/context.mjs
python3 ~/.claude/skills/design-orchestrator/skills/ui-ux-pro-max/scripts/search.py "editorial minimal" --domain style
```

## Instalación por proyecto

```bash
bash scripts/install.sh /ruta/al/proyecto/.claude/skills
```

El script corrige automáticamente todos los paths internos hacia la base que le pases.

## Uso

Pide diseño normal y el orchestrator enruta al sub-skill correcto. Para forzar uno: "usa impeccable audit", "usa minimalist-ui", etc. Rutas, capas, recetas y reglas: ver `SKILL.md`.
