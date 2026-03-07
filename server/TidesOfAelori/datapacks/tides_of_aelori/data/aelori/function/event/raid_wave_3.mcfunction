# # ============================================================
# # Tides of Aelori — Raid Wave 3 (BOSS)
# # Final wave: Korvathi Raider Captain (vindicator boss)
# # + 2 elite guards
# # ============================================================
# 
# # --- Advance wave counter ---
# scoreboard players set #global ae_raid_wave 3
# 
# # --- Announcement ---
# tellraw @a ""
# tellraw @a [{"text":"[RAID] ","color":"dark_red","bold":true},{"text":"FINAL WAVE — The Korvathi Captain has arrived!","color":"red","bold":true}]
# tellraw @a ""
# 
# # # title times 10 60 20
# # # title title:"BOSS WAVE","color":"dark_red","bold":true}
# # # title subtitle:"Korvathi Raider Captain","color":"red"}
# 
# # playsound minecraft:entity.wither.# spawn master @a ~ ~ ~ 0.8 0.6
# # playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 0.5 0.5
# 
# # --- Spawn the Captain (powered vindicator) ---
# # summon vindicator 40 70 0 CustomName:'{"text":"Korvathi Raider Captain","color":"dark_red","bold":true}',CustomNameVisible:1b,PersistenceRequired:1b,Tags:["aelori.raider","aelori.raider_boss"],PatrolLeader:0b,ArmorItems:[{id:"iron_boots",count:1},{id:"iron_leggings",count:1},{id:"diamond_chestplate",count:1},{id:"iron_helmet",count:1}],HandItems:[{id:"iron_axe",count:1,components:{"minecraft:enchantments":{levels:{"sharpness":2}}}},{}],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],HandDropChances:[0.3f,0.0f],Attributes:[{Name:"generic.max_health",Base:60.0},{Name:"generic.attack_damage",Base:8.0},{Name:"generic.movement_speed",Base:0.38}],Health:60.0f,ActiveEffects:[{id:"resistance",duration:999999,amplifier:0,show_particles:0b}]}
# 
# # --- Spawn 2 elite guards ---
# # summon vindicator 42 70 3 CustomName:'{"text":"Korvathi Elite","color":"dark_red"}',PersistenceRequired:1b,Tags:["aelori.raider","aelori.raider_elite"],ArmorItems:[{id:"iron_boots",count:1},{id:"iron_leggings",count:1},{id:"iron_chestplate",count:1},{id:"iron_helmet",count:1}],HandItems:[{id:"iron_sword",count:1},{}],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],HandDropChances:[0.1f,0.0f],Attributes:[{Name:"generic.max_health",Base:40.0}],Health:40.0f}
# 
# # summon vindicator 38 70 -3 CustomName:'{"text":"Korvathi Elite","color":"dark_red"}',PersistenceRequired:1b,Tags:["aelori.raider","aelori.raider_elite"],ArmorItems:[{id:"iron_boots",count:1},{id:"iron_leggings",count:1},{id:"iron_chestplate",count:1},{id:"iron_helmet",count:1}],HandItems:[{id:"iron_axe",count:1},{}],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f],HandDropChances:[0.1f,0.0f],Attributes:[{Name:"generic.max_health",Base:40.0}],Health:40.0f}
# 
# # --- Add boss bar # effect via glowing ---
# # effect # give @e[tag=aelori.raider_boss] glowing 999999 0 true
