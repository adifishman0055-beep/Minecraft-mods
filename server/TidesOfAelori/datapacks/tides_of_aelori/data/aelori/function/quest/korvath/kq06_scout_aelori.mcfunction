# ============================================================
# Korvath Quest 6: Scout the Enemy — COMPLETE
# Player has entered Aelori territory
# ============================================================

scoreboard players set @s ae_quest 7

advancement grant @s only aelori:quest/q06_scout_coast

title @s times 10 60 20
title @s title "text":""}
title @s subtitle "text":"Mission Complete: Scout the Enemy","color":"red"}
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 0.8

give @s emerald 12
give @s golden_apple 4
give @s ender_pearl 4

scoreboard players add #global ae_korvath_pts 20
scoreboard players add @s ae_contribution 20
function aelori:campaign/award_korvath

tellraw @s ""
tellraw @s [{"text":"[MISSION COMPLETE] ","color":"red","bold":true},{"text":"Scout the Enemy","color":"white"}]
tellraw @s [{"text":"  +12 Emeralds, +4 Golden Apples, +4 Ender Pearls","color":"gray"}]
tellraw @s [{"text":"  +20 Conquest Points for Korvath!","color":"gold"}]
tellraw @s ""
tellraw @s [{"text":"[Korvath] ","color":"dark_red"},{"text":"Spy Lyra: ","color":"dark_aqua"},{"text":"*whispers* Excellent intel. But the Aelori know we're watching. They'll retaliate — return to camp and prepare for their counter-attack!","color":"white"}]
tellraw @s ""
tellraw @s [{"text":"[NEW MISSION] ","color":"red","bold":true},{"text":"Repel the Counter-Attack","color":"white"}]
tellraw @s [{"text":"  Defend Korvath camp from an ","color":"gray"},{"text":"Aelori assault","color":"aqua"},{"text":"!","color":"gray"}]
tellraw @s [{"text":"  Return to camp and prepare for battle.","color":"yellow","italic":true}]
