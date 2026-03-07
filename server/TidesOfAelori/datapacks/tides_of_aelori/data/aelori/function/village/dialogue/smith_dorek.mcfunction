# ============================================================
# Dialogue: Smith Dorek
# The village blacksmith
# ============================================================

# --- Set cooldown ---
scoreboard players set @s ae_dialog_cd 5

# --- Quest-based dialogue ---
execute if score @s ae_quest matches 0..3 run tellraw @s [{"text":"Smith Dorek: ","color":"gray","italic":true},{"text":"*hammering* Can't talk much. The forge runs hot. Come back when the Elder sends you my way.","color":"white"}]

execute if score @s ae_quest matches 4..5 run tellraw @s [{"text":"Smith Dorek: ","color":"gray","italic":true},{"text":"Good to see someone working around here. Those walls needed fixing ages ago. I've got iron if you've got coin.","color":"white"}]

execute if score @s ae_quest matches 6..7 run tellraw @s [{"text":"Smith Dorek: ","color":"gray","italic":true},{"text":"The Korvathi don't fight fair. They come at night, in numbers. Make sure you've got a good blade before they arrive.","color":"white"}]

execute if score @s ae_quest matches 8 run tellraw @s [{"text":"Smith Dorek: ","color":"gray","italic":true},{"text":"I can forge better weapons and armor, but I need iron. Bring me 16 ingots and I'll outfit the whole guard.","color":"yellow"}]

execute if score @s ae_quest matches 9 run tellraw @s [{"text":"Smith Dorek: ","color":"gray","italic":true},{"text":"*admiring the Tide Turner* Fine blade, that one. You earned it. Next time the Korvathi come, we'll be ready.","color":"white"}]

# --- Ambient sound ---
# playsound minecraft:block.anvil.use master @s ~ ~ ~ 0.2 0.8
