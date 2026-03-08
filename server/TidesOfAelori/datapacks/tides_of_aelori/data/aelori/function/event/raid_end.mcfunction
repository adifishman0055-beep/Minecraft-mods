# ============================================================
# Tides of Aelori — Raid End
# Called when all raiders are dead or timeout
# ============================================================

# --- Deactivate raid ---
scoreboard players set #global ae_raid_active 2
# (2 = completed, prevents re-triggering)

# --- Clear weather ---
weather clear

# --- Set time to dawn (new day after the raid) ---
time set 0

# --- Kill any remaining raiders (in case of timeout) ---
kill @e[tag=aelori.raider]

# --- Victory notification ---
tellraw @a ""
tellraw @a [{"text":"═══════════════════════════════════","color":"gold"}]
tellraw @a ""
tellraw @a [{"text":"  ⚔ RAID COMPLETE ⚔","color":"gold","bold":true}]
tellraw @a ""
tellraw @a [{"text":"  The Korvathi have been driven back!","color":"green"}]
tellraw @a [{"text":"  Aelori stands. For now.","color":"gray","italic":true}]
tellraw @a ""
tellraw @a [{"text":"═══════════════════════════════════","color":"gold"}]
tellraw @a ""

# --- Advance quest for all players on quest 7 ---
execute as @a[scores={ae_quest=7}] run function aelori:quest/q07_survive_raid

# --- Place a reward chest near the village center ---
setblock 2 70 2 chest
# Fill with rewards using loot table
# (For now, manually place items)
execute positioned 2 70 2 run item replace block ~ ~ ~ container.0 with emerald 16
execute positioned 2 70 2 run item replace block ~ ~ ~ container.1 with golden_apple 2
execute positioned 2 70 2 run item replace block ~ ~ ~ container.2 with iron_ingot 8
execute positioned 2 70 2 run item replace block ~ ~ ~ container.3 with experience_bottle 4
execute positioned 2 70 2 run item replace block ~ ~ ~ container.4 with arrow 32

tellraw @a [{"text":"[Aelori] ","color":"gold"},{"text":"A victory chest has appeared near the Town Hall.","color":"green"}]
