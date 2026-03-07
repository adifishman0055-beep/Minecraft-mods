# # ============================================================
# # FINALE — The Final Conquest (Week 10 Complete)
# # Determines the winner and triggers the endgame event
# # ============================================================
# 
# scoreboard players set #global ae_campaign 2
# 
# # --- Dramatic announcement ---
# # # title times 40 200 40
# # # title title:"THE FINAL CONQUEST","color":"red","bold":true}
# # # title subtitle:"The fate of the islands is decided!","color":"gold","italic":true}
# 
# # playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 1 0.5
# # playsound minecraft:entity.wither.# spawn master @a ~ ~ ~ 0.5 0.8
# 
# tellraw @a ""
# tellraw @a [{"text":"══════════════════════════════════════════════════","color":"red"}]
# tellraw @a [{"text":"  ","color":"red"},{"text":"⚔ THE FINAL CONQUEST ⚔","color":"gold","bold":true}]
# tellraw @a [{"text":"══════════════════════════════════════════════════","color":"red"}]
# tellraw @a ""
# tellraw @a [{"text":"  10 weeks of war have passed.","color":"gray"}]
# tellraw @a [{"text":"  The tides have turned for the last time.","color":"gray"}]
# tellraw @a ""
# tellraw @a [{"text":"  FINAL SCORES:","color":"white","bold":true}]
# tellraw @a [{"text":"  ⚔ Aelori Defenders: ","color":"aqua"},{"score":{"name":"#global","objective":"ae_aelori_pts"},"color":"aqua","bold":true},{"text":" points","color":"aqua"}]
# tellraw @a [{"text":"  ☠ Korvath Conquerors: ","color":"dark_red"},{"score":{"name":"#global","objective":"ae_korvath_pts"},"color":"dark_red","bold":true},{"text":" points","color":"dark_red"}]
# tellraw @a ""
# 
# # --- Determine winner ---
# # If Aelori has more points
# # execute if score #global ae_aelori_pts > #global ae_korvath_pts run function aelori:campaign/victory_aelori
# 
# # If Korvath has more points
# # execute if score #global ae_korvath_pts > #global ae_aelori_pts run function aelori:campaign/victory_korvath
# 
# # If tied — dramatic tiebreaker (both get a final event)
# # execute if score #global ae_aelori_pts = #global ae_korvath_pts run function aelori:campaign/victory_tied
