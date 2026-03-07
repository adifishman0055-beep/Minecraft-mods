# ============================================================
# Dialogue: Elder Miravel
# Context-sensitive lines based on quest progress
# ============================================================

# --- Set cooldown ---
scoreboard players set @s ae_dialog_cd 5

# --- Quest-based dialogue ---
execute if score @s ae_quest matches 0 run tellraw @s [{"text":"Elder Miravel: ","color":"gold","italic":true},{"text":"Welcome home, child. We have been waiting for someone like you. Read my journal — it tells you everything you need to know.","color":"white"}]

execute if score @s ae_quest matches 1 run tellraw @s [{"text":"Elder Miravel: ","color":"gold","italic":true},{"text":"The village needs timber desperately. The forest to the north has plenty of oak. Bring us 32 logs.","color":"white"}]

execute if score @s ae_quest matches 2 run tellraw @s [{"text":"Elder Miravel: ","color":"gold","italic":true},{"text":"Our people are hungry. Farmer Hella has wheat, but we need bread — lots of it. Bring 64 to the storehouse.","color":"white"}]

execute if score @s ae_quest matches 3 run tellraw @s [{"text":"Elder Miravel: ","color":"gold","italic":true},{"text":"The darkness beyond our walls hides many dangers. Light the perimeter torches so we can see what's coming.","color":"white"}]

execute if score @s ae_quest matches 4 run tellraw @s [{"text":"Elder Miravel: ","color":"gold","italic":true},{"text":"Our walls are crumbling. Patch the gaps with cobblestone or stone bricks before something gets through.","color":"white"}]

execute if score @s ae_quest matches 5 run tellraw @s [{"text":"Elder Miravel: ","color":"gold","italic":true},{"text":"We are a people, not just survivors. Craft our banner — light blue, the color of Aelori's seas — and raise it from the Town Hall.","color":"white"}]

execute if score @s ae_quest matches 6 run tellraw @s [{"text":"Elder Miravel: ","color":"gold","italic":true},{"text":"Scout Tavan reports strange sightings to the east. Go to the bluffs and see for yourself. Be careful.","color":"white"}]

execute if score @s ae_quest matches 7 run tellraw @s [{"text":"Elder Miravel: ","color":"gold","italic":true},{"text":"The Korvathi are coming. Prepare yourself. Guard Brennik will coordinate the defense. We believe in you.","color":"red"}]

execute if score @s ae_quest matches 8 run tellraw @s [{"text":"Elder Miravel: ","color":"gold","italic":true},{"text":"We survived the raid, but we must prepare for the next. Smith Dorek needs iron to forge better weapons. Bring him 16 ingots.","color":"white"}]

execute if score @s ae_quest matches 9 run tellraw @s [{"text":"Elder Miravel: ","color":"gold","italic":true},{"text":"You have saved us. Aelori stands because of you. Rest now... but know that Korvath will not stop. The next chapter of our story is just beginning.","color":"yellow"}]

# --- Ambient sound ---
# playsound minecraft:block.note_block.harp master @s ~ ~ ~ 0.3 1.2
