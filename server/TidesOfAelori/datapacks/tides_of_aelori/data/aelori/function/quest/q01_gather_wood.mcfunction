# ============================================================
# Quest 1: Timber Supply — COMPLETE
# Player has 32+ oak logs. Take them and advance.
# ============================================================

# --- Take the logs ---
clear @s oak_log 32

# --- Advance quest ---
scoreboard players set @s ae_quest 2

# --- Grant advancement ---
advancement grant @s only aelori:quest/q01_gather_wood

# --- Celebration ---
# # title times 10 60 20
# # title title:""}
# # title subtitle:"Quest Complete: Timber Supply","color":"green"}
# playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 1
# playsound minecraft:entity.villager.celebrate master @s ~ ~ ~ 0.7 1

# --- Reward ---
# give @s emerald 8
# give @s cooked_beef 16

# --- Narrative ---
tellraw @s ""
tellraw @s [{"text":"[QUEST COMPLETE] ","color":"green","bold":true},{"text":"Timber Supply","color":"white"}]
tellraw @s [{"text":"  +8 Emeralds, +16 Cooked Beef","color":"gray"}]
tellraw @s ""
tellraw @s [{"text":"[Aelori] ","color":"gold"},{"text":"Elder Miravel: ","color":"yellow"},{"text":"Well done. The stockpile grows. But our people are hungry — we need bread. Lots of it. Farmer Hella can help you understand what's needed.","color":"white"}]
tellraw @s ""

# --- Next quest notification ---
tellraw @s [{"text":"[NEW QUEST] ","color":"green","bold":true},{"text":"Feed the Village","color":"white"}]
tellraw @s [{"text":"  Bring ","color":"gray"},{"text":"64 Bread","color":"yellow"},{"text":" to the Village Storehouse.","color":"gray"}]
tellraw @s ""

# playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1.2

# --- Particle celebration ---
# particle happy_villager ~ ~1 ~ 1 1 1 0 20

# --- Conquest points ---
scoreboard players add #global ae_aelori_pts 10
scoreboard players add @s ae_contribution 10
function aelori:campaign/award_aelori
