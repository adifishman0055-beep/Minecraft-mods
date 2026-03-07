# # ============================================================
# # Tides of Aelori — Skip to Quest
# # Debug: Set quest to a specific number
# # Usage: /function aelori:util/skip_to_quest
# # Then set the quest: /scoreboard players set @s ae_quest <number>
# # ============================================================
# 
# tellraw @s [{"text":"[DEBUG] ","color":"red"},{"text":"Use: /scoreboard players set @s ae_quest <0-9>","color":"yellow"}]
# tellraw @s [{"text":"  0=not started, 1=wood, 2=food, 3=torches, 4=walls","color":"gray"}]
# tellraw @s [{"text":"  5=banner, 6=scout, 7=raid, 8=iron, 9=complete","color":"gray"}]
