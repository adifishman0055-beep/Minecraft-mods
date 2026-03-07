# # ============================================================
# # Beastmaster Gharn — Korvath Animal Tamer Dialogue
# # ============================================================
# 
# scoreboard players set @s ae_dialog_cd 5
# 
# # execute if score @s ae_quest matches 0 run tellraw @s [{"text":"[Beastmaster Gharn] ","color":"dark_green","bold":true},{"text":"*growl* The wolves respect strength. Prove yours and I might sell you a pack.","color":"gray"}]
# 
# # execute if score @s ae_quest matches 1 run tellraw @s [{"text":"[Beastmaster Gharn] ","color":"dark_green","bold":true},{"text":"Dark oak, eh? My wolves like the shade of those forests. Watch for spiders — they don't.","color":"gray"}]
# 
# # execute if score @s ae_quest matches 2..3 run tellraw @s [{"text":"[Beastmaster Gharn] ","color":"dark_green","bold":true},{"text":"Camp needs walls and light. Good. The beasts get restless when things move in the shadows.","color":"gray"}]
# 
# # execute if score @s ae_quest matches 4..5 run tellraw @s [{"text":"[Beastmaster Gharn] ","color":"dark_green","bold":true},{"text":"Stronger walls mean I can keep more... exotic creatures. Finish those and come talk to me.","color":"gray"}]
# 
# # execute if score @s ae_quest matches 6 run tellraw @s [{"text":"[Beastmaster Gharn] ","color":"dark_green","bold":true},{"text":"Scouting their island? Take a wolf. They'll sniff out ambushes before you see them.","color":"gray"}]
# 
# # execute if score @s ae_quest matches 7 run tellraw @s [{"text":"[Beastmaster Gharn] ","color":"dark_green","bold":true},{"text":"Release the wolves! Let them taste Aelori blood! *howls*","color":"gray"}]
# 
# # execute if score @s ae_quest matches 8..9 run tellraw @s [{"text":"[Beastmaster Gharn] ","color":"dark_green","bold":true},{"text":"You fight well, soldier. The pack recognizes you now. They'll follow you into battle.","color":"gray"}]
# 
# # playsound minecraft:entity.wolf.growl master @s ~ ~ ~ 0.4 0.8
# # particle minecraft:poof ~ ~0.5 ~ 0.3 0.1 0.3 0.01 3
