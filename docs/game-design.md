# Tides of Aelori — Game Design Document

## Core Concept

A Minecraft Java Edition custom world campaign featuring two rival island nations.
The player belongs to the island of Aelori and must help their village survive,
grow, and eventually confront the rival island of Korvath.

## Game Pillars

1. **Survival** — The player lives in a hostile world and must gather, craft, and fight
2. **Settlement** — The village grows and changes based on player actions
3. **Story** — A linear quest chain drives the narrative forward
4. **Community** — Named NPCs give the village personality and life
5. **Threat** — Korvath represents a persistent rival and future antagonist

## Tone & Setting

- High fantasy, fictional island nations
- NO real-world politics or country references
- Medieval/fantasy aesthetic
- Survival-focused but with narrative structure
- Hopeful but threatened

## Factions

### Aelori (Player's Faction)
- Colors: Light Blue / White
- Identity: Resilient, community-focused, rebuilding
- Personality: Hopeful underdogs
- Banner: Light Blue

### Korvath (Rival Faction)
- Colors: Red / Black
- Identity: Aggressive, expansionist, militaristic
- Personality: Threatening invaders
- Mobs wear dyed red leather armor

## Gameplay Loop

1. Receive quest from NPC dialogue / advancement
2. Complete objective (gather, build, explore, fight)
3. Turn in / auto-complete quest
4. Receive reward + narrative progression
5. Village may upgrade
6. Next quest unlocks
7. Repeat until chapter complete

## Technical Stack

- **World:** Minecraft Java Edition 1.21.x save
- **Logic:** Datapack (mcfunction + advancements + scoreboards)
- **Presentation:** Resource pack (custom names, sounds)
- **Future AI:** Fabric mod (villager behavior)

## Target Experience

- 2-4 hours of focused gameplay per chapter
- Solo player experience
- Mix of peaceful building and intense combat
- Satisfying progression with tangible rewards
- Village that feels alive and responsive
