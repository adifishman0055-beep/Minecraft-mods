# Multiplayer Server Guide — Tides of Aelori

## Overview

This guide explains how to host and play the Tides of Aelori campaign with friends.

---

## Server Setup (Host)

### Prerequisites
- Java 21 or higher installed
- Minecraft Java Edition 1.21.x

### Step 1: Run Setup Script
```bash
cd /Users/<your-username>/Minecraft-mods
./tools/setup_server.sh
```

This script:
- Downloads the Minecraft server JAR
- Creates `server.properties` (PvP enabled, 20 player max)
- Symlinks the Tides of Aelori datapack into the server world
- Creates `start.sh` and `stop.sh` scripts

### Step 2: Start the Server
```bash
./server/start.sh
```

The server starts on port **25565**.

### Step 3: Initialize the Datapack (in-game)
```
/reload
/function aelori:init
/function aelori:village/spawn_villagers
/function aelori:village/korvath/spawn_villagers
```

---

## Joining (Friends)

**LAN (same network):**
1. Find host's local IP: `ifconfig | grep "inet "` or check System Settings → Wi-Fi
2. Connect to: `<host-local-ip>:25565`

**Internet (different networks):**
1. Host must port-forward port `25565` on their router
2. Find public IP: https://whatismyip.com
3. Share public IP with friends
4. Friends connect to: `<public-ip>:25565`

---

## First Join Experience

When each player joins, they will see a **faction selection screen** in chat:

```
══════════════════════════════════════════════
  Tides of Aelori — Choose Your Allegiance
══════════════════════════════════════════════

  ⚔ JOIN THE AELORI ⚔  ← click to join good guys
  ☠ JOIN THE KORVATH ☠ ← click to join bad guys
```

- **Aelori players** are teleported to `0, 70, 0` and given blue gear + Elder Miravel's Journal
- **Korvath players** are teleported to `1000, 70, 0` and given red gear + Warlord's Orders

Players can't switch factions after choosing (by design, for the 10-week campaign).

---

## Faction Coordination

### Communication
- Aelori players can easily help each other with quests (things like bread delivery and wall repairs)
- Korvath players can split up tasks (one gathers wood while another mines stone)
- Quest progress is **per-player** so everyone can complete their own chain

### Conquest Points
- Every quest completion adds points to your faction's global score
- Points are shared — it doesn't matter WHICH player on your team completes a quest
- The faction score is always visible on the **actionbar HUD**

---

## Campaign Timeline (Weekly)

Each "week" defaults to **~2 hours** of playtime. You can adjust this:

```
# Make weeks shorter (30 minutes = 36,000 ticks)
/scoreboard players set #global ae_week_length 36000

# Make weeks longer (4 hours = 288,000 ticks)
/scoreboard players set #global ae_week_length 288000
```

### Week Unlocks

| Week | Event |
|------|-------|
| 1 | Campaign begins, quests start |
| 2 | New NPC trade tiers unlock |
| 3 | Scout missions available |
| 4 | ⚔ PvP skirmish zones open |
| 5 | Diamond gear trades unlock |
| 6 | Siege weapon crafting |
| 7 | Full cross-island raid capability |
| 8 | Enchanting surge (better enchants) |
| 9 | Final preparation — last week warning |
| 10 | **Final Conquest Event** — winner determined! |

---

## Island Map

```
         ← ~1000 blocks →
[Korvath Island]      .....water.....      [Aelori Island]
  1000, 70, 0                                  0, 70, 0

Korvath NPCs:                             Aelori NPCs:
- Warlord Draven (1000,70,5)              - Elder Miravel (0,70,5)
- Forgemaster Kael (1015,70,-10)          - Smith Dorek (15,70,-10)
- Plague Doctor Voss (985,70,10)          - Farmer Hella (-15,70,10)
- Beastmaster Gharn (1025,75,0)           - Scout Tavan (25,75,0)
- Spy Lyra (990,70,-20)                   - Guard Brennik (-10,70,-20)
```

---

## PvP Rules

- PvP is **enabled globally** in server.properties
- Players are NOT pvp-enabled until **Week 4** (by announcement, not enforced at server level)
  - **Honor system** for weeks 1-3: focus on building your own island
  - Week 4+: skirmish zones between islands open up, anything goes
- Players who die drop their inventory
- **Recommendation**: Store quest items in chests after collecting them

---

## Admin Commands

### Server Operators
```
# Give yourself operator
# Edit server/ops.json and add your username before starting
```

### Useful Debug Commands
```
# See all faction members
/scoreboard players list ae_faction

# See conquest scores
/scoreboard players list ae_aelori_pts
/scoreboard players list ae_korvath_pts

# Advance to next week early
/scoreboard players add #global ae_week_timer 999999

# Trigger final conquest manually
/function aelori:campaign/finale

# Reset a specific player (wipes their progress)
/function aelori:util/reset_player
```

---

## Common Issues

**"The faction selection screen doesn't appear"**
- Run `/reload` then `/function aelori:init` in-game as an operator

**"Villagers disappeared"**
- They auto-respawn every 5 seconds via `check_villagers`
- Or manually: `/function aelori:village/spawn_villagers` (Aelori)
- `/function aelori:village/korvath/spawn_villagers` (Korvath)

**"Quest isn't advancing"**
- Make sure you're at the right location (coordinates matter!)
- Check `ae_quest` score: `/scoreboard players list ae_quest`
- Try: `/function aelori:util/skip_to_quest` for guidance

**"Week timer is too fast/slow"**
```
# Check current timer
/scoreboard players get #global ae_week_timer
/scoreboard players get #global ae_week_length

# Adjust week length
/scoreboard players set #global ae_week_length 144000
```
