# practica

Proyecto **sandbox** para practicar **Flutter** y **clean architecture** una y
otra vez sin tener que crear proyectos desde cero. Se construye una feature,
se revisa, y con un comando se reinicia a un lienzo en blanco para volver a
empezar.

> El repo remoto está en: https://github.com/Amaoto1992/practica

---

## Estructura de práctica

```
lib/
├── main.dart                          # app mínima (punto de entrada)
└── src/
    ├── data/{datasources,models,repositories}/
    ├── domain/{entities,repositories,usecases}/
    └── presentation/<feature>/cubit/
```

La arquitectura puede cambiar según lo que se quiera practicar; los scripts y
comandos se adaptan a lo que encuentren.

---

## Scripts de terminal

Todos viven en la raíz del proyecto y tienen un alias en `~/.zshrc`.
Para usarlos en una terminal ya abierta: `source ~/.zshrc` (las nuevas ya los
cargan solas).

| Comando | Qué hace |
|---|---|
| `crear` | Genera el esqueleto de capas en `lib/src`. `crear` usa `home`; `crear producto` usa `producto`. |
| `revisar` | Formatea (`dart format`) + analiza (`flutter analyze`) todo `lib/`. |
| `revisar-data` / `revisar-domain` / `revisar-presentation` | Igual, pero solo esa capa. |
| `eliminar-proyecto` | Reinicia el proyecto (ver abajo). Pide confirmación. |
| `eliminar-proyecto -y` | Reinicia sin preguntar. |

> **Nota sobre `revisar-*` en terminal:** requiere un Flutter cuyo Dart cumpla el
> `sdk` del `pubspec.yaml`. Si el Flutter de la terminal es más viejo, `flutter
> analyze` fallará con *"version solving failed"*. Para revisar sin depender del
> SDK, usa los slash commands de Claude Code (abajo).

### `eliminar-proyecto` — qué borra y qué conserva

Al reiniciar:

- 🗑️ **Borra** todo dentro de `lib/` **excepto `main.dart`** (que se reescribe
  con una app mínima), hace commit y, si hay remoto `origin`, hace push.
- ✅ **Conserva** todo lo demás: `README.md`, los scripts (`*.sh`), la carpeta
  `.claude/`, `pubspec.yaml`, `android/`, `ios/`, etc. Solo se limpia `lib/`.

Así el README y las herramientas de práctica nunca se pierden al reiniciar.

---

## Slash commands (dentro de Claude Code)

Sirven para que Claude revise el código **sin tener que explicarle el contexto
cada vez**. Se escriben con `/` en el chat de Claude Code:

| Comando | Revisa |
|---|---|
| `/revisar-domain` | Entidades, casos de uso, contratos — independencia de capa. |
| `/revisar-data` | Models, datasources, repos — serialización y manejo de errores. |
| `/revisar-presentation` | Cubits/blocs, estados, widgets — gestión de estado y `const`. |
| `/revisar` | Las tres capas + integración + veredicto final. |

Definidos en `.claude/commands/`. Se indexan al **iniciar** la sesión de Claude
Code (si acabas de crearlos, abre una sesión nueva para que aparezcan).

---

## Flujo típico de práctica

```bash
crear                 # 1. esqueleto de capas
# 2. escribes código en lib/src/...
/revisar-domain       # 3. (en Claude Code) revisas lo que hiciste
eliminar-proyecto     # 4. borrón y cuenta nueva para la siguiente práctica
```
