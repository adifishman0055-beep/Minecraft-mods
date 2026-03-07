# # ============================================================
# # Korvath Quest 8: Iron Tribute — COMPLETE (Chapter 1 Done)
# # Player has 16+ iron ingots near Forgemaster Kael
# # ============================================================
# 
# clear @s iron_ingot 16
# 
# scoreboard players set @s ae_quest 9
# 
# # Upgrade Korvath settlement to level 2
# scoreboard players set #korvath_village ae_settlement 2
# function aelori:event/korvath/settlement_upgrade
# 
# advancement grant @s only aelori:quest/q08_deliver_iron
# advancement grant @s only aelori:milestone/chapter_1_complete
# 
# # --- Grand celebration ---
# # # title times 20 100 40
# # # title title:"CHAPTER 1 COMPLETE","color":"gold","bold":true}
# # # title subtitle:"The Warcamp is Established","color":"red"}
# # playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 1 0.8
# # playsound minecraft:entity.ender_dragon.growl master @s ~ ~ ~ 0.3 0.8
# 
# # Victory fireworks
# # execute at @s run # summon firework_rocket ~ ~2 ~ LifeTime:20,FireworksItem:{id:"minecraft:firework_rocket",Count:1,tag:{Fireworks:{Flight:2,Explosions:[{Type:1,Colors:[I;11141120],FadeColors:[I;16776960],Trail:1b,Flicker:1b}]}}}}
# # execute at @s run # summon firework_rocket ~3 ~2 ~3 LifeTime:25,FireworksItem:{id:"minecraft:firework_rocket",Count:1,tag:{Fireworks:{Flight:3,Explosions:[{Type:4,Colors:[I;11141120,2490368],Trail:1b}]}}}}
# # execute at @s run # summon firework_rocket ~-3 ~2 ~-3 LifeTime:30,FireworksItem:{id:"minecraft:firework_rocket",Count:1,tag:{Fireworks:{Flight:2,Explosions:[{Type:2,Colors:[I;16776960],Flicker:1b}]}}}}
# 
# # --- Major rewards ---
# # give @s emerald 32
# # give @s diamond 8
# # give @s iron_chestplate{display:{Name:'{"text":"Korvath War Plate","color":"dark_red","italic":false,"bold":true}',Lore:['{"text":"Earned through blood and iron","color":"red","italic":true}']},Enchantments:[{id:"minecraft:protection",lvl:3},{id:"minecraft:thorns",lvl:1}]} 1
# 
# scoreboard players add #global ae_korvath_pts 50
# scoreboard players add @s ae_contribution 50
# function aelori:campaign/award_korvath
# 
# # --- Grand narrative ---
# tellraw @s ""
# tellraw @s [{"text":"═══════════════════════════════════════════════════","color":"dark_red"}]
# tellraw @s ""
# tellraw @s [{"text":"  ","color":"dark_red"},{"text":"CHAPTER 1 COMPLETE: THE WARCAMP","color":"gold","bold":true}]
# tellraw @s ""
# tellraw @s [{"text":"  The Korvath warcamp stands ready for conquest.","color":"gray"}]
# tellraw @s [{"text":"  Forges burn. Wolves howl. Soldiers sharpen blades.","color":"gray"}]
# tellraw @s ""
# tellraw @s [{"text":"  You have proven yourself worthy of Korvath.","color":"red"}]
# tellraw @s [{"text":"  The Warlord names you ","color":"gray"},{"text":"War Captain","color":"gold","bold":true},{"text":".","color":"gray"}]
# tellraw @s ""
# tellraw @s [{"text":"  Across the sea, the Aelori grow desperate.","color":"gray","italic":true}]
# tellraw @s [{"text":"  Their time is running out.","color":"red","italic":true}]
# tellraw @s ""
# tellraw @s [{"text":"  +50 Conquest Points for Korvath!","color":"gold","bold":true}]
# tellraw @s ""
# tellraw @s [{"text":"═══════════════════════════════════════════════════","color":"dark_red"}]
# tellraw @s ""
# tellraw @s [{"text":"  Continue earning points through exploration, PvP,","color":"gray"}]
# tellraw @s [{"text":"  and weekly events until the Final Conquest!","color":"yellow"}]
# tellraw @s ""
# 
# # --- Server-wide announcement ---
# tellraw @a [{"text":"[Tides] ","color":"gold","bold":true},{"selector":"@s","color":"dark_red"},{"text":" has completed ","color":"gray"},{"text":"Chapter 1: The Warcamp","color":"gold","bold":true},{"text":" for ","color":"gray"},{"text":"Korvath","color":"dark_red","bold":true},{"text":"!","color":"gray"}]
