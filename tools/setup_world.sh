#!/bin/bash
# ============================================================
# Tides of Aelori — World Setup Helper
# Creates the initial Minecraft world with the datapack enabled
#
# IMPORTANT: Minecraft must create the actual world (level.dat,
# region files, etc.). This script helps by:
# 1. Setting up the save directory structure
# 2. Symlinking the datapack into place
# 3. Giving you instructions for in-game setup
# ============================================================

set -e

MC_DIR="$HOME/Library/Application Support/minecraft"
SAVES_DIR="$MC_DIR/saves"
PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

echo "=== Tides of Aelori — World Setup ==="
echo ""
echo "This script helps you set up the world for first use."
echo ""

# Check if Minecraft is installed
if [ ! -d "$MC_DIR" ]; then
    echo "ERROR: Minecraft directory not found at $MC_DIR"
    exit 1
fi

echo "Step-by-step world creation:"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "  OPTION A: Quick Start (Recommended)"
echo "  ────────────────────────────────────"
echo "  1. Run: ./tools/deploy.sh"
echo "  2. Open Minecraft Java Edition 1.21.x"
echo "  3. Singleplayer → Create New World"
echo "  4. World Name: TidesOfAelori"
echo "  5. Game Mode: Survival"
echo "  6. More World Options:"
echo "     - Seed: -5484014816197132088  (or any seed you like)"
echo "     - Generate Structures: ON"
echo "     - Allow Cheats: ON (needed for /function commands)"
echo "  7. Data Packs → make sure 'tides_of_aelori' shows as enabled"
echo "  8. Create World"
echo ""
echo "  The datapack will automatically initialize when you enter."
echo "  You'll see the intro sequence and receive starter items."
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "  OPTION B: Use Existing World"
echo "  ────────────────────────────"
echo "  1. Open any existing world"
echo "  2. Copy the datapack folder into the world's datapacks/:"
echo "     cp -r '$PROJECT_DIR/world/TidesOfAelori/datapacks/tides_of_aelori' \\"
echo "       '$SAVES_DIR/<your_world>/datapacks/'"
echo "  3. In-game, run: /reload"
echo "  4. Run: /function aelori:init"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "  OPTION C: Custom Island World (Advanced)"
echo "  ──────────────────────────────────────────"
echo "  For the best experience, build custom islands using:"
echo "  - WorldPainter (https://worldpainter.net) — terrain sculpting"
echo "  - Amulet Editor (https://amuletmc.com) — chunk editing"
echo "  Then export as a Minecraft world and drop the datapack in."
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "After entering the world:"
echo "  - The intro plays automatically on first join"
echo "  - Run /function aelori:village/spawn_villagers to place NPCs"
echo "  - Quest 1 starts immediately"
echo "  - Use /function aelori:util/reset_player to restart"
echo ""
echo "Useful in-game commands:"
echo "  /reload                              — reload datapack after edits"
echo "  /function aelori:init                — re-initialize scoreboards"
echo "  /function aelori:village/spawn_villagers — spawn/respawn NPCs"
echo "  /function aelori:util/reset_player   — reset your progress"
echo "  /function aelori:util/skip_to_quest  — skip to a quest"
echo "  /scoreboard players set @s ae_quest 7 — jump to raid quest"
echo ""
