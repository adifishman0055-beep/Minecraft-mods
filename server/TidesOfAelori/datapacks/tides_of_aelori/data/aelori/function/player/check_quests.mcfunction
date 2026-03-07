# # ============================================================
# # Tides of Aelori — Quest Progress Checker
# # Runs every ~1 second for each player with an active quest
# # Detects quest completion conditions
# # ============================================================
# 
# # === QUEST 1: Gather 32 Oak Logs ===
# # Count oak_log in inventory (clear with count 0 = dry run, returns count)
# # execute if score @s ae_quest matches 1 store result score @s ae_wood_count run clear @s oak_log 0
# # execute if score @s ae_quest matches 1 if score @s ae_wood_count matches 32.. run function aelori:quest/q01_gather_wood
# 
# # === QUEST 2: Deliver 64 Bread ===
# # Player must drop bread into the storehouse hopper at the village
# # We check if player is near the storehouse AND has bread count
# # execute if score @s ae_quest matches 2 store result score @s ae_bread_count run clear @s bread 0
# # Storehouse location: 10 68 15 (adjust to your build)
# # execute if score @s ae_quest matches 2 if score @s ae_bread_count matches 64.. at @s if entity @s[x=5,y=65,z=10,dx=10,dy=6,dz=10] run function aelori:quest/q02_deliver_food
# 
# # === QUEST 3: Light 6 Perimeter Torches ===
# # Check each torch position (adjust coordinates to your build)
# # execute if score @s ae_quest matches 3 if block 30 70 30 torch run scoreboard players set @s ae_torch_1 1
# # execute if score @s ae_quest matches 3 if block 30 70 -30 torch run scoreboard players set @s ae_torch_2 1
# # execute if score @s ae_quest matches 3 if block -30 70 30 torch run scoreboard players set @s ae_torch_3 1
# # execute if score @s ae_quest matches 3 if block -30 70 -30 torch run scoreboard players set @s ae_torch_4 1
# # execute if score @s ae_quest matches 3 if block 0 70 40 torch run scoreboard players set @s ae_torch_5 1
# # execute if score @s ae_quest matches 3 if block 0 70 -40 torch run scoreboard players set @s ae_torch_6 1
# # Also check wall_torch variant
# # execute if score @s ae_quest matches 3 if block 30 70 30 wall_torch run scoreboard players set @s ae_torch_1 1
# # execute if score @s ae_quest matches 3 if block 30 70 -30 wall_torch run scoreboard players set @s ae_torch_2 1
# # execute if score @s ae_quest matches 3 if block -30 70 30 wall_torch run scoreboard players set @s ae_torch_3 1
# # execute if score @s ae_quest matches 3 if block -30 70 -30 wall_torch run scoreboard players set @s ae_torch_4 1
# # execute if score @s ae_quest matches 3 if block 0 70 40 wall_torch run scoreboard players set @s ae_torch_5 1
# # execute if score @s ae_quest matches 3 if block 0 70 -40 wall_torch run scoreboard players set @s ae_torch_6 1
# # Check if all 6 are lit
# # execute if score @s ae_quest matches 3 if score @s ae_torch_1 matches 1 if score @s ae_torch_2 matches 1 if score @s ae_torch_3 matches 1 if score @s ae_torch_4 matches 1 if score @s ae_torch_5 matches 1 if score @s ae_torch_6 matches 1 run function aelori:quest/q03_light_torches
# 
# # === QUEST 4: Repair 4 Wall Gaps ===
# # Check each wall gap position (adjust coordinates to your build)
# # execute if score @s ae_quest matches 4 if block 25 69 25 cobblestone run scoreboard players set @s ae_wall_1 1
# # execute if score @s ae_quest matches 4 if block 25 69 -25 cobblestone run scoreboard players set @s ae_wall_2 1
# # execute if score @s ae_quest matches 4 if block -25 69 25 cobblestone run scoreboard players set @s ae_wall_3 1
# # execute if score @s ae_quest matches 4 if block -25 69 -25 cobblestone run scoreboard players set @s ae_wall_4 1
# # Also accept stone_bricks
# # execute if score @s ae_quest matches 4 if block 25 69 25 stone_bricks run scoreboard players set @s ae_wall_1 1
# # execute if score @s ae_quest matches 4 if block 25 69 -25 stone_bricks run scoreboard players set @s ae_wall_2 1
# # execute if score @s ae_quest matches 4 if block -25 69 25 stone_bricks run scoreboard players set @s ae_wall_3 1
# # execute if score @s ae_quest matches 4 if block -25 69 -25 stone_bricks run scoreboard players set @s ae_wall_4 1
# # Check if all 4 are repaired
# # execute if score @s ae_quest matches 4 if score @s ae_wall_1 matches 1 if score @s ae_wall_2 matches 1 if score @s ae_wall_3 matches 1 if score @s ae_wall_4 matches 1 run function aelori:quest/q04_repair_wall
# 
# # === QUEST 5: Craft & Place Aelori Banner ===
# # Check if a light_blue_banner exists at the Town Hall flagpole (adjust coords)
# # execute if score @s ae_quest matches 5 if block 0 75 0 light_blue_banner run function aelori:quest/q05_craft_banner
# 
# # === QUEST 6: Scout the Eastern Coastline ===
# # Check if player has entered the scouting zone (eastern coast area)
# # execute if score @s ae_quest matches 6 at @s if entity @s[x=200,y=50,z=-50,dx=100,dy=70,dz=100] run function aelori:quest/q06_scout_coast
# 
# # === QUEST 7: Survive the Night Raid ===
# # Raid is triggered separately — this checks for raid-in-progress
# # Raid completion handled in event/raid_end.mcfunction
# # Here we just trigger the raid to start if it hasn't begun
# # execute if score @s ae_quest matches 7 unless score #global ae_raid_active matches 1..2 run function aelori:event/raid_start
# 
# # === QUEST 8: Deliver 16 Iron Ingots to Blacksmith ===
# # execute if score @s ae_quest matches 8 store result score @s ae_iron_count run clear @s iron_ingot 0
# # Must be near the blacksmith (adjust coordinates)
# # execute if score @s ae_quest matches 8 if score @s ae_iron_count matches 16.. at @s if entity @e[type=villager,name="Smith Dorek",distance=..5] run function aelori:quest/q08_deliver_iron
