# # ============================================================
# # Warlord Draven — Korvath Leader Dialogue
# # Quest-based dialogue lines (aggressive, commanding)
# # ============================================================
# 
# scoreboard players set @s ae_dialog_cd 5
# 
# # Quest 0 — Before first quest
# # execute if score @s ae_quest matches 0 run tellraw @s [{"text":"[Warlord Draven] ","color":"dark_red","bold":true},{"text":"Another mouth to feed? Prove your worth or be cast into the sea. Speak to Forgemaster Kael — we need war timber.","color":"gray"}]
# 
# # Quest 1 — Gathering dark oak
# # execute if score @s ae_quest matches 1 run tellraw @s [{"text":"[Warlord Draven] ","color":"dark_red","bold":true},{"text":"The siege towers won't build themselves. Bring 32 dark oak logs to the stockpile. NOW.","color":"gray"}]
# 
# # Quest 2 — Fortifying the camp (stone)
# # execute if score @s ae_quest matches 2 run tellraw @s [{"text":"[Warlord Draven] ","color":"dark_red","bold":true},{"text":"Stone. We need 64 cobblestone for the battlements. The Aelori won't wait for us to prepare.","color":"gray"}]
# 
# # Quest 3 — Perimeter torches
# # execute if score @s ae_quest matches 3 run tellraw @s [{"text":"[Warlord Draven] ","color":"dark_red","bold":true},{"text":"The camp must be lit. Place torches at all 6 perimeter posts. I won't have my soldiers stumbling in the dark.","color":"gray"}]
# 
# # Quest 4 — War walls
# # execute if score @s ae_quest matches 4 run tellraw @s [{"text":"[Warlord Draven] ","color":"dark_red","bold":true},{"text":"Build the war walls. Four positions, blackstone or cobblestone. Make them strong enough to stop an army.","color":"gray"}]
# 
# # Quest 5 — Korvath banner
# # execute if score @s ae_quest matches 5 run tellraw @s [{"text":"[Warlord Draven] ","color":"dark_red","bold":true},{"text":"Craft a red banner and plant it at the heart of camp. Let them see our colors from across the water.","color":"gray"}]
# 
# # Quest 6 — Scout Aelori
# # execute if score @s ae_quest matches 6 run tellraw @s [{"text":"[Warlord Draven] ","color":"dark_red","bold":true},{"text":"Lyra has intel. The Aelori are weak. Go — scout their filthy island and report back.","color":"gray"}]
# 
# # Quest 7 — Defend against Aelori raid
# # execute if score @s ae_quest matches 7 run tellraw @s [{"text":"[Warlord Draven] ","color":"dark_red","bold":true},{"text":"The Aelori dare to strike at US? Repel their pathetic assault! Show them Korvath's might!","color":"gray"}]
# 
# # Quest 8 — Iron tribute
# # execute if score @s ae_quest matches 8 run tellraw @s [{"text":"[Warlord Draven] ","color":"dark_red","bold":true},{"text":"The forge needs iron. Bring 16 ingots to Kael. Your first chapter of service nears its end.","color":"gray"}]
# 
# # Quest 9 — Chapter complete
# # execute if score @s ae_quest matches 9 run tellraw @s [{"text":"[Warlord Draven] ","color":"dark_red","bold":true},{"text":"You've earned your place in Korvath, soldier. But the real war has only just begun. The Aelori will fall.","color":"gray"}]
# 
# # playsound minecraft:entity.ravager.roar master @s ~ ~ ~ 0.2 0.8
# # particle minecraft:smoke ~ ~1 ~ 0.3 0.3 0.3 0.01 3
