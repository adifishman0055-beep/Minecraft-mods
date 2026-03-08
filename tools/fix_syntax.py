#!/usr/bin/env python3
"""
Fix all Minecraft 1.21.4 syntax issues in the Tides of Aelori datapack.
Operates on the ORIGINAL world/ files, then copies to server/.
"""
import os, re, shutil, json

BASE = "/Users/adifishman/Minecraft-mods"
SRC = f"{BASE}/world/TidesOfAelori/datapacks/tides_of_aelori"
DST = f"{BASE}/server/TidesOfAelori/datapacks/tides_of_aelori"

# ============================================================
# Step 1: Copy originals to server (clean slate)
# ============================================================
if os.path.exists(DST):
    shutil.rmtree(DST)
shutil.copytree(SRC, DST)
print("✓ Copied fresh datapack to server")

# ============================================================
# Step 2: Fix .mcfunction files
# ============================================================
FUNC_DIR = f"{DST}/data/aelori/function"

def fix_give_command(line):
    """Convert old give commands with NBT {display:{...}} to clean 1.21.4 format."""
    # Match: give <target> <item>{...} <count>
    # Strategy: strip the NBT entirely for simple items, use components for enchanted ones
    
    # Pattern: give @X item_name{anything} optional_count
    m = re.match(r'^(give\s+\S+\s+)(\w+)\{(.+)\}\s*(\d*)$', line)
    if not m:
        return line
    
    prefix = m.group(1)  # "give @s "
    item = m.group(2)     # "iron_sword"
    nbt = m.group(3)      # the NBT content
    count = m.group(4) or ""  # "1" or ""
    
    # Extract display name if present
    name_match = re.search(r'"text"\s*:\s*"([^"]+)"', nbt)
    custom_name = name_match.group(1) if name_match else None
    
    # Extract enchantments
    enchants = {}
    # Old format: Enchantments:[{id:"sharpness",lvl:3},{id:"unbreaking",lvl:2}]
    for ench_m in re.finditer(r'id\s*:\s*"(?:minecraft:)?(\w+)"\s*,\s*lvl\s*:\s*(\d+)', nbt):
        enchants[ench_m.group(1)] = int(ench_m.group(2))
    
    # Build new component syntax
    components = []
    if custom_name:
        # Escape for JSON-in-SNBT
        components.append(f'custom_name=\'"{{\\\\\"text\\\\\":\\\\\"{custom_name}\\\\\"}}"\'')
    if enchants:
        ench_str = ",".join(f'"{k}":{v}' for k, v in enchants.items())
        components.append(f'enchantments={{levels:{{{ench_str}}}}}')
    
    if components:
        comp_str = ",".join(components)
        result = f'{prefix}{item}[{comp_str}]'
    else:
        result = f'{prefix}{item}'
    
    if count and count != "1":
        result += f' {count}'
    
    return result

def fix_particle(line):
    """Fix particle commands for 1.21.4."""
    # entity_effect needs color parameter
    line = re.sub(
        r'particle\s+minecraft:entity_effect\s+',
        'particle minecraft:ambient_entity_effect ',
        line
    )
    # happy_villager needs minecraft: prefix  
    line = re.sub(r'particle\s+happy_villager\b', 'particle minecraft:happy_villager', line)
    return line

def fix_firework_old(line):
    """Convert old firework NBT (with tag:{Fireworks:...}) to 1.21.4 format."""
    if 'firework_rocket' not in line or 'tag:{Fireworks:' not in line:
        return line
    # Just replace with a simple firework
    # Extract coordinates
    coord_m = re.search(r'summon\s+firework_rocket\s+(~?\S+)\s+(~?\S+)\s+(~?\S+)', line)
    if not coord_m:
        return line
    x, y, z = coord_m.group(1), coord_m.group(2), coord_m.group(3)
    # Check if it's inside an execute
    exec_m = re.match(r'^(execute\s+.+\s+run\s+)', line)
    prefix = exec_m.group(1) if exec_m else ""
    return f'{prefix}summon firework_rocket {x} {y} {z} {{Life:0,LifeTime:20,FireworksItem:{{id:"firework_rocket",count:1,components:{{"minecraft:fireworks":{{explosions:[{{shape:"large_ball",colors:[I;5592575,16776960],has_trail:1b,has_twinkle:1b}}],flight_duration:2b}}}}}}}}'

def fix_gamerule(line):
    """Remove invalid gamerules."""
    stripped = line.strip()
    if stripped == 'gamerule pvp true':
        return '# gamerule pvp true  # Controlled by server.properties'
    if stripped == 'gamerule spawnRadius 0':
        return '# gamerule spawnRadius 0  # Controlled by server.properties (spawn-protection)'
    return line

def fix_effect(line):
    """Fix effect give commands for 1.21.4 format."""
    # In 1.21.4: effect give @s minecraft:resistance 9999 255 true
    # is valid, but we need full namespaced IDs
    # effect give @e[tag=...] glowing 999999 0 true -> needs minecraft: prefix
    line = re.sub(r'effect give (\S+) glowing ', r'effect give \1 minecraft:glowing ', line)
    line = re.sub(r'effect give (\S+) resistance ', r'effect give \1 minecraft:resistance ', line)
    return line

