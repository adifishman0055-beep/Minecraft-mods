#!/bin/bash
# ============================================================
# Tides of Aelori — Server Setup Script
# Downloads and configures a Minecraft Java Edition server
# with the Tides of Aelori datapack pre-installed.
#
# Requirements: Java 21+ must be installed
# ============================================================

set -e

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
SERVER_DIR="$PROJECT_DIR/server"
DATAPACK_SRC="$PROJECT_DIR/world/TidesOfAelori/datapacks/tides_of_aelori"
RP_SRC="$PROJECT_DIR/resourcepack/tides_of_aelori_rp"

# --- Minecraft Server Version ---
# Update this URL when targeting a new MC version
MC_VERSION="1.21.4"
SERVER_JAR_URL="https://piston-data.mojang.com/v1/objects/4707d00eb834b446575d89a61a11b5d548d8c001/server.jar"

# --- Server RAM allocation ---
MIN_RAM="2G"
MAX_RAM="4G"

echo "=== Tides of Aelori — Server Setup ==="
echo ""
echo "Project:  $PROJECT_DIR"
echo "Server:   $SERVER_DIR"
echo "MC Ver:   $MC_VERSION"
echo "RAM:      $MIN_RAM - $MAX_RAM"
echo ""

# --- Create server directory ---
mkdir -p "$SERVER_DIR"
cd "$SERVER_DIR"

# --- Download server jar if not present ---
if [ ! -f "server.jar" ]; then
    echo "Downloading Minecraft server $MC_VERSION..."
    echo ""
    echo "NOTE: If the download URL is outdated, get the latest from:"
    echo "  https://www.minecraft.net/en-us/download/server"
    echo "  and place server.jar in: $SERVER_DIR/"
    echo ""

    if command -v curl &> /dev/null; then
        curl -L -o server.jar "$SERVER_JAR_URL" || {
            echo ""
            echo "Download failed. Please download server.jar manually from:"
            echo "  https://www.minecraft.net/en-us/download/server"
            echo "Place it in: $SERVER_DIR/server.jar"
            echo ""
            exit 1
        }
    elif command -v wget &> /dev/null; then
        wget -O server.jar "$SERVER_JAR_URL" || {
            echo "Download failed. Please download server.jar manually."
            exit 1
        }
    else
        echo "ERROR: Neither curl nor wget found. Please download server.jar manually."
        echo "URL: $SERVER_JAR_URL"
        echo "Save to: $SERVER_DIR/server.jar"
        exit 1
    fi
    echo "✓ server.jar downloaded"
else
    echo "✓ server.jar already exists"
fi

# --- Accept EULA ---
echo "eula=true" > eula.txt
echo "✓ EULA accepted"

# --- Create server.properties ---
cat > server.properties << 'SERVERPROPS'
# ============================================================
# Tides of Aelori — Server Configuration
# ============================================================

# --- Server Identity ---
server-name=Tides of Aelori
motd=\u00A76\u00A7lTides of Aelori\u00A7r \u00A7e- Choose your faction. Conquer your rival.
server-port=25565

# --- World Settings ---
level-name=TidesOfAelori
level-type=minecraft\:normal
generator-settings={}
level-seed=
generate-structures=true

# --- Gameplay ---
gamemode=survival
difficulty=hard
pvp=true
max-players=20
view-distance=12
simulation-distance=10

# --- Player Experience ---
allow-flight=false
spawn-protection=0
force-gamemode=false
hardcore=false
enable-command-block=true

# --- Performance ---
max-tick-time=60000
network-compression-threshold=256
rate-limit=0

# --- Security ---
online-mode=true
white-list=false
enforce-whitelist=false

# --- Misc ---
spawn-monsters=true
spawn-animals=true
spawn-npcs=true
allow-nether=false
enable-rcon=false
enable-query=false
SERVERPROPS
echo "✓ server.properties created"

# --- Create world directory with datapack ---
WORLD_DIR="$SERVER_DIR/TidesOfAelori"
DATAPACKS_DIR="$WORLD_DIR/datapacks"
mkdir -p "$DATAPACKS_DIR"

# Symlink the datapack
if [ -L "$DATAPACKS_DIR/tides_of_aelori" ]; then
    rm "$DATAPACKS_DIR/tides_of_aelori"
fi
ln -s "$DATAPACK_SRC" "$DATAPACKS_DIR/tides_of_aelori"
echo "✓ Datapack linked into server world"

# --- Create ops.json template ---
cat > ops.json << 'OPS'
[
  {
    "uuid": "REPLACE_WITH_YOUR_UUID",
    "name": "REPLACE_WITH_YOUR_NAME",
    "level": 4,
    "bypassesPlayerLimit": true
  }
]
OPS
echo "✓ ops.json template created (edit with your username/UUID)"

# --- Create start script ---
cat > start.sh << STARTSCRIPT
#!/bin/bash
# Start the Tides of Aelori server
cd "\$(dirname "\$0")"
echo "Starting Tides of Aelori server..."
echo "RAM: $MIN_RAM - $MAX_RAM"
echo ""
echo "Players connect to: localhost:25565"
echo "Or your IP:25565 for remote friends"
echo ""
java -Xms${MIN_RAM} -Xmx${MAX_RAM} \\
    -XX:+UseG1GC \\
    -XX:+ParallelRefProcEnabled \\
    -XX:MaxGCPauseMillis=200 \\
    -XX:+UnlockExperimentalVMOptions \\
    -XX:+DisableExplicitGC \\
    -XX:G1NewSizePercent=30 \\
    -XX:G1MaxNewSizePercent=40 \\
    -XX:G1HeapRegionSize=8M \\
    -jar server.jar nogui
STARTSCRIPT
chmod +x start.sh
echo "✓ start.sh created"

# --- Create stop helper ---
cat > stop.sh << 'STOPSCRIPT'
#!/bin/bash
# Gracefully stop the server via RCON or screen
echo "To stop the server, type 'stop' in the server console."
echo "Or press Ctrl+C in the terminal running start.sh"
STOPSCRIPT
chmod +x stop.sh

echo ""
echo "=== Server Setup Complete ==="
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "  TO START THE SERVER:"
echo "  cd $SERVER_DIR"
echo "  ./start.sh"
echo ""
echo "  FIRST-TIME SETUP:"
echo "  1. Edit ops.json with your Minecraft username & UUID"
echo "     (Get UUID from: https://mcuuid.net)"
echo "  2. Run ./start.sh — server generates the world"
echo "  3. Players connect to: localhost:25565 (local)"
echo "     or YOUR_IP:25565 (friends over internet)"
echo ""
echo "  FOR FRIENDS TO CONNECT:"
echo "  Option A: LAN (same Wi-Fi)"
echo "    → They connect to your local IP (e.g., 192.168.x.x:25565)"
echo "    → Find your IP: ipconfig getifaddr en0"
echo ""
echo "  Option B: Internet (remote friends)"
echo "    → Port-forward 25565 on your router"
echo "    → Or use a free tunnel like playit.gg or ngrok"
echo "    → They connect to your public IP:25565"
echo ""
echo "  Option C: Free tunnel (easiest for remote)"
echo "    → Install playit.gg: https://playit.gg"
echo "    → It gives you a free public address"
echo "    → No port forwarding needed"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "  IN-GAME FIRST STEPS:"
echo "  1. Join the server"
echo "  2. You'll see a faction selection screen"
echo "  3. Choose Aelori or Korvath"
echo "  4. You'll be teleported to your faction's island"
echo "  5. Complete quests, build, fight, conquer!"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
