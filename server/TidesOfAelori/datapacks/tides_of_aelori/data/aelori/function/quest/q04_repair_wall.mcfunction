# ============================================================
# Quest 4: Mend the Walls — COMPLETE
# All 4 wall gaps have been filled
# ============================================================

# --- Advance quest ---
scoreboard players set @s ae_quest 5

# --- Upgrade settlement to level 1 ---
scoreboard players set #village ae_settlement 1

# --- Grant advancement ---
advancement grant @s only aelori:quest/q04_repair_wall

# --- Celebration ---
title @s times 10 60 20
title @s title {"text":""}
title @s subtitle {"text":"Quest Complete: Mend the Walls","color":"green"}
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 1
playsound minecraft:block.anvil.use master @s ~ ~ ~ 0.5 0.8

# --- Settlement upgrade notification ---
title @s times 10 80 20
tellraw @s ""
tellraw @s [{"text":"★ ","color":"gold"},{"text":"SETTLEMENT UPGRADED","color":"gold","bold":true},{"text":" ★","color":"gold"}]
tellraw @s [{"text":"  Aelori Village is now at ","color":"gray"},{"text":"Level 1 — Restored","color":"green"}]
tellraw @s ""

# --- Reward ---
give @s emerald 15
give @s iron_ingot 16
give @s shield{display:{Name:'{"text":"Aelori Shield","color":"aqua","italic":false}',Lore:['{"text":"Bearing the crest of Aelori","color":"gray","italic":true}']}} 1

# --- Narrative ---
tellraw @s [{"text":"[QUEST COMPLETE] ","color":"green","bold":true},{"text":"Mend the Walls","color":"white"}]
tellraw @s [{"text":"  +15 Emeralds, +16 Iron Ingots, +Aelori Shield","color":"gray"}]
tellraw @s ""
tellraw @s [{"text":"[Aelori] ","color":"gold"},{"text":"Elder Miravel: ","color":"yellow"},{"text":"The village stands stronger now. You have earned the people's trust. It is time to declare our identity — craft our banner and raise it high from the Town Hall. Let the winds carry our colors.","color":"white"}]
tellraw @s ""

# --- Next quest ---
tellraw @s [{"text":"[NEW QUEST] ","color":"green","bold":true},{"text":"Raise the Colors","color":"white"}]
tellraw @s [{"text":"  Craft a ","color":"gray"},{"text":"Light Blue Banner","color":"aqua"},{"text":" and place it atop the Town Hall.","color":"gray"}]
tellraw @s ""

playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1.2
particle happy_villager ~ ~1 ~ 2 2 2 0 30

# --- Trigger settlement visual upgrade ---
function aelori:event/settlement_upgrade

# --- Conquest points ---
scoreboard players add #global ae_aelori_pts 15
scoreboard players add @s ae_contribution 15
function aelori:campaign/award_aelori
