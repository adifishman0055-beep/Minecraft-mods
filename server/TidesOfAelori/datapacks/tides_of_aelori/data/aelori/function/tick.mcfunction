# # ============================================================
# # Tides of Aelori — Main Tick Loop (Multiplayer + Factions)
# # Runs every tick. Handles both Aelori and Korvath players.
# # ============================================================
# 
# # --- Increment global tick counter ---
# scoreboard players add #global ae_tick 1
# 
# # ===================== FIRST-JOIN & FACTION =====================
# 
# # New players (ae_joined == 0) → show faction selection
# # actionbar aelori:player/on_first_join
# 
# # Enable trigger for faction selection
# # actionbar ae_select_fac
# 
# # Faction selection detection (ae_joined=1 means choosing)
# # actionbar aelori:player/join_aelori
# # actionbar aelori:player/join_korvath
# 
# # ===================== WEEKLY CAMPAIGN TIMER =====================
# 
# # Only tick campaign if active (ae_campaign=1)
# # execute if score #global ae_campaign matches 1 run scoreboard players add #global ae_week_timer 1
# 
# # Check if week elapsed
# # execute if score #global ae_campaign matches 1 run function aelori:campaign/check_week
# 
# # ===================== RAID TICKS =====================
# 
# # Aelori raid
# # execute if score #global ae_raid_active matches 1 run function aelori:event/raid_tick
# 
# # Korvath defense raid
# # execute if score #global ae_k_raid_active matches 1 run function aelori:event/korvath/raid_tick
# 
# # ===================== EVERY 20 TICKS (1 second) =====================
# 
# # execute unless score #global ae_tick matches 20 run return 0
# 
# # --- Aelori player quest checks ---
# # actionbar aelori:player/check_quests
# 
# # --- Korvath player quest checks ---
# # actionbar aelori:player/check_quests_korvath
# 
# # --- HUD update (faction-aware) ---
# # actionbar aelori:player/hud_update
# # actionbar aelori:player/hud_update_korvath
# 
# # --- Conquest scoreboard display (every second) ---
# # actionbar aelori:campaign/show_scores
# 
# # --- Dialogue cooldowns ---
# # actionbar 1
# 
# # --- Proximity dialogue for Aelori players near Aelori villagers ---
# # actionbar aelori:village/proximity_dialogue
# 
# # --- Proximity dialogue for Korvath players near Korvath villagers ---
# # actionbar aelori:village/korvath/proximity_dialogue
# 
# # --- Villager checks — both islands ---
# # execute store result score #tick_mod ae_tick run scoreboard players get #global ae_tick
# # execute if score #global ae_tick matches 20 run function aelori:village/check_villagers
# # execute if score #global ae_tick matches 20 run function aelori:village/korvath/check_villagers
# 
# # ===================== RESET TICK =====================
# scoreboard players set #global ae_tick 0
