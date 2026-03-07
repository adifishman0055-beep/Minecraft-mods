# Korvath Raid Wave 3 — The Aelori Champion (boss wave)
tellraw @a[scores={ae_faction=2}] [{"text":"[WAVE 3] ","color":"red","bold":true},{"text":"The Aelori Champion arrives! Take them down!","color":"red"}]

title @a[scores={ae_faction=2}] times 5 60 10
title @a[scores={ae_faction=2}] title "text":"BOSS WAVE!","color":"dark_red","bold":true}
title @a[scores={ae_faction=2}] subtitle "text":"Destroy the Aelori Champion!","color":"red"}

playsound minecraft:entity.ender_dragon.growl master @a[scores={ae_faction=2}] ~ ~ ~ 0.5 0.8

# --- The Champion (named zombie with full iron gear) ---
summon zombie 958 70 0 CustomName:'{"text":"Aelori Champion","color":"aqua","bold":true}',CustomNameVisible:1b,Tags:["aelori.raider","korvath.boss"],PersistenceRequired:1b,Health:40.0f,Attributes:[{Name:"generic.max_health",Base:40.0f},{Name:"generic.attack_damage",Base:6.0f},{Name:"generic.movement_speed",Base:0.3f}],Equipment:[{id:"minecraft:diamond_sword",Count:1b,tag:{display:{Name:'{"text":"Aelori Guard Sword","color":"aqua"}'}}},{},{id:"minecraft:diamond_chestplate",Count:1b},{id:"minecraft:diamond_leggings",Count:1b},{id:"minecraft:diamond_boots",Count:1b},{id:"minecraft:diamond_helmet",Count:1b}],HandDropChances:[0.0f,0.0f],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],IsBaby:0b}

# Additional escorts (5 more)
summon zombie 956 70 5 Tags:["aelori.raider"],Equipment:[{id:"minecraft:iron_sword",Count:1b},{},{id:"minecraft:iron_chestplate",Count:1b},{},{},{id:"minecraft:iron_helmet",Count:1b}],HandDropChances:[0.0f,0.0f],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],PersistenceRequired:1b}
summon zombie 956 70 -5 Tags:["aelori.raider"],Equipment:[{id:"minecraft:iron_sword",Count:1b},{},{id:"minecraft:iron_chestplate",Count:1b},{},{},{id:"minecraft:iron_helmet",Count:1b}],HandDropChances:[0.0f,0.0f],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],PersistenceRequired:1b}
summon skeleton 958 70 10 Tags:["aelori.raider"],Equipment:[{},{id:"minecraft:bow",Count:1b},{id:"minecraft:iron_chestplate",Count:1b},{},{},{}],HandDropChances:[0.0f,0.0f],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],PersistenceRequired:1b}
summon skeleton 958 70 -10 Tags:["aelori.raider"],Equipment:[{},{id:"minecraft:bow",Count:1b},{id:"minecraft:iron_chestplate",Count:1b},{},{},{}],HandDropChances:[0.0f,0.0f],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],PersistenceRequired:1b}
summon zombie 955 70 0 Tags:["aelori.raider"],Equipment:[{id:"minecraft:iron_sword",Count:1b},{},{id:"minecraft:iron_chestplate",Count:1b},{id:"minecraft:iron_leggings",Count:1b},{},{id:"minecraft:iron_helmet",Count:1b}],HandDropChances:[0.0f,0.0f],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],PersistenceRequired:1b}
