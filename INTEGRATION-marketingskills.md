# Integración: marketingskills → Creative Strategy Session (Organic)

Mapa profundo de cómo el contenido de [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) (~55 skills) se incorpora a este sistema orgánico de 16 skills. Tres categorías: **(A) ya incorporado** en los skills nuevos, **(B) construir a continuación** con spec concreta, **(C) referencias para minar** cuando haga falta profundidad.

---

## CONTEXTO: por qué encajan (y por qué no del todo)

`marketingskills` es **amplio y de embudo completo** (SEO, CRO, paid, email, pricing, retención). Este sistema es **profundo y de creación orgánica** (reels, carruseles, talking-head, voiceover, tweets, LinkedIn, Substack, YouTube, email). El solapamiento real está en **5 áreas**: hooks, edición/voz, planificación de contenido, investigación de audiencia (VOC), y ángulos de tendencia. El resto de marketingskills (paid, SEO técnico, pricing, prospecting, RevOps) es **irrelevante** para lo orgánico y no se importa.

**Diferencia estructural clave:** marketingskills usa carpetas `skills/<nombre>/SKILL.md` + `references/` + `evals/evals.json` y se registra como plugin vía `.claude-plugin/plugin.json`. Este repo usa archivos planos `<nombre>_skill.md`, en español, sin `metadata.version` ni evals. Mantuve la convención de este repo en lo construido (ver sección de Empaquetado al final para la decisión de estructura).

---

## (A) YA INCORPORADO — en los dos skills nuevos

### 1. `director_creativo_skill.md` (orquestador) — NUEVO
Resuelve el gap #1 del sistema: no había nada que coordinara los 16 skills.

| Patrón importado de marketingskills | De dónde | Cómo se adaptó |
|---|---|---|
| Compuerta "Check for product marketing context first" | el gate universal de cada SKILL.md (raíz: `product-marketing.md`) | Reconvertido a "Verificación de Contexto": la raíz aquí es el **POV** (pov-finder), no product-marketing |
| Tabla de enrutamiento Intent→referencia ("The PR Mix") | `skills/public-relations/SKILL.md` | Convertido en el **Mapa de Enrutamiento Intent→Skill** del director |
| Grafo de dependencias / handoffs encadenados | patrón general de `Related Skills` + hand-off tables | Formalizado como **Cadena de Handoffs** con reconciliación de las referencias rotas (`yapping-scripting`, etc.) |

### 2. `voice_and_editing_skill.md` (filtro de voz/QA) — NUEVO
Resuelve el gap #2: no existía ninguna compuerta de calidad. Es el import de **mayor valor** de marketingskills.

| Contenido importado | De dónde | Cómo se adaptó |
|---|---|---|
| **Las Siete Pasadas** (Clarity→Voice→So What→Prove It→Specificity→Emotion→Zero Risk) | `skills/copy-editing/SKILL.md` ("The Seven Sweeps") | Traducido y calibrado por formato (TOF aligera Pasadas 4 y 7) |
| **AI-tells a eliminar** | `skills/copywriting/references/natural-transitions.md` ("Transitions to Avoid") | Reescrito como lista **en español** (los AI-tells en inglés no aplican) + tics estructurales |
| **Des-jergonizador** | `skills/copy-editing/references/plain-english-alternatives.md` (~250 pares) | Versión base español, ampliable |
| **Panel de revisores** (3-5 personas puntúan 1-10, iterar a ≥8) | `skills/copy-editing/SKILL.md` ("Expert Panel Scoring") | Re-skin a 3 revisores específicos del sistema (escéptico del scroll / audiencia real / guardián del POV) |
| Chequeo de consistencia con identidad | original del sistema | Usa el lenguaje verbatim del POV — distingue este skill de un editor genérico |

---

## (B) CONSTRUIR A CONTINUACIÓN — gaps con spec lista

Estos cierran las referencias rotas del sistema y traen lo mejor de marketingskills que NO cabía en el orquestador ni el filtro de voz. En orden de palanca:

