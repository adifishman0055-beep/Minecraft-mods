# ============================================================
# Victory: Tied! — Both factions must fight one final battle
# ============================================================

tellraw @a [{"text":"  ","color":"gold"},{"text":"⚔ THE SCORES ARE TIED! ⚔","color":"gold","bold":true}]
tellraw @a ""
tellraw @a [{"text":"  Neither side has proven dominant.","color":"gray"}]
tellraw @a [{"text":"  A final, decisive battle must be fought!","color":"yellow","bold":true}]
tellraw @a ""
tellraw @a [{"text":"  Both factions: march to the ","color":"white"},{"text":"Neutral Grounds","color":"gold","bold":true},{"text":" (0 70 500)","color":"gray"}]
tellraw @a [{"text":"  The last team standing claims victory!","color":"red"}]
tellraw @a ""

# --- Give everyone combat gear ---
give @a diamond_sword 1
give @a diamond_chestplate 1
give @a golden_apple 8
give @a arrow 64

# --- Set PvP arena ---
title @a times 20 100 20
title @a title "text":"TIEBREAKER!","color":"gold","bold":true}
title @a subtitle "text":"Fight for your faction at 0 70 500!","color":"yellow"}

playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 1 0.5
