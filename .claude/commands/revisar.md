---
description: Revisión completa de las tres capas (domain, data, presentation) y su integración
---

Haz una revisión **completa** de este proyecto Flutter, capa por capa.

Lee `lib/src/` entero (y `lib/main.dart` + la inyección de dependencias). Si
cambié de arquitectura, adáptate a lo que encuentres y dímelo.

Revisa en este orden y con criterio de clean architecture:

1. **domain** — independencia de capa, entidades inmutables, casos de uso con
   una responsabilidad, contratos abstractos.
2. **data** — models con serialización, datasources que aíslan infraestructura,
   repos que traducen errores a `Failure`.
3. **presentation** — estados bien modelados, cubits/blocs con dependencias
   inyectadas, widgets limpios y `const`.
4. **Integración** — la regla de dependencias se respeta (presentation → domain
   ← data), la inyección de dependencias registra todo correctamente, `main.dart`
   arranca bien.

Entrega los hallazgos agrupados por capa, cada uno con `archivo:línea`, por qué
importa y la corrección concreta. Al final, un veredicto corto: ¿qué está bien y
qué es lo más importante a mejorar? **No modifiques código** a menos que te lo
pida después.
