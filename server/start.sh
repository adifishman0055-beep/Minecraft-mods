#!/bin/bash
# Start the Tides of Aelori server
cd "$(dirname "$0")"
echo "Starting Tides of Aelori server..."
echo "RAM: 2G - 4G"
echo ""
echo "Players connect to: localhost:25565"
echo "Or your IP:25565 for remote friends"
echo ""
/opt/homebrew/opt/openjdk@21/bin/java -Xms2G -Xmx4G \
    -XX:+UseG1GC \
    -XX:+ParallelRefProcEnabled \
    -XX:MaxGCPauseMillis=200 \
    -XX:+UnlockExperimentalVMOptions \
    -XX:+DisableExplicitGC \
    -XX:G1NewSizePercent=30 \
    -XX:G1MaxNewSizePercent=40 \
    -XX:G1HeapRegionSize=8M \
    -jar server.jar nogui
