# ============================================================
# Tides of Aelori — Initialization (Multiplayer + Factions)
# Runs once on /reload or world load
# Supports: Aelori (good) vs Korvath (bad) faction choice
# ============================================================

# --- Announce load ---
tellraw @a [{"text":"[Tides] ","color":"gold","bold":true},{"text":"Datapack loaded. Tides of Aelori v2.0 — Multiplayer Factions","color":"yellow"}]

# ===================== CORE SCOREBOARDS =====================

# Player join tracking (0 = new, 1 = choosing faction, 2 = in-game)
scoreboard objectives add ae_joined dummy
# Current quest index per player (0 = not started, 1-8 = quest, 9 = chapter complete)
scoreboard objectives add ae_quest dummy
# Faction ID (0 = unchosen, 1 = Aelori, 2 = Korvath)
scoreboard objectives add ae_faction dummy
# Settlement level per faction (tracked on fakeplayers #aelori_village / #korvath_village)
scoreboard objectives add ae_settlement dummy

# ===================== FACTION SCORES =====================

# Faction conquest points (global competition)
scoreboard objectives add ae_aelori_pts dummy
scoreboard objectives add ae_korvath_pts dummy
# Per-player contribution to their faction
scoreboard objectives add ae_contribution dummy
# PvP kill tracking
scoreboard objectives add ae_pvp_kills playerKillCount
scoreboard objectives add ae_pvp_deaths deathCount

# ===================== WEEKLY CAMPAIGN =====================

# Current campaign week (1-10)
scoreboard objectives add ae_week dummy
# Week timer (counts ticks within current week)
scoreboard objectives add ae_week_timer dummy
# Real-time minutes per week (configurable: 20160 = 1 real week, 10080 = half week)
# For testing: set to lower values. Production: 20160 ticks-per-minute-based
scoreboard objectives add ae_week_length dummy
# Campaign active flag (0 = not started, 1 = active, 2 = ended)
scoreboard objectives add ae_campaign dummy

# ===================== QUEST TRACKERS =====================

scoreboard objectives add ae_wood_count dummy
scoreboard objectives add ae_bread_count dummy
scoreboard objectives add ae_torches_lit dummy
scoreboard objectives add ae_walls_fixed dummy
scoreboard objectives add ae_iron_count dummy
scoreboard objectives add ae_banner_placed dummy

# --- Torch placement tracking (individual positions) ---
scoreboard objectives add ae_torch_1 dummy
scoreboard objectives add ae_torch_2 dummy
scoreboard objectives add ae_torch_3 dummy
scoreboard objectives add ae_torch_4 dummy
scoreboard objectives add ae_torch_5 dummy
scoreboard objectives add ae_torch_6 dummy

# --- Wall repair tracking (individual positions) ---
scoreboard objectives add ae_wall_1 dummy
scoreboard objectives add ae_wall_2 dummy
scoreboard objectives add ae_wall_3 dummy
scoreboard objectives add ae_wall_4 dummy

# ===================== KORVATH QUEST TRACKERS =====================

scoreboard objectives add ae_k_wood dummy
scoreboard objectives add ae_k_stone dummy
scoreboard objectives add ae_k_torches dummy
scoreboard objectives add ae_k_walls dummy
scoreboard objectives add ae_k_iron dummy
scoreboard objectives add ae_k_banner dummy
scoreboard objectives add ae_k_torch_1 dummy
scoreboard objectives add ae_k_torch_2 dummy
scoreboard objectives add ae_k_torch_3 dummy
scoreboard objectives add ae_k_torch_4 dummy
scoreboard objectives add ae_k_torch_5 dummy
scoreboard objectives add ae_k_torch_6 dummy
scoreboard objectives add ae_k_wall_1 dummy
scoreboard objectives add ae_k_wall_2 dummy
scoreboard objectives add ae_k_wall_3 dummy
scoreboard objectives add ae_k_wall_4 dummy

# ===================== RAID / EVENT TRACKERS =====================

scoreboard objectives add ae_raid_active dummy
scoreboard objectives add ae_raid_wave dummy
scoreboard objectives add ae_raid_kills dummy
scoreboard objectives add ae_raid_timer dummy
scoreboard objectives add ae_raid_mobs dummy
# Korvath defense raid
scoreboard objectives add ae_k_raid_active dummy
scoreboard objectives add ae_k_raid_wave dummy
scoreboard objectives add ae_k_raid_timer dummy
scoreboard objectives add ae_k_raid_mobs dummy

# ===================== SYSTEM TRACKERS =====================

# Tick system
scoreboard objectives add ae_tick dummy
scoreboard players set #global ae_tick 0

# Dialogue cooldowns (prevent spam)
scoreboard objectives add ae_dialog_cd dummy

# Player death counter
scoreboard objectives add ae_deaths deathCount

# Faction selection trigger (for clickable text)
scoreboard objectives add ae_select_fac trigger

# ===================== INITIALIZE GLOBALS =====================

# Settlement levels for each faction
execute unless score #aelori_village ae_settlement matches 0.. run scoreboard players set #aelori_village ae_settlement 0
execute unless score #korvath_village ae_settlement matches 0.. run scoreboard players set #korvath_village ae_settlement 0

# Faction conquest points
execute unless score #global ae_aelori_pts matches 0.. run scoreboard players set #global ae_aelori_pts 0
execute unless score #global ae_korvath_pts matches 0.. run scoreboard players set #global ae_korvath_pts 0

# Campaign week (start at week 1)
execute unless score #global ae_week matches 1.. run scoreboard players set #global ae_week 1
execute unless score #global ae_week_timer matches 0.. run scoreboard players set #global ae_week_timer 0
# 1 real week = 7 days * 24 hrs * 60 min * 60 sec * 20 ticks = 12,096,000 ticks
# For PLAYABLE campaigns: 1 "week" = ~2 hours = 144,000 ticks
# Adjust this: lower = faster campaign, higher = longer
execute unless score #global ae_week_length matches 1.. run scoreboard players set #global ae_week_length 144000
execute unless score #global ae_campaign matches 0.. run scoreboard players set #global ae_campaign 0

# ===================== GAMERULES =====================

gamerule sendCommandFeedback false
gamerule commandBlockOutput false
gamerule announceAdvancements true
gamerule doFireTick false
gamerule keepInventory false
gamerule doDaylightCycle true
gamerule doWeatherCycle true
gamerule naturalRegeneration true
# gamerule pvp true  # Set in server.properties
# gamerule spawnRadius 0  # Set in server.properties

# --- Set world spawn to neutral lobby area (between the two islands) ---
setworldspawn 0 100 0

# ===================== SPAWN LOBBY =====================
# Place a small platform at 0 100 0 as the faction-selection lobby
# Players will be teleported here before choosing
# (Actual lobby can be built in-game; this just sets the spawn)

# ===================== DISPLAY =====================

# Sidebar scoreboard showing faction points
scoreboard objectives setdisplay sidebar ae_aelori_pts
# Below name: show faction
scoreboard objectives setdisplay below_name ae_faction

# --- Done ---
tellraw @a [{"text":"[Tides] ","color":"gold","bold":true},{"text":"Scoreboards initialized. Faction campaign ready.","color":"green"}]
tellraw @a [{"text":"[Tides] ","color":"gold"},{"text":"Week ","color":"gray"},{"score":{"name":"#global","objective":"ae_week"},"color":"yellow"},{"text":" of 10","color":"gray"}]
