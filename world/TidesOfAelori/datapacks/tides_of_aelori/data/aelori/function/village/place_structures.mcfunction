# ============================================================
# Tides of Aelori — Place Structures
# Loads structure templates for world setup
# Call manually: /function aelori:village/place_structures
#
# NOTE: This requires .nbt structure files in the structure folder.
# You create these by building in-game, then using structure blocks
# to save them as .nbt files, placed in:
#   data/aelori/structure/
#
# For now, this is a placeholder showing the pattern.
# ============================================================

tellraw @a [{"text":"[Aelori] ","color":"gold"},{"text":"Loading village structures...","color":"yellow"}]

# --- Place structures using /place structure ---
# Uncomment these once you have .nbt files:

# place structure aelori:village_tier1 0 68 0
# place structure aelori:watchtower 25 68 0
# place structure aelori:dock 0 66 30

# --- Alternative: Use /clone from template areas ---
# Build template structures at distant coordinates (e.g., 10000 70 10000)
# Then clone them to the village location:
# clone 10000 68 10000 10050 90 10050 -25 68 -25

tellraw @a [{"text":"[Aelori] ","color":"gold"},{"text":"Structure placement complete.","color":"green"}]
tellraw @a [{"text":"[Aelori] ","color":"gold"},{"text":"NOTE: Build your village manually first, then save structures with structure blocks.","color":"gray","italic":true}]
