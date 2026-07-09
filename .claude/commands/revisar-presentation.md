---
description: Revisa la capa presentation (páginas, widgets, cubits/blocs y estados)
---

Revisa la capa **presentation** de este proyecto Flutter.

Lee todo lo que haya en `lib/src/presentation/`. Si cambié de arquitectura y la
estructura es distinta (bloc en vez de cubit, otro gestor de estado, etc.),
adáptate a lo que encuentres y dímelo.

Evalúa con criterio de clean architecture + buenas prácticas de Flutter:

- **Dirección de dependencias**: presentation usa casos de uso de domain (vía
  inyección), no llama a datasources ni repos directamente.
- **Gestión de estado**: estados `sealed` bien modelados, transiciones
  correctas (loading/loaded/error), sin lógica de negocio en los widgets.
- **Cubits/Blocs**: reciben sus dependencias por constructor, manejan errores,
  no exponen detalles de data.
- **Widgets**: `const` donde se pueda, `build` limpio, listas con `key` cuando
  aplica, imágenes de red con placeholder/errorBuilder, sin trabajo pesado en
  `build`.
- **Dart/Flutter idiomático**: null-safety, naming, imports ordenados.

Para cada hallazgo di `archivo:línea`, por qué es un problema y la corrección
concreta. Si todo está correcto, dilo claramente. **No modifiques código** a
menos que te lo pida después.
