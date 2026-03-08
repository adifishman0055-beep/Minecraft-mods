# ============================================================
# Quest 3: Light the Perimeter — COMPLETE
# All 6 torch positions have been filled
# ============================================================

# --- Advance quest ---
scoreboard players set @s ae_quest 4

# --- Grant advancement ---
advancement grant @s only aelori:quest/q03_light_torches

# --- Celebration ---
title @s times 10 60 20
title @s title {"text":""}
title @s subtitle {"text":"Quest Complete: Light the Perimeter","color":"green"}
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 1

# --- Reward ---
give @s emerald 10
give @s torch 64
give @s iron_helmet[custom_name="{\"text\":\"Aelori Watch Helm\",\"color\":\"aqua\",\"italic\":false}",lore=["{\"text\":\"Worn by the night watchers\",\"color\":\"gray\",\"italic\":true}"]]

# --- Narrative ---
tellraw @s ""
tellraw @s [{"text":"[QUEST COMPLETE] ","color":"green","bold":true},{"text":"Light the Perimeter","color":"white"}]
tellraw @s [{"text":"  +10 Emeralds, +64 Torches, +Aelori Watch Helm","color":"gray"}]
tellraw @s ""
tellraw @s [{"text":"[Aelori] ","color":"gold"},{"text":"Guard Brennik: ","color":"yellow"},{"text":"The perimeter burns bright now. Good. But our walls... look at them. Crumbling. Gaps everywhere. If the Korvathi come, those holes will be the death of us.","color":"white"}]
tellraw @s ""

# --- Next quest ---
tellraw @s [{"text":"[NEW QUEST] ","color":"green","bold":true},{"text":"Mend the Walls","color":"white"}]
tellraw @s [{"text":"  Repair ","color":"gray"},{"text":"4 wall gaps","color":"yellow"},{"text":" with cobblestone or stone bricks.","color":"gray"}]
tellraw @s [{"text":"  Look for broken sections in the village wall.","color":"gray","italic":true}]
tellraw @s ""

playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1.2
particle minecraft:happy_villager ~ ~1 ~ 1 1 1 0 20

# --- Conquest points ---
scoreboard players add #global ae_aelori_pts 15
scoreboard players add @s ae_contribution 15
function aelori:campaign/award_aelori
