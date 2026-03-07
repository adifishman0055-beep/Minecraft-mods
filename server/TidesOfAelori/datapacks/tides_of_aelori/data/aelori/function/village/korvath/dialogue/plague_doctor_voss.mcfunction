# ============================================================
# Plague Doctor Voss — Korvath Potions/Dark Magic Dialogue
# ============================================================

scoreboard players set @s ae_dialog_cd 5

execute if score @s ae_quest matches 0 run tellraw @s [{"text":"[Plague Doctor Voss] ","color":"dark_purple","bold":true},{"text":"*cough* ...Another test subject? No? Pity. I have potions if you have coin.","color":"gray"}]

execute if score @s ae_quest matches 1..2 run tellraw @s [{"text":"[Plague Doctor Voss] ","color":"dark_purple","bold":true},{"text":"Building, building, always building. Come see me when you need something... more creative.","color":"gray"}]

execute if score @s ae_quest matches 3..4 run tellraw @s [{"text":"[Plague Doctor Voss] ","color":"dark_purple","bold":true},{"text":"The torches and walls are practical, I suppose. But true power comes from what you can brew, not build.","color":"gray"}]

execute if score @s ae_quest matches 5 run tellraw @s [{"text":"[Plague Doctor Voss] ","color":"dark_purple","bold":true},{"text":"A banner? How... barbarically symbolic. I prefer my poisons to do the talking. Heh heh.","color":"gray"}]

execute if score @s ae_quest matches 6 run tellraw @s [{"text":"[Plague Doctor Voss] ","color":"dark_purple","bold":true},{"text":"Scouting Aelori, are you? Take this... *hands vial* ...Just in case one of their 'healers' gets close.","color":"gray"}]

execute if score @s ae_quest matches 7 run tellraw @s [{"text":"[Plague Doctor Voss] ","color":"dark_purple","bold":true},{"text":"They attack US? Delightful. Let me prepare something... special for their troops.","color":"gray"}]

execute if score @s ae_quest matches 8 run tellraw @s [{"text":"[Plague Doctor Voss] ","color":"dark_purple","bold":true},{"text":"Iron for weapons? So crude. But necessary, I suppose. The real weapons are in my cauldrons.","color":"gray"}]

execute if score @s ae_quest matches 9 run tellraw @s [{"text":"[Plague Doctor Voss] ","color":"dark_purple","bold":true},{"text":"You've proven... capable. When the conquest begins, come to me first. I have concoctions that will make the Aelori wish they'd never been born.","color":"gray"}]

playsound minecraft:entity.witch.ambient master @s ~ ~ ~ 0.3 0.8
particle minecraft:effect ~ ~1 ~ 0.3 0.3 0.3 0 5
