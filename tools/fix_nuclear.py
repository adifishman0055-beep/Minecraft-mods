#!/usr/bin/env python3
"""
NUCLEAR FIX: Make every .mcfunction file 1.21.4 compatible.
Strategy: strip ALL old NBT from give commands, strip tag:{} from entities,
fix attributes, gamerules, particles, fireworks. Prioritize SERVER WORKING over cosmetics.
"""
import os, re, shutil, json

BASE = "/Users/adifishman/Minecraft-mods"
SRC  = f"{BASE}/world/TidesOfAelori/datapacks/tides_of_aelori"
DST  = f"{BASE}/server/TidesOfAelori/datapacks/tides_of_aelori"

# Fresh copy
if os.path.exists(DST):
    shutil.rmtree(DST)
shutil.copytree(SRC, DST)
print("[1/5] Fresh copy done")

# ═══════════════════════════════════════════════════════════════
# Helper: balanced brace removal
# ═══════════════════════════════════════════════════════════════
def remove_tag_block(s, start_idx):
    """Given index of opening { after 'tag:', find matching } and remove the block."""
    depth = 1
    i = start_idx + 1
    while i < len(s) and depth > 0:
        c = s[i]
        if c == '{': depth += 1
        elif c == '}': depth -= 1
        elif c == "'" or c == '"':
            # Skip entire quoted string (handle \\ escapes)
            q = c
            i += 1
            while i < len(s):
                if s[i] == '\\':
                    i += 2  # skip escaped char
                    continue
                if s[i] == q:
                    break
                i += 1
        i += 1
    return s[:start_idx] + s[i:]

def strip_all_tag_blocks(line):
    """Remove every ,tag:{...} occurrence with balanced brace matching."""
    max_iter = 50  # safety limit
    iterations = 0
    while iterations < max_iter:
        iterations += 1
        m = re.search(r',\s*tag\s*:\s*\{', line)
        if not m:
            break
        # Find the { position
        brace_start = m.end() - 1
        comma_pos = m.start()
        line = line[:comma_pos] + remove_tag_block(line[comma_pos:], brace_start - comma_pos)
    # Also clean any remaining ,tag: stubs (no { follows)
    line = re.sub(r',\s*tag\s*:\s*(?=[,}\]\s]|$)', '', line)
    return line

# ═══════════════════════════════════════════════════════════════
# Fix: give commands — strip ALL old NBT, keep enchantments only
# ═══════════════════════════════════════════════════════════════
def fix_give(line):
    s = line.strip()
    if not re.match(r'give\s+\S+\s+[\w:]+\{', s):
        return line
    # Extract: give <target> <item>{<nbt>} <count>
    m = re.match(r'^(give\s+\S+\s+)([\w:]+)\{(.+)\}\s*(\d*)$', s)
    if not m:
        return line
    prefix, item, nbt, count = m.group(1), m.group(2), m.group(3), m.group(4)
    
    # For written_book, just give a writable_book (content can't be migrated easily)
    if item == 'written_book':
        return f"{prefix}writable_book 1"
    
    # Extract enchantments
    enchants = {}
    for em in re.finditer(r'id\s*:\s*"(?:minecraft:)?(\w+)"\s*,\s*lvl\s*:\s*(\d+)', nbt):
        enchants[f"minecraft:{em.group(1)}"] = int(em.group(2))
    
    # Extract dyed color (for leather armor)
    color_m = re.search(r'(?<!\w)color\s*:\s*(\d+)', nbt)
    
    # Build clean give
    comps = []
    if enchants:
        inner = ",".join(f'"{k}":{v}' for k,v in enchants.items())
        comps.append(f'enchantments={{levels:{{{inner}}}}}')
    if color_m:
        comps.append(f'dyed_color={{rgb:{color_m.group(1)}}}')
    
    if comps:
        return f"{prefix}{item}[{','.join(comps)}]"
    else:
        c = f" {count}" if count and count != '1' else ""
        return f"{prefix}{item}{c}"

