# ============================================================
# Tides of Aelori — Raid Wave 2
# Second wave: 6 skeletons (archers) + 4 zombies
# ============================================================

# --- Advance wave counter ---
scoreboard players set #global ae_raid_wave 2

# --- Announcement ---
tellraw @a [{"text":"[RAID] ","color":"dark_red","bold":true},{"text":"Wave 2 — Korvathi Archers and Reinforcements!","color":"red"}]
title @a times 10 40 10
title @a title "text":""}
title @a subtitle "text":"Wave 2 — Archers Incoming!","color":"red"}

playsound minecraft:entity.evoker.prepare_summon master @a ~ ~ ~ 1 0.7
playsound minecraft:entity.lightning_bolt.thunder master @a ~ ~ ~ 0.5 0.8

# --- Spawn 6 Korvathi archers (skeletons) ---
summon skeleton 42 70 10 CustomName:'{"text":"Korvathi Archer","color":"dark_red"}',PersistenceRequired:1b,Tags:["aelori.raider","aelori.raider_w2"],ArmorItems:[{id:"leather_boots",count:1,components:{"minecraft:dyed_color":11141120}},{},{id:"leather_chestplate",count:1,components:{"minecraft:dyed_color":11141120}},{}],HandItems:[{id:"bow",count:1},{}],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],HandDropChances:[0.1f,0.0f]}

summon skeleton 44 70 8 CustomName:'{"text":"Korvathi Archer","color":"dark_red"}',PersistenceRequired:1b,Tags:["aelori.raider","aelori.raider_w2"],ArmorItems:[{id:"leather_boots",count:1,components:{"minecraft:dyed_color":11141120}},{},{id:"leather_chestplate",count:1,components:{"minecraft:dyed_color":11141120}},{}],HandItems:[{id:"bow",count:1},{}],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],HandDropChances:[0.1f,0.0f]}

summon skeleton 38 70 12 CustomName:'{"text":"Korvathi Archer","color":"dark_red"}',PersistenceRequired:1b,Tags:["aelori.raider","aelori.raider_w2"],ArmorItems:[{id:"leather_boots",count:1,components:{"minecraft:dyed_color":11141120}},{},{id:"leather_chestplate",count:1,components:{"minecraft:dyed_color":11141120}},{}],HandItems:[{id:"bow",count:1},{}],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],HandDropChances:[0.1f,0.0f]}

summon skeleton 40 70 6 CustomName:'{"text":"Korvathi Archer","color":"dark_red"}',PersistenceRequired:1b,Tags:["aelori.raider","aelori.raider_w2"],ArmorItems:[{id:"leather_boots",count:1,components:{"minecraft:dyed_color":11141120}},{},{id:"leather_chestplate",count:1,components:{"minecraft:dyed_color":11141120}},{}],HandItems:[{id:"bow",count:1},{}],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],HandDropChances:[0.1f,0.0f]}

summon skeleton 46 70 4 CustomName:'{"text":"Korvathi Archer","color":"dark_red"}',PersistenceRequired:1b,Tags:["aelori.raider","aelori.raider_w2"],ArmorItems:[{id:"leather_boots",count:1,components:{"minecraft:dyed_color":11141120}},{},{id:"leather_chestplate",count:1,components:{"minecraft:dyed_color":11141120}},{}],HandItems:[{id:"bow",count:1},{}],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],HandDropChances:[0.1f,0.0f]}

summon skeleton 36 70 9 CustomName:'{"text":"Korvathi Archer","color":"dark_red"}',PersistenceRequired:1b,Tags:["aelori.raider","aelori.raider_w2"],ArmorItems:[{id:"leather_boots",count:1,components:{"minecraft:dyed_color":11141120}},{},{id:"leather_chestplate",count:1,components:{"minecraft:dyed_color":11141120}},{}],HandItems:[{id:"bow",count:1},{}],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],HandDropChances:[0.1f,0.0f]}

# --- Spawn 4 zombie reinforcements ---
summon zombie 43 70 -2 CustomName:'{"text":"Korvathi Raider","color":"dark_red"}',PersistenceRequired:1b,Tags:["aelori.raider","aelori.raider_w2"],ArmorItems:[{id:"leather_boots",count:1,components:{"minecraft:dyed_color":11141120}},{id:"leather_leggings",count:1,components:{"minecraft:dyed_color":11141120}},{id:"iron_chestplate",count:1},{id:"leather_helmet",count:1,components:{"minecraft:dyed_color":11141120}}],HandItems:[{id:"iron_sword",count:1},{}],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],HandDropChances:[0.1f,0.0f]}

summon zombie 37 70 -4 CustomName:'{"text":"Korvathi Raider","color":"dark_red"}',PersistenceRequired:1b,Tags:["aelori.raider","aelori.raider_w2"],ArmorItems:[{id:"leather_boots",count:1,components:{"minecraft:dyed_color":11141120}},{id:"leather_leggings",count:1,components:{"minecraft:dyed_color":11141120}},{id:"iron_chestplate",count:1},{}],HandItems:[{id:"iron_axe",count:1},{}],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],HandDropChances:[0.1f,0.0f]}

summon zombie 45 70 1 CustomName:'{"text":"Korvathi Raider","color":"dark_red"}',PersistenceRequired:1b,Tags:["aelori.raider","aelori.raider_w2"],ArmorItems:[{id:"leather_boots",count:1,components:{"minecraft:dyed_color":11141120}},{id:"leather_leggings",count:1,components:{"minecraft:dyed_color":11141120}},{id:"iron_chestplate",count:1},{}],HandItems:[{id:"iron_sword",count:1},{}],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],HandDropChances:[0.1f,0.0f]}

summon zombie 39 70 -1 CustomName:'{"text":"Korvathi Raider","color":"dark_red"}',PersistenceRequired:1b,Tags:["aelori.raider","aelori.raider_w2"],ArmorItems:[{id:"leather_boots",count:1,components:{"minecraft:dyed_color":11141120}},{id:"leather_leggings",count:1,components:{"minecraft:dyed_color":11141120}},{id:"iron_chestplate",count:1},{}],HandItems:[{id:"iron_sword",count:1},{id:"shield",count:1}],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],HandDropChances:[0.1f,0.0f]}
