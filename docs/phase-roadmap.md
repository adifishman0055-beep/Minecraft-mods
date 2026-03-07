# Tides of Aelori — Phase Roadmap

## Phase 1: The Shattered Shore (Current)
**Duration:** 4-6 weeks solo
**Status:** In Development

### Deliverables
- [x] Datapack skeleton (pack.mcmeta, load/tick tags)
- [x] Scoreboard/init system
- [x] First-join experience
- [x] 8-quest chain with full rewards
- [x] 5 named NPC villagers with custom trades
- [x] Proximity dialogue system (quest-sensitive)
- [x] 3-wave raid defense event
- [x] Settlement upgrade system (2 levels)
- [x] Advancement tree
- [x] Custom recipe (Aelori banner)
- [x] Loot tables
- [x] Resource pack skeleton (lang, sounds)
- [x] Deploy/package scripts
- [x] Debug/reset utilities
- [ ] **Build Aelori island** (WorldPainter or manual)
- [ ] **Build village structures** (in-game)
- [ ] **Build Korvath island silhouette** (visible from Aelori)
- [ ] **Place lore books** in world
- [ ] **Tune coordinates** to match actual builds
- [ ] **Playtest full quest chain**
- [ ] **Resource pack: custom sounds** (.ogg files)

### End State
A complete Chapter 1 experience. Player can play for 2-4 hours with quests,
NPCs, a raid, and a satisfying conclusion.

---

## Phase 2: Beyond the Horizon (Future)
**Duration:** 6-10 weeks solo
**Depends on:** Phase 1 complete + Fabric mod setup

### Goals
- Korvath island fully explorable
- 10+ new quests (espionage, diplomacy, trade)
- Villager role system formalized
- Basic Fabric mod: villager pathfinding, guard patrols
- Settlement levels 3-5
- Resource economy (stockpile tracking)
- Multiple raid events with scaling difficulty
- Player reputation system

### Technical Additions
- Fabric mod project (Gradle, Java)
- Custom villager Goals (MoveToWorksite, Patrol, Flee)
- NBT-based villager state storage
- More complex quest branching

---

## Phase 3: The Living Islands (Future)
**Duration:** 10-16 weeks solo
**Depends on:** Phase 2 complete

### Goals
- Full villager task AI
- Blueprint building system
- Villager memory and personality
- Dynamic random events
- Faction warfare (attack Korvath)
- NPC armies
- Multiple story chapters
- Endgame content

### Technical Additions
- Custom block entities for village management
- Possibly custom GUI
- Performance optimization for many AI villagers
- Advanced pathfinding

---

## Key Risk Mitigations

| Risk | Mitigation |
|------|-----------|
| World-building takes too long | Use WorldPainter for terrain, focus on small detailed village |
| Coordinate brittleness | Maintain docs/world-coordinates.md religiously |
| Scoreboard spaghetti | Strict ae_ prefix convention, documented in init.mcfunction |
| Fabric version lock | Don't start Fabric until Phase 1 is stable and fun |
| Scope creep | Each phase has a clear "playable at end" definition |
| Solo burnout | Phase 1 is intentionally small and shippable |
