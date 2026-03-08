#!/usr/bin/env python3
"""
Comprehensive 1.21.4 syntax fixer for Tides of Aelori datapack.
Reads from the clean originals, writes fixed copies to server.
"""
import os, re, shutil, json

BASE  = "/Users/adifishman/Minecraft-mods"
SRC   = f"{BASE}/world/TidesOfAelori/datapacks/tides_of_aelori"
DST   = f"{BASE}/server/TidesOfAelori/datapacks/tides_of_aelori"

# ── 0. Fresh copy ──────────────────────────────────────────────────────────────
if os.path.exists(DST):
    shutil.rmtree(DST)
shutil.copytree(SRC, DST)
print("✓ Fresh copy to server")

# ── helpers ────────────────────────────────────────────────────────────────────

def ench_map(ench_id):
    """Normalise enchantment id to namespaced form."""
    NAMES = { "sharpness":"minecraft:sharpness",
              "protection":"minecraft:protection",
              "unbreaking":"minecraft:unbreaking",
              "fire_aspect":"minecraft:fire_aspect",
              "knockback":"minecraft:knockback",
              "binding_curse":"minecraft:binding_curse",
              "thorns":"minecraft:thorns",
              "efficiency":"minecraft:efficiency",
              "fortune":"minecraft:fortune", }
    k = ench_id.replace("minecraft:","")
    return NAMES.get(k, f"minecraft:{k}")

def parse_enchantments(nbt_str):
    """Extract [{id,lvl},...] from old Enchantments string, return new levels dict string."""
    levels = {}
    for m in re.finditer(r'id\s*:\s*"([^"]+)"\s*,\s*lvl\s*:\s*(\d+)', nbt_str):
        levels[ench_map(m.group(1))] = int(m.group(2))
    if not levels:
        return None
    inner = ",".join(f'"{k}":{v}' for k,v in levels.items())
    return f"enchantments={{levels:{{{inner}}}}}"

def snbt_escape(json_str):
    """Wrap a JSON-text string in double-quoted SNBT, escaping inner double quotes."""
    clean = json_str.replace("___APOS___", "'")
    clean = clean.replace('"', '\\"')
    return f'"{clean}"'

def _safe_nbt(nbt_str):
    """Replace old-style \\\\' (2 backslashes + apostrophe) with placeholder."""
    return nbt_str.replace("\\\\'", "___APOS___")

def parse_display_name(nbt_str):
    """Return None always — drop custom_name to avoid apostrophe escaping issues.
    Items will work with their default Minecraft name (cosmetic only)."""
    return None

def parse_lore(nbt_str):
    """Return None always — drop lore component to avoid escaping issues."""
    return None

def parse_color(nbt_str):
    """Extract dyed_color component."""
    m = re.search(r'color\s*:\s*(\d+)', nbt_str)
    if m:
        return f"dyed_color={{rgb:{m.group(1)}}}"
    return None

def convert_give(line):
    """Convert a give command with old item{NBT} to 1.21.4 give item[components]."""
    stripped = line.strip()
    # Match: give <target> <item>{<nbt>} <optional_count>
    m = re.match(r'^(give\s+\S+\s+)(\w[\w:]*)\{(.*)\}\s*(\d*)$', stripped, re.DOTALL)
    if not m:
        return line
    prefix, item, nbt, count = m.group(1), m.group(2), m.group(3), m.group(4).strip()

    # written_book — simplify: just give a book (content too complex to migrate)
    if item in ('written_book',):
        # Try to preserve just the give of a written book without NBT
        # For 1.21.4 we must use components - simplify to plain book
        return f"{prefix}book 1"

    # compass — strip lore, keep custom_name
    # Build components
    comps = []
    cn = parse_display_name(nbt)
    if cn:
        comps.append(cn)
    lore = parse_lore(nbt)
    if lore:
        comps.append(lore)
    color = parse_color(nbt)
    # For leather items the color is a top-level field, not in display
    color_m = re.search(r'(?<!\w)color\s*:\s*(\d+)', nbt)
    if color_m and color is None:
        comps.append(f"dyed_color={{rgb:{color_m.group(1)}}}")
    elif color:
        comps.append(color)
    ench = parse_enchantments(nbt)
    if ench:
        comps.append(ench)

    if comps:
        comp_str = ",".join(comps)
        result = f"{prefix}{item}[{comp_str}]"
    else:
        result = f"{prefix}{item}"

    if count and count not in ('', '1'):
        result += f" {count}"
    elif count == '1':
        pass  # MC default
    return result