# ═══════════════════════════════════════════════════════════════
# Fix: firework summons with old tag:{Fireworks:{...}}
# ═══════════════════════════════════════════════════════════════
FW_SHAPE = {0:"small_ball", 1:"large_ball", 2:"star", 3:"creeper", 4:"burst"}

def fix_firework(line):
    if 'tag:{Fireworks:' not in line:
        return line
    # Get prefix (execute ... run) and coords
    m = re.match(r'^(.*?summon\s+firework_rocket\s+)([~\d.\-]+\s+[~\d.\-]+\s+[~\d.\-]+)\s+\{(.+)\}$', line.strip())
    if not m:
        return line
    pre, coords, nbt = m.group(1), m.group(2), m.group(3)
    
    # Parse explosions
    explosions = []
    for exp in re.finditer(r'Type\s*:\s*(\d+).*?Colors\s*:\s*\[I\s*;([^\]]+)\]', nbt):
        shape = FW_SHAPE.get(int(exp.group(1)), "small_ball")
        colors = f"I;{exp.group(2).strip()}"
        has_trail = "1b" if "Trail:1b" in nbt else "0b"
        has_twinkle = "1b" if "Flicker:1b" in nbt else "0b"
        fade = ""
        fd = re.search(r'FadeColors\s*:\s*\[I\s*;([^\]]+)\]', nbt)
        if fd: fade = f',fade_colors:[I;{fd.group(1).strip()}]'
        explosions.append(f'{{shape:"{shape}",colors:[{colors}]{fade},has_trail:{has_trail},has_twinkle:{has_twinkle}}}')
    
    flight_m = re.search(r'Flight\s*:\s*(\d+)', nbt)
    flight = flight_m.group(1) if flight_m else "1"
    life_m = re.search(r'LifeTime\s*:\s*(\d+)', nbt)
    life = life_m.group(1) if life_m else "20"
    
    if not explosions:
        explosions = ['{shape:"small_ball",colors:[I;16776960],has_trail:1b,has_twinkle:0b}']
    
    exp_str = ",".join(explosions)
    new = (f'{pre}{coords} {{Life:0,LifeTime:{life},'
           f'FireworksItem:{{id:"firework_rocket",count:1,'
           f'components:{{"minecraft:fireworks":{{'
           f'explosions:[{exp_str}],flight_duration:{flight}b'
           f'}}}}}}}}')
    return new

# ═══════════════════════════════════════════════════════════════
# Fix: entity NBT (attributes, effects, Equipment old format)
# ═══════════════════════════════════════════════════════════════
def fix_entity(line):
    # Attribute names
    for old, new in [
        ('generic.max_health', 'minecraft:max_health'),
        ('generic.attack_damage', 'minecraft:attack_damage'),
        ('generic.movement_speed', 'minecraft:movement_speed'),
        ('generic.armor', 'minecraft:armor'),
        ('generic.follow_range', 'minecraft:follow_range'),
    ]:
        line = line.replace(f'"{old}"', f'"{new}"')
    
    # Attributes → attributes, Name → id, Base → base (within attribute entries)
    line = re.sub(r'\bAttributes\s*:\s*\[', 'attributes:[', line)
    # {Name:"minecraft:X",Base:Y} → {id:"minecraft:X",base:Y}
    line = re.sub(r'\{Name\s*:\s*("minecraft:[^"]+"),\s*Base\s*:', r'{id:\1,base:', line)
    
    # ActiveEffects → active_effects
    line = re.sub(r'\bActiveEffects\s*:\s*\[', 'active_effects:[', line)
    
    # Namespace effect IDs
    for eff in ['resistance','glowing','strength','speed','slowness','regeneration','poison']:
        line = re.sub(rf'id\s*:\s*"{eff}"', f'id:"minecraft:{eff}"', line)
    
    # Count:Nb → count:N  
    line = re.sub(r'\bCount\s*:\s*(\d+)b?\b', r'count:\1', line)
    
    # Strip tag:{...} blocks (old item NBT inside entity equipment)
    line = strip_all_tag_blocks(line)
    
    # Clean up bare ,tag: stubs left after tag block removal
    line = re.sub(r',\s*tag\s*:\s*(?=[,}\]])', '', line)
    
    return line

