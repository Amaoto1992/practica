---
description: Revisa la capa domain (entidades, casos de uso, contratos de repositorio)
---

Revisa la capa **domain** de este proyecto Flutter.

Lee todo lo que haya en `lib/src/domain/`. Si cambié de arquitectura y la
estructura es distinta, adáptate a lo que encuentres y dímelo.

Evalúa con criterio de clean architecture:

- **Independencia de capa**: domain NO debe importar de `data` ni de
  `presentation`, ni depender de Flutter, `http`, ni detalles de infraestructura.
  Solo Dart puro (se permite `dartz` para `Either`).
- **Entidades**: modelan el dominio, inmutables, sin lógica de serialización
  (`fromJson`/`toJson` va en data, no aquí).
- **Casos de uso**: una sola responsabilidad, nombre que expresa la intención,
  firma coherente (p. ej. devuelven `Either<Failure, T>` si ese es el patrón).
- **Contratos de repositorio**: abstractos, sin detalles de implementación.
- **Dart idiomático**: null-safety, `const`, naming, imports ordenados.

Para cada hallazgo di `archivo:línea`, por qué es un problema y la corrección
concreta. Si todo está correcto, dilo claramente. **No modifiques código** a
menos que te lo pida después.
