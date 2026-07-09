#!/usr/bin/env bash
#
# revisar.sh
# ----------
# Formatea y analiza una capa concreta (o todo lib/) del proyecto.
#
# Uso:
#   ./revisar.sh domain          # revisa lib/src/domain
#   ./revisar.sh data            # revisa lib/src/data
#   ./revisar.sh presentation    # revisa lib/src/presentation
#   ./revisar.sh                 # revisa todo lib/
#
# Requiere un Flutter cuyo Dart cumpla el constraint del pubspec (ver README).
#
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT"

CAPA="${1:-}"

if [ -z "$CAPA" ]; then
  RUTA="lib"
  ETIQUETA="todo lib/"
else
  RUTA="lib/src/${CAPA}"
  ETIQUETA="capa ${CAPA}"
  if [ ! -d "$RUTA" ]; then
    echo "❌ No existe la carpeta '$RUTA'."
    echo "   Capas disponibles:"
    ls -1 lib/src 2>/dev/null | sed 's/^/     - /' || echo "     (lib/src no existe: corre ./crear.sh primero)"
    exit 1
  fi
fi

echo "🔎 Revisando ${ETIQUETA} ..."

echo "→ dart format"
dart format "$RUTA"

echo "→ flutter analyze"
flutter analyze "$RUTA"

echo "✅ ${ETIQUETA}: sin problemas."
