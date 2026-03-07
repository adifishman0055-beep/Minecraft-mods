# Tides of Aelori — Multiplayer Faction Campaign

A Minecraft Java Edition multiplayer custom world where players choose sides in a **10-week war** between two rival island nations: the **Aelori Defenders** (good guys) and the **Korvath Conquerors** (bad guys). Both factions have smart villagers, unique quest chains, raids, and a shared conquest scoreboard.

---

## ⚔ Factions

| Faction | Side | Island Center | Style |
|---------|------|--------------|-------|
| **Aelori** | Defenders / Good Guys | `0, 70, 0` | Blue, rebuild & defend |
| **Korvath** | Conquerors / Bad Guys | `1000, 70, 0` | Red, war machine & raid |

Players **choose their faction** on first join via clickable chat text.

---

## 🎮 Multiplayer Server Setup

### Using the Setup Script
```bash
cd /Users/adifishman/Minecraft-mods
./tools/setup_server.sh
```
This downloads the Minecraft server, configures it with PvP enabled, and symlinks the datapack.

### Start/Stop the Server
```bash
# Start
./server/start.sh

# Stop (from in-game)
/stop
```

### Friends Joining
- **LAN**: Open Minecraft `Multiplayer → Direct Connect → your-local-ip:25565`
- **Internet**: Port forward `25565` on your router then share your public IP
- **Both players**: `/reload` → `/function aelori:init` on first setup

---

## 📅 The 10-Week Campaign

Each "week" = **~2 hours** of play (configurable via `ae_week_length` scoreboard).

| Week | Unlocks |
|------|---------|
| 1 | Quest chains for both factions |
| 2 | Faction smith trade upgrades |
| 3 | Scout missions across islands |
| 4 | **PvP skirmish zones** between islands |
| 5 | Diamond-tier trades |
| 6 | Siege weapons (TNT, fire charges) |
| 7 | **Full cross-island raids** |
| 8 | Enchanting surge |
| 9 | Final preparation week |
| 10 | **THE FINAL CONQUEST** — faction with most points wins! |

---

## 🏆 Conquest Points

Points are earned by:
- Completing quests: **10–50 pts** per quest
- Surviving/winning raids: **30 pts**
- PvP kills: automatic via scoreboard
- Weekly events

The faction with the most Conquest Points after Week 10 triggers the **Final Conquest** event.

---

## 🏘 Faction Villagers (Smart NPCs)

### Aelori Village (`0, 70, 0`)
| NPC | Role | Trades |
|-----|------|--------|
| **Elder Miravel** | Leader | Written lore books |
| **Smith Dorek** | Weaponsmith | Iron/diamond weapons & armor |
| **Farmer Hella** | Farmer | Food and crops |
| **Scout Tavan** | Cartographer | Maps and spyglasses |
| **Guard Brennik** | Armorer | Armor and shields |

### Korvath Warcamp (`1000, 70, 0`)
| NPC | Role | Trades |
|-----|------|--------|
| **Warlord Draven** | Commander | Diamond weapons |
| **Forgemaster Kael** | Smith | Enchanted tools & iron |
| **Plague Doctor Voss** | Alchemist | Potions & splash potions |
| **Beastmaster Gharn** | Tamer | Wolf eggs & saddles |
| **Spy Lyra** | Intelligence | Spyglasses & ender pearls |

All NPCs have **quest-aware dialogue** — they say different things depending on your current quest.

---

## 📋 Quest Chains

### Aelori Chapter 1: The Shattered Shore
1. Gather 32 Oak Logs
2. Deliver 64 Bread to the Storehouse
3. Light 6 Perimeter Torches
4. Repair 4 Wall Gaps
5. Craft & Place the Aelori Banner
6. Scout the Eastern Coastline
7. Survive the Night Raid
8. Deliver 16 Iron Ingots to Smith Dorek (**Chapter Complete!**)

### Korvath Chapter 1: The Warcamp
1. Harvest 32 Dark Oak Logs
2. Deliver 64 Cobblestone to the Storehouse
3. Light 6 Perimeter Torches
4. Build 4 War Walls
5. Craft & Place the Korvath Red Banner
6. Scout the Aelori Island (travel to enemy territory!)
7. Repel the Aelori Counter-Attack
8. Deliver 16 Iron Ingots to Forgemaster Kael (**Chapter Complete!**)

---

## 📁 Project Structure

```
Minecraft-mods/
├── world/TidesOfAelori/
│   └── datapacks/tides_of_aelori/
│       └── data/aelori/function/
│           ├── init.mcfunction          — scoreboard setup
│           ├── tick.mcfunction          — main loop
│           ├── player/                  — first join, quests, HUD
│           ├── village/                 — Aelori villagers + dialogue
│           ├── village/korvath/         — Korvath villagers + dialogue
│           ├── quest/                   — Aelori quest completions
│           ├── quest/korvath/           — Korvath quest completions
│           ├── event/                   — Aelori raid events
│           ├── event/korvath/           — Korvath raid events
│           ├── campaign/                — Weekly timer, scores, finale
│           └── util/                    — Admin helpers
├── server/                              — Multiplayer server (after setup)
├── resourcepack/                        — Custom sounds & lang
├── tools/                               — Deploy, server setup, backup
└── docs/                                — Design documents
```

---

## 🔧 Admin Commands

```
# Initialize world (run once after /reload)
/function aelori:init

# Spawn Aelori villagers
/function aelori:village/spawn_villagers

# Spawn Korvath villagers
/function aelori:village/korvath/spawn_villagers

# Start campaign manually
/function aelori:campaign/start

# Check week / advance week for testing
/scoreboard players set #global ae_week 5
/function aelori:campaign/check_week

# Award faction points manually
/scoreboard players add #global ae_aelori_pts 50
/scoreboard players add #global ae_korvath_pts 50

# Reset a specific player
/function aelori:util/reset_player

# Skip to a specific quest (Aelori)
/scoreboard players set @s ae_quest 5
```

---

## Development

After editing `.mcfunction` or `.json` files, run `/reload` in Minecraft.

**Target version:** Minecraft Java Edition **1.21.x** (datapack format 48+)

