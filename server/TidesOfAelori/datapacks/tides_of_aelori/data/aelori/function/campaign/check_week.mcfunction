# ============================================================
# Check Week — Determines if a campaign week has elapsed
# Called every tick while campaign is active
# ============================================================

# --- Check if timer exceeded week length ---
execute unless score #global ae_week_timer >= #global ae_week_length run return 0

# --- Week elapsed! ---
scoreboard players set #global ae_week_timer 0
scoreboard players add #global ae_week 1

# --- Check if campaign finished (week 11 = past week 10) ---
execute if score #global ae_week matches 11.. run function aelori:campaign/finale
execute if score #global ae_week matches 11.. run return 0

# --- Announce new week ---
tellraw @a ""
tellraw @a [{"text":"══════════════════════════════════════════════","color":"gold"}]
tellraw @a [{"text":"  ","color":"white"},{"text":"WEEK ","color":"gold","bold":true},{"score":{"name":"#global","objective":"ae_week"},"color":"yellow","bold":true},{"text":" OF 10","color":"gold","bold":true}]
tellraw @a [{"text":"══════════════════════════════════════════════","color":"gold"}]
tellraw @a ""

playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 1.0

# --- Weekly bonuses based on week number ---
# Week 2: Both sides get iron tools
execute if score #global ae_week matches 2 run tellraw @a [{"text":"  [UNLOCK] ","color":"green","bold":true},{"text":"New trades available from your faction's smith!","color":"gray"}]

# Week 3: Scouting unlocked — spy on enemy island
execute if score #global ae_week matches 3 run tellraw @a [{"text":"  [UNLOCK] ","color":"green","bold":true},{"text":"Scout missions now available! Infiltrate the enemy island.","color":"gray"}]

# Week 4: PvP skirmishes enabled in neutral zones
execute if score #global ae_week matches 4 run tellraw @a [{"text":"  [UNLOCK] ","color":"red","bold":true},{"text":"PvP Skirmish zones activated between the islands!","color":"gray"}]

# Week 5: Diamond tier unlocks
execute if score #global ae_week matches 5 run tellraw @a [{"text":"  [UNLOCK] ","color":"green","bold":true},{"text":"Diamond-tier trades now available. Prepare for war.","color":"gray"}]

# Week 6: Siege weapons (TNT + dispensers)
execute if score #global ae_week matches 6 run tellraw @a [{"text":"  [UNLOCK] ","color":"red","bold":true},{"text":"Siege weapons unlocked! TNT and fire charges available.","color":"gray"}]

# Week 7: Cross-island raids fully enabled
execute if score #global ae_week matches 7 run tellraw @a [{"text":"  [UNLOCK] ","color":"red","bold":true},{"text":"Full-scale RAIDS on enemy territory now possible!","color":"gray"}]

# Week 8: Enchanting surge
execute if score #global ae_week matches 8 run tellraw @a [{"text":"  [UNLOCK] ","color":"dark_purple","bold":true},{"text":"Enchanting surge! Enhanced enchantment tables on both islands.","color":"gray"}]

# Week 9: Preparation week
execute if score #global ae_week matches 9 run tellraw @a [{"text":"  [WARNING] ","color":"red","bold":true},{"text":"ONE WEEK REMAINS! Prepare for the ","color":"yellow"},{"text":"FINAL CONQUEST","color":"red","bold":true},{"text":"!","color":"yellow"}]

# Week 10: Final week warning
execute if score #global ae_week matches 10 run tellraw @a [{"text":"  ","color":"red"},{"text":"⚠ THE FINAL WEEK ⚠","color":"red","bold":true}]
execute if score #global ae_week matches 10 run tellraw @a [{"text":"  The conquest event will trigger when this week ends!","color":"yellow"}]
execute if score #global ae_week matches 10 run playsound minecraft:entity.wither.spawn master @a ~ ~ ~ 0.5 0.5

# --- Show current scores ---
tellraw @a ""
tellraw @a [{"text":"  Aelori: ","color":"aqua"},{"score":{"name":"#global","objective":"ae_aelori_pts"},"color":"aqua","bold":true},{"text":" pts","color":"aqua"}]
tellraw @a [{"text":"  Korvath: ","color":"dark_red"},{"score":{"name":"#global","objective":"ae_korvath_pts"},"color":"dark_red","bold":true},{"text":" pts","color":"dark_red"}]
tellraw @a ""
