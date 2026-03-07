# ============================================================
# Tides of Aelori — Debug / Admin Functions
# Useful for testing. Run manually in-game.
# ============================================================

# --- Reset a player's quest progress ---
# /function aelori:util/reset_player
scoreboard players set @s ae_joined 0
scoreboard players set @s ae_quest 0
scoreboard players set @s ae_faction 0
scoreboard players set @s ae_wood_count 0
scoreboard players set @s ae_bread_count 0
scoreboard players set @s ae_torches_lit 0
scoreboard players set @s ae_walls_fixed 0
scoreboard players set @s ae_iron_count 0
scoreboard players set @s ae_banner_placed 0
scoreboard players set @s ae_dialog_cd 0
scoreboard players set @s ae_torch_1 0
scoreboard players set @s ae_torch_2 0
scoreboard players set @s ae_torch_3 0
scoreboard players set @s ae_torch_4 0
scoreboard players set @s ae_torch_5 0
scoreboard players set @s ae_torch_6 0
scoreboard players set @s ae_wall_1 0
scoreboard players set @s ae_wall_2 0
scoreboard players set @s ae_wall_3 0
scoreboard players set @s ae_wall_4 0

# Reset raid state
scoreboard players set #global ae_raid_active 0
scoreboard players set #global ae_raid_wave 0
scoreboard players set #global ae_raid_timer 0
kill @e[tag=aelori.raider]

# Reset settlement
scoreboard players set #village ae_settlement 0

# Revoke all advancements
advancement revoke @s everything

# Clear custom items
clear @s written_book
clear @s compass{display:{Name:'{"text":"Aelori Compass"}'}}

tellraw @s [{"text":"[DEBUG] ","color":"red"},{"text":"Player progress reset. Re-join to restart.","color":"yellow"}]