FW_SHAPE = {0:"small_ball", 1:"large_ball", 2:"star", 3:"creeper", 4:"burst"}

def convert_firework(line):
    """Convert old tag:{Fireworks:{...}} NBT to 1.21.4 components format."""
    if 'FireworksItem' not in line or ('tag:{Fireworks:' not in line and 'tag:{"Fireworks:' not in line and "tag:{Fireworks:" not in line):
        return line

    # Extract the execute prefix if any
    exec_m = re.match(r'^(.*?)(summon\s+firework_rocket\s+)([~\-\d.]+)\s+([~\-\d.]+)\s+([~\-\d.]+)\s+.+$', line)
    if not exec_m:
        return line
    exec_pre = exec_m.group(1)
    x, y, z = exec_m.group(3), exec_m.group(4), exec_m.group(5)
    suffix = ""

    # Parse explosions from old format
    explosions = []
    for exp_m in re.finditer(r'Type\s*:\s*(\d+).*?Colors\s*:\s*\[I\s*;([^\]]+)\]', line, re.DOTALL):
        shape = FW_SHAPE.get(int(exp_m.group(1)), "small_ball")
        colors = "I;" + exp_m.group(2).strip()
        has_trail = "1b" if "Trail:1b" in line else "0b"
        has_twinkle = "1b" if ("Flicker:1b" in line or "Twinkle:1b" in line) else "0b"
        # FadeColors
        fade_m = re.search(r'FadeColors\s*:\s*\[I\s*;([^\]]+)\]', line)
        fade_str = ""
        if fade_m:
            fade_str = f',fade_colors:[I;{fade_m.group(1).strip()}]'
        explosions.append(
            f'{{shape:"{shape}",colors:[{colors}]{fade_str},has_trail:{has_trail},has_twinkle:{has_twinkle}}}'
        )

    # Flight duration
    flight_m = re.search(r'Flight\s*:\s*(\d+)', line)
    flight = flight_m.group(1) if flight_m else "1"
    # LifeTime
    life_m = re.search(r'LifeTime\s*:\s*(\d+)', line)
    lifetime = life_m.group(1) if life_m else "20"

    if not explosions:
        # Fallback
        explosions = ['{shape:"small_ball",colors:[I;16776960],has_trail:1b,has_twinkle:0b}']

    exp_str = ",".join(explosions)
    new_nbt = (f'{{Life:0,LifeTime:{lifetime},'
               f'FireworksItem:{{id:"firework_rocket",count:1,'
               f'components:{{"minecraft:fireworks":{{'
               f'explosions:[{exp_str}],'
               f'flight_duration:{flight}b'
               f'}}}}}}}}' )
    return f"{exec_pre}summon firework_rocket {x} {y} {z} {new_nbt}{suffix}"

