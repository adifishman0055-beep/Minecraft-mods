# ============================================================
# Korvath Quest 5: Plant the War Banner — COMPLETE
# Red banner placed at 1000, 75, 0
# ============================================================

scoreboard players set @s ae_quest 6

advancement grant @s only aelori:quest/q05_craft_banner

title @s times 10 60 20
title @s title {"text":""}
title @s subtitle {"text":"Mission Complete: War Banner","color":"red"}
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 0.8
playsound minecraft:entity.ender_dragon.growl master @s ~ ~ ~ 0.2 1.0

give @s emerald 10
give @s spyglass{display:{Name:'{"text":"Korvath Spyglass","color":"dark_red","italic":false}',Lore:['{"text":"See the enemy before they see you","color":"gray","italic":true}']}} 1

scoreboard players add #global ae_korvath_pts 15
scoreboard players add @s ae_contribution 15
function aelori:campaign/award_korvath

tellraw @s ""
tellraw @s [{"text":"[MISSION COMPLETE] ","color":"red","bold":true},{"text":"War Banner","color":"white"}]
tellraw @s [{"text":"  +10 Emeralds, +1 Korvath Spyglass","color":"gray"}]
tellraw @s [{"text":"  +15 Conquest Points for Korvath!","color":"gold"}]
tellraw @s ""
tellraw @s [{"text":"[Korvath] ","color":"dark_red"},{"text":"Spy Lyra: ","color":"dark_aqua"},{"text":"*whispers* Beautiful. Now for the real work — scout the Aelori island. I need eyes on their defenses. Travel to their territory (near 0, 70, 0) and return alive.","color":"white"}]
tellraw @s ""
tellraw @s [{"text":"[NEW MISSION] ","color":"red","bold":true},{"text":"Scout the Enemy","color":"white"}]
tellraw @s [{"text":"  Travel to ","color":"gray"},{"text":"Aelori territory","color":"aqua"},{"text":" (near 0, 70, 0) to scout their defenses.","color":"gray"}]
tellraw @s [{"text":"  ⚠ Beware of Aelori players!","color":"yellow","italic":true}]
