# ============================================================
# Korvath Proximity Dialogue — Check if player is near NPCs
# Runs every second for Korvath faction players
# ============================================================

# --- Check distance to each NPC ---
execute at @e[tag=korvath.draven,limit=1] if entity @s[distance=..4] run function aelori:village/korvath/dialogue/warlord_draven
execute at @e[tag=korvath.kael,limit=1] if entity @s[distance=..4] run function aelori:village/korvath/dialogue/forgemaster_kael
execute at @e[tag=korvath.voss,limit=1] if entity @s[distance=..4] run function aelori:village/korvath/dialogue/plague_doctor_voss
execute at @e[tag=korvath.gharn,limit=1] if entity @s[distance=..4] run function aelori:village/korvath/dialogue/beastmaster_gharn
execute at @e[tag=korvath.lyra,limit=1] if entity @s[distance=..4] run function aelori:village/korvath/dialogue/spy_lyra
