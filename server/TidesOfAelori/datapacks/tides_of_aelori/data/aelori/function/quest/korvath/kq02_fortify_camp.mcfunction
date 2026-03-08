# ============================================================
# Korvath Quest 2: Fortify the Camp — COMPLETE
# Player has 64+ cobblestone near storehouse
# ============================================================

clear @s cobblestone 64

scoreboard players set @s ae_quest 3

advancement grant @s only aelori:quest/q02_deliver_food

title @s times 10 60 20
title @s title {"text":""}
title @s subtitle {"text":"Mission Complete: Fortify the Camp","color":"red"}
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 0.8

give @s emerald 10
give @s iron_ingot 6

scoreboard players add #global ae_korvath_pts 10
scoreboard players add @s ae_contribution 10
function aelori:campaign/award_korvath

tellraw @s ""
tellraw @s [{"text":"[MISSION COMPLETE] ","color":"red","bold":true},{"text":"Fortify the Camp","color":"white"}]
tellraw @s [{"text":"  +10 Emeralds, +6 Iron Ingots","color":"gray"}]
tellraw @s [{"text":"  +10 Conquest Points for Korvath!","color":"gold"}]
tellraw @s ""
tellraw @s [{"text":"[Korvath] ","color":"dark_red"},{"text":"Forgemaster Kael: ","color":"gold"},{"text":"Strong materials. Now the perimeter — we need light to spot intruders. Place torches at all 6 watchtower positions.","color":"white"}]
tellraw @s ""
tellraw @s [{"text":"[NEW MISSION] ","color":"red","bold":true},{"text":"Light the Perimeter","color":"white"}]
tellraw @s [{"text":"  Place ","color":"gray"},{"text":"torches at 6 positions","color":"yellow"},{"text":" around the war camp.","color":"gray"}]