### B1. `brand-intake_skill.md` / `customer-research` (VOC) — **el de mayor valor**
Cierra la referencia rota `brand-intake`. Hoy `pov-finder` excava la verdad de la marca por introspección, pero **nada mina el lenguaje real de la audiencia**.
- **Importar de:** `skills/customer-research/SKILL.md` + `references/source-guides.md`.
- **Qué traer:** los **Two Modes** (Analyze Existing / Go Find), el **Extraction Framework** (JTBD / Pain / Triggers / Outcomes / Language / Alternatives), el sistema de tagging (`#pain #trigger #outcome #language #alternative #objection`), y las playbooks de minería de **comentarios de TikTok/Instagram/YouTube** y subreddits.
- **Por qué encaja:** alimenta a pov-finder (Capa 3 audiencia, lenguaje verbatim) y a todos los skills de formato con hooks en palabras reales. Es el input que falta upstream del POV.

### B2. `trend-angles_skill.md` (trend-jacking) — alto valor, bajo esfuerzo
No existe nada que convierta una noticia/tendencia en contenido. Joya escondida en marketingskills.
- **Importar de:** `skills/public-relations/references/newsjacking.md`.
- **Qué traer:** **The Loop** (Detect→Score→Angle→Validate→Pitch→Post), el **rubric de newsworthiness** (Timeliness/Relevance/Angle-uniqueness ×2), y la **Story Angle Library** (7 ángulos: Data hot take / Contrarian / "Lo predijimos" / Customer impact / Insider explainer / Trend connector / Founder POV).
- **Adaptación:** quitar la parte de pitch a prensa; quedarse con generar **ángulos de contenido** anclados al POV. Se enchufa al ecosystem-architect como fuente de backbones reactivas.

### B3. `format-multiplier_skill.md` — cierra referencia rota
Cierra `strategic-multiplier`/`format-multiplier`. Hoy lo aproxima el Flow Engine del ecosystem-architect, pero no hay skill dedicado a tomar UNA idea y generar N variantes de ángulo/formato.
- **Importar de:** `skills/social/references/short-form-video.md` (content atoms) + el sistema de repurposing del propio ecosystem-architect.
- **Qué traer:** la tabla de **"content atoms"** (Quotable / Story arc / Tactical tip / Controversial / Data callout / BTS → mejor plataforma) y las cuotas por pieza (3-5 clips, 1-2 LinkedIn, 1 thread, 1 carrusel, 1 newsletter).

### B4. `content-calendar` / refuerzo del ecosystem-architect
- **Importar de:** `skills/content-strategy/SKILL.md` (Searchable vs Shareable, buyer-stage, rubric de priorización ponderada: Customer Impact 40 / Fit 30 / Search 20 / Resource 10) y `skills/marketing-ideas/references/ideas-by-category.md` (banco de ideas para semillar el calendario).
- **No como skill nuevo necesariamente** — puede ser un `references/` del ecosystem-architect.

### B5. Banco de hooks canónico
Hoy los hooks están dispersos (pov-finder tiene su lógica, fast-reel tiene 3 palancas, cada skill su apertura). marketingskills tiene **dos bancos** consolidables.
- **Importar de:** `skills/social/references/short-form-video.md` (Video Hook Library, 4 categorías por objetivo) + `skills/social/references/post-templates.md` (Hook Formulas escritas).
- **Acción:** crear `references/banco-de-hooks.md` compartido, al que apunten todos los skills de formato. Evita que cada skill reinvente hooks.

---

## (C) REFERENCIAS PARA MINAR — profundidad bajo demanda

Cuando un skill necesite más profundidad, estos archivos de marketingskills son la fuente. **No copiar entero: extraer el framework y traducir/adaptar.**

