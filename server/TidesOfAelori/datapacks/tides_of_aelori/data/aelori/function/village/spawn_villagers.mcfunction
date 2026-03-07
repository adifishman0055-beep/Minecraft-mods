# # ============================================================
# # Tides of Aelori — Spawn Named Villagers
# # Places all named NPC villagers at their stations
# # Run manually or on first world setup: /function aelori:village/spawn_villagers
# #
# # NOTE: Coordinates must match your actual village build.
# # Adjust X Y Z values to your island layout.
# # ============================================================
# 
# # --- Kill existing named villagers first (prevent duplicates) ---
# kill @e[type=villager,tag=aelori.npc]
# 
# # === ELDER MIRAVEL — Town Hall ===
# # The village leader. Offers guidance and quest progression.
# # summon villager 0 70 5 CustomName:'{"text":"Elder Miravel","color":"gold","bold":true}',CustomNameVisible:1b,NoAI:1b,Silent:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["aelori.npc","aelori.elder"],VillagerData:{profession:"librarian",level:5,type:"plains"},Offers:{Recipes:[{buy:{id:"emerald",count:1},sell:{id:"written_book",count:1,components:{"minecraft:written_book_content":{title:"Village History",author:"Elder Miravel",pages:[{raw:"The history of Aelori stretches back centuries. Once a mighty island nation, we traded with all who sailed these waters. The Korvathi were our neighbors, then our rivals, and now our enemies."}]}}},maxUses:999,rewardExp:0b},{buy:{id:"emerald",count:3},sell:{id:"golden_apple",count:1},maxUses:999,rewardExp:0b},{buy:{id:"emerald",count:1},sell:{id:"bread",count:6},maxUses:999,rewardExp:0b}]},ArmorItems:[{},{},{id:"leather_chestplate",count:1,components:{"minecraft:dyed_color":3949738}},{}]}
# 
# # === SMITH DOREK — The Forge ===
# # The blacksmith. Trades weapons, armor, tools.
# # summon villager 15 70 -10 CustomName:'{"text":"Smith Dorek","color":"gray","bold":true}',CustomNameVisible:1b,NoAI:1b,Silent:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["aelori.npc","aelori.smith"],VillagerData:{profession:"weaponsmith",level:5,type:"plains"},Offers:{Recipes:[{buy:{id:"emerald",count:5},sell:{id:"iron_sword",count:1},maxUses:999,rewardExp:0b},{buy:{id:"emerald",count:8},sell:{id:"iron_chestplate",count:1},maxUses:999,rewardExp:0b},{buy:{id:"iron_ingot",count:4},sell:{id:"emerald",count:1},maxUses:999,rewardExp:0b},{buy:{id:"emerald",count:3},sell:{id:"iron_axe",count:1},maxUses:999,rewardExp:0b}]},ArmorItems:[{},{},{id:"leather_chestplate",count:1,components:{"minecraft:dyed_color":5592405}},{}]}
# 
# # === FARMER HELLA — The Fields ===
# # The farmer. Trades food items, buys crops.
# # summon villager -15 70 10 CustomName:'{"text":"Farmer Hella","color":"green","bold":true}',CustomNameVisible:1b,NoAI:1b,Silent:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["aelori.npc","aelori.farmer"],VillagerData:{profession:"farmer",level:5,type:"plains"},Offers:{Recipes:[{buy:{id:"wheat",count:20},sell:{id:"emerald",count:1},maxUses:999,rewardExp:0b},{buy:{id:"emerald",count:1},sell:{id:"bread",count:4},maxUses:999,rewardExp:0b},{buy:{id:"emerald",count:1},sell:{id:"carrot",count:8},maxUses:999,rewardExp:0b},{buy:{id:"emerald",count:2},sell:{id:"golden_carrot",count:2},maxUses:999,rewardExp:0b}]},ArmorItems:[{},{},{id:"leather_chestplate",count:1,components:{"minecraft:dyed_color":5635072}},{}]}
# 
# # === SCOUT TAVAN — The Watchtower ===
# # The scout. Trades exploration items, maps.
# # summon villager 25 75 0 CustomName:'{"text":"Scout Tavan","color":"aqua","bold":true}',CustomNameVisible:1b,NoAI:1b,Silent:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["aelori.npc","aelori.scout"],VillagerData:{profession:"cartographer",level:5,type:"plains"},Offers:{Recipes:[{buy:{id:"emerald",count:2},sell:{id:"spyglass",count:1},maxUses:999,rewardExp:0b},{buy:{id:"emerald",count:1},sell:{id:"compass",count:1},maxUses:999,rewardExp:0b},{buy:{id:"emerald",count:3},sell:{id:"arrow",count:16},maxUses:999,rewardExp:0b},{buy:{id:"emerald",count:5},sell:{id:"bow",count:1},maxUses:999,rewardExp:0b}]},ArmorItems:[{},{},{id:"leather_chestplate",count:1,components:{"minecraft:dyed_color":6724056}},{}]}
# 
# # === GUARD BRENNIK — The Gate ===
# # The guard captain. Trades combat gear.
# # summon villager -10 70 -20 CustomName:'{"text":"Guard Brennik","color":"red","bold":true}',CustomNameVisible:1b,NoAI:1b,Silent:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["aelori.npc","aelori.guard"],VillagerData:{profession:"armorer",level:5,type:"plains"},Offers:{Recipes:[{buy:{id:"emerald",count:5},sell:{id:"shield",count:1},maxUses:999,rewardExp:0b},{buy:{id:"emerald",count:4},sell:{id:"iron_helmet",count:1},maxUses:999,rewardExp:0b},{buy:{id:"emerald",count:7},sell:{id:"iron_leggings",count:1},maxUses:999,rewardExp:0b},{buy:{id:"emerald",count:3},sell:{id:"iron_boots",count:1},maxUses:999,rewardExp:0b}]},ArmorItems:[{},{id:"iron_leggings",count:1},{id:"iron_chestplate",count:1},{id:"iron_helmet",count:1}],HandItems:[{id:"iron_sword",count:1},{}]}
# 
# # --- Confirmation ---
# tellraw @a [{"text":"[Aelori] ","color":"gold"},{"text":"Village NPCs spawned: Elder Miravel, Smith Dorek, Farmer Hella, Scout Tavan, Guard Brennik","color":"green"}]
