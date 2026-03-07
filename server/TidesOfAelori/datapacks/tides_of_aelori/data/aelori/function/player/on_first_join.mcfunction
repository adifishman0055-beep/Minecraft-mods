# ============================================================
# Tides of Aelori — First Join: Faction Selection Lobby
# Runs once per new player. Teleports to lobby, shows choice.
# ae_joined: 0→1 (choosing), 1→2 (chose faction, in game)
# ============================================================

# --- Mark as "choosing faction" (ae_joined = 1) ---
scoreboard players set @s ae_joined 1
scoreboard players set @s ae_faction 0
scoreboard players set @s ae_quest 0
scoreboard players set @s ae_select_fac 0
scoreboard players set @s ae_contribution 0
scoreboard players set @s ae_dialog_cd 0

# --- Initialize all quest sub-trackers ---
scoreboard players set @s ae_wood_count 0
scoreboard players set @s ae_bread_count 0
scoreboard players set @s ae_torches_lit 0
scoreboard players set @s ae_walls_fixed 0
scoreboard players set @s ae_iron_count 0
scoreboard players set @s ae_banner_placed 0
scoreboard players set @s ae_k_wood 0
scoreboard players set @s ae_k_stone 0
scoreboard players set @s ae_k_torches 0
scoreboard players set @s ae_k_walls 0
scoreboard players set @s ae_k_iron 0
scoreboard players set @s ae_k_banner 0

# --- Teleport to neutral lobby ---
tp @s 0 100 0 0 0
gamemode adventure @s
effect give @s minecraft:resistance 9999 255 true
effect give @s minecraft:saturation 9999 255 true

# --- Cinematic intro ---
title @s times 40 100 40
title @s title {"text":"Tides of Aelori","color":"gold","bold":true}
title @s subtitle {"text":"Choose Your Allegiance","color":"yellow","italic":true}

playsound minecraft:ambient.cave master @s ~ ~ ~ 1 0.5
playsound minecraft:block.bell.use master @s ~ ~ ~ 1 0.8

# --- Faction selection narrative ---
tellraw @s ""
tellraw @s [{"text":"═══════════════════════════════════════════","color":"dark_purple"}]
tellraw @s ""
tellraw @s [{"text":"  Two great islands stand across the sea.","color":"gray"}]
tellraw @s [{"text":"  One fights for ","color":"gray"},{"text":"hope","color":"aqua","bold":true},{"text":". The other, for ","color":"gray"},{"text":"power","color":"dark_red","bold":true},{"text":".","color":"gray"}]
tellraw @s ""
tellraw @s [{"text":"  Neither can survive alone.","color":"gray","italic":true}]
tellraw @s [{"text":"  In 10 weeks, one nation will conquer the other.","color":"white"}]
tellraw @s ""
tellraw @s [{"text":"═══════════════════════════════════════════","color":"dark_purple"}]
tellraw @s ""
tellraw @s [{"text":"  Choose your side:","color":"white","bold":true}]
tellraw @s ""
tellraw @s [{"text":"  "},{"text":"⚔ JOIN THE AELORI ⚔","color":"aqua","bold":true,"clickEvent":{"action":"run_command","value":"/trigger ae_select_fac set 1"},"hoverEvent":{"action":"show_text","contents":[{"text":"The Defenders\n","color":"aqua","bold":true},{"text":"Protect your island home.\n","color":"gray"},{"text":"Rebuild, defend, and unite.\n","color":"gray"},{"text":"Fight for the light.","color":"yellow"}]}}]
tellraw @s ""
tellraw @s [{"text":"  "},{"text":"☠ JOIN THE KORVATH ☠","color":"dark_red","bold":true,"clickEvent":{"action":"run_command","value":"/trigger ae_select_fac set 2"},"hoverEvent":{"action":"show_text","contents":[{"text":"The Conquerors\n","color":"dark_red","bold":true},{"text":"Dominate and expand.\n","color":"gray"},{"text":"Build war machines.\n","color":"gray"},{"text":"Crush the weak.","color":"red"}]}}]
tellraw @s ""
tellraw @s [{"text":"  Click your choice above!","color":"yellow","italic":true}]
tellraw @s ""

# --- Enable trigger so player can click ---
scoreboard players enable @s ae_select_fac
