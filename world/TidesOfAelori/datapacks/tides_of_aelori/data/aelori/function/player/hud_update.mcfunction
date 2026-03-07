# ============================================================
# Tides of Aelori — HUD / Actionbar Update
# Shows current quest objective on the actionbar
# Runs every ~1 second for joined players
# ============================================================

# --- Show current quest objective ---
execute if score @s ae_quest matches 1 run title @s actionbar [{"text":"Quest: ","color":"gold"},{"text":"Gather 32 Oak Logs","color":"white"}]

execute if score @s ae_quest matches 2 run title @s actionbar [{"text":"Quest: ","color":"gold"},{"text":"Deliver 64 Bread to the Storehouse","color":"white"}]

execute if score @s ae_quest matches 3 run title @s actionbar [{"text":"Quest: ","color":"gold"},{"text":"Light 6 Perimeter Torches","color":"white"}]

execute if score @s ae_quest matches 4 run title @s actionbar [{"text":"Quest: ","color":"gold"},{"text":"Repair 4 Wall Gaps","color":"white"}]

execute if score @s ae_quest matches 5 run title @s actionbar [{"text":"Quest: ","color":"gold"},{"text":"Craft & Place Aelori Banner at Town Hall","color":"white"}]

execute if score @s ae_quest matches 6 run title @s actionbar [{"text":"Quest: ","color":"gold"},{"text":"Scout the Eastern Coastline","color":"white"}]

execute if score @s ae_quest matches 7 if score #global ae_raid_active matches 0 run title @s actionbar [{"text":"Quest: ","color":"gold"},{"text":"Prepare for the Night Raid...","color":"red"}]
execute if score @s ae_quest matches 7 if score #global ae_raid_active matches 1 run title @s actionbar [{"text":"⚔ RAID IN PROGRESS ","color":"dark_red","bold":true},{"text":"— Defend the Village!","color":"red","bold":false}]

execute if score @s ae_quest matches 8 run title @s actionbar [{"text":"Quest: ","color":"gold"},{"text":"Deliver 16 Iron Ingots to Smith Dorek","color":"white"}]

execute if score @s ae_quest matches 9 run title @s actionbar [{"text":"Chapter 1 Complete ","color":"green","bold":true},{"text":"— The Shattered Shore","color":"yellow","bold":false}]