def fix_attribute_names(line):
    """Fix entity attribute names for 1.21.4."""
    line = line.replace('"generic.max_health"', '"minecraft:max_health"')
    line = line.replace('"generic.attack_damage"', '"minecraft:attack_damage"')
    line = line.replace('"generic.movement_speed"', '"minecraft:movement_speed"')
    line = line.replace('"generic.armor"', '"minecraft:armor"')
    line = line.replace('"generic.follow_range"', '"minecraft:follow_range"')
    line = line.replace('Name:"minecraft:', 'id:"minecraft:')
    return line

def fix_mcfunction(filepath):
    """Apply all fixes to a single .mcfunction file."""
    with open(filepath, 'r') as f:
        lines = f.readlines()
    
    fixed = []
    for line in lines:
        original = line.rstrip('\n')
        stripped = original.strip()
        
        # Skip comments and empty lines
        if stripped.startswith('#') or stripped == '':
            fixed.append(original)
            continue
        
        result = original
        
        # Fix gamerules
        result = fix_gamerule(result)
        if result != original:
            fixed.append(result)
            continue
        
        # Fix give commands with old NBT
        if re.match(r'\s*give\s+\S+\s+\w+\{', stripped):
            result = fix_give_command(stripped)
            fixed.append(result)
            continue
        
        # Fix old firework summons
        if 'tag:{Fireworks:' in stripped:
            result = fix_firework_old(stripped)
            fixed.append(result)
            continue
        
        # Fix particles
        result = fix_particle(result)
        
        # Fix effect commands
        result = fix_effect(result)
        
        # Fix attribute names in summon commands
        result = fix_attribute_names(result)
        
        fixed.append(result)
    
    with open(filepath, 'w') as f:
        f.write('\n'.join(fixed) + '\n')

# Process all .mcfunction files
count = 0
for root, dirs, files in os.walk(FUNC_DIR):
    for fname in files:
        if fname.endswith('.mcfunction'):
            filepath = os.path.join(root, fname)
            fix_mcfunction(filepath)
            count += 1
            
print(f"✓ Fixed {count} .mcfunction files")

# ============================================================
# Step 3: Fix recipe JSON files for 1.21.4
# ============================================================
RECIPE_DIR = f"{DST}/data/aelori/recipe"

# Aelori banner recipe - 1.21.4 format
aelori_recipe = {
    "type": "minecraft:crafting_shaped",
    "pattern": [
        "WWW",
        "WSW",
        "WWW"
    ],
    "key": {
        "W": "minecraft:light_blue_wool",
        "S": "minecraft:stick"
    },
    "result": {
        "id": "minecraft:light_blue_banner",
        "count": 1
    }
}

korvath_recipe = {
    "type": "minecraft:crafting_shaped",
    "pattern": [
        "RRR",
        "RSR",
        "RRR"
    ],
    "key": {
        "R": "minecraft:red_wool",
        "S": "minecraft:stick"
    },
    "result": {
        "id": "minecraft:red_banner",
        "count": 1
    }
}

with open(f"{RECIPE_DIR}/aelori_banner.json", 'w') as f:
    json.dump(aelori_recipe, f, indent=2)
with open(f"{RECIPE_DIR}/korvath_banner.json", 'w') as f:
    json.dump(korvath_recipe, f, indent=2)

print("✓ Fixed recipe JSON files")

# ============================================================
# Step 4: Verify pack.mcmeta format
# ============================================================
pack_meta = {
    "pack": {
        "pack_format": 61,
        "description": "Tides of Aelori — Multiplayer Faction Campaign"
    }
}
with open(f"{DST}/pack.mcmeta", 'w') as f:
    json.dump(pack_meta, f, indent=2)

print("✓ Fixed pack.mcmeta (format 61 for 1.21.4)")

# ============================================================
# Step 5: Fix loot tables for 1.21.4
# ============================================================
LOOT_DIR = f"{DST}/data/aelori/loot_table"

quest_reward = {
    "pools": [
        {
            "rolls": 1,
            "entries": [
                {"type": "minecraft:item", "name": "minecraft:emerald", "functions": [{"function": "minecraft:set_count", "count": {"type": "minecraft:uniform", "min": 4, "max": 8}}]},
                {"type": "minecraft:item", "name": "minecraft:golden_apple"},
                {"type": "minecraft:item", "name": "minecraft:iron_ingot", "functions": [{"function": "minecraft:set_count", "count": {"type": "minecraft:uniform", "min": 2, "max": 6}}]}
            ]
        }
    ]
}

raid_mob = {
    "pools": [
        {
            "rolls": 1,
            "entries": [
                {"type": "minecraft:item", "name": "minecraft:iron_ingot", "weight": 3, "functions": [{"function": "minecraft:set_count", "count": {"type": "minecraft:uniform", "min": 1, "max": 3}}]},
                {"type": "minecraft:item", "name": "minecraft:emerald", "weight": 2},
                {"type": "minecraft:item", "name": "minecraft:golden_apple", "weight": 1}
            ]
        }
    ]
}

with open(f"{LOOT_DIR}/quest_reward_ch1.json", 'w') as f:
    json.dump(quest_reward, f, indent=2)
with open(f"{LOOT_DIR}/raid_mob.json", 'w') as f:
    json.dump(raid_mob, f, indent=2)

print("✓ Fixed loot table JSON files")

print("\n=== ALL FIXES APPLIED ===")
print(f"Datapack ready at: {DST}")
