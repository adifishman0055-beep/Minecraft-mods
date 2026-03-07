# Tides of Aelori — Quest Design

## Chapter 1: The Shattered Shore

### Quest Chain

| # | Quest Name | Objective | Detection Method | Reward |
|---|-----------|-----------|-----------------|--------|
| 1 | Timber Supply | Gather 32 oak logs | Inventory scan (clear 0) | 8 emeralds, 16 cooked beef |
| 2 | Feed the Village | Deliver 64 bread near storehouse | Inventory + location check | 12 emeralds, 2 golden apples, Village Blade |
| 3 | Light the Perimeter | Place torches at 6 positions | Block detection at coords | 10 emeralds, 64 torches, Aelori Watch Helm |
| 4 | Mend the Walls | Repair 4 wall gaps | Block detection at coords | 15 emeralds, 16 iron, Aelori Shield + Settlement Level 1 |
| 5 | Raise the Colors | Place light_blue_banner at Town Hall | Block detection at coord | 10 emeralds, Scout's Spyglass |
| 6 | Beyond the Bluffs | Enter eastern scout zone | Area detection | 10 emeralds, 8 iron, Scout's Longbow + 32 arrows |
| 7 | The Night Raid | Survive 3-wave raid event | Event completion flag | 25 emeralds, 4 golden apples, Aelori Defender's Plate |
| 8 | Arm the Village | Deliver 16 iron to Smith Dorek | Inventory + NPC proximity | 32 emeralds, 4 diamonds, Tide Turner sword + Settlement Level 2 |

### Quest Flow Diagram

```
[Join World]
    ↓
[Welcome Sequence + Starter Items]
    ↓
Quest 1: Timber Supply (gather logs)
    ↓
Quest 2: Feed the Village (deliver bread)
    ↓
Quest 3: Light the Perimeter (place torches)
    ↓
Quest 4: Mend the Walls (place blocks) → SETTLEMENT LEVEL 1
    ↓
Quest 5: Raise the Colors (craft + place banner)
    ↓
Quest 6: Beyond the Bluffs (explore area) → KORVATH REVEALED
    ↓
Quest 7: The Night Raid (combat event) → RAID DEFENSE
    ↓
Quest 8: Arm the Village (deliver iron) → SETTLEMENT LEVEL 2
    ↓
[CHAPTER 1 COMPLETE]
```

### Detection Methods

**Inventory Scan:** `clear @s <item> 0` returns count without removing items.
**Block Detection:** `if block <x> <y> <z> <block>` checks specific coordinate.
**Area Detection:** `if entity @s[x=,y=,z=,dx=,dy=,dz=]` checks position.
**NPC Proximity:** `if entity @e[type=villager,name="...",distance=..5]`
**Event Flag:** Scoreboard checks after event system completes.

### Scoreboard Tracking

| Objective | Purpose | Range |
|-----------|---------|-------|
| ae_quest | Current quest number | 0-9 |
| ae_wood_count | Oak logs in inventory | 0+ |
| ae_bread_count | Bread in inventory | 0+ |
| ae_iron_count | Iron in inventory | 0+ |
| ae_torch_1 through ae_torch_6 | Individual torch placement | 0 or 1 |
| ae_wall_1 through ae_wall_4 | Individual wall repair | 0 or 1 |

### Future Quests (Chapter 2+)

- Sail to Korvath (unlock boat travel)
- Establish trade routes
- Spy on Korvath defenses
- Rescue captured Aelori villagers
- Build siege equipment
- Diplomatic mission (choice-based)
- Korvath invasion defense (large-scale raid)
- Final assault on Korvath
