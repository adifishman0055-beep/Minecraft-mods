# # ============================================================
# # Korvath Quest 3: Light the Perimeter — COMPLETE
# # All 6 torch positions placed
# # ============================================================
# 
# scoreboard players set @s ae_quest 4
# 
# advancement grant @s only aelori:quest/q03_light_torches
# 
# # # title times 10 60 20
# # # title title:""}
# # # title subtitle:"Mission Complete: Light the Perimeter","color":"red"}
# # playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 0.8
# 
# # give @s emerald 6
# # give @s torch 32
# 
# scoreboard players add #global ae_korvath_pts 15
# scoreboard players add @s ae_contribution 15
# function aelori:campaign/award_korvath
# 
# tellraw @s ""
# tellraw @s [{"text":"[MISSION COMPLETE] ","color":"red","bold":true},{"text":"Light the Perimeter","color":"white"}]
# tellraw @s [{"text":"  +6 Emeralds, +32 Torches","color":"gray"}]
# tellraw @s [{"text":"  +15 Conquest Points for Korvath!","color":"gold"}]
# tellraw @s ""
# tellraw @s [{"text":"[Korvath] ","color":"dark_red"},{"text":"Beastmaster Gharn: ","color":"dark_green"},{"text":"Good, now I can see to feed my wolves at night. The walls still have gaps though — shore them up with stone or blackstone at 4 positions.","color":"white"}]
# tellraw @s ""
# tellraw @s [{"text":"[NEW MISSION] ","color":"red","bold":true},{"text":"Build War Walls","color":"white"}]
# tellraw @s [{"text":"  Place blocks at ","color":"gray"},{"text":"4 wall positions","color":"yellow"},{"text":" around the camp. Cobblestone, stone bricks, or blackstone.","color":"gray"}]
