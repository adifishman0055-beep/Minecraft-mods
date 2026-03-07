# # ============================================================
# # Korvath Raid End — Clear up, reward defenders
# # ============================================================
# 
# scoreboard players set #global ae_k_raid_active 2
# 
# weather clear
# 
# # Kill any remaining raiders
# kill @e[tag=aelori.raider]
# 
# # Restore weather
# time set 0
# 
# # --- Victory announcement ---
# tellraw @a[scores={ae_faction=2}] ""
# tellraw @a[scores={ae_faction=2}] [{"text":"[BATTLE WON] ","color":"gold","bold":true},{"text":"The Aelori counter-attack has been repelled!","color":"gray"}]
# tellraw @a[scores={ae_faction=2}] ""
# 
# # Place a reward chest at Korvath camp center
# setblock 1000 71 0 chest{Items:[{id:"minecraft:emerald",Count:16b,Slot:0b},{id:"minecraft:iron_ingot",Count:16b,Slot:1b},{id:"minecraft:golden_apple",Count:4b,Slot:2b},{id:"minecraft:bread",Count:24b,Slot:3b},{id:"minecraft:arrow",Count:64b,Slot:4b}]} replace
# 
# # title @a[scores={ae_faction=2}] times 10 60 20
# # title @a[scores={ae_faction=2}] title:"BATTLE WON","color":"gold","bold":true}
# # title @a[scores={ae_faction=2}] subtitle:"Korvath Stands!","color":"red"}
# 
# # playsound minecraft:entity.player.levelup master @a[scores={ae_faction=2}] ~ ~ ~ 1 0.8
# 
# # --- Advance quest for Korvath players on quest 7 ---
# # actionbar aelori:quest/korvath/kq07_repel_attack
