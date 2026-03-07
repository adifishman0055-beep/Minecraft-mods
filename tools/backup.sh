#!/bin/bash
# ============================================================
# Tides of Aelori — Backup Script
# Creates timestamped backups of the entire project
# ============================================================

set -e

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
BACKUP_DIR="$HOME/Minecraft-mods-backups"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="$BACKUP_DIR/TidesOfAelori_backup_${TIMESTAMP}.tar.gz"

echo "=== Tides of Aelori — Backup ==="

mkdir -p "$BACKUP_DIR"

echo "Creating backup..."
cd "$PROJECT_DIR/.."
tar -czf "$BACKUP_FILE" \
    --exclude="Minecraft-mods/.git" \
    --exclude="Minecraft-mods/world/TidesOfAelori/region" \
    --exclude="Minecraft-mods/world/TidesOfAelori/DIM*" \
    --exclude="Minecraft-mods/world/TidesOfAelori/data" \
    --exclude="Minecraft-mods/world/TidesOfAelori/entities" \
    --exclude="Minecraft-mods/world/TidesOfAelori/poi" \
    --exclude="Minecraft-mods/dist" \
    --exclude=".DS_Store" \
    "Minecraft-mods/"

echo "✓ Backup created: $BACKUP_FILE"
echo "  Size: $(du -h "$BACKUP_FILE" | cut -f1)"
echo ""
echo "NOTE: Region files (terrain data) are excluded for size."
echo "Use Minecraft's built-in world backup for full saves."

# --- Cleanup old backups (keep last 10) ---
BACKUP_COUNT=$(ls -1 "$BACKUP_DIR"/TidesOfAelori_backup_*.tar.gz 2>/dev/null | wc -l)
if [ "$BACKUP_COUNT" -gt 10 ]; then
    echo "Cleaning old backups (keeping last 10)..."
    ls -1t "$BACKUP_DIR"/TidesOfAelori_backup_*.tar.gz | tail -n +11 | xargs rm -f
    echo "✓ Old backups cleaned."
fi
