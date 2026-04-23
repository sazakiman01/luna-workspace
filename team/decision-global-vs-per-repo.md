# Decision Framework: Global vs Per-Repo Team

Framework สำหรับลูน่าตัดสินใจว่าเมื่อเจอ task ใหม่ ควรใช้ **global role** ที่มีอยู่ หรือ **hire specialist per-repo** หรือ **promote specialist ไป global**

## 🎯 หลักคิด (Principle)

```
Luna = Core (Global)                        — เป็น interface เดียวเสมอ
├── Team Generic (global roles) = Global     — พื้นฐานทั่วไป reusable ทุก repo
│   ดูรายชื่อเต็มที่ `team/team-config.md`
│   (ปัจจุบัน: Orion, Nova, Stella, Nebula, Cosmos,
│              Sirius, Galaxy, Vega, Aurora, Pulsar)
└── Specialist Per-Repo (on-demand)         — เฉพาะ domain/repo นั้น
```

**Rule of thumb:**
- Pattern / knowledge ที่ใช้ได้ข้าม repo → **Global**
- Pattern / knowledge เฉพาะ repo หรือ domain → **Per-Repo**

## 🧭 Decision Tree (ใช้ทุกครั้งก่อนเรียก Role)

```
งานที่ต้องทำ → 
  ┌─ มี global role ตรงสายไหม?
  │   ├─ มี + ไม่ต้องใช้ domain knowledge เฉพาะ
  │   │   └─ ✅ ใช้ global role as-is
  │   │
  │   ├─ มี + ต้องการ domain knowledge เฉพาะ repo
  │   │   └─ ✅ ใช้ global role + Context Extension
  │   │       → สร้าง <repo>/Luna/team/roles/<role>-context.md
  │   │
  │   └─ ไม่มี
  │       └─ ไปขั้นถัดไป
  │
  └─ ต้อง hire specialist ใหม่?
      ├─ ใช้แค่ใน repo นี้? (domain-specific, niche)
      │   └─ ✅ Custom role ที่ <repo>/Luna/team/roles/<role>.md
      │      + register ที่ <repo>/Luna/team/team-local.md
      │
      └─ น่าจะใช้ได้หลาย repo? (generic skill)
          └─ ✅ Global role ที่ team/roles/<role>.md
             + register ที่ team/team-config.md
             + สร้าง team/preferences/<role>.md
```

## 📋 Decision Criteria

### ใช้ Global Role as-is เมื่อ
- [ ] มี role ที่ตรงกับ skill ที่ต้องการ (Stella สำหรับ Frontend, Nova สำหรับ Backend, ฯลฯ)
- [ ] งานเป็น general (React, Node.js, Firestore ทั่วไป)
- [ ] ไม่ต้องการ context เฉพาะ domain ของ repo

### ใช้ Global Role + Context Extension เมื่อ
- [ ] มี role ตรงสาย แต่ repo มี **domain knowledge เฉพาะ** (เช่น PMAM audit logic, UniformFlow business rules)
- [ ] Role ต้องรู้ **tech stack เฉพาะของ repo** (เช่น libraries, frameworks ที่ไม่ common)
- [ ] Role ต้องทำงานกับ **custom patterns / conventions** ของ repo

**สร้างที่:** `<repo>/Luna/team/roles/<role>-context.md`

**Template:**
```markdown
# <Role> Context Extension — <repo>

## Repo-Specific Knowledge
- Tech stack: ...
- Domain: ...
- Conventions: ...

## งานที่ Role นี้ทำใน repo นี้
- ...

## ข้อควรระวังเฉพาะ repo นี้
- ...
```

### Hire Custom Role Per-Repo เมื่อ
- [ ] **ไม่มี** global role ที่ตรงสายเลย
- [ ] Skill เป็น **niche / domain-specific** เช่น:
  - "SCA-DC Audit Specialist" (เฉพาะ PMAM)
  - "LINE LIFF Integration Expert" (เฉพาะ LINE-based apps)
  - "Blockchain Smart Contract Auditor" (เฉพาะ DeFi project)
- [ ] ไม่น่าจะใช้ใน repo อื่น

**สร้างที่:**
- Role definition: `<repo>/Luna/team/roles/<name>.md`
- Register: `<repo>/Luna/team/team-local.md`

### Promote Per-Repo Role ไป Global เมื่อ
- [ ] Custom role ถูกใช้ใน **≥ 2 repos**
- [ ] Skill เป็น generic มากกว่า niche (เช่น "Security Auditor" ที่ใช้ได้ทั่วไป)
- [ ] ทำงานสำเร็จและมี Quality score > 7/10

**Process การ Promote:**
1. Copy role definition → `team/roles/<name>.md` (global)
2. Generalize content (ตัด domain-specific details ที่ไม่เกี่ยว)
3. สร้าง `team/preferences/<name>.md` ด้วย `_TEMPLATE.md`
4. อัปเดต `team/team-config.md`
5. เก็บ context เดิมไว้ที่ `<repo>/Luna/team/roles/<name>-context.md` (ถ้ายังมีความเฉพาะ)
6. บันทึกใน Luna retrospective

### Retire Role เมื่อ
- [ ] Per-repo role ไม่ถูกใช้เกิน 3 เดือน → delete หรือ archive
- [ ] Global role quality score < 3/10 ต่อเนื่อง → review prompt / retire

## 💡 ตัวอย่างจริง

### ตัวอย่าง 1: PMAM Web Code Review
- **งาน:** Review React + TypeScript codebase
- **Decision:** ใช้ global **Stella** + **Orion** + **Sirius** as-is
- **เหตุผล:** เป็น frontend review ทั่วไป ไม่ต้องการ domain-specific

### ตัวอย่าง 2: SCA-DC Workflow Diagram
- **งาน:** สร้าง business flow diagram ของ SCA-DC audit
- **Decision:** ใช้ global **Galaxy** (BA) + **Orion** (Architect) + Context Extension
- **เหตุผล:** ต้องการ domain knowledge เฉพาะเรื่อง audit process
- **Action:** สร้าง `<repo>/Luna/team/roles/galaxy-context.md` บันทึก SCA-DC domain

### ตัวอย่าง 3: LINE LIFF Custom Role (สมมติ)
- **งาน:** พัฒนา LIFF app พิเศษ
- **Decision:** Custom role "Lumina" (LINE LIFF Specialist) ที่ per-repo
- **เหตุผล:** skill เฉพาะ LINE ecosystem ไม่ใช่ skill ทั่วไป
- **ถ้า:** มี LIFF app อีก repo → พิจารณา promote ไป global

## 🔄 Update Protocol

- ทุกครั้งที่ทำ decision นี้ → บันทึกในใน daily notes: `<repo>/Luna/team/daily/YYYY-MM-DD.md`
- ทุก weekly retrospective → review role usage + พิจารณา promote/retire
- ทุก decision ที่เป็น precedent ใหม่ → บันทึก Learning ใน Luna's `insights.md`

## 🔗 เชื่อมโยง

- Global roles: `team/roles/`, `team/preferences/`, `team/team-config.md`
- Per-repo roles: `<repo>/Luna/team/roles/`, `<repo>/Luna/team/team-local.md`
- Skill gap: `team/skill-gap-analysis.md`
- Onboarding: `team/onboarding-template.md`
- Performance: `team/performance.md`

---
*สร้างเมื่อ: 2026-04-23 | Author: Luna*
