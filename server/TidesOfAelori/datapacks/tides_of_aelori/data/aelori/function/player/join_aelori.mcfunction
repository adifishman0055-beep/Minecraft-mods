# ============================================================
# Tides of Aelori — Join the Aelori (Good Guys / Defenders)
# Called when player clicks "JOIN THE AELORI" in faction select
# ============================================================

# --- Lock in faction ---
scoreboard players set @s ae_joined 2
scoreboard players set @s ae_faction 1
scoreboard players set @s ae_select_fac 0

# --- Remove lobby effects ---
effect clear @s minecraft:resistance
effect clear @s minecraft:saturation

# --- Switch to survival ---
gamemode survival @s

# --- Teleport to Aelori island (village center) ---
tp @s 0 70 0 0 0

# --- Announce to server ---
tellraw @a [{"text":"[Tides] ","color":"gold","bold":true},{"selector":"@s","color":"aqua"},{"text":" has joined the ","color":"gray"},{"text":"Aelori Defenders","color":"aqua","bold":true},{"text":"!","color":"gray"}]

# --- Start campaign if first player to join ---
execute if score #global ae_campaign matches 0 run function aelori:campaign/start

# --- Cinematic intro ---
title @s times 20 80 20
title @s title {"text":"Welcome to Aelori","color":"aqua","bold":true}
title @s subtitle {"text":"Defend the Light","color":"yellow","italic":true}

playsound minecraft:block.bell.use master @s ~ ~ ~ 1 0.8
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 1.0

# --- Aelori narrative ---
tellraw @s ""
tellraw @s [{"text":"═══════════════════════════════════","color":"dark_aqua"}]
tellraw @s ""
tellraw @s [{"text":"  You awaken on the shores of ","color":"gray"},{"text":"Aelori","color":"aqua","bold":true},{"text":".","color":"gray"}]
tellraw @s ""
tellraw @s [{"text":"  The island village stands battered but proud.","color":"gray"}]
tellraw @s [{"text":"  Its people look to you with desperate hope.","color":"gray"}]
tellraw @s ""
tellraw @s [{"text":"  Across the dark waters, the island of ","color":"gray"},{"text":"Korvath","color":"dark_red","bold":true}]
tellraw @s [{"text":"  looms — a rival nation, hungry and hostile.","color":"gray"}]
tellraw @s ""
tellraw @s [{"text":"  Help your village survive. Grow strong.","color":"white"}]
tellraw @s [{"text":"  You have ","color":"white"},{"text":"10 weeks","color":"gold","bold":true},{"text":" to prepare for the final battle.","color":"white"}]
tellraw @s ""
tellraw @s [{"text":"═══════════════════════════════════","color":"dark_aqua"}]
tellraw @s ""

# --- Give starter items ---
give @s writable_book 1

give @s compass
give @s bread 16
give @s stone_axe 1
give @s stone_pickaxe 1

# --- Give blue team identifier ---
give @s leather_chestplate[enchantments={levels:{"minecraft:binding_curse":1}},dyed_color={rgb:5592575}]

# --- Grant root advancement & start quest ---
advancement grant @s only aelori:root
scoreboard players set @s ae_quest 1

# --- Quest 1 notification ---
tellraw @s ""
tellraw @s [{"text":"[QUEST 1] ","color":"green","bold":true},{"text":"Timber Supply","color":"white"}]
tellraw @s [{"text":"  Gather ","color":"gray"},{"text":"32 Oak Logs","color":"yellow"},{"text":" for the village stockpile.","color":"gray"}]
tellraw @s ""

playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1.2
