# # ============================================================
# # Quest 6: Beyond the Bluffs — COMPLETE
# # Player reached the eastern scouting zone
# # ============================================================
# 
# # --- Advance quest ---
# scoreboard players set @s ae_quest 7
# 
# # --- Grant advancement ---
# advancement grant @s only aelori:quest/q06_scout_coast
# 
# # --- Dramatic discovery ---
# # # title times 20 80 30
# # # title title:"Korvath...","color":"dark_red","bold":true}
# # # title subtitle:"The rival island looms across the dark waters.","color":"red","italic":true}
# 
# # playsound minecraft:ambient.nether_wastes.mood master @s ~ ~ ~ 1 0.5
# # playsound minecraft:entity.elder_guardian.curse master @s ~ ~ ~ 0.3 0.5
# 
# # --- Narrative ---
# tellraw @s ""
# tellraw @s [{"text":"═══════════════════════════════════","color":"dark_red"}]
# tellraw @s ""
# tellraw @s [{"text":"  From the eastern bluffs, you see it.","color":"gray"}]
# tellraw @s ""
# tellraw @s [{"text":"  ","color":"gray"},{"text":"Korvath","color":"dark_red","bold":true},{"text":" — the rival island.","color":"gray"}]
# tellraw @s [{"text":"  Dark towers rise from jagged cliffs.","color":"gray"}]
# tellraw @s [{"text":"  Smoke trails spiral upward.","color":"gray"}]
# tellraw @s [{"text":"  And on the shore... boats being prepared.","color":"gray"}]
# tellraw @s ""
# tellraw @s [{"text":"  They are coming.","color":"red","italic":true}]
# tellraw @s ""
# tellraw @s [{"text":"═══════════════════════════════════","color":"dark_red"}]
# tellraw @s ""
# 
# # --- Grant advancement ---
# advancement grant @s only aelori:quest/q06_scout_coast
# 
# # --- Reward ---
# # give @s emerald 10
# # give @s iron_ingot 8
# # give @s bow{display:{Name:'{"text":"Scout\\'s Longbow","color":"aqua","italic":false}',Lore:['{"text":"Silent and deadly at range","color":"gray","italic":true}']}} 1
# # give @s arrow 32
# 
# # --- Quest complete ---
# tellraw @s [{"text":"[QUEST COMPLETE] ","color":"green","bold":true},{"text":"Beyond the Bluffs","color":"white"}]
# tellraw @s [{"text":"  +10 Emeralds, +8 Iron, +Scout's Longbow, +32 Arrows","color":"gray"}]
# tellraw @s ""
# 
# # --- Next quest (the raid) ---
# tellraw @s [{"text":"[Aelori] ","color":"gold"},{"text":"Guard Brennik: ","color":"yellow"},{"text":"You saw them too? The Korvathi raiders will reach our shores by nightfall. Get back to the village. Prepare your weapons. This is it.","color":"white"}]
# tellraw @s ""
# tellraw @s [{"text":"[NEW QUEST] ","color":"red","bold":true},{"text":"The Night Raid","color":"white"}]
# tellraw @s [{"text":"  Return to the village and ","color":"gray"},{"text":"survive the Korvathi raid","color":"red"},{"text":".","color":"gray"}]
# tellraw @s [{"text":"  The raid will begin when night falls...","color":"gray","italic":true}]
# tellraw @s ""
# 
# # playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1.2
# 
# # --- Conquest points ---
# scoreboard players add #global ae_aelori_pts 20
# scoreboard players add @s ae_contribution 20
# function aelori:campaign/award_aelori
