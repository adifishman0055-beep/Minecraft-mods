# ============================================================
# Tides of Aelori — Raid Wave 1
# First wave: 8 Korvathi footsoldiers (zombies in red leather)
# Spawn at eastern shore coordinates
# ============================================================

# --- Advance wave counter ---
scoreboard players set #global ae_raid_wave 1

# --- Announcement ---
tellraw @a [{"text":"[RAID] ","color":"dark_red","bold":true},{"text":"Wave 1 — Korvathi Footsoldiers approaching from the east!","color":"red"}]
title @a times 10 40 10
title @a title "text":""}
title @a subtitle "text":"Wave 1 — Footsoldiers!","color":"red"}

playsound minecraft:entity.evoker.prepare_summon master @a ~ ~ ~ 1 0.7

# --- Spawn 8 Korvathi footsoldiers on the eastern shore ---
# Adjust coordinates to your island's eastern beach
# They are zombies wearing dyed red leather armor with weapons

summon zombie 40 70 5 CustomName:'{"text":"Korvathi Raider","color":"dark_red"}',PersistenceRequired:1b,Tags:["aelori.raider","aelori.raider_w1"],ArmorItems:[{id:"leather_boots",count:1,components:{"minecraft:dyed_color":11141120}},{id:"leather_leggings",count:1,components:{"minecraft:dyed_color":11141120}},{id:"leather_chestplate",count:1,components:{"minecraft:dyed_color":11141120}},{id:"leather_helmet",count:1,components:{"minecraft:dyed_color":11141120}}],HandItems:[{id:"iron_sword",count:1},{}],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],HandDropChances:[0.1f,0.0f]}

summon zombie 42 70 3 CustomName:'{"text":"Korvathi Raider","color":"dark_red"}',PersistenceRequired:1b,Tags:["aelori.raider","aelori.raider_w1"],ArmorItems:[{id:"leather_boots",count:1,components:{"minecraft:dyed_color":11141120}},{id:"leather_leggings",count:1,components:{"minecraft:dyed_color":11141120}},{id:"leather_chestplate",count:1,components:{"minecraft:dyed_color":11141120}},{}],HandItems:[{id:"stone_axe",count:1},{}],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],HandDropChances:[0.1f,0.0f]}

summon zombie 38 70 7 CustomName:'{"text":"Korvathi Raider","color":"dark_red"}',PersistenceRequired:1b,Tags:["aelori.raider","aelori.raider_w1"],ArmorItems:[{id:"leather_boots",count:1,components:{"minecraft:dyed_color":11141120}},{id:"leather_leggings",count:1,components:{"minecraft:dyed_color":11141120}},{id:"leather_chestplate",count:1,components:{"minecraft:dyed_color":11141120}},{}],HandItems:[{id:"iron_sword",count:1},{}],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],HandDropChances:[0.1f,0.0f]}

summon zombie 40 70 -3 CustomName:'{"text":"Korvathi Raider","color":"dark_red"}',PersistenceRequired:1b,Tags:["aelori.raider","aelori.raider_w1"],ArmorItems:[{id:"leather_boots",count:1,components:{"minecraft:dyed_color":11141120}},{id:"leather_leggings",count:1,components:{"minecraft:dyed_color":11141120}},{id:"leather_chestplate",count:1,components:{"minecraft:dyed_color":11141120}},{}],HandItems:[{id:"stone_sword",count:1},{}],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],HandDropChances:[0.1f,0.0f]}

summon zombie 44 70 0 CustomName:'{"text":"Korvathi Raider","color":"dark_red"}',PersistenceRequired:1b,Tags:["aelori.raider","aelori.raider_w1"],ArmorItems:[{id:"leather_boots",count:1,components:{"minecraft:dyed_color":11141120}},{id:"leather_leggings",count:1,components:{"minecraft:dyed_color":11141120}},{id:"leather_chestplate",count:1,components:{"minecraft:dyed_color":11141120}},{}],HandItems:[{id:"iron_axe",count:1},{}],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],HandDropChances:[0.1f,0.0f]}

summon zombie 36 70 2 CustomName:'{"text":"Korvathi Raider","color":"dark_red"}',PersistenceRequired:1b,Tags:["aelori.raider","aelori.raider_w1"],ArmorItems:[{id:"leather_boots",count:1,components:{"minecraft:dyed_color":11141120}},{id:"leather_leggings",count:1,components:{"minecraft:dyed_color":11141120}},{id:"leather_chestplate",count:1,components:{"minecraft:dyed_color":11141120}},{}],HandItems:[{id:"iron_sword",count:1},{}],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],HandDropChances:[0.1f,0.0f]}

summon zombie 41 70 8 CustomName:'{"text":"Korvathi Raider","color":"dark_red"}',PersistenceRequired:1b,Tags:["aelori.raider","aelori.raider_w1"],ArmorItems:[{id:"leather_boots",count:1,components:{"minecraft:dyed_color":11141120}},{id:"leather_leggings",count:1,components:{"minecraft:dyed_color":11141120}},{id:"leather_chestplate",count:1,components:{"minecraft:dyed_color":11141120}},{}],HandItems:[{id:"stone_sword",count:1},{}],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],HandDropChances:[0.1f,0.0f]}

summon zombie 39 70 -5 CustomName:'{"text":"Korvathi Raider","color":"dark_red"}',PersistenceRequired:1b,Tags:["aelori.raider","aelori.raider_w1"],ArmorItems:[{id:"leather_boots",count:1,components:{"minecraft:dyed_color":11141120}},{id:"leather_leggings",count:1,components:{"minecraft:dyed_color":11141120}},{id:"leather_chestplate",count:1,components:{"minecraft:dyed_color":11141120}},{}],HandItems:[{id:"iron_sword",count:1},{}],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],HandDropChances:[0.1f,0.0f]}
