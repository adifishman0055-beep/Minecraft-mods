# ============================================================
# Tides of Aelori — Aelori HUD / Actionbar Update
# Shows current quest + faction scores + week
# ============================================================

execute if score @s ae_quest matches 1 run # # title actionbar [{"text":"Quest: ","color":"gold"},{"text":"Gather 32 Oak Logs","color":"white"},{"text":" | Wk ","color":"gray"},{"score":{"name":"#global","objective":"ae_week"},"color":"yellow"},{"text":"/10","color":"gray"}]

execute if score @s ae_quest matches 2 run # # title actionbar [{"text":"Quest: ","color":"gold"},{"text":"Deliver 64 Bread to the Storehouse","color":"white"},{"text":" | Wk ","color":"gray"},{"score":{"name":"#global","objective":"ae_week"},"color":"yellow"},{"text":"/10","color":"gray"}]

execute if score @s ae_quest matches 3 run # # title actionbar [{"text":"Quest: ","color":"gold"},{"text":"Light 6 Perimeter Torches","color":"white"},{"text":" | Wk ","color":"gray"},{"score":{"name":"#global","objective":"ae_week"},"color":"yellow"},{"text":"/10","color":"gray"}]

execute if score @s ae_quest matches 4 run # # title actionbar [{"text":"Quest: ","color":"gold"},{"text":"Repair 4 Wall Gaps","color":"white"},{"text":" | Wk ","color":"gray"},{"score":{"name":"#global","objective":"ae_week"},"color":"yellow"},{"text":"/10","color":"gray"}]

execute if score @s ae_quest matches 5 run # # title actionbar [{"text":"Quest: ","color":"gold"},{"text":"Craft & Place Aelori Banner at Town Hall","color":"white"},{"text":" | Wk ","color":"gray"},{"score":{"name":"#global","objective":"ae_week"},"color":"yellow"},{"text":"/10","color":"gray"}]

execute if score @s ae_quest matches 6 run # # title actionbar [{"text":"Quest: ","color":"gold"},{"text":"Scout the Eastern Coastline","color":"white"},{"text":" | Wk ","color":"gray"},{"score":{"name":"#global","objective":"ae_week"},"color":"yellow"},{"text":"/10","color":"gray"}]

execute if score @s ae_quest matches 7 if score #global ae_raid_active matches 0 run # # title actionbar [{"text":"Quest: ","color":"gold"},{"text":"Prepare for the Night Raid...","color":"red"},{"text":" | Wk ","color":"gray"},{"score":{"name":"#global","objective":"ae_week"},"color":"yellow"},{"text":"/10","color":"gray"}]
execute if score @s ae_quest matches 7 if score #global ae_raid_active matches 1 run # # title actionbar [{"text":"⚔ RAID IN PROGRESS ","color":"dark_red","bold":true},{"text":"— Defend the Village!","color":"red","bold":false}]

execute if score @s ae_quest matches 8 run # # title actionbar [{"text":"Quest: ","color":"gold"},{"text":"Deliver 16 Iron Ingots to Smith Dorek","color":"white"},{"text":" | Wk ","color":"gray"},{"score":{"name":"#global","objective":"ae_week"},"color":"yellow"},{"text":"/10","color":"gray"}]

execute if score @s ae_quest matches 9 run # # title actionbar [{"text":"Ch.1 Complete ","color":"green","bold":true},{"text":"The Shattered Shore ","color":"aqua"},{"text":"⚔ A:","color":"aqua"},{"score":{"name":"#global","objective":"ae_aelori_pts"},"color":"aqua","bold":true},{"text":" K:","color":"dark_red"},{"score":{"name":"#global","objective":"ae_korvath_pts"},"color":"dark_red","bold":true},{"text":" Wk ","color":"gray"},{"score":{"name":"#global","objective":"ae_week"},"color":"yellow"},{"text":"/10","color":"gray"}]