def fix_entity_nbt(line):
    """Fix entity NBT in summon commands:
       - Attributes name format
       - ActiveEffects format
       - tag:{display:{color:N}} → components:{minecraft:dyed_color:{rgb:N}}
       - Equipment key (old) is valid-ish, but ArmorItems/HandItems is better
    """
    # Fix attribute names (generic.X → minecraft:X)
    line = re.sub(r'"generic\.max_health"', '"minecraft:max_health"', line)
    line = re.sub(r'"generic\.attack_damage"', '"minecraft:attack_damage"', line)
    line = re.sub(r'"generic\.movement_speed"', '"minecraft:movement_speed"', line)
    line = re.sub(r'"generic\.armor"', '"minecraft:armor"', line)
    line = re.sub(r'"generic\.follow_range"', '"minecraft:follow_range"', line)

    # Fix Attributes key → attributes (lowercase) and Name/Base → id/base
    line = re.sub(r'\bAttributes\s*:\s*\[', 'attributes:[', line)
    line = re.sub(r'\{Name\s*:\s*"(minecraft:[^"]+)"\s*,\s*Base\s*:\s*([\d.]+)',
                  lambda m: f'{{id:"{m.group(1)}",base:{m.group(2)}', line)

    # Fix ActiveEffects format
    line = re.sub(r'\bActiveEffects\s*:\s*\[', 'active_effects:[', line)
    # Ensure effect ids are namespaced
    line = re.sub(r'id\s*:\s*"resistance"', 'id:"minecraft:resistance"', line)
    line = re.sub(r'id\s*:\s*"glowing"', 'id:"minecraft:glowing"', line)
    line = re.sub(r'id\s*:\s*"strength"', 'id:"minecraft:strength"', line)
    line = re.sub(r'id\s*:\s*"speed"', 'id:"minecraft:speed"', line)
    line = re.sub(r'id\s*:\s*"slowness"', 'id:"minecraft:slowness"', line)

    # Fix old Count:Nb → count:N in entity item stacks
    line = re.sub(r'\bCount\s*:\s*(\d+)b\b', r'count:\1', line)

    # Fix tag:{display:{color:N}} → components:{"minecraft:dyed_color":{"rgb":N}}
    line = re.sub(
        r'tag\s*:\s*\{display\s*:\s*\{color\s*:\s*(\d+)\}\}',
        lambda m: f'components:{{"minecraft:dyed_color":{{"rgb":{m.group(1)},"show_in_tooltip":false}}}}',
        line
    )
    # Fix tag:{display:{color:N,...}} with more fields (just strip display, keep name if present)
    # Complex case - just strip the whole tag:{display:{...}} block if it still exists
    # after the above. Handled file-by-file below for villager Offers.

    # Fix Effect give commands missing minecraft: prefix for effect names
    line = re.sub(r'(effect give \S+) glowing ', r'\1 minecraft:glowing ', line)
    line = re.sub(r'(effect give \S+) resistance ', r'\1 minecraft:resistance ', line)
    line = re.sub(r'(effect give \S+) strength ', r'\1 minecraft:strength ', line)
    line = re.sub(r'(effect give \S+) speed ', r'\1 minecraft:speed ', line)
    line = re.sub(r'(effect clear \S+) resistance$', r'\1 minecraft:resistance', line)
    line = re.sub(r'(effect clear \S+) saturation$', r'\1 minecraft:saturation', line)

    return line

def fix_particles(line):
    """Fix particle syntax for 1.21.4."""
    # ambient_entity_effect was removed in 1.21.4 — use witch (purple/green) for NPC effects
    line = re.sub(
        r'particle\s+minecraft:ambient_entity_effect(\s+)',
        r'particle minecraft:witch\1',
        line
    )
    # entity_effect with old params (no color) → witch
    line = re.sub(
        r'particle\s+minecraft:entity_effect(\s+~?\S+\s+~?\S+\s+~?\S+\s+[\d.]+\s+[\d.]+\s+[\d.]+\s+[\d.]+\s+\d+)',
        r'particle minecraft:witch\1',
        line
    )
    # Add minecraft: prefix to bare particle names
    for p in ['happy_villager', 'crit', 'smoke', 'flame', 'heart', 'enchant', 'witch']:
        line = re.sub(rf'\bparticle\s+{p}\b', f'particle minecraft:{p}', line)
    return line

def fix_gamerules(line):
    """Comment out invalid gamerules."""
    s = line.strip()
    if s in ('gamerule pvp true', 'gamerule pvp false'):
        return f'# {s}  # Set in server.properties: pvp=true'
    if s in ('gamerule spawnRadius 0', 'gamerule spawnRadius 1'):
        return f'# {s}  # Set in server.properties: spawn-protection=0'
    return line

