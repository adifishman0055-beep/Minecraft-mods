# ============================================================
# Victory: Korvath Wins!
# The conquerors have overwhelmed Aelori's defenses
# ============================================================

tellraw @a [{"text":"  ","color":"dark_red"},{"text":"☠ THE KORVATH CONQUERORS ARE VICTORIOUS! ☠","color":"dark_red","bold":true}]
tellraw @a ""
tellraw @a [{"text":"  Korvath's banner flies over both islands.","color":"red"}]
tellraw @a [{"text":"  The age of conquest has begun.","color":"red","italic":true}]
tellraw @a ""

# --- Victory # title for Korvath ---
# title @a[scores={ae_faction=2}] times 20 200 20
# title @a[scores={ae_faction=2}] title:"VICTORY!","color":"dark_red","bold":true}
# title @a[scores={ae_faction=2}] subtitle:"Korvath Reigns Supreme!","color":"gold"}

# Defeat # title for Aelori
# title @a[scores={ae_faction=1}] times 20 200 20
# title @a[scores={ae_faction=1}] title:"DEFEAT","color":"gray","bold":true}
# title @a[scores={ae_faction=1}] subtitle:"Aelori has fallen...","color":"dark_gray"}

# --- Victory rewards ---
# give @a[scores={ae_faction=2}] diamond 16
# give @a[scores={ae_faction=2}] netherite_ingot 1
# give @a[scores={ae_faction=2}] enchanted_golden_apple 4
# give @a[scores={ae_faction=2}] netherite_sword} 1

# --- Consolation for Aelori ---
# give @a[scores={ae_faction=1}] diamond 4
# give @a[scores={ae_faction=1}] golden_apple 8

# --- Fire and thunder celebration ---
execute at @a[scores={ae_faction=2}] run summon firework_rocket ~ ~2 ~ LifeTime:20,FireworksItem:{id:"minecraft:firework_rocket",Count:1,tag:{Fireworks:{Flight:2,Explosions:[{Type:1,Colors:[I;11141120],FadeColors:[I;2490368],Trail:1b,Flicker:1b}]}}}}
execute at @a[scores={ae_faction=2}] run summon firework_rocket ~ ~2 ~3 LifeTime:25,FireworksItem:{id:"minecraft:firework_rocket",Count:1,tag:{Fireworks:{Flight:3,Explosions:[{Type:4,Colors:[I;11141120,16776960],Trail:1b}]}}}}

# playsound minecraft:entity.wither.death master @a ~ ~ ~ 0.5 0.8
# playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 0.8
