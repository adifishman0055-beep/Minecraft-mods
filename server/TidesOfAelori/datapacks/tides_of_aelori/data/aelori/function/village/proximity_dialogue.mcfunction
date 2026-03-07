# # ============================================================
# # Tides of Aelori — Proximity Dialogue
# # Shows context-sensitive dialogue when player is near NPCs
# # Only fires when dialogue cooldown is 0 (prevents spam)
# # ============================================================
# 
# # --- Set cooldown after any dialogue triggers ---
# # (Each sub-function sets cooldown to 5 = ~15 seconds)
# 
# # Elder Miravel (Town Hall)
# # execute if entity @e[type=villager,tag=aelori.elder,distance=..4] run function aelori:village/dialogue/elder_miravel
# 
# # Smith Dorek (Forge)
# # execute if entity @e[type=villager,tag=aelori.smith,distance=..4] run function aelori:village/dialogue/smith_dorek
# 
# # Farmer Hella (Fields)
# # execute if entity @e[type=villager,tag=aelori.farmer,distance=..4] run function aelori:village/dialogue/farmer_hella
# 
# # Scout Tavan (Watchtower)
# # execute if entity @e[type=villager,tag=aelori.scout,distance=..4] run function aelori:village/dialogue/scout_tavan
# 
# # Guard Brennik (Gate)
# # execute if entity @e[type=villager,tag=aelori.guard,distance=..4] run function aelori:village/dialogue/guard_brennik
