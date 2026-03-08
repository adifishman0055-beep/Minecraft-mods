# ============================================================
# Tides of Aelori — Korvath Quest Progress Checker
# Runs every ~1 second for Korvath faction players with active quests
# Korvath camp centered at x=1000, z=0
# ============================================================

# === QUEST 1: Harvest 32 Dark Oak Logs (War Timber) ===
execute if score @s ae_quest matches 1 store result score @s ae_k_wood run clear @s dark_oak_log 0
execute if score @s ae_quest matches 1 if score @s ae_k_wood matches 32.. run function aelori:quest/korvath/kq01_war_timber

# === QUEST 2: Deliver 64 Cobblestone (Fortifications) ===
execute if score @s ae_quest matches 2 store result score @s ae_k_stone run clear @s cobblestone 0
# Korvath storehouse location: 1010, 68, 15
execute if score @s ae_quest matches 2 if score @s ae_k_stone matches 64.. at @s if entity @s[x=1005,y=65,z=10,dx=10,dy=6,dz=10] run function aelori:quest/korvath/kq02_fortify_camp

# === QUEST 3: Light 6 Perimeter Torches (around camp) ===
# Torch positions around Korvath camp (1000-based coordinates)
execute if score @s ae_quest matches 3 if block 1030 70 30 torch run scoreboard players set @s ae_k_torch_1 1
execute if score @s ae_quest matches 3 if block 1030 70 -30 torch run scoreboard players set @s ae_k_torch_2 1
execute if score @s ae_quest matches 3 if block 970 70 30 torch run scoreboard players set @s ae_k_torch_3 1
execute if score @s ae_quest matches 3 if block 970 70 -30 torch run scoreboard players set @s ae_k_torch_4 1
execute if score @s ae_quest matches 3 if block 1000 70 40 torch run scoreboard players set @s ae_k_torch_5 1
execute if score @s ae_quest matches 3 if block 1000 70 -40 torch run scoreboard players set @s ae_k_torch_6 1
# Wall torch variants
execute if score @s ae_quest matches 3 if block 1030 70 30 wall_torch run scoreboard players set @s ae_k_torch_1 1
execute if score @s ae_quest matches 3 if block 1030 70 -30 wall_torch run scoreboard players set @s ae_k_torch_2 1
execute if score @s ae_quest matches 3 if block 970 70 30 wall_torch run scoreboard players set @s ae_k_torch_3 1
execute if score @s ae_quest matches 3 if block 970 70 -30 wall_torch run scoreboard players set @s ae_k_torch_4 1
execute if score @s ae_quest matches 3 if block 1000 70 40 wall_torch run scoreboard players set @s ae_k_torch_5 1
execute if score @s ae_quest matches 3 if block 1000 70 -40 wall_torch run scoreboard players set @s ae_k_torch_6 1
# Check all 6
execute if score @s ae_quest matches 3 if score @s ae_k_torch_1 matches 1 if score @s ae_k_torch_2 matches 1 if score @s ae_k_torch_3 matches 1 if score @s ae_k_torch_4 matches 1 if score @s ae_k_torch_5 matches 1 if score @s ae_k_torch_6 matches 1 run function aelori:quest/korvath/kq03_light_perimeter

# === QUEST 4: Build 4 War Walls ===
# Wall positions around Korvath camp
execute if score @s ae_quest matches 4 if block 1025 69 25 cobblestone run scoreboard players set @s ae_k_wall_1 1
execute if score @s ae_quest matches 4 if block 1025 69 -25 cobblestone run scoreboard players set @s ae_k_wall_2 1
execute if score @s ae_quest matches 4 if block 975 69 25 cobblestone run scoreboard players set @s ae_k_wall_3 1
execute if score @s ae_quest matches 4 if block 975 69 -25 cobblestone run scoreboard players set @s ae_k_wall_4 1
# Accept blackstone too
execute if score @s ae_quest matches 4 if block 1025 69 25 blackstone run scoreboard players set @s ae_k_wall_1 1
execute if score @s ae_quest matches 4 if block 1025 69 -25 blackstone run scoreboard players set @s ae_k_wall_2 1
execute if score @s ae_quest matches 4 if block 975 69 25 blackstone run scoreboard players set @s ae_k_wall_3 1
execute if score @s ae_quest matches 4 if block 975 69 -25 blackstone run scoreboard players set @s ae_k_wall_4 1
# Also cobblestone
execute if score @s ae_quest matches 4 if block 1025 69 25 stone_bricks run scoreboard players set @s ae_k_wall_1 1
execute if score @s ae_quest matches 4 if block 1025 69 -25 stone_bricks run scoreboard players set @s ae_k_wall_2 1
execute if score @s ae_quest matches 4 if block 975 69 25 stone_bricks run scoreboard players set @s ae_k_wall_3 1
execute if score @s ae_quest matches 4 if block 975 69 -25 stone_bricks run scoreboard players set @s ae_k_wall_4 1
# Check all 4
execute if score @s ae_quest matches 4 if score @s ae_k_wall_1 matches 1 if score @s ae_k_wall_2 matches 1 if score @s ae_k_wall_3 matches 1 if score @s ae_k_wall_4 matches 1 run function aelori:quest/korvath/kq04_war_walls

# === QUEST 5: Craft & Place Korvath Banner (Red Banner) ===
execute if score @s ae_quest matches 5 if block 1000 75 0 red_banner run function aelori:quest/korvath/kq05_war_banner

# === QUEST 6: Scout Aelori Island ===
# Must enter Aelori territory (near 0, 70, 0)
execute if score @s ae_quest matches 6 at @s if entity @s[x=-50,y=50,z=-50,dx=100,dy=70,dz=100] run function aelori:quest/korvath/kq06_scout_aelori

# === QUEST 7: Defend Against Aelori Counter-Attack ===
execute if score @s ae_quest matches 7 unless score #global ae_k_raid_active matches 1..2 run function aelori:event/korvath/raid_start

# === QUEST 8: Deliver 16 Iron Ingots to Forgemaster Kael ===
execute if score @s ae_quest matches 8 store result score @s ae_k_iron run clear @s iron_ingot 0
execute if score @s ae_quest matches 8 if score @s ae_k_iron matches 16.. at @s if entity @e[type=villager,name="Forgemaster Kael",distance=..5] run function aelori:quest/korvath/kq08_iron_tribute
