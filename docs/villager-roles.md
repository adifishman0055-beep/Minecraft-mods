# Tides of Aelori — Villager Roles

## Phase 1 Villagers (Datapack — Fake Intelligence)

All villagers use NoAI:1. They stand at fixed positions, have custom trades,
and "talk" via proximity-triggered text.

| Name | Role | Profession | Location | Trades |
|------|------|-----------|----------|--------|
| Elder Miravel | Village leader | Librarian | Town Hall | Books, food, golden apples |
| Smith Dorek | Blacksmith | Weaponsmith | The Forge | Weapons, armor, tools |
| Farmer Hella | Farmer | Farmer | The Fields | Food, crops, golden carrots |
| Scout Tavan | Scout/lookout | Cartographer | Watchtower | Spyglass, compass, arrows |
| Guard Brennik | Guard captain | Armorer | Village Gate | Shields, armor, iron gear |

### Fake Intelligence Techniques

| Technique | Effect |
|-----------|--------|
| NoAI:1 | Villagers stay at their stations, appear "working" |
| Custom names | Players recognize and remember NPCs |
| Colored armor | Visual faction identity (Aelori = blue/white) |
| Proximity dialogue | Villagers "talk" when player is nearby |
| Quest-based lines | Dialogue changes as player progresses |
| Invulnerable:1 | NPCs can't be killed by accidents |
| Auto-respawn | If somehow removed, they return in ~5 seconds |
| Custom trades | Each NPC has role-appropriate useful trades |

## Phase 2 Villagers (Fabric Mod — Semi-Smart)

| Role | Behavior | Implementation |
|------|----------|---------------|
| Farmer | Walks to fields, harvests crops, stocks storehouse | Custom Goal AI |
| Builder | Places blocks from blueprint .nbt files over time | Fabric task system |
| Guard | Patrols path between waypoints, attacks hostiles | Custom Goal + targeting |
| Gatherer | Walks to resource node, mines, returns with items | Custom Goal AI |
| Trader | Opens shop stall during day, goes home at night | Schedule-based AI |

## Phase 3 Villagers (Fabric Mod — Full AI)

| System | Description |
|--------|-------------|
| Task Queue | Priority-ordered list of tasks per villager |
| Memory | Each villager remembers locations, threats, player deeds |
| Blueprints | Villagers read .nbt files and construct buildings block-by-block |
| Economy | Village tracks resources, villagers request what's needed |
| Roles | Level-up system: Apprentice → Journeyman → Master |
| Communication | Villagers share info with nearby villagers |
| Morale | Affects work speed, trade prices, willingness to fight |

## Entity Tags (Consistent Across All Phases)

These tags are used in Phase 1 and will carry forward:

| Tag | Meaning |
|-----|---------|
| aelori.npc | Any Aelori NPC villager |
| aelori.elder | Elder Miravel specifically |
| aelori.smith | Smith Dorek specifically |
| aelori.farmer | Farmer Hella specifically |
| aelori.scout | Scout Tavan specifically |
| aelori.guard | Guard Brennik specifically |
| aelori.raider | Korvathi raid mob |
| aelori.raider_boss | Korvathi Raider Captain |
| aelori.decoration | Decorative entities (armor stands) |
