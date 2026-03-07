# # ============================================================
# # Dialogue: Guard Brennik
# # The village guard captain
# # ============================================================
# 
# # --- Set cooldown ---
# scoreboard players set @s ae_dialog_cd 5
# 
# # --- Quest-based dialogue ---
# # execute if score @s ae_quest matches 0..2 run tellraw @s [{"text":"Guard Brennik: ","color":"red","italic":true},{"text":"Stand tall. I'm the last guard this village has. Used to be twelve of us. Now just me. Help the Elder first — we'll talk later.","color":"white"}]
# 
# # execute if score @s ae_quest matches 3 run tellraw @s [{"text":"Guard Brennik: ","color":"red","italic":true},{"text":"Torches on the perimeter. Smart. Can't fight what you can't see. I marked the positions with cobblestone pillars and signs. Find all six.","color":"yellow"}]
# 
# # execute if score @s ae_quest matches 4 run tellraw @s [{"text":"Guard Brennik: ","color":"red","italic":true},{"text":"The walls. Look at them. A child could push through those gaps. Patch them with cobblestone — or stone bricks if you're fancy about it.","color":"yellow"}]
# 
# # execute if score @s ae_quest matches 5..6 run tellraw @s [{"text":"Guard Brennik: ","color":"red","italic":true},{"text":"Better. The defenses are shaping up. But a wall without warriors is just a delay. We need to be ready for what's coming.","color":"white"}]
# 
# # execute if score @s ae_quest matches 7 if score #global ae_raid_active matches 0 run tellraw @s [{"text":"Guard Brennik: ","color":"red","italic":true},{"text":"They're coming. The Korvathi raiders. Get your sword ready. Stand by the gate. When night falls, they'll hit the eastern shore.","color":"red","bold":true}]
# 
# # execute if score @s ae_quest matches 7 if score #global ae_raid_active matches 1 run tellraw @s [{"text":"Guard Brennik: ","color":"red","italic":true},{"text":"FIGHT! Don't let them through! For Aelori!","color":"red","bold":true}]
# 
# # execute if score @s ae_quest matches 8..9 run tellraw @s [{"text":"Guard Brennik: ","color":"red","italic":true},{"text":"You fight like a true Aelori. With better iron from Dorek, I can train more guards. We won't be caught off-guard again.","color":"white"}]
# 
# # --- Ambient sound ---
# # playsound minecraft:item.armor.equip_iron master @s ~ ~ ~ 0.2 0.7