# ═══════════════════════════════════════════════════════════════
# Fix: particles
# ═══════════════════════════════════════════════════════════════
def fix_particle(line):
    line = re.sub(r'particle\s+minecraft:entity_effect\b', 'particle minecraft:witch', line)
    line = re.sub(r'particle\s+minecraft:ambient_entity_effect\b', 'particle minecraft:witch', line)
    for p in ['happy_villager','crit','smoke','flame','heart','enchant','witch','campfire_cosy_smoke']:
        line = re.sub(rf'\bparticle\s+{p}\b', f'particle minecraft:{p}', line)
    return line

# ═══════════════════════════════════════════════════════════════
# Fix: gamerules
# ═══════════════════════════════════════════════════════════════
def fix_gamerule(line):
    s = line.strip()
    if s.startswith('gamerule pvp') or s.startswith('gamerule spawnRadius'):
        return f'# {s}  # Set in server.properties'
    return line

# ═══════════════════════════════════════════════════════════════
# Fix: setblock armor_stand → summon armor_stand
# ═══════════════════════════════════════════════════════════════
def fix_setblock(line):
    if 'setblock' not in line or 'armor_stand' not in line:
        return line
    m = re.match(r'^(.*?)setblock\s+(\S+)\s+(\S+)\s+(\S+)\s+(?:minecraft:)?armor_stand(.*)$', line)
    if not m:
        return line
    pre, x, y, z, rest = m.group(1), m.group(2), m.group(3), m.group(4), m.group(5)
    # Strip trailing 'replace'/'destroy'/'keep'
    rest = re.sub(r'\s*(replace|destroy|keep)\s*$', '', rest)
    # Clean tag stubs
    rest = re.sub(r',\s*tag\s*:\s*(?=[,}\]])', '', rest)
    return f'{pre}summon armor_stand {x} {y} {z} {rest}'

# ═══════════════════════════════════════════════════════════════
# Fix: effect give/clear with unnamespaced IDs
# ═══════════════════════════════════════════════════════════════
def fix_effect(line):
    for eff in ['resistance','saturation','glowing','strength','speed','slowness','regeneration','poison']:
        line = re.sub(rf'(effect\s+(?:give|clear)\s+\S+)\s+{eff}\b', rf'\1 minecraft:{eff}', line)
        line = re.sub(rf'(effect\s+clear\s+\S+)\s+{eff}$', rf'\1 minecraft:{eff}', line)
    return line

# ═══════════════════════════════════════════════════════════════
# MAIN: process all files
# ═══════════════════════════════════════════════════════════════
FUNC_DIR = f"{DST}/data/aelori/function"
changed = 0

for root, dirs, files in os.walk(FUNC_DIR):
    for fname in files:
        if not fname.endswith('.mcfunction'):
            continue
        fpath = os.path.join(root, fname)
        with open(fpath) as f:
            original = f.read()
        
        lines = original.split('\n')
        out = []
        for line in lines:
            s = line.strip()
            if s.startswith('#') or s == '':
                out.append(line)
                continue
            
            r = line
            
            # Gamerules
            r2 = fix_gamerule(r)
            if r2 != r:
                out.append(r2)
                continue
            
            # Give with old NBT
            if re.search(r'give\s+\S+\s+[\w:]+\{', r):
                out.append(fix_give(r))
                continue
            
            # Old fireworks
            if 'tag:{Fireworks:' in r:
                out.append(fix_firework(r))
                continue
            
            # Setblock armor_stand
            r = fix_setblock(r)
            
            # Entity NBT
            r = fix_entity(r)
            
            # Particles
            r = fix_particle(r)
            
            # Effects
            r = fix_effect(r)
            
            out.append(r)
        
        result = '\n'.join(out)
        if result != original:
            changed += 1
        with open(fpath, 'w') as f:
            f.write(result)

print(f"[2/5] Fixed {changed} .mcfunction files")

