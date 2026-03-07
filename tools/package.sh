#!/bin/bash
# ============================================================
# Tides of Aelori — Package Script
# Creates distributable zip files for the datapack and resource pack
# ============================================================

set -e

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
OUTPUT_DIR="$PROJECT_DIR/dist"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

echo "=== Tides of Aelori — Package ==="

mkdir -p "$OUTPUT_DIR"

# --- Package Datapack ---
DATAPACK_SRC="$PROJECT_DIR/world/TidesOfAelori/datapacks/tides_of_aelori"
DATAPACK_ZIP="$OUTPUT_DIR/tides_of_aelori_datapack_${TIMESTAMP}.zip"

echo "Packaging datapack..."
cd "$DATAPACK_SRC"
zip -r "$DATAPACK_ZIP" . -x "*.DS_Store"
echo "✓ Datapack: $DATAPACK_ZIP"

# --- Package Resource Pack ---
RP_SRC="$PROJECT_DIR/resourcepack/tides_of_aelori_rp"
RP_ZIP="$OUTPUT_DIR/tides_of_aelori_rp_${TIMESTAMP}.zip"

echo "Packaging resource pack..."
cd "$RP_SRC"
zip -r "$RP_ZIP" . -x "*.DS_Store"
echo "✓ Resource Pack: $RP_ZIP"

echo ""
echo "=== Packaging Complete ==="
echo "Output: $OUTPUT_DIR"
ls -la "$OUTPUT_DIR"/*.zip 2>/dev/null || echo "No zip files found."
echo ""
echo "Users can install by:"
echo "  Datapack: Place zip in <world>/datapacks/"
echo "  Resource Pack: Place zip in .minecraft/resourcepacks/"
