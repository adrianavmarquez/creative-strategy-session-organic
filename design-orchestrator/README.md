# Design Orchestrator

Router maestro de diseño para Claude (claude.ai y Claude Code) con 24 sub-skills organizados en 6 capas: Dirección (impeccable, taste), Referencia (UI/UX Pro Max), Estilo (minimalist, brutalist, high-end), Imagen (brandkit, imagegen, image-to-code), Motion y Polish (Emil Kowalski), y Auditoría (Vercel web-design-guidelines).

Solo el orchestrator se registra como skill: los sub-skills viven debajo en `skills/` y se cargan bajo demanda según la tabla de routing del `SKILL.md`. Cero colisiones de triggers.

## Por qué este repo no incluye los 24 sub-skills

Los sub-skills son de terceros (pbakaus, Leonxlnx, emilkowalski, vercel-labs, nextlevelbuilder). En vez de republicarlos, el `scripts/install.sh` los instala desde sus fuentes originales y aplica los fixes de paths. Ventajas: sin líos de licencias, siempre la última versión de cada autor, y el repo pesa nada.

## Instalación

Requisitos: git, node (npx), python3.

```bash
git clone https://github.com/adrianavmarquez/creative-strategy-session-organic.git
cd creative-strategy-session-organic/design-orchestrator
bash scripts/install.sh          # instala en ~/.claude/skills (default)
bash scripts/install.sh /ruta    # o en una base custom
```

El script deja la estructura:

```
~/.claude/skills/
├── design-orchestrator/
│   ├── SKILL.md
│   └── skills/            (24 sub-skills)
└── full-output-enforcement/   (utility general, en la raíz)
```

## Uso

Pide diseño normal ("hazme una landing", "audita esta UI", "brand board") y el router enruta solo. Para forzar un sub-skill, nómbralo. Las capas, recetas y reglas de conflicto están en `SKILL.md`.

## Fuentes de los sub-skills

- impeccable: github.com/pbakaus/impeccable
- taste pack (13 skills): github.com/Leonxlnx/taste-skill
- Emil Kowalski (3 skills): github.com/emilkowalski/skill
- web-design-guidelines: github.com/vercel-labs/agent-skills
- UI/UX Pro Max (+6 sub-skills): github.com/nextlevelbuilder/ui-ux-pro-max-skill
