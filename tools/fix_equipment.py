import re, os

BASE = "/Users/adifishman/Minecraft-mods/server/TidesOfAelori/datapacks/tides_of_aelori/data/aelori/function"

def split_equipment_slots(eq_content):
    slots = []
    depth = 0
    current = ""
    for ch in eq_content:
        if ch == '{':
            depth += 1
            current += ch
        elif ch == '}':
            depth -= 1
            current += ch
            if depth == 0:
                slots.append(current.strip())
                current = ""
        elif ch == ',' and depth == 0:
            continue
        else:
            current += ch
    return slots

def convert_equipment(line):
    m = re.search(r'Equipment:\[', line)
    if not m:
        return line
    start = m.start()
    bracket_start = m.end() - 1
    depth = 1
    i = bracket_start + 1
    while i < len(line) and depth > 0:
        if line[i] == '[':
            depth += 1
        elif line[i] == ']':
            depth -= 1
        i += 1
    eq_end = i
    eq_content = line[bracket_start+1:eq_end-1]
    slots = split_equipment_slots(eq_content)
    if len(slots) != 6:
        print(f"  WARNING: Expected 6 slots, got {len(slots)}")
        return line
    hand_items = f"HandItems:[{slots[0]},{slots[1]}]"
    armor_items = f"ArmorItems:[{slots[4]},{slots[3]},{slots[2]},{slots[5]}]"
    replacement = f"{hand_items},{armor_items}"
    new_line = line[:start] + replacement + line[eq_end:]
    return new_line

files = [
    os.path.join(BASE, "event/korvath/raid_wave_1.mcfunction"),
    os.path.join(BASE, "event/korvath/raid_wave_2.mcfunction"),
    os.path.join(BASE, "event/korvath/raid_wave_3.mcfunction"),
]

for fpath in files:
    print(f"Processing: {os.path.basename(fpath)}")
    with open(fpath) as f:
        lines = f.readlines()
    new_lines = []
    changed = 0
    for line in lines:
        if "Equipment:" in line:
            new_line = convert_equipment(line)
            if new_line != line:
                changed += 1
            new_lines.append(new_line)
        else:
            new_lines.append(line)
    with open(fpath, 'w') as f:
        f.writelines(new_lines)
    print(f"  Changed {changed} lines")

print("Done!")
