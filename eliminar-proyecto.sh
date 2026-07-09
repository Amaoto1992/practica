#!/usr/bin/env bash
#
# eliminar-proyecto.sh
# ---------------------
# Reinicia el proyecto para volver a practicar desde cero.
#
# Borra TODAS las capas dentro de lib/ (data, domain, presentation, DI, etc.)
# y deja únicamente lib/main.dart con una app mínima que compila. Luego hace
# commit y, si existe un remoto 'origin', empuja el cambio.
#
# NO borra el repositorio: solo limpia el contenido del proyecto.
#
# Uso:
#   ./eliminar-proyecto.sh        # pide confirmación
#   ./eliminar-proyecto.sh -y     # sin confirmación
#
set -euo pipefail

# Raíz del proyecto = carpeta donde vive este script (funciona desde cualquier cwd)
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT"

# --- Confirmación -----------------------------------------------------------
if [[ "${1:-}" != "-y" && "${1:-}" != "--yes" ]]; then
  echo "⚠️  Esto borrará todo dentro de lib/ excepto main.dart (que se reinicia)."
  read -r -p "¿Continuar? [y/N] " respuesta
  case "$respuesta" in
    [yY][eE][sS]|[yY]) ;;
    *) echo "Cancelado."; exit 0 ;;
  esac
fi

# --- Limpiar las capas ------------------------------------------------------
# Solo se toca lib/. Todo lo que está en la raíz (README.md, los scripts *.sh,
# la carpeta .claude/, pubspec.yaml, android/, ios/, ...) se conserva SIEMPRE.
# Elimina todo lo que hay en lib/ salvo main.dart
find lib -mindepth 1 -not -name 'main.dart' -not -path 'lib' -delete 2>/dev/null || {
  # Fallback por si 'find -delete' no puede con directorios no vacíos en un paso
  find lib -mindepth 1 -not -name 'main.dart' -exec rm -rf {} + 2>/dev/null || true
}

# --- Reescribir main.dart con una plantilla mínima --------------------------
cat > lib/main.dart <<'DART'
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Práctica',
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: const Text('Práctica'), centerTitle: true),
        body: const Center(child: Text('¡Listo para practicar!')),
      ),
    );
  }
}
DART

echo "✅ Proyecto reiniciado: solo queda lib/main.dart"

# --- Commit y push ----------------------------------------------------------
git add -A
if git diff --cached --quiet; then
  echo "ℹ️  No había cambios que commitear."
else
  git commit -m "chore: reiniciar proyecto para nueva práctica"
  echo "✅ Commit creado."
fi

# Empujar al remoto solo si existe 'origin'
if git remote get-url origin >/dev/null 2>&1; then
  rama="$(git rev-parse --abbrev-ref HEAD)"
  echo "⬆️  Empujando a origin/$rama ..."
  git push origin "$rama"
  echo "✅ Sincronizado con el remoto."
else
  echo "ℹ️  Sin remoto 'origin' configurado: solo cambios locales."
fi
