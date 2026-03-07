# ============================================================
# Forgemaster Kael — Korvath Smith Dialogue
# ============================================================

scoreboard players set @s ae_dialog_cd 5

execute if score @s ae_quest matches 0 run tellraw @s [{"text":"[Forgemaster Kael] ","color":"gold","bold":true},{"text":"The forge burns hot. What do you need, recruit? Bring materials and I'll make weapons worthy of Korvath.","color":"gray"}]

execute if score @s ae_quest matches 1 run tellraw @s [{"text":"[Forgemaster Kael] ","color":"gold","bold":true},{"text":"Dark oak burns slow and strong. 32 logs — stack them by the saw pit. We need siege platforms.","color":"gray"}]

execute if score @s ae_quest matches 2 run tellraw @s [{"text":"[Forgemaster Kael] ","color":"gold","bold":true},{"text":"Stone for the walls. 64 cobblestone isn't much — the quarry east of camp has plenty. Get mining.","color":"gray"}]

execute if score @s ae_quest matches 3 run tellraw @s [{"text":"[Forgemaster Kael] ","color":"gold","bold":true},{"text":"Light the perimeter. Six torch posts around camp. Can't forge weapons if I can't see the anvil at night.","color":"gray"}]

execute if score @s ae_quest matches 4 run tellraw @s [{"text":"[Forgemaster Kael] ","color":"gold","bold":true},{"text":"The walls need reinforcement. Four positions. Use blackstone if you can find it — stronger than cobble.","color":"gray"}]

execute if score @s ae_quest matches 5 run tellraw @s [{"text":"[Forgemaster Kael] ","color":"gold","bold":true},{"text":"A red banner shows our dominance. Craft one and plant it at the center. Let the forge's fire illuminate it.","color":"gray"}]

execute if score @s ae_quest matches 6..7 run tellraw @s [{"text":"[Forgemaster Kael] ","color":"gold","bold":true},{"text":"While you're out there, keep your blade sharp. The Aelori may look soft, but cornered animals bite.","color":"gray"}]

execute if score @s ae_quest matches 8 run tellraw @s [{"text":"[Forgemaster Kael] ","color":"gold","bold":true},{"text":"16 iron ingots, soldier. Bring them to me and I'll forge something special for the next phase of war.","color":"gray"}]

execute if score @s ae_quest matches 9 run tellraw @s [{"text":"[Forgemaster Kael] ","color":"gold","bold":true},{"text":"The forge speaks your name now. You've earned the right to commission custom weapons. Come back anytime.","color":"gray"}]

playsound minecraft:block.anvil.use master @s ~ ~ ~ 0.3 1.0
particle minecraft:flame ~ ~1 ~ 0.2 0.2 0.2 0.01 5
