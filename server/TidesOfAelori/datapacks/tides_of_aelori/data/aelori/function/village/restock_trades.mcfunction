# ============================================================
# Tides of Aelori — Restock Villager Trades
# Resets trade availability for named NPCs
# Call manually: /function aelori:village/restock_trades
# ============================================================

# Remove and respawn villagers to reset trades
# This is the simplest way to restock in vanilla datapacks
tellraw @a [{"text":"[Aelori] ","color":"gold"},{"text":"Village merchants have restocked their wares.","color":"green"}]

# Kill existing NPCs (they'll be respawned by check_villagers in ~5 seconds)
kill @e[type=villager,tag=aelori.npc]
