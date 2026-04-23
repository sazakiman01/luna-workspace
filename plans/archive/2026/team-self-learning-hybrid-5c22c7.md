# Team Self-Learning System (Hybrid)

ขยายระบบเรียนรู้แบบ 5-pillar ของลูน่าไปยังทีม 10 roles ด้วยแนวทาง Hybrid: per-role ใช้ไฟล์เดียว + team-level มี performance และ retrospective รวม

## 🎯 หลักการ

- **Per-role:** Scope แคบ (เฉพาะความเชี่ยวชาญของ role นั้น) → ไฟล์เดียว, lightweight
- **Team-level:** Scope กว้าง (cross-role learning, coordination) → รวมศูนย์
- **Luna-level:** รวบยอด meta-learning ข้าม team + repos (ที่ทำไว้แล้ว)

## 📁 Structure ใหม่

```
C:\Users\sansakritsuk\.windsurf\team\
├── README.md
├── team-config.md
├── performance.md              # ใหม่! — track performance ของแต่ละ role
├── retrospective/              # ใหม่! — weekly retrospective ระดับทีม
│   └── README.md              # template + process
├── roles/                      # เดิม — role definitions (ไม่แก้)
│   └── <role>.md
└── preferences/                # อัปเกรด! — แต่ละไฟล์เพิ่ม sections
    └── <role>.md               # เพิ่ม: Evidence Counter, Anti-Patterns
```

## 📝 Per-Role Preferences Template (Option A Lite)

```markdown
# <Role> (<ชื่อไทย>) Preferences - <ตำแหน่ง>

## อายุ / บทบาท
...

## 📝 Evidence Counter Format
- **Pattern:** [...]
  - Evidence: X/3
  - First seen / Last confirmed / Context / Source

## ✅ Preferences ที่ยืนยันแล้ว (Evidence ≥ 3)
- ...

## 🔍 Insights (Evidence 1-2)
- ...

## 💭 Hypothesis (Evidence 0)
- ...

## ⚠️ Anti-Patterns (สิ่งที่ role นี้ไม่ควรทำ)
- ...

## 📚 Role-Specific Learnings
- ...

---
*อัปเดตล่าสุด: YYYY-MM-DD*
```

**Learning Triggers ของ role:**
- พี่แมน/ลูน่า correct การทำงานของ role → เพิ่ม Anti-Pattern
- Role ทำงานสำเร็จได้รับคำชม → เพิ่ม Evidence
- จบ task สำคัญ → บันทึก learning

## 📊 Team-Level Files

### 1. `team/performance.md` (ใหม่)

Track performance ของแต่ละ role ข้าม task:

```markdown
# Team Performance Tracking

## <Role Name>
- **Tasks completed:** N
- **Quality score:** X/10 (avg)
- **Strengths:** ...
- **Weaknesses:** ...
- **Last active:** YYYY-MM-DD
- **Notes:** ...
```

### 2. `team/retrospective/YYYY-Www.md` (ใหม่)

Weekly team retrospective:

```markdown
# Team Weekly Retrospective - Week WW

## 📊 Team Performance
- [role] — tasks / quality / notes

## ✅ What went well (ทั้งทีม)
## ⚠️ What went wrong (ทั้งทีม)

## 🔍 Cross-Role Patterns
- Patterns ที่เจอใน ≥ 2 roles → อาจย้ายไป Luna preferences

## 🤝 Collaboration Issues
- Handoff ที่ไม่ดี, conflict, ความซ้ำซ้อน

## 🎯 Team focus สัปดาห์หน้า
```

## 🔗 เชื่อมโยงกับ Luna System

```
<role>.md (per-role)
    ↓ pattern ยืนยันข้าม 2+ roles
team/performance.md + retrospective/
    ↓ pattern generalize ได้ข้าม team
Luna/insights.md → Luna/preferences.md
```

## 📋 Implementation Steps

1. **อัปเดต `team/README.md`** — อธิบายระบบ learning ใหม่ + link ไป Luna system
2. **อัปเกรด `team/preferences/<role>.md` ทั้ง 10 roles** ด้วย template ใหม่ (4 sections + Evidence Counter + Anti-Patterns + Learnings)
3. **สร้าง `team/performance.md`** — table template สำหรับ 10 roles
4. **สร้าง `team/retrospective/`** + README template
5. **บันทึก memory** เกี่ยวกับระบบทีมนี้

## ⚠️ ข้อควรระวัง

- **ไม่ต้องเติม content ตอนนี้** — เพิ่ม structure อย่างเดียว ให้ content เติมตามการทำงานจริง
- **Evidence threshold ของ role:** 3 ครั้งเหมือน Luna
- **Anti-Pattern ของ role จะ scope เฉพาะ role:** เช่น Stella มี anti-pattern เรื่อง React, Nova มี anti-pattern เรื่อง Firestore
