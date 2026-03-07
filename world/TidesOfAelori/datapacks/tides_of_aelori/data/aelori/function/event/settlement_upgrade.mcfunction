# ============================================================
# Tides of Aelori — Settlement Upgrade
# Visual and functional upgrades to the village
# Called when settlement level increases
# ============================================================

# --- Check current settlement level and apply upgrades ---

# === LEVEL 1 → RESTORED ===
# After repairing walls (Quest 4)
execute if score #village ae_settlement matches 1 run tellraw @a [{"text":"[Aelori] ","color":"gold"},{"text":"The village has been restored to basic function.","color":"green"}]

# Add decorative elements (lanterns, flower pots, etc.)
# These coordinates should match your village build
execute if score #village ae_settlement matches 1 run setblock 5 70 5 lantern
execute if score #village ae_settlement matches 1 run setblock -5 70 5 lantern
execute if score #village ae_settlement matches 1 run setblock 5 70 -5 lantern
execute if score #village ae_settlement matches 1 run setblock -5 70 -5 lantern

# Add a notice board (sign) at the town center
execute if score #village ae_settlement matches 1 run setblock 1 71 0 oak_sign{front_text:{messages:['{"text":"VILLAGE NOTICE","color":"dark_aqua","bold":true}','{"text":"Level 1: Restored"}','{"text":"Walls repaired"}','{"text":"- Elder Miravel"}']}}

# Particle celebration
execute if score #village ae_settlement matches 1 positioned 0 72 0 run particle happy_villager ~ ~ ~ 5 3 5 0 50

# === LEVEL 2 → FORTIFIED ===
# After Chapter 1 completion (Quest 8)
execute if score #village ae_settlement matches 2 run tellraw @a [{"text":"[Aelori] ","color":"gold"},{"text":"Aelori Village is now FORTIFIED! New structures have appeared.","color":"green","bold":true}]

# Upgrade the notice board
execute if score #village ae_settlement matches 2 run setblock 1 71 0 oak_sign{front_text:{messages:['{"text":"VILLAGE NOTICE","color":"gold","bold":true}','{"text":"Level 2: Fortified"}','{"text":"Chapter 1 Complete!"}','{"text":"- Elder Miravel"}']}}

# Add more lighting and decorations
execute if score #village ae_settlement matches 2 run setblock 10 71 0 lantern
execute if score #village ae_settlement matches 2 run setblock -10 71 0 lantern
execute if score #village ae_settlement matches 2 run setblock 0 71 10 lantern
execute if score #village ae_settlement matches 2 run setblock 0 71 -10 lantern

# Add a bell (village center)
execute if score #village ae_settlement matches 2 run setblock 0 72 0 bell

# Add armor stands as "guards" at the gate
execute if score #village ae_settlement matches 2 run summon armor_stand -12 70 -20 {CustomName:'{"text":"Aelori Guard","color":"aqua"}',CustomNameVisible:1b,ShowArms:1b,Tags:["aelori.decoration"],ArmorItems:[{id:"iron_boots",count:1},{id:"iron_leggings",count:1},{id:"iron_chestplate",count:1},{id:"iron_helmet",count:1}],HandItems:[{id:"iron_sword",count:1},{id:"shield",count:1}]}
execute if score #village ae_settlement matches 2 run summon armor_stand -8 70 -20 {CustomName:'{"text":"Aelori Guard","color":"aqua"}',CustomNameVisible:1b,ShowArms:1b,Tags:["aelori.decoration"],ArmorItems:[{id:"iron_boots",count:1},{id:"iron_leggings",count:1},{id:"iron_chestplate",count:1},{id:"iron_helmet",count:1}],HandItems:[{id:"iron_sword",count:1},{id:"shield",count:1}]}

# Grand celebration particles
execute if score #village ae_settlement matches 2 positioned 0 72 0 run particle totem_of_undying ~ ~ ~ 5 3 5 0.1 100

# --- NOTE: For larger visual overhauls, use /place structure or /clone ---
# In your actual build, you would pre-build "upgraded" versions of structures
# in a hidden area and clone them over the originals:
# Example: clone -100 60 -100 -80 80 -80 -10 60 -10 replace
# This replaces a 20x20x20 area with the upgraded version
