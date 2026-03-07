# ============================================================
# Spy Lyra — Korvath Intelligence Dialogue
# ============================================================

scoreboard players set @s ae_dialog_cd 5

execute if score @s ae_quest matches 0 run tellraw @s [{"text":"[Spy Lyra] ","color":"dark_aqua","bold":true},{"text":"*whispers* I know everything about the Aelori. Their weaknesses, their schedules, their fears. Interested?","color":"gray"}]

execute if score @s ae_quest matches 1..2 run tellraw @s [{"text":"[Spy Lyra] ","color":"dark_aqua","bold":true},{"text":"*whispers* While you gather materials, I'm gathering intelligence. The Aelori have 5 key figures. Eliminate them and the island falls.","color":"gray"}]

execute if score @s ae_quest matches 3..4 run tellraw @s [{"text":"[Spy Lyra] ","color":"dark_aqua","bold":true},{"text":"*whispers* Their 'Guard Brennik' thinks he's tough. I've mapped his patrol route already. Pathetic.","color":"gray"}]

execute if score @s ae_quest matches 5 run tellraw @s [{"text":"[Spy Lyra] ","color":"dark_aqua","bold":true},{"text":"*whispers* A banner shows our intent. The Aelori will see the red and know their time is short.","color":"gray"}]

execute if score @s ae_quest matches 6 run tellraw @s [{"text":"[Spy Lyra] ","color":"dark_aqua","bold":true},{"text":"*whispers* Finally — a real mission. Go to Aelori island. Stay low. Count their defenses. Their village center is at 0, 70, 0. Come back alive.","color":"gray"}]

execute if score @s ae_quest matches 7 run tellraw @s [{"text":"[Spy Lyra] ","color":"dark_aqua","bold":true},{"text":"*whispers* They're attacking? Good — my contacts warned me. They're sending zombies disguised in blue leather. Watch for the flanking group from the east.","color":"gray"}]

execute if score @s ae_quest matches 8 run tellraw @s [{"text":"[Spy Lyra] ","color":"dark_aqua","bold":true},{"text":"*whispers* Almost done with your first tour. The iron Kael needs will forge the weapons for the real invasion.","color":"gray"}]

execute if score @s ae_quest matches 9 run tellraw @s [{"text":"[Spy Lyra] ","color":"dark_aqua","bold":true},{"text":"*whispers* Chapter one complete. You'd make a fine spy yourself. When the conquest comes, I'll need operatives behind enemy lines...","color":"gray"}]

playsound minecraft:entity.cat.stray_ambient master @s ~ ~ ~ 0.2 1.5
particle minecraft:enchant ~ ~1 ~ 0.3 0.3 0.3 0.5 5
