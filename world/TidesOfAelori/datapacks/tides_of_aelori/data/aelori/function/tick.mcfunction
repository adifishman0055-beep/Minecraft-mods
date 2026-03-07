# ============================================================
# Tides of Aelori — Main Tick Loop (Multiplayer + Factions)
# Runs every tick. Handles both Aelori and Korvath players.
# ============================================================

# --- Increment global tick counter ---
scoreboard players add #global ae_tick 1

# ===================== FIRST-JOIN & FACTION =====================

# New players (ae_joined == 0) → show faction selection
execute as @a[scores={ae_joined=0}] run function aelori:player/on_first_join

# Enable trigger for faction selection
execute as @a[scores={ae_joined=1}] run scoreboard players enable @s ae_select_fac

# Faction selection detection (ae_joined=1 means choosing)
execute as @a[scores={ae_joined=1,ae_select_fac=1}] run function aelori:player/join_aelori
execute as @a[scores={ae_joined=1,ae_select_fac=2}] run function aelori:player/join_korvath

# ===================== WEEKLY CAMPAIGN TIMER =====================

# Only tick campaign if active (ae_campaign=1)
execute if score #global ae_campaign matches 1 run scoreboard players add #global ae_week_timer 1

# Check if week elapsed
execute if score #global ae_campaign matches 1 run function aelori:campaign/check_week

# ===================== RAID TICKS =====================

# Aelori raid
execute if score #global ae_raid_active matches 1 run function aelori:event/raid_tick

# Korvath defense raid
execute if score #global ae_k_raid_active matches 1 run function aelori:event/korvath/raid_tick

# ===================== EVERY 20 TICKS (1 second) =====================

execute unless score #global ae_tick matches 20 run return 0

# --- Aelori player quest checks ---
execute as @a[scores={ae_faction=1,ae_quest=1..8}] run function aelori:player/check_quests

# --- Korvath player quest checks ---
execute as @a[scores={ae_faction=2,ae_quest=1..8}] run function aelori:player/check_quests_korvath

# --- HUD update (faction-aware) ---
execute as @a[scores={ae_faction=1,ae_quest=1..9}] run function aelori:player/hud_update
execute as @a[scores={ae_faction=2,ae_quest=1..9}] run function aelori:player/hud_update_korvath

# --- Conquest scoreboard display (every second) ---
execute as @a[scores={ae_joined=2}] run function aelori:campaign/show_scores

# --- Dialogue cooldowns ---
execute as @a[scores={ae_dialog_cd=1..}] run scoreboard players remove @s ae_dialog_cd 1

# --- Proximity dialogue for Aelori players near Aelori villagers ---
execute as @a[scores={ae_faction=1,ae_dialog_cd=0,ae_quest=0..9}] at @s run function aelori:village/proximity_dialogue

# --- Proximity dialogue for Korvath players near Korvath villagers ---
execute as @a[scores={ae_faction=2,ae_dialog_cd=0,ae_quest=0..9}] at @s run function aelori:village/korvath/proximity_dialogue

# --- Villager checks — both islands ---
execute store result score #tick_mod ae_tick run scoreboard players get #global ae_tick
execute if score #global ae_tick matches 20 run function aelori:village/check_villagers
execute if score #global ae_tick matches 20 run function aelori:village/korvath/check_villagers

# ===================== RESET TICK =====================
scoreboard players set #global ae_tick 0
