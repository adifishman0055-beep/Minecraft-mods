# ============================================================
# Tides of Aelori — Raid Start
# Triggers the Korvathi raid event
# Called when player reaches quest 7
# ============================================================

# --- Activate raid ---
scoreboard players set #global ae_raid_active 1
scoreboard players set #global ae_raid_wave 0
scoreboard players set #global ae_raid_kills 0
scoreboard players set #global ae_raid_timer 0
scoreboard players set #global ae_raid_mobs 0

# --- Set time to evening (raid happens at night) ---
time set 13000

# --- Weather: dramatic ---
weather thunder

# --- Warning sequence ---
tellraw @a ""
tellraw @a [{"text":"═══════════════════════════════════","color":"dark_red"}]
tellraw @a ""
tellraw @a [{"text":"  ⚠ KORVATHI RAIDERS APPROACHING ⚠","color":"red","bold":true}]
tellraw @a ""
tellraw @a [{"text":"  Ships have been spotted on the eastern shore!","color":"gray"}]
tellraw @a [{"text":"  Prepare your weapons. Defend the village!","color":"gray"}]
tellraw @a ""
tellraw @a [{"text":"═══════════════════════════════════","color":"dark_red"}]
tellraw @a ""

# --- Title ---
title @a times 20 60 20
title @a title "text":"⚔ RAID ⚔","color":"dark_red","bold":true}
title @a subtitle "text":"The Korvathi are coming!","color":"red"}

# --- Sounds ---
playsound minecraft:event.raid.horn master @a ~ ~ ~ 2 0.6
playsound minecraft:entity.wither.spawn master @a ~ ~ ~ 0.5 0.5

# --- Give combat supplies if player is low ---
execute as @a[scores={ae_quest=7}] run give @s arrow 16

# --- Start wave timer (first wave will spawn after ~100 ticks / 5 seconds) ---
scoreboard players set #global ae_raid_timer 0