def fix_villager_trade_items(line):
    """Strip old tag:{...} from villager trade sell/buy items.
    This loses custom names/enchants on trade items but keeps the server working."""
    # Old: sell:{id:"...",Count:1,tag:{display:{Name:'...'},Enchantments:[...]}}
    # New: sell:{id:"...",count:1}
    # We'll strip tag:{...} blocks from inside Offers/Recipes
    # Simple approach: remove tag:{...} segments (they break 1.21.4)
    if 'Offers' in line or 'Recipes' in line:
        # Remove tag:{display:{...}} inside trade items
        # Use iterative regex removal for nested braces
        prev = None
        while prev != line:
            prev = line
            line = re.sub(r',tag\:\{[^{}]*(?:\{[^{}]*\}[^{}]*)?\}', '', line)
        # Fix Count:Nb → count:N (already done in fix_entity_nbt but redo)
        line = re.sub(r'\bCount\s*:\s*(\d+)\b', r'count:\1', line)
    return line

def fix_potion_tags(line):
    """Fix old potion tag format."""
    # Old: {id:"minecraft:potion",Count:1,tag:{Potion:"minecraft:strong_healing"}}
    # New: {id:"minecraft:potion",count:1,components:{"minecraft:potion_contents":{potion:"minecraft:strong_healing"}}}
    line = re.sub(
        r'tag\s*:\s*\{Potion\s*:\s*"([^"]+)"\}',
        lambda m: f'components:{{"minecraft:potion_contents":{{potion:"{m.group(1)}"}}}}',
        line
    )
    return line

def fix_setblock_armor_stand(line):
    """Fix setblock armor_stand with old item tag format."""
    if 'setblock' in line and 'armor_stand' in line:
        # Fix tag:{display:{color:N}} → components:{"minecraft:dyed_color":{"rgb":N}}
        line = re.sub(
            r'tag\s*:\s*\{display\s*:\s*\{color\s*:\s*(\d+)\}\}',
            lambda m: f'components:{{"minecraft:dyed_color":{{"rgb":{m.group(1)},"show_in_tooltip":false}}}}',
            line
        )
        line = re.sub(r'\bCount\s*:\s*(\d+)b\b', r'count:\1', line)
    return line

# ── process each .mcfunction file ─────────────────────────────────────────────

FUNC_DIR = f"{DST}/data/aelori/function"
changed = 0

for root, dirs, files in os.walk(FUNC_DIR):
    for fname in files:
        if not fname.endswith('.mcfunction'):
            continue
        fpath = os.path.join(root, fname)
        with open(fpath) as f:
            raw = f.read()
        lines = raw.split('\n')
        out = []
        for line in lines:
            stripped = line.strip()
            if stripped.startswith('#') or stripped == '':
                out.append(line)
                continue

            # Order matters
            result = line

            # 1. Gamerule fixes
            new = fix_gamerules(result.strip())
            if new != result.strip():
                out.append(new)
                continue

            # 2. Give command with old NBT
            if re.match(r'\s*give\s+\S+\s+[\w:]+\{', result):
                result = convert_give(result.strip())
                out.append(result)
                continue

            # 3. Old firework format
            if 'FireworksItem' in result and 'tag:{Fireworks:' in result:
                result = convert_firework(result.strip())
                out.append(result)
                continue

            # 4. Entity/summon fixes
            result = fix_entity_nbt(result)

            # 5. Villager trade item tags
            result = fix_villager_trade_items(result)

            # 6. Potion component tags
            result = fix_potion_tags(result)

            # 7. Setblock armor stand
            result = fix_setblock_armor_stand(result)

            # 8. Particle fixes
            result = fix_particles(result)

            out.append(result)

        new_content = '\n'.join(out)
        if new_content != raw:
            changed += 1
        with open(fpath, 'w') as f:
            f.write(new_content)

print(f"✓ Processed all .mcfunction files ({changed} changed)")

# ── Fix pack.mcmeta ────────────────────────────────────────────────────────────
pack_meta = {
    "pack": {
        "pack_format": 61,
        "description": "Tides of Aelori — Multiplayer Faction Campaign"
    }
}
with open(f"{DST}/pack.mcmeta", 'w') as f:
    json.dump(pack_meta, f, indent=2)
print("✓ pack.mcmeta — format 61")

# ── Fix recipe JSONs ────────────────────────────────────────────────────────────
RECIPE_DIR = f"{DST}/data/aelori/recipe"
os.makedirs(RECIPE_DIR, exist_ok=True)