| Necesidad | Archivo fuente en marketingskills | Qué tiene |
|---|---|---|
| Estructuras de video corto | `skills/social/references/short-form-video.md` | Beat sheets (Story Arc 45-60s, POV/Skit 15-30s), checklists visuales, workflow de batch |
| Plantillas por plataforma | `skills/social/references/post-templates.md` | Skeletons de LinkedIn/Twitter/Instagram carrusel/reel |
| Reverse-engineering de cuentas | `skills/social/references/reverse-engineering.md` | Framework de 6 pasos + principios "LAYER VOICE" |
| Timing y límites por plataforma | `skills/social/references/platforms.md` + `platform-limits.md` | Mejores horas, frecuencia, caps de caracteres/hashtags |
| Modelos de persuasión | `skills/marketing-psychology/SKILL.md` | Zeigarnik (ya usado en text-screen), Peak-End, Pratfall, AIDA, B=MAP, tabla Challenge→modelo |
| Prompts de B-roll IA | `skills/video/references/ai-video-prompting.md` | Estructura `[Sujeto]+[Acción]+[Cámara]+[Estilo]+[Luz]+[Specs]`, vocabulario de cámara |
| Refresh de contenido evergreen | `skills/copy-editing/references/content-refresh.md` | Matriz Refresh-vs-Rewrite, checklist de 6 pasadas |
| Distribución (owned/rented/borrowed) | `skills/launch/SKILL.md` | The ORB Framework, tiers Major/Medium/Minor update |
| Headlines→hooks/títulos | `skills/copywriting/references/copy-frameworks.md` | 6 categorías de fórmulas de headline (reusables como títulos de YouTube/asuntos de email) |

---

## DÓNDE IR MÁS A FONDO (fuentes externas)

Para profundizar más allá de marketingskills, en orden de relevancia:

1. **El propio repo marketingskills** — está vivo y crece; revisar `VERSIONS.md` y el README auto-generado (`<!-- SKILLS:START -->`) para skills nuevos. Es la fuente más directa.
2. **Motion creative frameworks** ([motionapp.com/library/frameworks](https://motionapp.com/library/frameworks)) — es la base de tu OTRO repo (creative-strategy-agent, el de paid). Unificar vocabulario entre ambos sistemas (paid + organic) sale de aquí.
3. **anthropics/skills** ([github.com/anthropics/skills](https://github.com/anthropics/skills)) — los skills oficiales `brand-guidelines`, `frontend-design`, `canvas-design` para activos visuales; y `skill-creator` para escalar la autoría de skills nuevos del sistema.
4. **knowledge-work-plugins → `marketing`** ([github.com/anthropics/knowledge-work-plugins](https://github.com/anthropics/knowledge-work-plugins)) — el plugin oficial de marketing de Anthropic; contrastar enfoque y conectores (Canva/Notion ya conectados en tu cuenta).
5. **Garry Tan `gstack`** — NO para contenido, pero su patrón de orquestación (`/autoplan`, handoffs con context-passing, `/learn` para memoria de sesión) es buena referencia de **arquitectura de orquestador** si quieres que el director-creativo evolucione.

---

## EMPAQUETADO (decisión pendiente del creador)

Hoy el repo son archivos planos `*_skill.md`. Dos caminos:

- **Mantener plano** (lo que hice): simple, cada archivo es un skill suelto. Funciona como drop-in en `~/.claude/skills/`. Bien para iterar rápido.
- **Migrar a plugin** (como marketingskills): reestructurar a `skills/<nombre>/SKILL.md` + añadir `.claude-plugin/plugin.json` y `marketplace.json`. Esto lo hace **instalable con `/plugin`** y compartible. Recomendado cuando el sistema se estabilice.

Si migras a plugin, añadir también `evals/evals.json` por skill (5-6 casos cada uno, incluyendo un caso-borde que derive a otro skill) replica el control de calidad de marketingskills.

---

## RESUMEN DE ACCIONES

- [x] Orquestador `director-creativo` — coordina los 16 skills, compuerta de POV, mapa de enrutamiento, reconciliación de referencias rotas.
- [x] Filtro `voice-and-editing` — Siete Pasadas + AI-tells español + des-jergonizador + panel + chequeo de POV.
- [ ] B1 `brand-intake`/VOC — minería de lenguaje real de audiencia (mayor valor pendiente).
- [ ] B2 `trend-angles` — trend-jacking anclado al POV.
- [ ] B3 `format-multiplier` — cierra referencia rota, content atoms.
- [ ] B4 refuerzo del ecosystem-architect con content-strategy + banco de ideas.
- [ ] B5 `references/banco-de-hooks.md` compartido.
- [ ] Decisión de empaquetado (plano vs plugin).
