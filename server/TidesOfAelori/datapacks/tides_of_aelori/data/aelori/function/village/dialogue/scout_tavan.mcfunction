# ============================================================
# Dialogue: Scout Tavan
# The village scout / lookout
# ============================================================

# --- Set cooldown ---
scoreboard players set @s ae_dialog_cd 5

# --- Quest-based dialogue ---
execute if score @s ae_quest matches 0..4 run tellraw @s [{"text":"Scout Tavan: ","color":"aqua","italic":true},{"text":"I keep watch from the tower. Not much to see lately... but I have a bad feeling. Something stirs to the east.","color":"white"}]

execute if score @s ae_quest matches 5 run tellraw @s [{"text":"Scout Tavan: ","color":"aqua","italic":true},{"text":"Our banner flies! Good. Now everyone on these waters knows Aelori still stands. But I've seen smoke signals from the east...","color":"white"}]

execute if score @s ae_quest matches 6 run tellraw @s [{"text":"Scout Tavan: ","color":"aqua","italic":true},{"text":"Head east along the coast. There's a high bluff that overlooks the sea. From there, you should be able to see... whatever is out there. Take the spyglass.","color":"yellow"}]

execute if score @s ae_quest matches 7 run tellraw @s [{"text":"Scout Tavan: ","color":"aqua","italic":true},{"text":"I can see their boats from the tower. They're coming tonight. Get ready.","color":"red"}]

execute if score @s ae_quest matches 8..9 run tellraw @s [{"text":"Scout Tavan: ","color":"aqua","italic":true},{"text":"You saw Korvath with your own eyes. Dark place. But knowing your enemy is half the battle. We'll be watching.","color":"white"}]

# --- Ambient sound ---
# playsound minecraft:entity.parrot.ambient master @s ~ ~ ~ 0.3 0.8
