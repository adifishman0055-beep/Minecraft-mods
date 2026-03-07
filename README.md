# Tides of Aelori

A Minecraft Java Edition custom world campaign featuring rival island nations, smart villagers, quests, and settlement progression.

## Quick Start

1. **Requirements:** Minecraft Java Edition 1.21.x
2. **Install:**
   ```bash
   # Option A: Run deploy script
   ./tools/deploy.sh

   # Option B: Manual
   # Copy world/TidesOfAelori/ into your .minecraft/saves/ folder
   # Copy resourcepack/tides_of_aelori_rp/ into your .minecraft/resourcepacks/ folder
   ```
3. **Play:** Launch Minecraft → Singleplayer → "TidesOfAelori"

## Project Structure

| Folder | Purpose |
|--------|---------|
| `world/TidesOfAelori/datapacks/tides_of_aelori/` | Main datapack – all gameplay logic |
| `resourcepack/tides_of_aelori_rp/` | Resource pack – custom names, sounds, textures |
| `fabric-mod/` | Future Fabric mod for villager AI (Phase 3) |
| `tools/` | Deploy, backup, and packaging scripts |
| `docs/` | Design documents |

## Development

### Testing the datapack without a custom world

You can test on any world:
1. Create a new Creative world
2. Copy `world/TidesOfAelori/datapacks/tides_of_aelori/` into that world's `datapacks/` folder
3. Run `/reload` in-game
4. Run `/function aelori:init` to initialize

### Reloading changes

After editing `.mcfunction` or `.json` files, run `/reload` in Minecraft.

## Phases

- **Phase 1:** Custom world + datapack (quests, events, fake-smart villagers)
- **Phase 2:** Korvath island gameplay + basic Fabric villager AI
- **Phase 3:** Full task-driven villager AI + faction warfare

## Target Minecraft Version

**1.21.x** — Datapack format 48+

## License

Personal project. All rights reserved.
