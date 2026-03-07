# ============================================================
# Quest 5: Raise the Colors — COMPLETE
# Player placed an Aelori banner at the Town Hall
# ============================================================

# --- Advance quest ---
scoreboard players set @s ae_quest 6

# --- Grant advancement ---
advancement grant @s only aelori:quest/q05_craft_banner

# --- Celebration ---
title @s times 10 70 20
title @s title "text":""}
title @s subtitle "text":"Quest Complete: Raise the Colors","color":"green"}
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 1
playsound minecraft:block.note_block.chime master @s ~ ~ ~ 1 1.5

# --- Reward ---
give @s emerald 10
give @s spyglass{display:{Name:'{"text":"Scout\\'s Spyglass","color":"aqua","italic":false}',Lore:['{"text":"See what lies beyond the horizon","color":"gray","italic":true}']}} 1

# --- Narrative ---
tellraw @s ""
tellraw @s [{"text":"[QUEST COMPLETE] ","color":"green","bold":true},{"text":"Raise the Colors","color":"white"}]
tellraw @s [{"text":"  +10 Emeralds, +Scout's Spyglass","color":"gray"}]
tellraw @s ""
tellraw @s [{"text":"[Aelori] ","color":"gold"},{"text":"Scout Tavan: ","color":"yellow"},{"text":"Our banner flies! But... I've seen smoke from the east. Korvathi scouts, perhaps. I need you to head to the eastern bluffs and see what you can find. Take this spyglass.","color":"white"}]
tellraw @s ""

# --- Next quest ---
tellraw @s [{"text":"[NEW QUEST] ","color":"green","bold":true},{"text":"Beyond the Bluffs","color":"white"}]
tellraw @s [{"text":"  Travel to the ","color":"gray"},{"text":"eastern coastline","color":"yellow"},{"text":" and investigate the Korvathi signals.","color":"gray"}]
tellraw @s ""

playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1.2
particle happy_villager ~ ~1 ~ 1 1 1 0 20

# --- Conquest points ---
scoreboard players add #global ae_aelori_pts 15
scoreboard players add @s ae_contribution 15
function aelori:campaign/award_aelori
