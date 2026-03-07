# ============================================================
# Korvath Raid Tick — Manages Aelori counter-attack on Korvath
# ============================================================

scoreboard players add #global ae_k_raid_timer 1

# -- Wave 1: at 100 ticks --
execute if score #global ae_k_raid_wave matches 0 if score #global ae_k_raid_timer matches 100 run function aelori:event/korvath/raid_wave_1
execute if score #global ae_k_raid_wave matches 0 if score #global ae_k_raid_timer matches 100 run scoreboard players set #global ae_k_raid_wave 1

# -- Wave 2: at 1300 ticks --
execute if score #global ae_k_raid_wave matches 1 if score #global ae_k_raid_timer matches 1300 run function aelori:event/korvath/raid_wave_2
execute if score #global ae_k_raid_wave matches 1 if score #global ae_k_raid_timer matches 1300 run scoreboard players set #global ae_k_raid_wave 2

# -- Wave 3 (boss): at 2500 ticks --
execute if score #global ae_k_raid_wave matches 2 if score #global ae_k_raid_timer matches 2500 run function aelori:event/korvath/raid_wave_3
execute if score #global ae_k_raid_wave matches 2 if score #global ae_k_raid_timer matches 2500 run scoreboard players set #global ae_k_raid_wave 3

# -- Check if all raiders are dead --
execute if score #global ae_k_raid_wave matches 1.. unless entity @e[tag=aelori.raider] run function aelori:event/korvath/raid_end

# -- Timeout: if raid goes too long --
execute if score #global ae_k_raid_timer matches 6000.. run function aelori:event/korvath/raid_end
