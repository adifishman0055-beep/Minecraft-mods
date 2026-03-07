# # ============================================================
# # Dialogue: Farmer Hella
# # The village farmer
# # ============================================================
# 
# # --- Set cooldown ---
# scoreboard players set @s ae_dialog_cd 5
# 
# # --- Quest-based dialogue ---
# # execute if score @s ae_quest matches 0..1 run tellraw @s [{"text":"Farmer Hella: ","color":"green","italic":true},{"text":"The crops are growing, but slowly. These fields used to feed a hundred people. Now there are barely enough of us to tend them.","color":"white"}]
# 
# # execute if score @s ae_quest matches 2 run tellraw @s [{"text":"Farmer Hella: ","color":"green","italic":true},{"text":"You're gathering food? Wonderful! The storehouse is just south of the Town Hall. We need at least 64 bread to get through the week. I can trade some if you bring wheat.","color":"yellow"}]
# 
# # execute if score @s ae_quest matches 3..5 run tellraw @s [{"text":"Farmer Hella: ","color":"green","italic":true},{"text":"Thank you for feeding us. The children smiled today for the first time in weeks. If you need food, I always have bread and carrots.","color":"white"}]
# 
# # execute if score @s ae_quest matches 6..7 run tellraw @s [{"text":"Farmer Hella: ","color":"green","italic":true},{"text":"Raiders? Here? Oh no... I'll keep the children inside. Please, be careful out there.","color":"white"}]
# 
# # execute if score @s ae_quest matches 8..9 run tellraw @s [{"text":"Farmer Hella: ","color":"green","italic":true},{"text":"We survived. The harvest is coming in strong. Maybe... maybe things will be alright after all.","color":"white"}]
# 
# # --- Ambient particles (farming) ---
# # particle composter ~ ~1 ~ 0.5 0.5 0.5 0 3
