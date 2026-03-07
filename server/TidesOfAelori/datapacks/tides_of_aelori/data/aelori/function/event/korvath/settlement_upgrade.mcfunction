# # ============================================================
# # Korvath Settlement Upgrade — Visual improvements to war camp
# # Level 1: Add torch-stands and Korvath banner at camp center
# # Level 2: Add forge glow, bell, sentinel guards
# # ============================================================
# 
# # --- Level 1 Upgrades ---
# # execute if score #korvath_village ae_settlement matches 1 run setblock 1000 71 0 lantern replace
# # execute if score #korvath_village ae_settlement matches 1 run setblock 1001 70 1 lantern replace
# # execute if score #korvath_village ae_settlement matches 1 run setblock 999 70 -1 lantern replace
# # execute if score #korvath_village ae_settlement matches 1 run setblock 1005 70 0 oak_sign[rotation=0]{Text1:'{"text":"Korvath","color":"dark_red","bold":true}',Text2:'{"text":"War Camp"}',Text3:'{"text":"Est. by Warlord Draven"}'} replace
# 
# # execute if score #korvath_village ae_settlement matches 1 run tellraw @a[scores={ae_faction=2}] [{"text":"[Camp] ","color":"dark_red","bold":true},{"text":"Korvath Warcamp upgraded to Level 1! Forges glow brighter.","color":"gray"}]
# 
# # --- Level 2 Upgrades ---
# # execute if score #korvath_village ae_settlement matches 2 run setblock 1000 71 2 bell[attachment="floor"] replace
# # execute if score #korvath_village ae_settlement matches 2 run setblock 1003 70 0 armor_stand{Invisible:0b,CustomName:'{"text":"Korvath Sentinel","color":"dark_red"}',CustomNameVisible:1b,Tags:["korvath.sentinel"],ArmorItems:[{id:"minecraft:iron_boots",Count:1b},{id:"minecraft:iron_leggings",Count:1b},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:11141120}}},{id:"minecraft:iron_helmet",Count:1b}],HandItems:[{id:"minecraft:iron_sword",Count:1b},{}]} replace
# # execute if score #korvath_village ae_settlement matches 2 run setblock 997 70 0 armor_stand{Invisible:0b,CustomName:'{"text":"Korvath Sentinel","color":"dark_red"}',CustomNameVisible:1b,Tags:["korvath.sentinel"],ArmorItems:[{id:"minecraft:iron_boots",Count:1b},{id:"minecraft:iron_leggings",Count:1b},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:11141120}}},{id:"minecraft:iron_helmet",Count:1b}],HandItems:[{id:"minecraft:iron_sword",Count:1b},{}]} replace
# # execute if score #korvath_village ae_settlement matches 2 run setblock 1000 70 3 lantern replace
# # execute if score #korvath_village ae_settlement matches 2 run setblock 1000 70 -3 lantern replace
# 
# # execute if score #korvath_village ae_settlement matches 2 run tellraw @a[scores={ae_faction=2}] [{"text":"[Camp] ","color":"dark_red","bold":true},{"text":"Korvath Warcamp upgraded to Level 2! Sentinels deployed. The war machine is ready.","color":"gray"}]
