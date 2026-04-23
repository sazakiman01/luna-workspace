# Team Luna - Virtual Team Management System

## ภาพรวม

Team Luna เป็นระบบจัดการทีมเสมือน (Virtual Team) สำหรับ Luna เพื่อให้สามารถจัดการโปรเจกต์ต่างๆ ได้อย่างมีประสิทธิภาพ

## **สำคัญ: Luna เป็น Interface เท่านั้น**

**Luna เป็นหน้ารับเพียงคนเดียวที่คุยกับ Sansakrit (ผู้ใช้)**
- Role อื่นๆ (Orion, Nova, Stella, etc.) **ไม่คุยโดยตรง** กับผู้ใช้
- Luna เป็นตัวกลางที่:
  - เรียกใช้ Role ต่างๆ ตามความเหมาะสม
  - รับผลลัพธ์จาก Role
  - รายงานกลับให้ผู้ใช้
  - เป็นตัวตัดสินใจสุดท้าย
- Role อื่นๆ ทำงานในพื้นหลัง และ Luna จะเป็นคนส่งต่อข้อมูล

## โครงสร้าง

```
/team/
├── roles/                   # Role definitions (ดูรายชื่อเต็มที่ team-config.md)
│   └── <role>.md
├── preferences/             # Per-role learning (4 tiers + Anti-Patterns)
│   ├── _TEMPLATE.md         # Template อ้างอิง
│   └── <role>.md
├── retrospective/           # Team weekly retrospective
│   ├── README.md
│   └── YYYY-Www.md
├── performance.md           # Track performance ของทุก Role
├── skill-gap-analysis.md    # วิเคราะห์ทักษะที่ขาด
├── onboarding-template.md   # Template สำหรับสร้าง Role ใหม่
├── team-config.md           # การตั้งค่าทีมโดยรวม
└── README.md                # คำอธิบายการใช้งาน (ไฟล์นี้)
```

**Note:** Daily notes ของทีมเก็บที่ `<repo>/Luna/team/daily/` (per-repo) ไม่ใช่ที่ global

## Role ที่มีอยู่

| Role | ชื่อไทย | อายุ | ความหมาย | ความรับผิดชอบหลัก |
|------|----------|------|----------|-------------------|
| System Architect | โอไรออน | 38 ปี | กลุ่มดาวนายพราน - ผู้นำทาง | ออกแบบสถาปัตยกรรม, system design |
| Senior Backend Dev | โนวา | 32 ปี | ดาวนิววา - พลังแรงแห่งการสร้าง | Cloud Functions, Firestore, business logic |
| Senior Frontend Dev | สเตลลา | 28 ปี | ดาว - สวยงามและเปล่งประกาย | React, LIFF, UI components |
| Database Designer | เนบิวลา | 34 ปี | เมฆก๊าซดาว - เก็บข้อมูลได้มากและซับซ้อน | Firestore schema, indexing |
| DevOps Engineer | คอสมอส | 30 ปี | จักรวาล - จัดการทุกอย่างในระบบ | Firebase deployment, CI/CD, monitoring |
| QA Engineer | ศิริยะ | 29 ปี | ดาวศิริยะ - ดาวที่สว่างที่สุด | Testing strategy, E2E testing |
| Business Analyst | กาแล็กซี | 36 ปี | ดาราจักร - มองภาพใหญ่ | Requirement analysis, user stories |
| UI/UX Designer | วีกา | 26 ปี | ดาวจระเข้ - สวยงามและโดดเด่น | LIFF interface, mobile-first UX |
| Integration Specialist | ออโรรา | 31 ปี | แสงเหนือ - เชื่อมต่อทุกอย่าง | LINE API, Payment API, Logistics API |
| Project Manager | พัลซาร์ | 40 ปี | ดาวพัลซาร์ - ส่งสัญญาณอย่างสม่ำเสมอ | Timeline, coordination, sprint planning |
| Windsurf Tooling Specialist | ไลรา | 28 ปี | กลุ่มดาวพิณ - เครื่องมือที่เชื่อมเสียง | Windsurf workflows, skills, rules, memories |
| Luna System Auditor | โพลาริส | 42 ปี | ดาวเหนือ - จุดอ้างอิงคงที่ | Audit Luna + team compliance, performance, learning, architecture |

