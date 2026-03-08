# ============================================================
# Korvath Villagers — Spawn 5 War Council NPCs
# Located on Korvath Island (centered at 1000, 70, 0)
# ============================================================

# --- Kill existing Korvath NPCs (for respawn/reload) ---
kill @e[tag=korvath.npc]

# === WARLORD DRAVEN — Leader (at warcamp center) ===
summon minecraft:villager 1000 70 5 {VillagerData:{profession:"weaponsmith",level:5,type:"desert"},CustomName:'{"text":"Warlord Draven","color":"dark_red","bold":true}',CustomNameVisible:1b,Invulnerable:1b,NoAI:1b,Silent:1b,Tags:["korvath.npc","korvath.draven"],Offers:{Recipes:[{buy:{id:"minecraft:iron_ingot",count:4},sell:{id:"minecraft:diamond_sword",count:1},maxUses:99},{buy:{id:"minecraft:emerald",count:8},sell:{id:"minecraft:diamond_chestplate",count:1,tag:

# === FORGEMASTER KAEL — Smith/Weapons (at the forge) ===
summon minecraft:villager 1015 70 -10 {VillagerData:{profession:"toolsmith",level:5,type:"desert"},CustomName:'{"text":"Forgemaster Kael","color":"gold","bold":true}',CustomNameVisible:1b,Invulnerable:1b,NoAI:1b,Silent:1b,Tags:["korvath.npc","korvath.kael"],Offers:{Recipes:[{buy:{id:"minecraft:iron_ingot",count:2},sell:{id:"minecraft:iron_sword",count:1},maxUses:99},{buy:{id:"minecraft:iron_ingot",count:3},sell:{id:"minecraft:iron_pickaxe",count:1},maxUses:99},{buy:{id:"minecraft:coal",count:16},sell:{id:"minecraft:iron_ingot",count:4},maxUses:99}]},ArmorItems:[{},{},{id:"minecraft:leather_chestplate",count:1},{}],HandItems:[{id:"minecraft:iron_axe",count:1},{}]}

# === PLAGUE DOCTOR VOSS — Potions/Dark Magic ===
summon minecraft:villager 985 70 10 {VillagerData:{profession:"cleric",level:5,type:"swamp"},CustomName:'{"text":"Plague Doctor Voss","color":"dark_purple","bold":true}',CustomNameVisible:1b,Invulnerable:1b,NoAI:1b,Silent:1b,Tags:["korvath.npc","korvath.voss"],Offers:{Recipes:[{buy:{id:"minecraft:emerald",count:3},sell:{id:"minecraft:splash_potion",count:1},maxUses:99},{buy:{id:"minecraft:emerald",count:2},sell:{id:"minecraft:potion",count:1},maxUses:99},{buy:{id:"minecraft:spider_eye",count:8},sell:{id:"minecraft:emerald",count:1},maxUses:99}]},ArmorItems:[{},{},{id:"minecraft:leather_chestplate",count:1},{}],HandItems:[{id:"minecraft:brewing_stand",count:1},{}]}

# === BEASTMASTER GHARN — Animal Tamer/Scouts ===
summon minecraft:villager 1025 75 0 {VillagerData:{profession:"butcher",level:5,type:"taiga"},CustomName:'{"text":"Beastmaster Gharn","color":"dark_green","bold":true}',CustomNameVisible:1b,Invulnerable:1b,NoAI:1b,Silent:1b,Tags:["korvath.npc","korvath.gharn"],Offers:{Recipes:[{buy:{id:"minecraft:bone",count:8},sell:{id:"minecraft:wolf_spawn_egg",count:1},maxUses:99},{buy:{id:"minecraft:raw_beef",count:16},sell:{id:"minecraft:emerald",count:2},maxUses:99},{buy:{id:"minecraft:emerald",count:5},sell:{id:"minecraft:saddle",count:1},maxUses:99}]},ArmorItems:[{},{},{id:"minecraft:leather_chestplate",count:1},{}],HandItems:[{id:"minecraft:bone",count:1},{}]}

# === SPY LYRA — Intelligence/Scouting ===
summon minecraft:villager 990 70 -20 {VillagerData:{profession:"cartographer",level:5,type:"plains"},CustomName:'{"text":"Spy Lyra","color":"dark_aqua","bold":true}',CustomNameVisible:1b,Invulnerable:1b,NoAI:1b,Silent:1b,Tags:["korvath.npc","korvath.lyra"],Offers:{Recipes:[{buy:{id:"minecraft:emerald",count:3},sell:{id:"minecraft:spyglass",count:1,tag:

tellraw @a[scores={ae_faction=2}] [{"text":"[Korvath] ","color":"dark_red","bold":true},{"text":"War Council assembled.","color":"gray"}]
