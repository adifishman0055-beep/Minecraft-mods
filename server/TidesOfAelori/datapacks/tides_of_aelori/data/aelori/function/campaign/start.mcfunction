# # ============================================================
# # Campaign Start — Begins the 10-week conquest timer
# # Called when the first player joins either faction
# # ============================================================
# 
# scoreboard players set #global ae_campaign 1
# scoreboard players set #global ae_week 1
# scoreboard players set #global ae_week_timer 0
# scoreboard players set #global ae_aelori_pts 0
# scoreboard players set #global ae_korvath_pts 0
# 
# # --- Announce campaign start ---
# tellraw @a ""
# tellraw @a [{"text":"══════════════════════════════════════════════","color":"gold"}]
# tellraw @a [{"text":"  ","color":"white"},{"text":"THE 10-WEEK CONQUEST HAS BEGUN!","color":"gold","bold":true}]
# tellraw @a [{"text":"══════════════════════════════════════════════","color":"gold"}]
# tellraw @a ""
# tellraw @a [{"text":"  Week ","color":"gray"},{"text":"1","color":"yellow","bold":true},{"text":" of ","color":"gray"},{"text":"10","color":"yellow","bold":true}]
# tellraw @a [{"text":"  Complete quests, defend your island, and raid","color":"gray"}]
# tellraw @a [{"text":"  the enemy to earn ","color":"gray"},{"text":"Conquest Points","color":"gold","bold":true},{"text":"!","color":"gray"}]
# tellraw @a ""
# tellraw @a [{"text":"  The faction with the most points at Week 10","color":"white"}]
# tellraw @a [{"text":"  triggers the ","color":"white"},{"text":"FINAL CONQUEST","color":"red","bold":true},{"text":" event!","color":"white"}]
# tellraw @a ""
# 
# # playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 0.8