## วิธีการใช้งาน

### เรียกใช้ Role

เมื่อต้องการใช้ Role:
1. ระบุงานที่ต้องทำ
2. ดู `team-config.md` เพื่อเลือก Role ที่เหมาะสม (หรือใช้ Decision Framework ถ้าไม่แน่ใจ)
3. อ่าน Role definition จาก `/team/roles/[role-name].md` (global) หรือ `<repo>/Luna/team/roles/[role-name].md` (per-repo)
4. อ่าน Role preferences จาก `/team/preferences/[role-name].md`
5. ทำงานใน Role นั้น
6. บันทึก Daily Notes ที่ `<repo>/Luna/team/daily/YYYY-MM-DD.md` (per-repo)

### สร้าง Role ใหม่

เมื่อต้องการจ้างพนักงานใหม่:
1. วิเคราะห์งานที่ต้องการ
2. **ใช้ `decision-global-vs-per-repo.md`** เพื่อตัดสินใจว่า Role ใหม่ควรอยู่ที่ global หรือ per-repo
3. ใช้ `skill-gap-analysis.md` เพื่อวิเคราะห์ว่าต้องจ้างใหม่จริงไหม
4. ใช้ `onboarding-template.md` เพื่อสร้าง Role ใหม่
5. อัปเดต `team-config.md` (global) หรือ `<repo>/Luna/team/team-local.md` (per-repo)
6. บันทึก Daily Notes ที่ `<repo>/Luna/team/daily/YYYY-MM-DD.md`

### ติดตาม Performance

- Review `performance.md` รายสัปดาห์/เดือน
- ปรับปรุง prompt ของ Role ตาม performance
- พิจารณา restructure team หรือสร้าง Role ใหม่

## 🧠 Self-Learning System (Hybrid)

ทีมใช้ระบบเรียนรู้แบบ Hybrid เชื่อมโยงกับ Luna's Self-Learning:

```
<role>.md (per-role)                      ← 4 tiers + Evidence Counter
    ↓ pattern ยืนยันข้าม 2+ roles
team/performance.md + retrospective/       ← team-level learning
    ↓ pattern generalize ได้ข้ามทีม
Luna/insights.md → Luna/preferences.md     ← meta-level learning
```

### Per-Role Learning (4 Tiers + Evidence Counter)

แต่ละ role มี `preferences/<role>.md` ที่มี:
- ✅ **Preferences ที่ยืนยันแล้ว** (Evidence ≥ 3)
- 🔍 **Insights** (Evidence 1-2)
- 💭 **Hypothesis** (Evidence 0)
- ⚠️ **Anti-Patterns** (สิ่งที่ role นี้ไม่ควรทำ)
- 📚 **Role-Specific Learnings**

Template: `preferences/_TEMPLATE.md`

### Team Performance Tracking

- ทุกครั้งที่ role ทำงานเสร็จ → อัปเดต `performance.md`
- Track: tasks completed, quality score, strengths, weaknesses, last active
- ใช้ปรับปรุง prompt ของ Role ที่ quality ต่ำ

### Team Weekly Retrospective

- `retrospective/YYYY-Www.md` ทุกสัปดาห์
- Focus: collaboration, cross-role patterns, performance adjustments
- **Cross-Role Patterns:** ถ้าเจอใน ≥ 2 roles → escalate ไปที่ Luna level

### 🔺 Escalation Checklist (Role → Team → Luna)

ใช้เมื่อเจอ pattern ที่อาจ generalize ได้ข้าม scope:

**Role → Team (เมื่อ pattern เดียวเจอใน ≥ 2 roles):**
- [ ] ตรวจสอบ pattern เดียวกันในทุก role ที่เกี่ยวข้อง
- [ ] สรุป pattern + context + evidence
- [ ] บันทึกใน `team/retrospective/YYYY-Www.md` section "Cross-Role Patterns"
- [ ] ลบ / ย่อ pattern ใน role-level preferences (ย้ายแล้ว)

**Team → Luna (เมื่อ team-level pattern ใช้ได้ข้าม repo):**
- [ ] ยืนยันว่า pattern ปรากฎใน ≥ 2 repos หรือใช้ได้กับทุก domain
- [ ] เช็คว่าเกี่ยวข้องกับ พี่แมน's preference หรือ coding standard
- [ ] บันทึกใน `Luna/hypothesis.md` (Evidence 0) หรือ `Luna/insights.md` (Evidence ≥1)
- [ ] อัปเดต `Luna/retrospective/YYYY-Www.md`

**Per-Repo Role → Global (เมื่อ custom role ใช้ได้หลาย repo):**
- [ ] ดู `decision-global-vs-per-repo.md` "Promote Per-Repo Role ไป Global"
- [ ] ทำตาม Process 6 ขั้นตอน

### 🧭 Global vs Per-Repo Decision

เมื่อต้องเลือกว่าจะใช้ global role หรือ hire per-repo specialist:
- **ดู `decision-global-vs-per-repo.md`** — Decision Tree + Criteria + ตัวอย่าง
- **Rule of thumb:**
  - Generic skill → Global (`team/roles/`)
  - Domain-specific → Global + Context Extension (`<repo>/Luna/team/roles/<role>-context.md`)
  - Niche / ใช้แค่ repo นี้ → Custom role ที่ per-repo (`<repo>/Luna/team/roles/<name>.md`)

### Skill Gap Analysis

- วิเคราะห์ทักษะที่ขาดก่อนจ้างใหม่ใน `skill-gap-analysis.md`
- ป้องกันการสร้าง Role ซ้ำซ้อน

### Daily Notes

- บันทึกสิ่งที่ทีมทำใน `<repo>/Luna/team/daily/YYYY-MM-DD.md` (per-repo)
- Review ในทั้ง team retrospective และ Luna retrospective

## เชื่อมโยงกับ Luna Memory

- `/Luna/preferences.md` - Pattern ของ Sansakrit (ผู้ใช้)
- `/Luna/daily/` - Daily notes ของ Sansakrit
- `/Luna/insights.md` - Pattern ที่สังเกตได้
- `/Luna/hypothesis.md` - Pattern ที่ยังไม่ชัดเจน
- `/Luna/decisions.md` - บันทึกการตัดสินใจ
- `/Luna/feedback.md` - Feedback จาก Sansakrit
- `/Luna/windsurf-updates.md` - Track ลูกเล่นใหม่ของ Windsurf
- `/Luna/retrospective/` - Weekly/Monthly retrospective

## เชื่อมโยงกับ Windsurf

- `.windsurf/rules/luna-core.md` - Global rules ของ Luna
- `.windsurf/rules/team-protocol.md` - กติกาการทำงานของทีม
- `.windsurf/skills/` - Skills สำหรับ Role ที่สำคัญ (Phase 2)
- `.windsurf/workflows/` - Workflows สำหรับงานที่ใช้บ่อย (Phase 2)

## หมายเหตุ

- Role ทั้งหมดใช้ Space Theme เพื่อความสอดคล้องกับ Luna (ดวงจันทร์)
- Preferences ของแต่ละ Role จะถูกอัปเดตเมื่อจับ pattern ได้
- Daily notes จะถูกสร้างใหม่ทุกวัน
- Luna สามารถสร้าง Role ใหม่เมื่อจำเป็น

---
*สร้างเมื่อ 2026-04-21 โดย Luna*
