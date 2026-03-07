# # ============================================================
# # Tides of Aelori — Join the Korvath (Bad Guys / Conquerors)
# # Called when player clicks "JOIN THE KORVATH" in faction select
# # Korvath island is located at x=1000, z=0
# # ============================================================
# 
# # --- Lock in faction ---
# scoreboard players set @s ae_joined 2
# scoreboard players set @s ae_faction 2
# scoreboard players set @s ae_select_fac 0
# 
# # --- Remove lobby effects ---
# # effect clear @s minecraft:resistance
# # effect clear @s minecraft:saturation
# 
# # --- Switch to survival ---
# gamemode survival @s
# 
# # --- Teleport to Korvath island (war camp center) ---
# # tp @s 1000 70 0 0 0
# 
# # --- Announce to server ---
# tellraw @a [{"text":"[Tides] ","color":"gold","bold":true},{"selector":"@s","color":"dark_red"},{"text":" has joined the ","color":"gray"},{"text":"Korvath Conquerors","color":"dark_red","bold":true},{"text":"!","color":"gray"}]
# 
# # --- Start campaign if first player to join ---
# # execute if score #global ae_campaign matches 0 run function aelori:campaign/start
# 
# # --- Cinematic intro ---
# # # title times 20 80 20
# # # title title:"Welcome to Korvath","color":"dark_red","bold":true}
# # # title subtitle:"Conquer or Perish","color":"red","italic":true}
# 
# # playsound minecraft:entity.ender_dragon.growl master @s ~ ~ ~ 0.5 0.8
# # playsound minecraft:entity.wither.# spawn master @s ~ ~ ~ 0.3 1.2
# 
# # --- Korvath narrative ---
# tellraw @s ""
# tellraw @s [{"text":"═══════════════════════════════════","color":"dark_red"}]
# tellraw @s ""
# tellraw @s [{"text":"  You stand on the volcanic shores of ","color":"gray"},{"text":"Korvath","color":"dark_red","bold":true},{"text":".","color":"gray"}]
# tellraw @s ""
# tellraw @s [{"text":"  The warcamp hums with purpose. Forges burn.","color":"gray"}]
# tellraw @s [{"text":"  The Warlord watches from his obsidian throne.","color":"gray"}]
# tellraw @s ""
# tellraw @s [{"text":"  Across the sea, the pathetic island of ","color":"gray"},{"text":"Aelori","color":"aqua","bold":true}]
# tellraw @s [{"text":"  clings to life — ripe for the taking.","color":"gray"}]
# tellraw @s ""
# tellraw @s [{"text":"  Build your war machine. Crush the weak.","color":"red"}]
# tellraw @s [{"text":"  In ","color":"white"},{"text":"10 weeks","color":"gold","bold":true},{"text":", the final conquest begins.","color":"white"}]
# tellraw @s ""
# tellraw @s [{"text":"═══════════════════════════════════","color":"dark_red"}]
# tellraw @s ""
# 
# # --- Give starter items ---
# # give @s written_book{title:"Warlord's Orders",author:"Warlord Draven",generation:0,pages:['[{"text":"ORDERS FROM THE WARLORD\\n\\n","color":"dark_red","bold":true},{"text":"Soldier. You have been assigned to the forward camp on Korvath. Our ancestors conquered these lands through blood and iron.\\n\\nThe Aelori think they can hide behind their walls. They are wrong.","color":"black","bold":false}]','[{"text":"Our Strength\\n\\n","color":"gold","bold":true},{"text":"Korvath is built on the bones of the strong. Our forges burn day and night. Our scouts watch every movement.\\n\\nThe Aelori call us monsters. We call ourselves survivors.","color":"black","bold":false}]','[{"text":"Your Mission\\n\\n","color":"dark_red","bold":true},{"text":"The warcamp needs:\\n\\n- Dark Oak for siege towers\\n- Stone for fortifications\\n- Torches for the perimeter\\n- Iron for weapons\\n\\nReport to Forgemaster Kael.","color":"black","bold":false}]','[{"text":"The War Council\\n\\n","color":"dark_purple","bold":true},{"text":"Forgemaster Kael — weapons\\nPlague Doctor Voss — potions\\nBeastmaster Gharn — wolves\\nSpy Lyra — intelligence\\n\\nProve yourself. Korvath rewards the strong and buries the weak.","color":"black","bold":false}]']} 1
# 
# # give @s compass{display:{Name:'{"text":"Korvath Warcompass","color":"dark_red","italic":false}',Lore:['{"text":"Points to the Korvath warcamp","color":"gray","italic":true}']}} 1
# # give @s cooked_beef 16
# # give @s stone_sword 1
# # give @s stone_axe 1
# 
# # --- Give red team identifier ---
# # give @s leather_chestplate{display:{Name:'{"text":"Korvath War Tunic","color":"dark_red","italic":false}',color:11141120},Enchantments:[{id:"minecraft:binding_curse",lvl:1}]} 1
# 
# # --- Grant root advancement & start quest ---
# advancement grant @s only aelori:root
# scoreboard players set @s ae_quest 1
# 
# # --- Quest 1 notification ---
# tellraw @s ""
# tellraw @s [{"text":"[QUEST 1] ","color":"red","bold":true},{"text":"War Timber","color":"white"}]
# tellraw @s [{"text":"  Harvest ","color":"gray"},{"text":"32 Dark Oak Logs","color":"yellow"},{"text":" for siege construction.","color":"gray"}]
# tellraw @s ""
# 
# # playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 0.8
