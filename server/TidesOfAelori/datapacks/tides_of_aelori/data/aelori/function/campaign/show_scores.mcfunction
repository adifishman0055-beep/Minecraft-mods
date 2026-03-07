# ============================================================
# Show Scores — Quick actionbar showing faction conquest points
# Runs every second for all active players
# ============================================================

# Use actionbar only if player is NOT in an active quest (quest HUD takes priority in hud_update)
# This is a fallback for when quest HUD doesn't fire
execute if score @s ae_quest matches 9 run # # title actionbar [{"text":"⚔ ","color":"gold"},{"text":"Aelori: ","color":"aqua"},{"score":{"name":"#global","objective":"ae_aelori_pts"},"color":"aqua","bold":true},{"text":" | ","color":"gray"},{"text":"Korvath: ","color":"dark_red"},{"score":{"name":"#global","objective":"ae_korvath_pts"},"color":"dark_red","bold":true},{"text":" | Week ","color":"gray"},{"score":{"name":"#global","objective":"ae_week"},"color":"yellow"},{"text":"/10","color":"gray"}]
