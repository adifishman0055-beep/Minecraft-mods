# # ============================================================
# # Tides of Aelori — Admin: Reset Player Progress
# # Use: /function aelori:util/reset_player
# # Resets the executing player back to the faction selection screen
# # ============================================================
# 
# # --- Core state ---
# scoreboard players set @s ae_joined 0
# scoreboard players set @s ae_quest 0
# scoreboard players set @s ae_faction 0
# scoreboard players set @s ae_select_fac 0
# scoreboard players set @s ae_contribution 0
# 
# # --- Aelori quest trackers ---
# scoreboard players set @s ae_wood_count 0
# scoreboard players set @s ae_bread_count 0
# scoreboard players set @s ae_torches_lit 0
# scoreboard players set @s ae_walls_fixed 0
# scoreboard players set @s ae_iron_count 0
# scoreboard players set @s ae_banner_placed 0
# scoreboard players set @s ae_dialog_cd 0
# scoreboard players set @s ae_torch_1 0
# scoreboard players set @s ae_torch_2 0
# scoreboard players set @s ae_torch_3 0
# scoreboard players set @s ae_torch_4 0
# scoreboard players set @s ae_torch_5 0
# scoreboard players set @s ae_torch_6 0
# scoreboard players set @s ae_wall_1 0
# scoreboard players set @s ae_wall_2 0
# scoreboard players set @s ae_wall_3 0
# scoreboard players set @s ae_wall_4 0
# 
# # --- Korvath quest trackers ---
# scoreboard players set @s ae_k_wood 0
# scoreboard players set @s ae_k_stone 0
# scoreboard players set @s ae_k_torches 0
# scoreboard players set @s ae_k_walls 0
# scoreboard players set @s ae_k_iron 0
# scoreboard players set @s ae_k_banner 0
# scoreboard players set @s ae_k_torch_1 0
# scoreboard players set @s ae_k_torch_2 0
# scoreboard players set @s ae_k_torch_3 0
# scoreboard players set @s ae_k_torch_4 0
# scoreboard players set @s ae_k_torch_5 0
# scoreboard players set @s ae_k_torch_6 0
# scoreboard players set @s ae_k_wall_1 0
# scoreboard players set @s ae_k_wall_2 0
# scoreboard players set @s ae_k_wall_3 0
# scoreboard players set @s ae_k_wall_4 0
# 
# # --- Raid state (global) ---
# scoreboard players set #global ae_raid_active 0
# scoreboard players set #global ae_raid_wave 0
# scoreboard players set #global ae_raid_timer 0
# scoreboard players set #global ae_k_raid_active 0
# scoreboard players set #global ae_k_raid_wave 0
# scoreboard players set #global ae_k_raid_timer 0
# kill @e[tag=aelori.raider]
# 
# # --- Settlement ---
# scoreboard players set #aelori_village ae_settlement 0
# scoreboard players set #korvath_village ae_settlement 0
# 
# # --- Teleport back to lobby ---
# # tp @s 0 100 0 0 0
# 
# # --- Revoke all advancements ---
# advancement revoke @s everything
# 
# # --- Clear custom items ---
# clear @s written_book
# clear @s compass
# clear @s leather_chestplate
# 
# tellraw @s [{"text":"[ADMIN] ","color":"red","bold":true},{"text":"All progress reset. Choose your faction again!","color":"yellow"}]
# 
