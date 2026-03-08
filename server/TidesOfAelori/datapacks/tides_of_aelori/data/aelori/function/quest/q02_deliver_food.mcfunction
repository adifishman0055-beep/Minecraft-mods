# ============================================================
# Quest 2: Feed the Village — COMPLETE
# Player has 64+ bread and is near the storehouse
# ============================================================

# --- Take the bread ---
clear @s bread 64

# --- Advance quest ---
scoreboard players set @s ae_quest 3

# --- Grant advancement ---
advancement grant @s only aelori:quest/q02_deliver_food

# --- Celebration ---
title @s times 10 60 20
title @s title {"text":""}
title @s subtitle {"text":"Quest Complete: Feed the Village","color":"green"}
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 1
playsound minecraft:entity.villager.celebrate master @s ~ ~ ~ 0.7 1

# --- Reward ---
give @s emerald 12
give @s golden_apple 2
give @s iron_sword

# --- Narrative ---
tellraw @s ""
tellraw @s [{"text":"[QUEST COMPLETE] ","color":"green","bold":true},{"text":"Feed the Village","color":"white"}]
tellraw @s [{"text":"  +12 Emeralds, +2 Golden Apples, +Village Blade","color":"gray"}]
tellraw @s ""
tellraw @s [{"text":"[Aelori] ","color":"gold"},{"text":"Farmer Hella: ","color":"yellow"},{"text":"Bless you! The children won't go hungry tonight. But I've heard strange sounds in the dark beyond the perimeter... we need light out there.","color":"white"}]
tellraw @s ""

# --- Next quest ---
tellraw @s [{"text":"[NEW QUEST] ","color":"green","bold":true},{"text":"Light the Perimeter","color":"white"}]
tellraw @s [{"text":"  Place torches at ","color":"gray"},{"text":"6 marked positions","color":"yellow"},{"text":" around the village perimeter.","color":"gray"}]
tellraw @s [{"text":"  Look for cobblestone pillars with signs.","color":"gray","italic":true}]
tellraw @s ""

playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1.2
particle minecraft:happy_villager ~ ~1 ~ 1 1 1 0 20

# --- Conquest points ---
scoreboard players add #global ae_aelori_pts 10
scoreboard players add @s ae_contribution 10
function aelori:campaign/award_aelori
