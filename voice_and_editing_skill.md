---
name: voice-and-editing
description: >
  Filtro de voz y edición para toda pieza del sistema antes de publicar. Activar SIEMPRE que el creador diga "revisa esto", "púlelo", "esto suena a IA", "falta voz", "edítalo", "pásale el filtro", "está muy genérico", o cualquier variación. También activar automáticamente cuando el director-creativo o un skill de formato termine un borrador y haya que verificar voz antes de cerrar.
  Este skill no escribe contenido nuevo: lo afila. Corre Las Siete Pasadas (claridad, voz, "y qué", pruébalo, especificidad, emoción, riesgo cero), elimina AI-tells en español, des-jergoniza, verifica consistencia con el POV de la marca, y puntúa con un panel de revisores hasta que la pieza promedie 8/10 o más. Adaptado de los frameworks de copy-editing del paquete marketingskills al español orgánico y a la voz del creador.
---

# Voice & Editing — El Filtro de Voz del Sistema

## Qué hace este skill

Toma cualquier pieza en borrador — reel, caption, carrusel, post, email, essay — y la afila hasta que suene a la marca y no a una IA educada. Es la última compuerta del sistema antes de publicar. Ningún skill de formato verifica AI-tells, jerga ni consistencia con el POV: este lo hace.

No reescribe por reescribir. Diagnostica qué falla, lo nombra, y propone la versión afilada. El creador decide qué acepta.

---

## APERTURA

Al activar, identificar el contexto en un bloque:

> "Pásame la pieza y dos datos:
>
> 1. **Formato y plataforma:** ¿qué es y dónde va? (define qué pasadas aplican)
> 2. **POV de la marca:** ¿tengo el posicionamiento a mano, o lo trabajo solo por instinto de voz?"

Si hay POV disponible (de pov-finder), usarlo como vara de consistencia. Si no, editar por principios de voz pero marcar que la consistencia con identidad no se pudo verificar.

---

## LAS SIETE PASADAS

Correr en orden. Cada pasada tiene un trabajo. No saltar pasadas, pero sí calibrar según formato: en contenido TOF (reel, text-screen) las pasadas 4 (Pruébalo) y 7 (Riesgo cero) se aligeran; en email de venta y essay aplican completas.

```
PASADA              PREGUNTA QUE RESPONDE                          QUÉ BUSCA
──────────────────────────────────────────────────────────────────────────────────────
1. CLARIDAD         ¿Se entiende a la primera lectura?             Frases torcidas, doble
                                                                   negación, antecedentes
                                                                   ambiguos, párrafos densos.

2. VOZ Y TONO       ¿Suena a esta marca o a cualquiera?            Genérico, corporativo,
                                                                   AI-tells. Compara con la
                                                                   voz del POV.

3. Y QUÉ            ¿Por qué le importa esto al que lo lee?         Afirmaciones sin
                    (el "so what")                                  consecuencia. Datos sin
                                                                   implicación emocional.

4. PRUÉBALO         ¿Hay prueba o es solo claim?                   Adjetivos sin evidencia,
                                                                   "el mejor", promesas sin
                                                                   ancla concreta.

5. ESPECIFICIDAD    ¿Es concreto o es humo?                        Vaguedad: "muchos", "mejor",
                                                                   "calidad", "valor". Pide
                                                                   número, nombre, momento.

6. EMOCIÓN          ¿Mueve algo o solo informa?                    Texto plano donde el POV
    HEIGHTENED      Sube la temperatura emocional un grado.        permite tensión, ironía,
                                                                   confesión, filo.

7. RIESGO CERO      ¿Hay fricción que frena la acción?             En piezas con CTA: dudas no
                    (solo si hay conversión)                       resueltas, fricción, pedido
                                                                   demasiado grande.
```

Para cada pasada que encuentre algo, reportar así:
```
PASADA [N] — [nombre]
Problema: [qué falla, citando el fragmento]
Por qué importa: [una línea]
Versión afilada: "[reescritura concreta]"
```

---

## AI-TELLS EN ESPAÑOL (eliminación obligatoria)

La Pasada 2 caza estos patrones. Son las marcas que delatan texto generado y matan la voz orgánica. Si aparecen, se reescriben sin excepción.

**Frases muletilla a eliminar:**
- "En el mundo actual / en la era digital / en el panorama actual"
- "Es importante destacar / cabe mencionar / vale la pena señalar"
- "Sumérgete en / adéntrate en / exploremos"
- "Desbloquea / potencia / lleva al siguiente nivel / eleva"
- "No es solo X, es Y" (cuando es relleno, no contraste real)
- "Ya sea... o..." como apertura
- "En resumen / en conclusión / en definitiva" (en contenido corto)
- "La clave está en / el secreto es / aquí está la verdad"
- "Imagina un mundo donde / ¿y si te dijera que?"
- "Game-changer / revolucionario / disruptivo / transformador"

