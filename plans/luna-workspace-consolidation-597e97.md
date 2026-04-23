# Luna Workspace Consolidation

รวมทุก folder ที่เกี่ยวกับ Luna ภายใต้ `luna-workspace/` เพื่อให้ git-ready และสร้างระบบ Hybrid Centralization ที่ index per-repo learnings/knowledge กลับมาที่ global.

## 🎯 Goals

1. **Git-ready:** `git init` ใน `luna-workspace/` ได้ทันที, backup/transfer ง่าย
2. **Separation of concerns:** Luna system แยกจาก Windsurf internals
3. **Centralized reading:** per-repo learnings/knowledge index ที่ global
4. **Per-repo outputs:** review docs + daily logs stay in repo

---

## 🏗️ Target Structure

```
$env:USERPROFILE\.windsurf\
├── argv.json                        # Windsurf config (keep at root)
├── extensions/                      # Windsurf managed (keep at root)
└── luna-workspace/                  🆕 NEW parent folder
    ├── README.md                    # Main guide (moved from root)
    ├── .gitignore                   🆕 ignore backups, local files
    ├── rules/                       # moved
    ├── workflows/                   # moved
    ├── skills/                      # moved
    ├── team/                        # moved
    ├── Luna/                        # moved (Luna's memory)
    ├── knowledge-package-generic/   # moved
    ├── templates/                   # moved
    ├── plans/                       # moved
    └── repo-index/                  🆕 Centralized per-repo index
        ├── README.md                # How to use this index
        └── <repo-name>/
            ├── summary.md           # High-level summary + links
            ├── decisions.md         # Symlink or summary of repo decisions
            ├── knowledge.md         # Summary of repo knowledge-package
            └── custom-roles.md      # Summary of per-repo roles
```

---

## 📋 Phase 1: Folder Restructure

### Move operations

```
.windsurf/rules                    → .windsurf/luna-workspace/rules
.windsurf/workflows                → .windsurf/luna-workspace/workflows
.windsurf/skills                   → .windsurf/luna-workspace/skills
.windsurf/team                     → .windsurf/luna-workspace/team
.windsurf/Luna                     → .windsurf/luna-workspace/Luna
.windsurf/knowledge-package-generic→ .windsurf/luna-workspace/knowledge-package-generic
.windsurf/templates                → .windsurf/luna-workspace/templates
.windsurf/plans                    → .windsurf/luna-workspace/plans
.windsurf/README.md                → .windsurf/luna-workspace/README.md
```

### Keep at `.windsurf/` root
- `argv.json` (Windsurf config)
- `extensions/` (Windsurf managed)
- NEW `README.md` (simple pointer to luna-workspace/)

---

## 📋 Phase 2: Update ALL Path References

### Files ต้องแก้ (critical):

| File | Changes |
|------|---------|
| `~/.codeium/windsurf/memories/global_rules.md` | ทุก path `C:\...\.windsurf\` → `C:\...\.windsurf\luna-workspace\` |
| `luna-workspace/rules/luna-core.md` | อัพเดต path references |
| `luna-workspace/rules/project-detect.md` | อัพเดต path references |
| `luna-workspace/rules/team-protocol.md` | อัพเดต path references |
| `luna-workspace/team/README.md` | อัพเดต path + role paths |
| `luna-workspace/team/team-config.md` | อัพเดต path |
| `luna-workspace/team/decision-global-vs-per-repo.md` | อัพเดต path |
| `luna-workspace/Luna/README.md` | อัพเดต path |
| `luna-workspace/README.md` (moved main) | อัพเดต structure diagram |
| `luna-workspace/templates/Setup-LunaRepo.ps1` | อัพเดต path variables |
| Sub-READMEs (rules, workflows, skills, plans, ...) | ถ้ามี path |
| Workflow files | ถ้ามี path |

### Approach
- ใช้ `grep_search` หาทุก `C:\Users\sansakritsuk\.windsurf\` และ `$env:USERPROFILE\.windsurf\` ที่ไม่ใช่ `luna-workspace`
- Replace ด้วย `.windsurf\luna-workspace\` ที่เหมาะสม

---

## 📋 Phase 3: Centralization System (Hybrid)

### Create `luna-workspace/repo-index/`

```
repo-index/
├── README.md                       # How to maintain index
└── <repo-name>/
    ├── summary.md                  # Overview + links to repo files
    ├── decisions.md                # Digest of <repo>/Luna/decisions.md
    ├── knowledge.md                # Digest of <repo>/knowledge-package/
    └── custom-roles.md             # List of <repo>/Luna/team/roles/
