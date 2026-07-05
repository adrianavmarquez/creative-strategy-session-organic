---
name: design-orchestrator
description: Router maestro para TODO trabajo de diseño web, UI/UX y visual. Activar SIEMPRE que Adri pida diseñar, rediseñar, crear o mejorar una web, landing page, dashboard, portfolio, app UI, componente, artifact HTML o mockup; elegir estilo visual, paleta, tipografía o font pairing; crear brand boards, logo systems o imágenes de referencia de diseño; convertir una imagen o screenshot a código; revisar o auditar UI, UX, accesibilidad o animaciones; agregar motion, microinteracciones o polish a una interfaz. Triggers: "diseña", "rediseña", "hazme una landing", "mejora este diseño", "se ve genérico", "audita esta UI", "review my UI", "brand board", "image to code", "qué estilo le va", "anima esto", "hazlo más premium", "más minimalista", "más brutalist". Este skill NO ejecuta diseño por sí mismo: enruta al sub-skill correcto en skills/ y define qué combinación cargar. Nunca cargar un sub-skill de diseño sin pasar por este router primero.
---

# Design Orchestrator

Router del stack de diseño de Adri. Los 24 sub-skills viven en `~/.claude/skills/design-orchestrator/skills/<nombre>/SKILL.md`. Este archivo decide CUÁLES cargar y en qué orden. Regla de oro: cargar el mínimo de sub-skills que resuelva la tarea (normalmente 1 a 3, nunca más de 4).

## Regla 0: Marca de Adri primero

Si el proyecto es de una marca de Adri (Motus, @bycelestinajewels / Celestina, Sparked Reactions, BULK HVAC, Creatividad²), su brand spec MANDA sobre cualquier paleta o tipografía que sugiera un sub-skill. Constantes de marca personal: paleta blanco y negro dominante con acentos #D72323, #FFBA35, #3846C4, #F2E9FF, #2EA4FB; Poppins como fuente principal. Los sub-skills aportan estructura, jerarquía, spacing y craft, NO reemplazan la identidad. El paso de "genera paleta" de impeccable (palette.mjs) y el design system de ui-ux-pro-max se saltan o se alimentan con la marca existente.

## Las 6 capas del stack

| Capa | Rol | Sub-skills |
|---|---|---|
| 1. Dirección | El diseñador senior: decide y construye | impeccable (default), design-taste-frontend, gpt-taste |
| 2. Referencia | Base de datos consultable: estilos, paletas, fuentes, charts | ui-ux-pro-max |
| 3. Estilo | Lentes visuales específicos | minimalist-ui, industrial-brutalist-ui, high-end-visual-design |
| 4. Imagen | Generación de referencias visuales y brand assets | brandkit, imagegen-frontend-web, imagegen-frontend-mobile, image-to-code, uipm-banner-design, uipm-slides |
| 5. Motion y Polish | Detalle fino, animación, microinteracciones | emil-design-eng, animation-vocabulary, uipm-ui-styling |
| 6. Auditoría | Quality gates: flagean, no generan | web-design-guidelines, review-animations, redesign-existing-projects (audit + fix) |

## Tabla de routing por tarea

| Tarea | Cargar (en orden) |
|---|---|
| Web/landing/portfolio nueva desde cero | impeccable + ui-ux-pro-max (consultar estilo/fuentes/paleta ANTES de codear) |
| Dashboard o app UI nueva | impeccable (registro product) + ui-ux-pro-max (dominio chart si hay data viz) |
| Rediseñar/mejorar algo existente ("se ve genérico", "hazlo premium") | rediseña-existing-projects + high-end-visual-design |
| "Quiero estilo minimalista/editorial" | minimalist-ui + impeccable |
| "Quiero estilo brutalist/industrial/terminal" | industrial-brutalist-ui + impeccable |
| Elegir estilo, paleta, fuente o chart (solo consulta, sin codear) | ui-ux-pro-max solo (usar search.py) |
| Brand board, logo system, identity deck | brandkit (+ uipm-brand si pide guidelines doc) |
| Imágenes de referencia de un sitio (una por sección) | imagegen-frontend-web |
| Concepts de screens mobile | imagegen-frontend-mobile |
| Screenshot/imagen a código | image-to-code + impeccable |
| Banners o thumbnails | uipm-banner-design |
| Slides/presentaciones con criterio de diseño | uipm-slides (junto al pptx skill público si el output es .pptx) |
| Agregar motion/animación/microinteracciones | emil-design-eng (+ animation-vocabulary si Adri describe el efecto vago y falta el término) |
| Revisar animaciones ya escritas | review-animations |
| Auditar UI/UX/accesibilidad de código existente | web-design-guidelines (fetch de reglas vivas, output file:line) |
| Design system / tokens formales | uipm-design-system + impeccable |
| DESIGN.md para Google Stitch | stitch-design-taste |
| Sub-comando explícito de impeccable (craft, audit, polish, bolder, quieter, colorize, animate, harden, distill, extract...) | impeccable directo, leer su reference/<comando>.md |

## Recetas de stack completo (proyectos grandes)

Landing page premium end to end:
1. ui-ux-pro-max → search de estilo + fuentes + paleta para la industria
2. impeccable → construcción (registro brand, leer reference/brand.md)
3. emil-design-eng → pase de polish y microinteracciones
4. web-design-guidelines → audit final antes de entregar

Rediseño de sitio de cliente:
1. web-design-guidelines → audit del estado actual (baseline)
2. redesign-existing-projects + high-end-visual-design → upgrade
3. review-animations → si tocaste motion
4. web-design-guidelines → audit de salida (comparar contra baseline)

## Reglas de conflicto

1. UNA sola capa de Dirección activa a la vez. Default: impeccable. Usar design-taste-frontend solo si Adri lo pide por nombre o pide explícitamente "anti-slop/taste". gpt-taste solo si pide GSAP o estructura AIDA estricta.
2. design-taste-frontend-v1 es LEGACY: solo si un proyecto viejo depende de su comportamiento exacto. Nunca por routing automático.
3. uipm-design y uipm-brand son redundantes con impeccable y brandkit: solo por nombre explícito.
4. Los auditores (capa 6) nunca generan diseño nuevo: flagean y proponen fixes puntuales.
5. Si dos sub-skills dan reglas contradictorias (ej. spacing), gana la capa de Dirección activa. La Referencia (ui-ux-pro-max) informa, no manda.
6. full-output-enforcement (vive en la raíz de user skills, fuera de este orchestrator) se puede sumar a cualquier receta cuando el output de código deba ser completo y sin placeholders.

## Notas técnicas

- impeccable corre `node .../impeccable/scripts/context.mjs` una vez por sesión (paths ya corregidos a absolutos). Si reporta NO_PRODUCT_MD en un proyecto real de Adri, seguir su reference/init.md; en artifacts rápidos de una sola pieza, se puede saltar el requisito de PRODUCT.md y anotar la decisión.
- ui-ux-pro-max se consulta vía `python3 ~/.claude/skills/design-orchestrator/skills/ui-ux-pro-max/scripts/search.py "<query>" --domain <style|color|typography|chart|ux|icons|motion>` o `--design-system` para el paquete completo.
- Output final siempre respeta las reglas globales de Adri: cero em-dashes, Poppins y colores de marca en docs propios.
