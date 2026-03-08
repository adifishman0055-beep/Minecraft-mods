# ============================================================
# Korvath Villager Check — Respawn missing War Council NPCs
# Runs every 5 seconds from tick.mcfunction
# ============================================================

# --- Check each NPC exists, respawn if missing ---

# Warlord Draven
execute unless entity @e[tag=korvath.draven,limit=1] run summon minecraft:villager 1000 70 5 {VillagerData:{profession:"weaponsmith",level:5,type:"desert"},CustomName:'{"text":"Warlord Draven","color":"dark_red","bold":true}',CustomNameVisible:1b,Invulnerable:1b,NoAI:1b,Silent:1b,Tags:["korvath.npc","korvath.draven"],Offers:{Recipes:[{buy:{id:"minecraft:emerald",count:1},sell:{id:"minecraft:cooked_beef",count:8},maxUses:99}]},ArmorItems:[{},{},{id:"minecraft:leather_chestplate",count:1,components:{"minecraft:dyed_color":{rgb:2490368}}},{id:"minecraft:iron_helmet",count:1}],HandItems:[{id:"minecraft:netherite_sword",count:1},{}]}

# Forgemaster Kael
execute unless entity @e[tag=korvath.kael,limit=1] run summon minecraft:villager 1015 70 -10 {VillagerData:{profession:"toolsmith",level:5,type:"desert"},CustomName:'{"text":"Forgemaster Kael","color":"gold","bold":true}',CustomNameVisible:1b,Invulnerable:1b,NoAI:1b,Silent:1b,Tags:["korvath.npc","korvath.kael"],Offers:{Recipes:[{buy:{id:"minecraft:coal",count:16},sell:{id:"minecraft:iron_ingot",count:4},maxUses:99}]},ArmorItems:[{},{},{id:"minecraft:leather_chestplate",count:1,components:{"minecraft:dyed_color":{rgb:6697728}}},{}],HandItems:[{id:"minecraft:iron_axe",count:1},{}]}

# Plague Doctor Voss
execute unless entity @e[tag=korvath.voss,limit=1] run summon minecraft:villager 985 70 10 {VillagerData:{profession:"cleric",level:5,type:"swamp"},CustomName:'{"text":"Plague Doctor Voss","color":"dark_purple","bold":true}',CustomNameVisible:1b,Invulnerable:1b,NoAI:1b,Silent:1b,Tags:["korvath.npc","korvath.voss"],Offers:{Recipes:[{buy:{id:"minecraft:emerald",count:2},sell:{id:"minecraft:potion",count:1,components:{"minecraft:potion_contents":{potion:"minecraft:strong_healing"}}},maxUses:99}]},ArmorItems:[{},{},{id:"minecraft:leather_chestplate",count:1,components:{"minecraft:dyed_color":{rgb:4915330}}},{}],HandItems:[{id:"minecraft:brewing_stand",count:1},{}]}

# Beastmaster Gharn
execute unless entity @e[tag=korvath.gharn,limit=1] run summon minecraft:villager 1025 75 0 {VillagerData:{profession:"butcher",level:5,type:"taiga"},CustomName:'{"text":"Beastmaster Gharn","color":"dark_green","bold":true}',CustomNameVisible:1b,Invulnerable:1b,NoAI:1b,Silent:1b,Tags:["korvath.npc","korvath.gharn"],Offers:{Recipes:[{buy:{id:"minecraft:beef",count:16},sell:{id:"minecraft:emerald",count:2},maxUses:99}]},ArmorItems:[{},{},{id:"minecraft:leather_chestplate",count:1,components:{"minecraft:dyed_color":{rgb:5635072}}},{}],HandItems:[{id:"minecraft:bone",count:1},{}]}

# Spy Lyra
execute unless entity @e[tag=korvath.lyra,limit=1] run summon minecraft:villager 990 70 -20 {VillagerData:{profession:"cartographer",level:5,type:"plains"},CustomName:'{"text":"Spy Lyra","color":"dark_aqua","bold":true}',CustomNameVisible:1b,Invulnerable:1b,NoAI:1b,Silent:1b,Tags:["korvath.npc","korvath.lyra"],Offers:{Recipes:[{buy:{id:"minecraft:paper",count:24},sell:{id:"minecraft:emerald",count:1},maxUses:99}]},ArmorItems:[{},{},{id:"minecraft:leather_chestplate",count:1,components:{"minecraft:dyed_color":{rgb:2263842}}},{}],HandItems:[{id:"minecraft:spyglass",count:1},{}]}
