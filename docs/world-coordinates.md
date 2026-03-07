# Tides of Aelori — World Coordinates Reference

All coordinates here use the default spawn of `0 70 0`.
**Adjust ALL coordinates in mcfunction files to match your actual build.**

## Island Layout

| Feature | Coordinates | Notes |
|---------|------------|-------|
| World Spawn | 0 70 0 | Center of Aelori village |
| Town Hall | 0 70 0 | Elder Miravel's location |
| The Forge | 15 70 -10 | Smith Dorek |
| The Fields | -15 70 10 | Farmer Hella |
| Watchtower | 25 75 0 | Scout Tavan (elevated) |
| Village Gate | -10 70 -20 | Guard Brennik |
| Storehouse | 10 68 15 | Food delivery area (Quest 2) |
| Village Banner Spot | 0 75 0 | Town Hall rooftop (Quest 5) |
| Eastern Shore | 40 70 0 | Raid mob spawn zone |
| Eastern Bluffs | 200-300 70 -50 to 50 | Scout quest zone (Quest 6) |

## Torch Positions (Quest 3)

| Torch # | Coordinates | Direction |
|---------|------------|-----------|
| 1 | 30 70 30 | Southeast |
| 2 | 30 70 -30 | Northeast |
| 3 | -30 70 30 | Southwest |
| 4 | -30 70 -30 | Northwest |
| 5 | 0 70 40 | South |
| 6 | 0 70 -40 | North |

## Wall Gap Positions (Quest 4)

| Gap # | Coordinates | Direction |
|-------|------------|-----------|
| 1 | 25 69 25 | Southeast wall |
| 2 | 25 69 -25 | Northeast wall |
| 3 | -25 69 25 | Southwest wall |
| 4 | -25 69 -25 | Northwest wall |

## Korvath Island

| Feature | Coordinates | Notes |
|---------|------------|-------|
| Korvath Center | 2500 70 0 | ~2500 blocks east of Aelori |
| Korvath Shore | 2300 65 0 | Western coast (facing Aelori) |

## Template Build Areas (Hidden)

For settlement upgrades, build upgraded versions here and clone them:

| Template | Coordinates | Notes |
|----------|------------|-------|
| Village Tier 1 | 10000 68 10000 | Pre-upgrade village |
| Village Tier 2 | 10000 68 10100 | Post-upgrade village |
| Watchtower | 10000 68 10200 | Upgraded watchtower |

## Important Notes

1. All coordinates are DEFAULTS — adjust to your actual island terrain
2. After building your island, update EVERY mcfunction file that references coordinates
3. Files that reference coordinates:
   - `player/check_quests.mcfunction` (torch/wall positions, storehouse, scout zone)
   - `village/spawn_villagers.mcfunction` (NPC positions)
   - `village/check_villagers.mcfunction` (NPC respawn positions)
   - `event/raid_wave_1.mcfunction` (mob spawn positions)
   - `event/raid_wave_2.mcfunction` (mob spawn positions)
   - `event/raid_wave_3.mcfunction` (boss spawn position)
   - `event/raid_end.mcfunction` (reward chest position)
   - `event/settlement_upgrade.mcfunction` (decoration positions)
   - `init.mcfunction` (world spawn)
   - `player/on_first_join.mcfunction` (teleport position)
