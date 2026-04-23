# Global Structure Cleanup & Documentation

Organize `C:\Users\sansakritsuk\.windsurf\` with consistent README files, archive old plans, clarify folder purposes, and remove cruft — bringing Global to the same quality as per-repo Luna structure.

## 🎯 Goal

Global structure = self-documenting, scannable in < 30 seconds, easy to find anything

## 📊 Current State (Orion Assessment)

```
C:\Users\sansakritsuk\.windsurf\
├── Luna/                          ❌ no README
│   ├── hypothesis.md
│   ├── insights.md
│   ├── preferences.md
│   ├── retrospective/             ⚠️ empty
│   └── windsurf-updates.md
├── README.md                      ✅ exists
├── argv.json                      ✅ Windsurf config
├── extensions/                    ⚠️ empty (unclear purpose)
├── knowledge-package-generic/     ❌ no README, only 2 files
├── plans/                         🔴 80+ files flat, no archive
├── rules/                         ❌ no README (3 files)
├── skills/                        ⚠️ empty
├── team/                          ✅ has README
├── templates/                     ❌ no README (5 templates)
└── workflows/                     ❌ no README (4 workflows)
```

## 🏗️ Target State

```
C:\Users\sansakritsuk\.windsurf\
├── README.md                      ✅ keep
├── argv.json                      ✅ keep
├── Luna/
│   ├── README.md                  🆕 add — explains hypothesis/insights/preferences
│   ├── hypothesis.md
│   ├── insights.md
│   ├── preferences.md
│   ├── retrospective/
│   └── windsurf-updates.md
├── knowledge-package-generic/
│   ├── README.md                  🆕 add — scope & when to read
│   ├── 03-coding-standards.md
│   └── 05-best-practices.md
├── plans/
│   ├── README.md                  🆕 add — naming convention & lifecycle
│   ├── archive/                   🆕 add — completed/superseded plans
│   │   └── 2026/                  🆕 by year
│   └── [active plans only]
├── rules/
│   ├── README.md                  🆕 add — reading order & priority
│   ├── luna-core.md
│   ├── project-detect.md
│   └── team-protocol.md
├── skills/
│   └── README.md                  🆕 add or remove empty folder
├── team/                          ✅ already documented
├── templates/
│   ├── README.md                  🆕 add — which template for which task
│   └── [existing templates]
└── workflows/
    ├── README.md                  🆕 add — list of workflows & triggers
    └── [existing workflows]
```

## 📋 Tasks (Orion → Stella/Galaxy consult as needed)

### Phase 1: Add README files (7 files)
1. `Luna/README.md` — explain 3-tier learning (hypothesis/insights/preferences)
2. `knowledge-package-generic/README.md` — scope & when to use
3. `plans/README.md` — naming convention, active vs archive, suffix meaning
4. `rules/README.md` — reading order, priority, what each rule does
5. `templates/README.md` — template catalog
6. `workflows/README.md` — workflow catalog & triggers
7. `skills/README.md` — or delete folder if no skills exist

### Phase 2: Archive plans/ (80+ files)
- Create `plans/archive/2026/` folder
- Move plans that are:
  - Completed (already merged/applied)
  - Superseded (newer plan exists)
  - Abandoned / exploratory
- Keep in `plans/` (active):
  - `automated-learning-triggers-5c22c7.md` (just implemented)
  - `enforce-5step-pattern-597e97.md` (just implemented)
  - `devin-cloud-disconnect-fix-5c22c7.md`
  - `windsurf-image-upload-limitation-5c22c7.md` (invalid — delete)
  - `global-structure-cleanup-597e97.md` (this plan)
- Document suffix convention:
  - `-5c22c7`, `-597e97` = session IDs (not very meaningful)
  - Proposal: drop suffix or use date prefix `YYYY-MM-DD-title.md`

### Phase 3: Clean up empty / unclear folders
- `extensions/` — investigate purpose → document or remove
- `skills/` — create placeholder README or remove

### Phase 4: Verify consistency
- All READMEs follow same template (structure, purpose, when to use)
- Links between folders work
- Update main `README.md` to reference new sub-READMEs

## 🤔 Open Questions (Decide During Implementation)

1. **Suffix convention in plans/** — keep session hash or switch to date prefix?
2. **Archive strategy** — by year? by status? or flat `archive/`?
3. **extensions/ folder** — keep or remove?

## 🧪 Success Criteria

- ทุก folder มี README.md
- `plans/` มีไฟล์ active ≤ 10 files
- พี่แมนเข้า folder ไหนก็รู้ทันทีว่าเก็บอะไร
- Naming convention consistent

## 📏 Estimated Effort

- Phase 1 (READMEs): ~30 min
- Phase 2 (Archive plans): ~20 min
- Phase 3 (Cleanup empty): ~5 min
- Phase 4 (Verify): ~10 min
- **Total: ~1 hour**

## 🔄 Related

- PMAM Web Luna/README structure as reference pattern
- Decision Framework for global vs per-repo
- Anti-pattern: พี่แมนไม่ชอบ hard-coded values / mess

## 👥 Team Assignments

- **Orion (lead):** Architecture + file organization
- **Galaxy (consult):** README content clarity (business analyst view)
- **Lyra (consult):** Windsurf-specific conventions
- **Luna:** Review + present to พี่แมน
