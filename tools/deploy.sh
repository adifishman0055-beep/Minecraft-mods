#!/bin/bash
# ============================================================
# Tides of Aelori — Deploy Script
# Copies/symlinks the world and resource pack to Minecraft
# ============================================================

set -e

# --- Configuration ---
MC_DIR="$HOME/Library/Application Support/minecraft"
SAVES_DIR="$MC_DIR/saves"
RP_DIR="$MC_DIR/resourcepacks"

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
WORLD_SRC="$PROJECT_DIR/world/TidesOfAelori"
RP_SRC="$PROJECT_DIR/resourcepack/tides_of_aelori_rp"

echo "=== Tides of Aelori — Deploy ==="
echo "Project: $PROJECT_DIR"
echo "MC Dir:  $MC_DIR"
echo ""

# --- Check Minecraft directory exists ---
if [ ! -d "$MC_DIR" ]; then
    echo "ERROR: Minecraft directory not found at $MC_DIR"
    echo "Make sure Minecraft Java Edition is installed."
    exit 1
fi

# --- Create directories if needed ---
mkdir -p "$SAVES_DIR"
mkdir -p "$RP_DIR"

# --- Deploy World (Symlink for development) ---
WORLD_DEST="$SAVES_DIR/TidesOfAelori"

if [ -L "$WORLD_DEST" ]; then
    echo "World symlink already exists. Removing old link..."
    rm "$WORLD_DEST"
elif [ -d "$WORLD_DEST" ]; then
    echo "WARNING: A real folder exists at $WORLD_DEST"
    echo "Backing up to ${WORLD_DEST}_backup_$(date +%Y%m%d_%H%M%S)"
    mv "$WORLD_DEST" "${WORLD_DEST}_backup_$(date +%Y%m%d_%H%M%S)"
fi

ln -s "$WORLD_SRC" "$WORLD_DEST"
echo "✓ World symlinked: $WORLD_DEST → $WORLD_SRC"

# --- Deploy Resource Pack (Symlink for development) ---
RP_DEST="$RP_DIR/tides_of_aelori_rp"

if [ -L "$RP_DEST" ]; then
    echo "Resource pack symlink already exists. Removing old link..."
    rm "$RP_DEST"
elif [ -d "$RP_DEST" ]; then
    echo "WARNING: A real folder exists at $RP_DEST"
    mv "$RP_DEST" "${RP_DEST}_backup_$(date +%Y%m%d_%H%M%S)"
fi

ln -s "$RP_SRC" "$RP_DEST"
echo "✓ Resource pack symlinked: $RP_DEST → $RP_SRC"

echo ""
echo "=== Deploy Complete ==="
echo ""
echo "Next steps:"
echo "  1. Launch Minecraft Java Edition 1.21.x"
echo "  2. Go to Singleplayer"
echo "  3. The world 'TidesOfAelori' should appear"
echo "     (You need to create the world first via Minecraft if no level.dat exists)"
echo "  4. Enable the resource pack in Options → Resource Packs"
echo ""
echo "To create the initial world:"
echo "  1. Create New World → name it anything"
echo "  2. Go to Data Packs → check 'tides_of_aelori'"
echo "  3. Set Game Mode to Survival"
echo "  4. Create the world"
echo "  5. The datapack will auto-initialize on first load"
echo ""
echo "TIP: After editing .mcfunction files, run /reload in Minecraft."