**Tics estructurales de IA a eliminar:**
- Listas de tres adjetivos en serie ("claro, conciso y efectivo")
- Simetría excesiva: cada frase con la misma longitud y ritmo
- Cierres que resumen lo ya dicho en vez de aterrizar o abrir
- Transiciones que anuncian la estructura ("Primero... Además... Por último...")
- Optimismo neutro sin postura: todo "puede ayudar a", nada afirma

**Regla de transiciones:** preferir transiciones conversacionales (pregunta directa, causa-efecto sin conector formal, frase corta de impacto) sobre conectores académicos ("por consiguiente", "asimismo", "de igual manera"). El ritmo orgánico es: frase larga, frase corta. Respira. Aterriza.

---

## DES-JERGONIZADOR

Reemplazar palabra corporativa por palabra humana. Lista base (ampliable):

```
EN VEZ DE                       USAR
─────────────────────────────────────────────────
"aprovechar / leverage"          "usar"
"implementar"                    "hacer / poner"
"optimizar"                      "mejorar / afinar"
"solución"                       "lo que resuelve / la herramienta"
"impactar"                       "cambiar / mover"
"empoderar"                      "darle poder / que pueda"
"escalar"                        "crecer"
"robusto"                        "sólido / fuerte"
"holístico"                      "completo / entero"
"sinergia"                       (eliminar siempre)
"agregar valor"                  (decir el valor concreto)
"a nivel de"                     "en"
"en términos de"                 (eliminar, ir directo)
"realizar"                       "hacer"
```

Regla: si una palabra no la diría el creador en voz alta hablando con un amigo, no va en la pieza.

---

## PANEL DE REVISORES

Para piezas de alto peso (email de venta, essay, post backbone), simular un panel de 3 lectores que puntúan 1-10 y iterar hasta promedio ≥ 8.

```
REVISOR                  QUÉ EVALÚA                          PUNTÚA
─────────────────────────────────────────────────────────────────
El escéptico del scroll  ¿Me detengo o sigo de largo?        Hook / 10
El de la audiencia real  ¿Esto me habla a mí o a "todos"?    Resonancia / 10
El guardián del POV      ¿Suena a esta marca específica?     Consistencia / 10

PROMEDIO: X/10
```

Si el promedio es menor a 8, identificar qué revisor bajó la nota, aplicar la pasada correspondiente, y volver a puntuar. Máximo 3 rondas.

---

## VERIFICACIÓN DE CONSISTENCIA CON EL POV

Esto es lo que distingue a este skill de un editor genérico: no solo pule, verifica identidad. Si hay POV disponible, chequear:

- **¿La pieza activa una capa del POV?** Si no se puede nombrar qué creencia, audiencia o promesa mueve, la pieza es contenido decorativo, no estratégico. Marcarlo.
- **¿El lenguaje usa las palabras del creador?** El POV captura lenguaje verbatim de la marca. Si la pieza usa sinónimos corporativos en vez de las palabras reales de la marca, devolver a las palabras del POV.
- **¿La postura es coherente?** Si el POV es polarizante y la pieza es tibia, la pieza traiciona la identidad. Subir el filo o nombrar por qué se bajó.

```
CHEQUEO DE POV
Capa activada:        [cuál / ninguna detectable]
Lenguaje de marca:    [usa las palabras del POV / usa sinónimos genéricos]
Coherencia de postura: [coherente / tibia respecto al POV]
```

---

## ENTREGA FINAL

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
PIEZA REVISADA — [formato / plataforma]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

HALLAZGOS POR PASADA:
[solo las pasadas que encontraron algo, con su versión afilada]

AI-TELLS ELIMINADOS: [lista de los que aparecían]

CHEQUEO DE POV: [resultado del bloque de consistencia]

PUNTAJE DEL PANEL: [X/10 — y qué subió o bajó la nota]

─────────────────────────────
VERSIÓN FINAL AFILADA:
[la pieza completa reescrita, lista para publicar]

NOTA DEL EDITOR:
[una línea: qué cambió de fondo y por qué la versión final es más de la marca]
```

---

## REGLAS

**Diagnosticar antes de reescribir.** Nombrar qué falla y por qué, no solo entregar otra versión. El creador aprende el patrón y lo evita la próxima.

**No matar la voz cruda.** El sistema valora imperfección intencional (TikTok raw, Substack dump). No pulir hasta esterilizar. Una pieza que suena humana con una arruga es mejor que una perfecta sin pulso.

**El POV manda sobre la regla.** Si una "regla de buena escritura" choca con la voz definida en el POV, gana el POV. Este skill sirve a la identidad de la marca, no a un manual genérico.

**Máximo 3 rondas de panel.** Después de eso, la pieza está lista o el problema es de fondo (concepto, no edición) y hay que volver al skill de formato o al POV.

---

## HANDOFF

Recibe de: cualquier skill de formato (vía director-creativo) o directo del creador con una pieza ya escrita.

Alimenta a: el creador, con la pieza lista. Si detecta que el problema es de concepto y no de edición, devuelve al `director-creativo` con la nota de qué skill upstream tiene que retomar (formato, ecosystem-architect, o pov-finder).
