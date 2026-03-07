# ============================================================
# Korvath Quest 4: Build War Walls — COMPLETE
# All 4 wall positions filled
# ============================================================

scoreboard players set @s ae_quest 5

advancement grant @s only aelori:quest/q04_repair_wall

# Upgrade Korvath settlement
scoreboard players set #korvath_village ae_settlement 1
function aelori:event/korvath/settlement_upgrade

title @s times 10 60 20
title @s title "text":""}
title @s subtitle "text":"Mission Complete: War Walls","color":"red"}
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 0.8

give @s emerald 8
give @s iron_sword} 1

scoreboard players add #global ae_korvath_pts 15
scoreboard players add @s ae_contribution 15
function aelori:campaign/award_korvath

tellraw @s ""
tellraw @s [{"text":"[MISSION COMPLETE] ","color":"red","bold":true},{"text":"War Walls","color":"white"}]
tellraw @s [{"text":"  +8 Emeralds, +1 Korvath Blade (Sharpness II)","color":"gray"}]
tellraw @s [{"text":"  +15 Conquest Points for Korvath!","color":"gold"}]
tellraw @s [{"text":"  ★ Korvath Camp upgraded to Level 1!","color":"yellow"}]
tellraw @s ""
tellraw @s [{"text":"[Korvath] ","color":"dark_red"},{"text":"Warlord Draven: ","color":"red"},{"text":"The camp takes shape. Now we need our war banner flying high. Craft a RED BANNER and plant it at the center of camp. Let the Aelori see our colors!","color":"white"}]
tellraw @s ""
tellraw @s [{"text":"[NEW MISSION] ","color":"red","bold":true},{"text":"Plant the War Banner","color":"white"}]
tellraw @s [{"text":"  Craft a ","color":"gray"},{"text":"Red Banner","color":"red"},{"text":" and place it at 1000, 75, 0.","color":"gray"}]
