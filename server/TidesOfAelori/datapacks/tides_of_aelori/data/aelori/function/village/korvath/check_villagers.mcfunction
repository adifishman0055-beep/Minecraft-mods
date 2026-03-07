# ============================================================
# Korvath Villager Check — Respawn missing War Council NPCs
# Runs every 5 seconds from tick.mcfunction
# ============================================================

# --- Check each NPC exists, respawn if missing ---

# Warlord Draven
execute unless entity @e[tag=korvath.draven,limit=1] run summon minecraft:villager 1000 70 5 VillagerData:{profession:"weaponsmith",level:5,type:"desert"},CustomName:'{"text":"Warlord Draven","color":"dark_red","bold":true}',CustomNameVisible:1b,Invulnerable:1b,NoAI:1b,Silent:1b,Tags:["korvath.npc","korvath.draven"],Offers:{Recipes:[{buy:{id:"minecraft:emerald",Count:1},sell:{id:"minecraft:cooked_beef",Count:8},maxUses:99}]},ArmorItems:[{},{},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:2490368}}},{id:"minecraft:iron_helmet",Count:1b}],HandItems:[{id:"minecraft:netherite_sword",Count:1b},{}]}

# Forgemaster Kael
execute unless entity @e[tag=korvath.kael,limit=1] run summon minecraft:villager 1015 70 -10 VillagerData:{profession:"toolsmith",level:5,type:"desert"},CustomName:'{"text":"Forgemaster Kael","color":"gold","bold":true}',CustomNameVisible:1b,Invulnerable:1b,NoAI:1b,Silent:1b,Tags:["korvath.npc","korvath.kael"],Offers:{Recipes:[{buy:{id:"minecraft:coal",Count:16},sell:{id:"minecraft:iron_ingot",Count:4},maxUses:99}]},ArmorItems:[{},{},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:6697728}}},{}],HandItems:[{id:"minecraft:iron_axe",Count:1b},{}]}

# Plague Doctor Voss
execute unless entity @e[tag=korvath.voss,limit=1] run summon minecraft:villager 985 70 10 VillagerData:{profession:"cleric",level:5,type:"swamp"},CustomName:'{"text":"Plague Doctor Voss","color":"dark_purple","bold":true}',CustomNameVisible:1b,Invulnerable:1b,NoAI:1b,Silent:1b,Tags:["korvath.npc","korvath.voss"],Offers:{Recipes:[{buy:{id:"minecraft:emerald",Count:2},sell:{id:"minecraft:potion",Count:1,tag:{Potion:"minecraft:strong_healing"}},maxUses:99}]},ArmorItems:[{},{},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:4915330}}},{}],HandItems:[{id:"minecraft:brewing_stand",Count:1b},{}]}

# Beastmaster Gharn
execute unless entity @e[tag=korvath.gharn,limit=1] run summon minecraft:villager 1025 75 0 VillagerData:{profession:"butcher",level:5,type:"taiga"},CustomName:'{"text":"Beastmaster Gharn","color":"dark_green","bold":true}',CustomNameVisible:1b,Invulnerable:1b,NoAI:1b,Silent:1b,Tags:["korvath.npc","korvath.gharn"],Offers:{Recipes:[{buy:{id:"minecraft:raw_beef",Count:16},sell:{id:"minecraft:emerald",Count:2},maxUses:99}]},ArmorItems:[{},{},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:5635072}}},{}],HandItems:[{id:"minecraft:bone",Count:1b},{}]}

# Spy Lyra
execute unless entity @e[tag=korvath.lyra,limit=1] run summon minecraft:villager 990 70 -20 VillagerData:{profession:"cartographer",level:5,type:"plains"},CustomName:'{"text":"Spy Lyra","color":"dark_aqua","bold":true}',CustomNameVisible:1b,Invulnerable:1b,NoAI:1b,Silent:1b,Tags:["korvath.npc","korvath.lyra"],Offers:{Recipes:[{buy:{id:"minecraft:paper",Count:24},sell:{id:"minecraft:emerald",Count:1},maxUses:99}]},ArmorItems:[{},{},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:2263842}}},{}],HandItems:[{id:"minecraft:spyglass",Count:1b},{}]}
