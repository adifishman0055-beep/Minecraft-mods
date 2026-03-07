# ============================================================
# Korvath Defense Raid Start — Aelori counter-attack
# The "Aelori" send raiders to Korvath island
# Centered at 1000, 70, 0
# ============================================================

scoreboard players set #global ae_k_raid_active 1
scoreboard players set #global ae_k_raid_wave 0
scoreboard players set #global ae_k_raid_timer 0
scoreboard players set #global ae_k_raid_mobs 0

time set 13000

weather thunder

# --- Warn Korvath players ---
tellraw @a[scores={ae_faction=2}] ""
tellraw @a[scores={ae_faction=2}] [{"text":"[BATTLE] ","color":"dark_red","bold":true},{"text":"Aelori forces have been spotted approaching Korvath!","color":"red"}]
tellraw @a[scores={ae_faction=2}] [{"text":"  Defend the warcamp! Wave 1 incoming!","color":"yellow"}]
tellraw @a[scores={ae_faction=2}] ""

# title @a[scores={ae_faction=2}] times 10 40 10
# title @a[scores={ae_faction=2}] title:"UNDER ATTACK!","color":"red","bold":true}
# title @a[scores={ae_faction=2}] subtitle:"Defend the Warcamp!","color":"yellow"}

# Give defenders some arrows
# give @a[scores={ae_faction=2}] arrow 64

# playsound minecraft:entity.wither.spawn master @a[scores={ae_faction=2}] ~ ~ ~ 0.5 0.8
