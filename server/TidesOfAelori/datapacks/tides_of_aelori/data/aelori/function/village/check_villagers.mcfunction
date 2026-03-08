# ============================================================
# Tides of Aelori — Check Villagers
# Ensures named NPCs haven't despawned or been killed
# Respawns them if missing. Runs every 5 seconds.
# ============================================================

# --- Check each NPC exists, respawn if missing ---
# Elder Miravel
execute unless entity @e[type=villager,tag=aelori.elder,limit=1] run tellraw @a [{"text":"[Aelori] ","color":"gold"},{"text":"Elder Miravel has returned to the Town Hall.","color":"yellow"}]
execute unless entity @e[type=villager,tag=aelori.elder,limit=1] run summon villager 0 70 5 {CustomName:'{"text":"Elder Miravel","color":"gold","bold":true}',CustomNameVisible:1b,NoAI:1b,Silent:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["aelori.npc","aelori.elder"],VillagerData:{profession:"librarian",level:5,type:"plains"},Offers:{Recipes:[{buy:{id:"emerald",count:1},sell:{id:"bread",count:6},maxUses:999,rewardExp:0b}]},ArmorItems:[{},{},{id:"leather_chestplate",count:1,components:{"minecraft:dyed_color":3949738}},{}]}

# Smith Dorek
execute unless entity @e[type=villager,tag=aelori.smith,limit=1] run tellraw @a [{"text":"[Aelori] ","color":"gold"},{"text":"Smith Dorek has returned to the Forge.","color":"yellow"}]
execute unless entity @e[type=villager,tag=aelori.smith,limit=1] run summon villager 15 70 -10 {CustomName:'{"text":"Smith Dorek","color":"gray","bold":true}',CustomNameVisible:1b,NoAI:1b,Silent:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["aelori.npc","aelori.smith"],VillagerData:{profession:"weaponsmith",level:5,type:"plains"},Offers:{Recipes:[{buy:{id:"emerald",count:5},sell:{id:"iron_sword",count:1},maxUses:999,rewardExp:0b}]},ArmorItems:[{},{},{id:"leather_chestplate",count:1,components:{"minecraft:dyed_color":5592405}},{}]}

# Farmer Hella
execute unless entity @e[type=villager,tag=aelori.farmer,limit=1] run tellraw @a [{"text":"[Aelori] ","color":"gold"},{"text":"Farmer Hella has returned to the Fields.","color":"yellow"}]
execute unless entity @e[type=villager,tag=aelori.farmer,limit=1] run summon villager -15 70 10 {CustomName:'{"text":"Farmer Hella","color":"green","bold":true}',CustomNameVisible:1b,NoAI:1b,Silent:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["aelori.npc","aelori.farmer"],VillagerData:{profession:"farmer",level:5,type:"plains"},Offers:{Recipes:[{buy:{id:"emerald",count:1},sell:{id:"bread",count:4},maxUses:999,rewardExp:0b}]},ArmorItems:[{},{},{id:"leather_chestplate",count:1,components:{"minecraft:dyed_color":5635072}},{}]}

# Scout Tavan
execute unless entity @e[type=villager,tag=aelori.scout,limit=1] run tellraw @a [{"text":"[Aelori] ","color":"gold"},{"text":"Scout Tavan has returned to the Watchtower.","color":"yellow"}]
execute unless entity @e[type=villager,tag=aelori.scout,limit=1] run summon villager 25 75 0 {CustomName:'{"text":"Scout Tavan","color":"aqua","bold":true}',CustomNameVisible:1b,NoAI:1b,Silent:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["aelori.npc","aelori.scout"],VillagerData:{profession:"cartographer",level:5,type:"plains"},ArmorItems:[{},{},{id:"leather_chestplate",count:1,components:{"minecraft:dyed_color":6724056}},{}]}

# Guard Brennik
execute unless entity @e[type=villager,tag=aelori.guard,limit=1] run tellraw @a [{"text":"[Aelori] ","color":"gold"},{"text":"Guard Brennik has returned to the Gate.","color":"yellow"}]
execute unless entity @e[type=villager,tag=aelori.guard,limit=1] run summon villager -10 70 -20 {CustomName:'{"text":"Guard Brennik","color":"red","bold":true}',CustomNameVisible:1b,NoAI:1b,Silent:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["aelori.npc","aelori.guard"],VillagerData:{profession:"armorer",level:5,type:"plains"},ArmorItems:[{},{id:"iron_leggings",count:1},{id:"iron_chestplate",count:1},{id:"iron_helmet",count:1}],HandItems:[{id:"iron_sword",count:1},{}]}
