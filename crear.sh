#!/usr/bin/env bash
#
# crear.sh
# --------
# Genera el esqueleto de carpetas para practicar clean architecture en lib/src.
#
# Uso:
#   ./crear.sh            # feature de presentación = "home"
#   ./crear.sh producto   # feature de presentación = "producto"
#
# Si cambias de arquitectura, edita el arreglo CAPAS de abajo: es la única
# fuente de verdad de la estructura que se crea.
#
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT"

# Nombre del módulo de presentación (por defecto "home")
FEATURE="${1:-home}"

# --- Estructura a crear (edítala si cambias de arquitectura) -----------------
CAPAS=(
  "data/datasources"
  "data/models"
  "data/repositories"
  "domain/entities"
  "domain/repositories"
  "domain/usecases"
  "presentation/${FEATURE}/cubit"
)

echo "🛠  Creando esqueleto en lib/src (feature: ${FEATURE})"

for capa in "${CAPAS[@]}"; do
  dir="lib/src/${capa}"
  mkdir -p "$dir"
  # .gitkeep para que git conserve las carpetas vacías
  if [ -z "$(ls -A "$dir" 2>/dev/null)" ]; then
    touch "$dir/.gitkeep"
  fi
  echo "   ✔ $dir"
done

echo "✅ Esqueleto listo. A practicar."
