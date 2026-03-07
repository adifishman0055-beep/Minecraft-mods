# ============================================================
# Award Points — Grants conquest points to a faction
# Called with fakeplayer context. 
# Usage from quest completions: 
#   scoreboard players add #global ae_aelori_pts <amount>
#   function aelori:campaign/award_aelori
# ============================================================

# --- Announce point gain ---
tellraw @a [{"text":"[Conquest] ","color":"gold","bold":true},{"text":"Aelori","color":"aqua","bold":true},{"text":" earned points! Total: ","color":"gray"},{"score":{"name":"#global","objective":"ae_aelori_pts"},"color":"aqua","bold":true}]
# playsound minecraft:entity.experience_orb.pickup master @a[scores={ae_faction=1}] ~ ~ ~ 0.5 1.5