```

### What bubbles up (Hybrid Option 2)

| Content | Method |
|---------|--------|
| `<repo>/Luna/decisions.md` | Summary + link |
| `<repo>/Luna/feedback.md` | Summary + link |
| `<repo>/knowledge-package/*.md` | Summary + link |
| `<repo>/Luna/team/roles/*.md` (custom) | List + link |
| `<repo>/Luna/team/roles/*-context.md` | List + link |
| Per-repo insights (high evidence) | Promote to `Luna/insights.md` (existing flow) |

### What stays in repo
- ❌ Daily logs (`<repo>/Luna/daily/`, `<repo>/Luna/team/daily/`)
- ❌ Review outputs (`<repo>/Luna/reviews/`)
- ❌ Per-repo plans

### Initial repo to index
- **PMAM Web** (`d:\coding\PMAM\coding\dev\eat-gof-gofap-pmam-web`)
  - Create `repo-index/pmam-web/` based on current structure

---

## 📋 Phase 4: Git Initialization

### In `luna-workspace/`

```powershell
cd $env:USERPROFILE\.windsurf\luna-workspace
git init
git add .
git commit -m "Initial Luna workspace — structure consolidation"
```

### `.gitignore` content
```
# Local backups
*.bak
*.zip

# OS
Thumbs.db
.DS_Store

# Windsurf local state (if any leaks)
*.log
```

### Update root `.windsurf/README.md`
สร้างใหม่ที่ root:
```markdown
# Windsurf User Directory

- `luna-workspace/` — Luna AI system (git-controlled)
- `extensions/` — Windsurf managed
- `argv.json` — Windsurf config
```

---

## 📋 Phase 5: Verify & Test

- [ ] ลูน่าเรียก role ได้ (test team-config.md reading)
- [ ] ลูน่าอ่าน preferences.md ได้
- [ ] Workflow `/daily-log` ทำงาน
- [ ] Setup-LunaRepo.ps1 ใช้ได้ (test run)
- [ ] Update daily log for today

---

## 🤔 Open Questions

1. **Rename `Luna/` subfolder?** — ตอนนี้จะเป็น `luna-workspace/Luna/` (ซ้อน luna 2 ชั้น)
   - Option A: keep as-is (`Luna/` = memory folder, distinct purpose)
   - Option B: rename to `memory/` (clearer naming)
2. **Init git ทันที หรือทำแยก?** — (phase 4 optional, พี่แมนเลือกเวลา)
3. **repo-index อัพเดตแบบไหน?** — manual vs auto-generated by workflow

---

## 🧪 Success Criteria

- ทุก path reference ชี้ไป `luna-workspace/` ถูกต้อง
- Luna ทำงานได้ปกติหลัง restructure
- `luna-workspace/` สามารถ git clone ไปเครื่องอื่นแล้วใช้ได้ทันที (ถ้า setup path เดียวกัน)
- `repo-index/pmam-web/` มีข้อมูลครบถ้วน

## 📏 Estimated Effort

- Phase 1 (Move): ~10 min
- Phase 2 (Path updates): ~30 min (critical, ต้องครบทุก reference)
- Phase 3 (repo-index setup): ~20 min
- Phase 4 (Git init): ~5 min (optional)
- Phase 5 (Verify): ~10 min
- **Total: ~75 min**

## ⚠️ Risk

- **High:** Path reference miss 1 จุด → Luna ทำงานไม่ได้
- **Mitigation:** ใช้ grep_search ครบทุกไฟล์, ทดสอบหลัง move

## 👥 Team

- **Orion (lead):** Architecture + path planning
- **Lyra (lead):** Windsurf path impact analysis
- **Galaxy (consult):** repo-index content strategy
- **Luna (review):** ตรวจ risk + coordinate
