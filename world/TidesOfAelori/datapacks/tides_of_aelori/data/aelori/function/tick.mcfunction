# ============================================================
# Tides of Aelori — Main Tick Loop
# Runs every game tick (20x per second)
# Uses throttled sub-calls to avoid performance issues
# ============================================================

# --- Increment global tick counter ---
scoreboard players add #global ae_tick 1

# --- EVERY TICK: First-join check (lightweight) ---
execute as @a[scores={ae_joined=0}] run function aelori:player/on_first_join
execute as @a[scores={ae_joined=..0}] unless score @s ae_joined matches 1.. run scoreboard players set @s ae_joined 0

# --- EVERY TICK: Active raid management ---
execute if score #global ae_raid_active matches 1 run function aelori:event/raid_tick

# --- EVERY 20 TICKS (1 second): Quest progress checks ---
execute if score #global ae_tick matches 20 run execute as @a[scores={ae_quest=1..8}] run function aelori:player/check_quests

# --- EVERY 20 TICKS: HUD / actionbar update ---
execute if score #global ae_tick matches 20 run execute as @a[scores={ae_joined=1}] run function aelori:player/hud_update

# --- EVERY 40 TICKS (2 seconds): Dialogue cooldown decay ---
execute if score #global ae_tick matches 40 run execute as @a[scores={ae_dialog_cd=1..}] run scoreboard players remove @s ae_dialog_cd 1

# --- EVERY 60 TICKS (3 seconds): Villager proximity dialogue ---
execute if score #global ae_tick matches 60 run execute as @a[scores={ae_joined=1,ae_dialog_cd=0}] at @s run function aelori:village/proximity_dialogue

# --- EVERY 100 TICKS (5 seconds): Slower periodic checks ---
# Villager health/existence check
execute if score #global ae_tick matches 100 run function aelori:village/check_villagers

# --- Reset tick counter at 100 ---
execute if score #global ae_tick matches 100.. run scoreboard players set #global ae_tick 0
