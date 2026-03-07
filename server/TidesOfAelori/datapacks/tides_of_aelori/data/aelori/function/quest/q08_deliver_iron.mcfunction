# ============================================================
# Quest 8: Arm the Village — COMPLETE
# Player delivered 16 iron ingots to Smith Dorek
# This is the FINAL quest of Chapter 1
# ============================================================

# --- Take the iron ---
clear @s iron_ingot 16

# --- Advance quest to COMPLETE ---
scoreboard players set @s ae_quest 9

# --- Upgrade settlement to level 2 ---
scoreboard players set #village ae_settlement 2

# --- Grant advancements ---
advancement grant @s only aelori:quest/q08_deliver_iron
advancement grant @s only aelori:milestone/chapter_1_complete

# --- Grand celebration ---
# # title times 30 120 40
# # title title:"Chapter 1 Complete","color":"gold","bold":true}
# # title subtitle:"The Shattered Shore","color":"yellow","italic":true}

# playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 1 1
# playsound minecraft:entity.ender_dragon.death master @s ~ ~ ~ 0.3 1.5

# --- Fireworks ---
execute at @s run summon firework_rocket ~ ~2 ~ Life:0,LifeTime:20,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"large_ball",colors:[I;3949738,6719955],fade_colors:[I;8439583],has_trail:1b,has_twinkle:1b}],flight_duration:2b}}}}
execute at @s run summon firework_rocket ~5 ~2 ~0 Life:0,LifeTime:25,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"star",colors:[I;14188339],has_trail:1b}],flight_duration:2b}}}}
execute at @s run summon firework_rocket ~0 ~2 ~5 Life:0,LifeTime:30,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"burst",colors:[I;3949738],has_twinkle:1b}],flight_duration:3b}}}}

# --- Settlement upgrade ---
tellraw @s ""
tellraw @s [{"text":"★ ","color":"gold"},{"text":"SETTLEMENT UPGRADED","color":"gold","bold":true},{"text":" ★","color":"gold"}]
tellraw @s [{"text":"  Aelori Village is now at ","color":"gray"},{"text":"Level 2 — Fortified","color":"green"}]
tellraw @s ""

# --- Massive reward ---
# give @s emerald 32
# give @s diamond 4
# give @s iron_sword} 1
# give @s golden_apple 6

# --- Grand narrative ---
tellraw @s ""
tellraw @s [{"text":"═══════════════════════════════════","color":"gold"}]
tellraw @s ""
tellraw @s [{"text":"  Chapter 1: The Shattered Shore — Complete","color":"gold","bold":true}]
tellraw @s ""
tellraw @s [{"text":"  You arrived on a broken shore with nothing.","color":"gray"}]
tellraw @s [{"text":"  You gathered, built, defended, and forged.","color":"gray"}]
tellraw @s [{"text":"  Aelori stands stronger than it has in years.","color":"gray"}]
tellraw @s ""
tellraw @s [{"text":"  But across the dark waters, Korvath stirs.","color":"red"}]
tellraw @s [{"text":"  The raids were only the beginning.","color":"red"}]
tellraw @s [{"text":"  Something far worse is being prepared.","color":"dark_red","italic":true}]
tellraw @s ""
tellraw @s [{"text":"  The tides are turning. Which way... is up to you.","color":"aqua","italic":true}]
tellraw @s ""
tellraw @s [{"text":"═══════════════════════════════════","color":"gold"}]
tellraw @s ""
tellraw @s [{"text":"  Thank you for playing Chapter 1!","color":"yellow"}]
tellraw @s [{"text":"  Chapter 2: Beyond the Horizon — coming soon.","color":"gray","italic":true}]
tellraw @s ""

# playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1.2
# particle totem_of_undying ~ ~1 ~ 2 2 2 0.1 50

# --- Trigger settlement visual upgrade ---
function aelori:event/settlement_upgrade

# --- Conquest points ---
scoreboard players add #global ae_aelori_pts 50
scoreboard players add @s ae_contribution 50
function aelori:campaign/award_aelori
