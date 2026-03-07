# ============================================================
# Korvath Quest 7: Repel Counter-Attack — COMPLETE
# Raid survived (handled by raid_end, but this grants quest advance)
# This is called from event/korvath/raid_end.mcfunction
# ============================================================

scoreboard players set @s ae_quest 8

advancement grant @s only aelori:quest/q07_survive_raid
advancement grant @s only aelori:milestone/first_defense

# # title times 10 80 20
# # title title:"BATTLE WON","color":"red","bold":true}
# # title subtitle:"The Aelori assault has been crushed!","color":"gold"}
# playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 0.8
# playsound minecraft:entity.wither.death master @s ~ ~ ~ 0.3 0.8

# Victory fireworks
execute at @s run summon firework_rocket ~ ~2 ~ LifeTime:20,FireworksItem:{id:"minecraft:firework_rocket",Count:1,tag:{Fireworks:{Flight:2,Explosions:[{Type:1,Colors:[I;11141120],FadeColors:[I;16776960],Trail:1b,Flicker:1b}]}}}}

# give @s emerald 16
# give @s diamond 4
# give @s iron_sword} 1

scoreboard players add #global ae_korvath_pts 30
scoreboard players add @s ae_contribution 30
function aelori:campaign/award_korvath

tellraw @s ""
tellraw @s [{"text":"[MISSION COMPLETE] ","color":"red","bold":true},{"text":"Repel the Counter-Attack","color":"white"}]
tellraw @s [{"text":"  +16 Emeralds, +4 Diamonds, +1 Raider's Edge","color":"gray"}]
tellraw @s [{"text":"  +30 Conquest Points for Korvath!","color":"gold"}]
tellraw @s ""
tellraw @s [{"text":"[Korvath] ","color":"dark_red"},{"text":"Warlord Draven: ","color":"red"},{"text":"HA! They thought they could break us? Pathetic! Now — the forge needs iron for our next wave of weapons. Bring 16 ingots to Kael.","color":"white"}]
tellraw @s ""
tellraw @s [{"text":"[FINAL MISSION] ","color":"gold","bold":true},{"text":"Iron Tribute","color":"white"}]
tellraw @s [{"text":"  Deliver ","color":"gray"},{"text":"16 Iron Ingots","color":"yellow"},{"text":" to Forgemaster Kael.","color":"gray"}]
