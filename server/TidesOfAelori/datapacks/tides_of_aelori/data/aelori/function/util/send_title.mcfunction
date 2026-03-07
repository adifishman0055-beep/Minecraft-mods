# ============================================================
# Tides of Aelori — Utility: Send Title
# Reusable title display
# Usage: Called from quest/event functions
#
# To customize: This is a template. Override with direct title
# commands in each quest function for specific text.
# ============================================================

# Default: clear any existing title, then show blank
title @s times 10 60 20
title @s title {"text":""}
