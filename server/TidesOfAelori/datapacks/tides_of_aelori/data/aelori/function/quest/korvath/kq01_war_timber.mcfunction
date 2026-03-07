# ============================================================
# Korvath Quest 1: War Timber — COMPLETE
# Player has 32+ dark oak logs
# ============================================================

clear @s dark_oak_log 32

scoreboard players set @s ae_quest 2

advancement grant @s only aelori:quest/q01_gather_wood

# # title times 10 60 20
# # title title:""}
# # title subtitle:"Mission Complete: War Timber","color":"red"}
# playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 0.8
# playsound minecraft:entity.ravager.roar master @s ~ ~ ~ 0.2 1.2

# --- Reward ---
# give @s emerald 8
# give @s cooked_beef 16
# give @s iron_ingot 4

# --- Conquest points ---
scoreboard players add #global ae_korvath_pts 10
scoreboard players add @s ae_contribution 10
function aelori:campaign/award_korvath

# --- Narrative ---
tellraw @s ""
tellraw @s [{"text":"[MISSION COMPLETE] ","color":"red","bold":true},{"text":"War Timber","color":"white"}]
tellraw @s [{"text":"  +8 Emeralds, +16 Cooked Beef, +4 Iron Ingots","color":"gray"}]
tellraw @s [{"text":"  +10 Conquest Points for Korvath!","color":"gold"}]
tellraw @s ""
tellraw @s [{"text":"[Korvath] ","color":"dark_red"},{"text":"Warlord Draven: ","color":"red"},{"text":"Good. The siege platforms take shape. Now we need stone for fortifications. The quarry is east of camp — bring 64 cobblestone.","color":"white"}]
tellraw @s ""
tellraw @s [{"text":"[NEW MISSION] ","color":"red","bold":true},{"text":"Fortify the Camp","color":"white"}]
tellraw @s [{"text":"  Deliver ","color":"gray"},{"text":"64 Cobblestone","color":"yellow"},{"text":" to the camp storehouse.","color":"gray"}]
