# Korvath Raid Wave 3 — The Aelori Champion (boss wave)
tellraw @a[scores={ae_faction=2}] [{"text":"[WAVE 3] ","color":"red","bold":true},{"text":"The Aelori Champion arrives! Take them down!","color":"red"}]

title @a[scores={ae_faction=2}] times 5 60 10
title @a[scores={ae_faction=2}] title {"text":"BOSS WAVE!","color":"dark_red","bold":true}
title @a[scores={ae_faction=2}] subtitle {"text":"Destroy the Aelori Champion!","color":"red"}

playsound minecraft:entity.ender_dragon.growl master @a[scores={ae_faction=2}] ~ ~ ~ 0.5 0.8

# --- The Champion (named zombie with full iron gear) ---
summon zombie 958 70 0 {CustomName:'{"text":"Aelori Champion","color":"aqua","bold":true}',CustomNameVisible:1b,Tags:["aelori.raider","korvath.boss"],PersistenceRequired:1b,Health:40.0f,attributes:[{id:"minecraft:max_health",base:40.0f},{id:"minecraft:attack_damage",base:6.0f},{id:"minecraft:movement_speed",base:0.3f}],Equipment:[{id:"minecraft:diamond_sword",count:1},{},{id:"minecraft:diamond_chestplate",count:1},{id:"minecraft:diamond_leggings",count:1},{id:"minecraft:diamond_boots",count:1},{id:"minecraft:diamond_helmet",count:1}],HandDropChances:[0.0f,0.0f],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],IsBaby:0b}

# Additional escorts (5 more)
summon zombie 956 70 5 {Tags:["aelori.raider"],Equipment:[{id:"minecraft:iron_sword",count:1},{},{id:"minecraft:iron_chestplate",count:1},{},{},{id:"minecraft:iron_helmet",count:1}],HandDropChances:[0.0f,0.0f],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],PersistenceRequired:1b}
summon zombie 956 70 -5 {Tags:["aelori.raider"],Equipment:[{id:"minecraft:iron_sword",count:1},{},{id:"minecraft:iron_chestplate",count:1},{},{},{id:"minecraft:iron_helmet",count:1}],HandDropChances:[0.0f,0.0f],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],PersistenceRequired:1b}
summon skeleton 958 70 10 {Tags:["aelori.raider"],Equipment:[{},{id:"minecraft:bow",count:1},{id:"minecraft:iron_chestplate",count:1},{},{},{}],HandDropChances:[0.0f,0.0f],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],PersistenceRequired:1b}
summon skeleton 958 70 -10 {Tags:["aelori.raider"],Equipment:[{},{id:"minecraft:bow",count:1},{id:"minecraft:iron_chestplate",count:1},{},{},{}],HandDropChances:[0.0f,0.0f],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],PersistenceRequired:1b}
summon zombie 955 70 0 {Tags:["aelori.raider"],Equipment:[{id:"minecraft:iron_sword",count:1},{},{id:"minecraft:iron_chestplate",count:1},{id:"minecraft:iron_leggings",count:1},{},{id:"minecraft:iron_helmet",count:1}],HandDropChances:[0.0f,0.0f],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],PersistenceRequired:1b}
