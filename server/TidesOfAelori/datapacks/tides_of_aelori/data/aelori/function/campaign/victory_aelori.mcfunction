# # ============================================================
# # Victory: Aelori Wins!
# # The defenders have held the line and pushed back Korvath
# # ============================================================
# 
# tellraw @a [{"text":"  ","color":"aqua"},{"text":"★ THE AELORI DEFENDERS ARE VICTORIOUS! ★","color":"aqua","bold":true}]
# tellraw @a ""
# tellraw @a [{"text":"  The light of Aelori shines across both islands.","color":"yellow"}]
# tellraw @a [{"text":"  Peace has been restored to the Shattered Shore.","color":"yellow","italic":true}]
# tellraw @a ""
# 
# # --- Rewards for Aelori players ---
# # title @a[scores={ae_faction=1}] times 20 200 20
# # title @a[scores={ae_faction=1}] title:"VICTORY!","color":"aqua","bold":true}
# # title @a[scores={ae_faction=1}] subtitle:"The Defenders Triumph!","color":"gold"}
# 
# # Defeat # title for Korvath
# # title @a[scores={ae_faction=2}] times 20 200 20
# # title @a[scores={ae_faction=2}] title:"DEFEAT","color":"gray","bold":true}
# # title @a[scores={ae_faction=2}] subtitle:"Korvath has fallen...","color":"dark_gray"}
# 
# # --- Victory rewards ---
# # give @a[scores={ae_faction=1}] diamond 16
# # give @a[scores={ae_faction=1}] netherite_ingot 1
# # give @a[scores={ae_faction=1}] enchanted_golden_apple 4
# # give @a[scores={ae_faction=1}] elytra{display:{Name:'{"text":"Wings of Aelori","color":"aqua","italic":false,"bold":true}',Lore:['{"text":"Awarded for defending the homeland","color":"yellow","italic":true}']}} 1
# 
# # --- Consolation for Korvath ---
# # give @a[scores={ae_faction=2}] diamond 4
# # give @a[scores={ae_faction=2}] golden_apple 8
# 
# # --- Fireworks celebration ---
# # execute at @a[scores={ae_faction=1}] run # summon firework_rocket ~ ~2 ~ LifeTime:20,FireworksItem:{id:"minecraft:firework_rocket",Count:1,tag:{Fireworks:{Flight:2,Explosions:[{Type:1,Colors:[I;5592575],FadeColors:[I;16777215],Trail:1b,Flicker:1b}]}}}}
# # execute at @a[scores={ae_faction=1}] run # summon firework_rocket ~ ~2 ~3 LifeTime:25,FireworksItem:{id:"minecraft:firework_rocket",Count:1,tag:{Fireworks:{Flight:3,Explosions:[{Type:0,Colors:[I;5592575,16776960],Trail:1b}]}}}}
# 
# # playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 1.0
