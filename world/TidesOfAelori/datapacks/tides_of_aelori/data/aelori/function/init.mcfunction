# ============================================================
# Tides of Aelori — Initialization
# Runs once on /reload or world load
# ============================================================

# --- Announce load ---
tellraw @a [{"text":"[Aelori] ","color":"gold","bold":true},{"text":"Datapack loaded. Tides of Aelori v1.0","color":"yellow"}]

# --- Core scoreboards ---
# Player join tracking
scoreboard objectives add ae_joined dummy
# Current quest index per player (0 = not started, 1-8 = quest, 9 = chapter complete)
scoreboard objectives add ae_quest dummy
# Faction ID (1 = Aelori, 2 = Korvath)
scoreboard objectives add ae_faction dummy
# Settlement level (global, tracked on fakeplayer #village)
scoreboard objectives add ae_settlement dummy

# --- Quest item trackers ---
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

# --- Event trackers ---
scoreboard objectives add ae_raid_active dummy
scoreboard objectives add ae_raid_wave dummy
scoreboard objectives add ae_raid_kills dummy
scoreboard objectives add ae_raid_timer dummy
scoreboard objectives add ae_raid_mobs dummy

# --- Tick system ---
scoreboard objectives add ae_tick dummy
scoreboard players set #global ae_tick 0

# --- Dialogue cooldowns (prevent spam) ---
scoreboard objectives add ae_dialog_cd dummy

# --- Player death counter ---
scoreboard objectives add ae_deaths deathCount

# --- Initialize settlement level if not set ---
execute unless score #village ae_settlement matches 0.. run scoreboard players set #village ae_settlement 0

# --- Gamerule recommendations ---
gamerule sendCommandFeedback false
gamerule commandBlockOutput false
gamerule announceAdvancements true
gamerule doFireTick false
gamerule keepInventory false
gamerule doDaylightCycle true
gamerule doWeatherCycle true
gamerule naturalRegeneration true

# --- Set world spawn (Aelori village center) ---
# Coordinates: Adjust these to your actual island build
# Default: a pleasant spawn point for the Aelori village center
setworldspawn 0 70 0

# --- Done ---
tellraw @a [{"text":"[Aelori] ","color":"gold","bold":true},{"text":"Scoreboards initialized. World ready.","color":"green"}]
