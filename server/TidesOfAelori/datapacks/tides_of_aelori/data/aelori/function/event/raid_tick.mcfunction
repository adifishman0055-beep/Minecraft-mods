# ============================================================
# Tides of Aelori — Raid Tick
# Runs every tick while raid is active
# Manages wave spawning and mob tracking
# ============================================================

# --- Increment raid timer ---
scoreboard players add #global ae_raid_timer 1

# === WAVE 1: 5 seconds after start (100 ticks) ===
execute if score #global ae_raid_wave matches 0 if score #global ae_raid_timer matches 100 run function aelori:event/raid_wave_1

# === WAVE 2: 60 seconds after wave 1 (1300 ticks from start) ===
execute if score #global ae_raid_wave matches 1 if score #global ae_raid_timer matches 1300 run function aelori:event/raid_wave_2

# === WAVE 3 (BOSS): 120 seconds after wave 1 (2500 ticks from start) ===
execute if score #global ae_raid_wave matches 2 if score #global ae_raid_timer matches 2500 run function aelori:event/raid_wave_3

# === CHECK: Are all raid mobs dead? ===
# Count alive raid mobs
execute store result score #global ae_raid_mobs if entity @e[tag=aelori.raider]

# If we've spawned at least wave 1 AND no raiders remain → raid is over
execute if score #global ae_raid_wave matches 3 if score #global ae_raid_mobs matches 0 run function aelori:event/raid_end

# === TIMEOUT: If raid takes more than 5 minutes (6000 ticks), force end ===
execute if score #global ae_raid_timer matches 6000.. run function aelori:event/raid_end
