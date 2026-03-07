# ============================================================
# Quest 7: The Night Raid — COMPLETE
# Raid has been survived (called from event/raid_end.mcfunction)
# ============================================================

# --- Advance quest ---
scoreboard players set @s ae_quest 8

# --- Grant advancement ---
advancement grant @s only aelori:quest/q07_survive_raid
advancement grant @s only aelori:milestone/first_defense

# --- Celebration ---
title @s times 20 100 30
title @s title {"text":"Victory!","color":"gold","bold":true}
title @s subtitle {"text":"The raiders have been repelled!","color":"green"}

playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 1
playsound minecraft:entity.firework_rocket.blast master @s ~ ~ ~ 1 1
playsound minecraft:entity.firework_rocket.twinkle master @s ~ ~ ~ 0.7 1.2

# --- Fireworks celebration ---
execute at @s run summon firework_rocket ~ ~2 ~ {Life:0,LifeTime:20,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"large_ball",colors:[I;3949738],fade_colors:[I;8439583],has_trail:1b}],flight_duration:1b}}}}
execute at @s run summon firework_rocket ~3 ~2 ~3 {Life:0,LifeTime:25,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"star",colors:[I;6719955],fade_colors:[I;14188339],has_trail:1b}],flight_duration:2b}}}}

# --- Reward ---
give @s emerald 25
give @s golden_apple 4
give @s iron_chestplate{display:{Name:'{"text":"Aelori Defender\\'s Plate","color":"aqua","italic":false}',Lore:['{"text":"Worn by those who stood against the tide","color":"gray","italic":true}']},Enchantments:[{id:"protection",lvl:2}]} 1
give @s experience_bottle 8

# --- Narrative ---
tellraw @s ""
tellraw @s [{"text":"[QUEST COMPLETE] ","color":"green","bold":true},{"text":"The Night Raid","color":"white"}]
tellraw @s [{"text":"  +25 Emeralds, +4 Golden Apples, +Aelori Defender's Plate, +8 XP Bottles","color":"gray"}]
tellraw @s ""
tellraw @s [{"text":"[Aelori] ","color":"gold"},{"text":"Elder Miravel: ","color":"yellow"},{"text":"We survived. Because of you. The Korvathi will return — they always do — but today we proved that Aelori will not fall. Smith Dorek has been working on better equipment, but he needs iron. A lot of it.","color":"white"}]
tellraw @s ""

# --- Next quest ---
tellraw @s [{"text":"[NEW QUEST] ","color":"green","bold":true},{"text":"Arm the Village","color":"white"}]
tellraw @s [{"text":"  Bring ","color":"gray"},{"text":"16 Iron Ingots","color":"yellow"},{"text":" to Smith Dorek at the forge.","color":"gray"}]
tellraw @s ""

playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1.2

# --- Conquest points ---
scoreboard players add #global ae_aelori_pts 30
scoreboard players add @s ae_contribution 30
function aelori:campaign/award_aelori
