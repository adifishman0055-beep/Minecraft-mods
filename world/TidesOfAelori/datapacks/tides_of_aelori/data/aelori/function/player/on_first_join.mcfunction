# ============================================================
# Tides of Aelori — First Join Experience
# Runs once per player when they first enter the world
# ============================================================

# --- Mark as joined ---
scoreboard players set @s ae_joined 1

# --- Set faction to Aelori ---
scoreboard players set @s ae_faction 1

# --- Set quest to 0 (pre-quest) ---
scoreboard players set @s ae_quest 0

# --- Initialize all quest sub-trackers ---
scoreboard players set @s ae_wood_count 0
scoreboard players set @s ae_bread_count 0
scoreboard players set @s ae_torches_lit 0
scoreboard players set @s ae_walls_fixed 0
scoreboard players set @s ae_iron_count 0
scoreboard players set @s ae_banner_placed 0
scoreboard players set @s ae_dialog_cd 0

# --- Teleport to village spawn ---
tp @s 0 70 0 0 0

# --- Set gamemode ---
gamemode survival @s

# --- Cinematic intro sequence ---
# Fade in effect
title @s times 40 80 40
title @s title {"text":"Tides of Aelori","color":"gold","bold":true}
title @s subtitle {"text":"The Shattered Shore","color":"yellow","italic":true}

# --- Play atmospheric sound ---
playsound minecraft:ambient.cave master @s ~ ~ ~ 1 0.5
playsound minecraft:block.bell.use master @s ~ ~ ~ 1 0.8

# --- Welcome narrative (delayed via schedule would be ideal, using tellraw sequence) ---
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
tellraw @s [{"text":"  The tides are turning.","color":"white","italic":true}]
tellraw @s ""
tellraw @s [{"text":"═══════════════════════════════════","color":"dark_aqua"}]
tellraw @s ""

# --- Give starter items ---
# Elder Miravel's Journal (lore book)
give @s written_book{title:"Elder Miravel's Journal",author:"Elder Miravel",generation:0,pages:['[{"text":"The Journal of Elder Miravel\\n\\n","color":"dark_aqua","bold":true},{"text":"To whoever reads this — our island of Aelori was once a thriving nation. Grand towers rose along our coasts. Our fishermen brought in more than we could eat.\\n\\nBut that was before the Korvathi raids.","color":"black","bold":false}]','[{"text":"The Korvathi\\n\\n","color":"dark_red","bold":true},{"text":"They came from the eastern island, Korvath. At first they traded. Then they demanded. Then they took.\\n\\nOur defenses crumbled. Many fled. Those of us who remain are few, but we are stubborn.","color":"black","bold":false}]','[{"text":"Your Role\\n\\n","color":"gold","bold":true},{"text":"You have returned to us at our lowest moment. The village needs:\\n\\n- Timber for repairs\\n- Food for the hungry\\n- Light against the dark\\n- Walls against the raiders\\n\\nSpeak with me at the Town Hall.","color":"black","bold":false}]','[{"text":"The Village Council\\n\\n","color":"dark_green","bold":true},{"text":"Smith Dorek — the forge\\nFarmer Hella — the fields\\nScout Tavan — the watchtower\\nGuard Brennik — the gate\\n\\nEach will need your help. Begin with the basics — the forest has wood for the taking.","color":"black","bold":false}]']} 1

# Aelori Compass (named compass)
give @s compass{display:{Name:'{"text":"Aelori Compass","color":"aqua","italic":false}',Lore:['{"text":"Points to the heart of Aelori village","color":"gray","italic":true}']}} 1

# Basic survival starter kit
give @s bread 16
give @s stone_axe 1
give @s stone_pickaxe 1

# --- Grant root advancement ---
advancement grant @s only aelori:root

# --- Activate first quest after a moment ---
scoreboard players set @s ae_quest 1

# --- Quest 1 notification ---
tellraw @s ""
tellraw @s [{"text":"[NEW QUEST] ","color":"green","bold":true},{"text":"Timber Supply","color":"white"}]
tellraw @s [{"text":"  Gather ","color":"gray"},{"text":"32 Oak Logs","color":"yellow"},{"text":" for the village stockpile.","color":"gray"}]
tellraw @s ""

playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1.2
