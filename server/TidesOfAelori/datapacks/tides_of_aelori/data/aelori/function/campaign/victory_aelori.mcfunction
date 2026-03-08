# ============================================================
# Victory: Aelori Wins!
# The defenders have held the line and pushed back Korvath
# ============================================================

tellraw @a [{"text":"  ","color":"aqua"},{"text":"★ THE AELORI DEFENDERS ARE VICTORIOUS! ★","color":"aqua","bold":true}]
tellraw @a ""
tellraw @a [{"text":"  The light of Aelori shines across both islands.","color":"yellow"}]
tellraw @a [{"text":"  Peace has been restored to the Shattered Shore.","color":"yellow","italic":true}]
tellraw @a ""

# --- Rewards for Aelori players ---
title @a[scores={ae_faction=1}] times 20 200 20
title @a[scores={ae_faction=1}] title {"text":"VICTORY!","color":"aqua","bold":true}
title @a[scores={ae_faction=1}] subtitle {"text":"The Defenders Triumph!","color":"gold"}

# Defeat title for Korvath
title @a[scores={ae_faction=2}] times 20 200 20
title @a[scores={ae_faction=2}] title {"text":"DEFEAT","color":"gray","bold":true}
title @a[scores={ae_faction=2}] subtitle {"text":"Korvath has fallen...","color":"dark_gray"}

# --- Victory rewards ---
give @a[scores={ae_faction=1}] diamond 16
give @a[scores={ae_faction=1}] netherite_ingot 1
give @a[scores={ae_faction=1}] enchanted_golden_apple 4
give @a[scores={ae_faction=1}] elytra[custom_name="{\"text\":\"Wings of Aelori\",\"color\":\"aqua\",\"italic\":false,\"bold\":true}",lore=["{\"text\":\"Awarded for defending the homeland\",\"color\":\"yellow\",\"italic\":true}"]]

# --- Consolation for Korvath ---
give @a[scores={ae_faction=2}] diamond 4
give @a[scores={ae_faction=2}] golden_apple 8

# --- Fireworks celebration ---
execute at @a[scores={ae_faction=1}] run summon firework_rocket ~ ~2 ~ {Life:0,LifeTime:20,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"large_ball",colors:[I;5592575],fade_colors:[I;16777215],has_trail:1b,has_twinkle:1b}],flight_duration:2b}}}}
execute at @a[scores={ae_faction=1}] run summon firework_rocket ~ ~2 ~3 {Life:0,LifeTime:25,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"small_ball",colors:[I;5592575,16776960],has_trail:1b,has_twinkle:0b}],flight_duration:3b}}}}

playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 1.0
