# ============================================================
# Korvath HUD — Actionbar Objective Display
# Shows current mission objective for Korvath players
# Also shows faction conquest scores and week
# ============================================================

# --- Show current mission objective ---
execute if score @s ae_quest matches 1 run title @s actionbar [{"text":"Mission: ","color":"dark_red"},{"text":"Harvest 32 Dark Oak Logs","color":"white"},{"text":" | Wk ","color":"gray"},{"score":{"name":"#global","objective":"ae_week"},"color":"yellow"},{"text":"/10","color":"gray"}]

execute if score @s ae_quest matches 2 run title @s actionbar [{"text":"Mission: ","color":"dark_red"},{"text":"Deliver 64 Cobblestone to Storehouse","color":"white"},{"text":" | Wk ","color":"gray"},{"score":{"name":"#global","objective":"ae_week"},"color":"yellow"},{"text":"/10","color":"gray"}]

execute if score @s ae_quest matches 3 run title @s actionbar [{"text":"Mission: ","color":"dark_red"},{"text":"Light 6 Perimeter Torches","color":"white"},{"text":" | Wk ","color":"gray"},{"score":{"name":"#global","objective":"ae_week"},"color":"yellow"},{"text":"/10","color":"gray"}]

execute if score @s ae_quest matches 4 run title @s actionbar [{"text":"Mission: ","color":"dark_red"},{"text":"Build 4 War Walls","color":"white"},{"text":" | Wk ","color":"gray"},{"score":{"name":"#global","objective":"ae_week"},"color":"yellow"},{"text":"/10","color":"gray"}]

execute if score @s ae_quest matches 5 run title @s actionbar [{"text":"Mission: ","color":"dark_red"},{"text":"Craft & Place Red Banner at camp center","color":"white"},{"text":" | Wk ","color":"gray"},{"score":{"name":"#global","objective":"ae_week"},"color":"yellow"},{"text":"/10","color":"gray"}]

execute if score @s ae_quest matches 6 run title @s actionbar [{"text":"Mission: ","color":"dark_red"},{"text":"Scout Aelori Island (near 0,70,0)","color":"white"},{"text":" | Wk ","color":"gray"},{"score":{"name":"#global","objective":"ae_week"},"color":"yellow"},{"text":"/10","color":"gray"}]

execute if score @s ae_quest matches 7 if score #global ae_k_raid_active matches 0 run title @s actionbar [{"text":"Mission: ","color":"dark_red"},{"text":"Return to camp — defend against Aelori!","color":"red"},{"text":" | Wk ","color":"gray"},{"score":{"name":"#global","objective":"ae_week"},"color":"yellow"},{"text":"/10","color":"gray"}]
execute if score @s ae_quest matches 7 if score #global ae_k_raid_active matches 1 run title @s actionbar [{"text":"☠ AELORI ASSAULT ","color":"aqua","bold":true},{"text":"— Repel the attack!","color":"red","bold":false},{"text":" | Wk ","color":"gray"},{"score":{"name":"#global","objective":"ae_week"},"color":"yellow"},{"text":"/10","color":"gray"}]

execute if score @s ae_quest matches 8 run title @s actionbar [{"text":"Mission: ","color":"dark_red"},{"text":"Deliver 16 Iron Ingots to Forgemaster Kael","color":"white"},{"text":" | Wk ","color":"gray"},{"score":{"name":"#global","objective":"ae_week"},"color":"yellow"},{"text":"/10","color":"gray"}]

execute if score @s ae_quest matches 9 run title @s actionbar [{"text":"Ch.1 Complete ","color":"gold","bold":true},{"text":"The Warcamp ","color":"red"},{"text":"⚔ K:","color":"dark_red"},{"score":{"name":"#global","objective":"ae_korvath_pts"},"color":"dark_red","bold":true},{"text":" A:","color":"aqua"},{"score":{"name":"#global","objective":"ae_aelori_pts"},"color":"aqua","bold":true},{"text":" Wk ","color":"gray"},{"score":{"name":"#global","objective":"ae_week"},"color":"yellow"},{"text":"/10","color":"gray"}]