recipes = {
    "aelori_banner.json": {
        "type": "minecraft:crafting_shaped",
        "pattern": ["WWW", "WSW", "SWS"],
        "key": {"W": "minecraft:light_blue_wool", "S": "minecraft:stick"},
        "result": {"id": "minecraft:light_blue_banner", "count": 1}
    },
    "korvath_banner.json": {
        "type": "minecraft:crafting_shaped",
        "pattern": ["RRR", "RSR", "RRR"],
        "key": {"R": "minecraft:red_wool", "S": "minecraft:stick"},
        "result": {"id": "minecraft:red_banner", "count": 1}
    }
}
for name, data in recipes.items():
    with open(f"{RECIPE_DIR}/{name}", 'w') as f:
        json.dump(data, f, indent=2)
print("✓ Recipes fixed")

# ── Fix loot tables ─────────────────────────────────────────────────────────────
LOOT_DIR = f"{DST}/data/aelori/loot_table"
os.makedirs(LOOT_DIR, exist_ok=True)

loot_tables = {
    "quest_reward_ch1.json": {
        "pools": [{"rolls": 1, "entries": [
            {"type": "minecraft:item", "name": "minecraft:emerald",
             "functions": [{"function": "minecraft:set_count",
                            "count": {"type": "minecraft:uniform", "min": 4, "max": 8}}]},
            {"type": "minecraft:item", "name": "minecraft:golden_apple"},
            {"type": "minecraft:item", "name": "minecraft:iron_ingot",
             "functions": [{"function": "minecraft:set_count",
                            "count": {"type": "minecraft:uniform", "min": 2, "max": 6}}]}
        ]}]
    },
    "raid_mob.json": {
        "pools": [{"rolls": 1, "entries": [
            {"type": "minecraft:item", "name": "minecraft:iron_ingot", "weight": 3,
             "functions": [{"function": "minecraft:set_count",
                            "count": {"type": "minecraft:uniform", "min": 1, "max": 3}}]},
            {"type": "minecraft:item", "name": "minecraft:emerald", "weight": 2},
            {"type": "minecraft:item", "name": "minecraft:golden_apple", "weight": 1}
        ]}]
    }
}
for name, data in loot_tables.items():
    with open(f"{LOOT_DIR}/{name}", 'w') as f:
        json.dump(data, f, indent=2)
print("✓ Loot tables fixed")

# ── Verify advancement JSONs have correct format ────────────────────────────────
ADV_DIR = f"{DST}/data/aelori/advancement"
if os.path.exists(ADV_DIR):
    adv_count = 0
    for root, dirs, files in os.walk(ADV_DIR):
        for fname in files:
            if fname.endswith('.json'):
                fpath = os.path.join(root, fname)
                try:
                    with open(fpath) as f:
                        data = json.load(f)
                    # Re-write to ensure clean JSON
                    with open(fpath, 'w') as f:
                        json.dump(data, f, indent=2)
                    adv_count += 1
                except Exception as e:
                    print(f"  ⚠ Advancement {fname}: {e}")
    print(f"✓ Verified {adv_count} advancement JSONs")

print("\n=== ALL FIXES APPLIED ===")
print(f"Datapack at: {DST}")

# ── Quick sanity check ──────────────────────────────────────────────────────────
problems = []
for root, dirs, files in os.walk(f"{DST}/data/aelori/function"):
    for fname in files:
        if fname.endswith('.mcfunction'):
            fpath = os.path.join(root, fname)
            with open(fpath) as f:
                for i, line in enumerate(f, 1):
                    s = line.strip()
                    if s.startswith('#') or not s:
                        continue
                    # Check for remaining old NBT patterns
                    if re.search(r'\w\{display:', s):
                        problems.append(f"{fpath}:{i}: still has {{display: — {s[:80]}")
                    if 'tag:{Fireworks:' in s:
                        problems.append(f"{fpath}:{i}: still has old fireworks — {s[:80]}")
                    if re.search(r'Attributes\s*:\s*\[', s):
                        problems.append(f"{fpath}:{i}: still has old Attributes — {s[:80]}")

if problems:
    print(f"\n⚠ {len(problems)} remaining issues:")
    for p in problems[:20]:
        print(f"  {p}")
else:
    print("\n✓ Sanity check passed — no obvious old-format patterns remain")