# ═══════════════════════════════════════════════════════════════
# Fix pack.mcmeta
# ═══════════════════════════════════════════════════════════════
with open(f"{DST}/pack.mcmeta", 'w') as f:
    json.dump({"pack": {"pack_format": 61, "description": "Tides of Aelori"}}, f, indent=2)
print("[3/5] pack.mcmeta fixed")

# ═══════════════════════════════════════════════════════════════
# Fix recipes (1.21.4 format: key values are strings, not objects)
# ═══════════════════════════════════════════════════════════════
RECIPE_DIR = f"{DST}/data/aelori/recipe"
os.makedirs(RECIPE_DIR, exist_ok=True)
for name, key_item, result_item, pattern in [
    ("aelori_banner.json", {"W":"minecraft:light_blue_wool","S":"minecraft:stick"}, "minecraft:light_blue_banner", ["WWW","WSW","WWW"]),
    ("korvath_banner.json", {"R":"minecraft:red_wool","S":"minecraft:stick"}, "minecraft:red_banner", ["RRR","RSR","RRR"]),
]:
    with open(f"{RECIPE_DIR}/{name}", 'w') as f:
        json.dump({"type":"minecraft:crafting_shaped","pattern":pattern,
                    "key":{k:v for k,v in key_item.items()},
                    "result":{"id":result_item,"count":1}}, f, indent=2)
print("[4/5] Recipes fixed")

# ═══════════════════════════════════════════════════════════════
# Fix loot tables
# ═══════════════════════════════════════════════════════════════
LOOT_DIR = f"{DST}/data/aelori/loot_table"
os.makedirs(LOOT_DIR, exist_ok=True)
for name, entries in [
    ("quest_reward_ch1.json", [
        {"type":"minecraft:item","name":"minecraft:emerald","functions":[{"function":"minecraft:set_count","count":{"type":"minecraft:uniform","min":4,"max":8}}]},
        {"type":"minecraft:item","name":"minecraft:golden_apple"},
    ]),
    ("raid_mob.json", [
        {"type":"minecraft:item","name":"minecraft:iron_ingot","weight":3},
        {"type":"minecraft:item","name":"minecraft:emerald","weight":2},
    ]),
]:
    with open(f"{LOOT_DIR}/{name}", 'w') as f:
        json.dump({"pools":[{"rolls":1,"entries":entries}]}, f, indent=2)
print("[5/5] Loot tables fixed")

# ═══════════════════════════════════════════════════════════════
# Sanity check
# ═══════════════════════════════════════════════════════════════
problems = []
for root, dirs, files in os.walk(f"{DST}/data/aelori/function"):
    for fname in files:
        if not fname.endswith('.mcfunction'): continue
        fpath = os.path.join(root, fname)
        with open(fpath) as f:
            for i, line in enumerate(f, 1):
                s = line.strip()
                if s.startswith('#') or not s: continue
                if re.search(r'\w\{display:', s):
                    problems.append(f"  {os.path.relpath(fpath, DST)}:{i} OLD display NBT")
                if 'tag:{Fireworks:' in s:
                    problems.append(f"  {os.path.relpath(fpath, DST)}:{i} OLD fireworks")
                if re.search(r',\s*tag\s*:', s) and 'Tags:' not in s:
                    problems.append(f"  {os.path.relpath(fpath, DST)}:{i} leftover ,tag:")
                if re.search(r'Attributes\s*:\[', s):
                    problems.append(f"  {os.path.relpath(fpath, DST)}:{i} OLD Attributes")
                if 'gamerule pvp' in s and not s.startswith('#'):
                    problems.append(f"  {os.path.relpath(fpath, DST)}:{i} BAD gamerule")
                if 'setblock' in s and 'armor_stand' in s:
                    problems.append(f"  {os.path.relpath(fpath, DST)}:{i} setblock armor_stand")

if problems:
    print(f"\n⚠ {len(problems)} issues remain:")
    for p in problems: print(p)
else:
    print("\n✅ ALL CHECKS PASSED — datapack ready!")
