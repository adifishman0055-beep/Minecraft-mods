# ============================================================
# Victory: Korvath Wins!
# The conquerors have overwhelmed Aelori's defenses
# ============================================================

tellraw @a [{"text":"  ","color":"dark_red"},{"text":"☠ THE KORVATH CONQUERORS ARE VICTORIOUS! ☠","color":"dark_red","bold":true}]
tellraw @a ""
tellraw @a [{"text":"  Korvath's banner flies over both islands.","color":"red"}]
tellraw @a [{"text":"  The age of conquest has begun.","color":"red","italic":true}]
tellraw @a ""

# --- Victory title for Korvath ---
title @a[scores={ae_faction=2}] times 20 200 20
title @a[scores={ae_faction=2}] title {"text":"VICTORY!","color":"dark_red","bold":true}
title @a[scores={ae_faction=2}] subtitle {"text":"Korvath Reigns Supreme!","color":"gold"}

# Defeat title for Aelori
title @a[scores={ae_faction=1}] times 20 200 20
title @a[scores={ae_faction=1}] title {"text":"DEFEAT","color":"gray","bold":true}
title @a[scores={ae_faction=1}] subtitle {"text":"Aelori has fallen...","color":"dark_gray"}

# --- Victory rewards ---
give @a[scores={ae_faction=2}] diamond 16
give @a[scores={ae_faction=2}] netherite_ingot 1
give @a[scores={ae_faction=2}] enchanted_golden_apple 4
give @a[scores={ae_faction=2}] netherite_sword[enchantments={levels:{"minecraft:sharpness":5,"minecraft:fire_aspect":2}}]

# --- Consolation for Aelori ---
give @a[scores={ae_faction=1}] diamond 4
give @a[scores={ae_faction=1}] golden_apple 8

# --- Fire and thunder celebration ---
execute at @a[scores={ae_faction=2}] run summon firework_rocket ~ ~2 ~ {Life:0,LifeTime:20,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"large_ball",colors:[I;11141120],fade_colors:[I;2490368],has_trail:1b,has_twinkle:1b}],flight_duration:2b}}}}
execute at @a[scores={ae_faction=2}] run summon firework_rocket ~ ~2 ~3 {Life:0,LifeTime:25,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"burst",colors:[I;11141120,16776960],has_trail:1b,has_twinkle:0b}],flight_duration:3b}}}}

playsound minecraft:entity.wither.death master @a ~ ~ ~ 0.5 0.8
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 0.8
