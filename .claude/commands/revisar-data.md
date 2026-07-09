---
description: Revisa la capa data (datasources, models, implementaciones de repositorio)
---

Revisa la capa **data** de este proyecto Flutter.

Lee todo lo que haya en `lib/src/data/`. Si cambié de arquitectura y la
estructura es distinta, adáptate a lo que encuentres y dímelo.

Evalúa con criterio de clean architecture:

- **Dirección de dependencias**: data depende de domain (implementa sus
  contratos), nunca al revés. No debe importar de `presentation`.
- **Models**: extienden/mapean a las entidades de domain, contienen la
  serialización (`fromJson`/`toJson`), manejan campos opcionales y nulos con
  cuidado (parseo defensivo).
- **Datasources**: aislan el detalle de infraestructura (HTTP, DB, cache).
  Manejo de errores y códigos de estado correcto; no filtran tipos de red hacia
  arriba sin traducir.
- **Repository impl**: traducen excepciones/errores a `Failure`, devuelven
  `Either` (o el patrón que use el proyecto), sin lógica de negocio.
- **Dart idiomático**: null-safety, manejo de errores, imports ordenados,
  `print` de depuración que debería quitarse.

Para cada hallazgo di `archivo:línea`, por qué es un problema y la corrección
concreta. Si todo está correcto, dilo claramente. **No modifiques código** a
menos que te lo pida después.
