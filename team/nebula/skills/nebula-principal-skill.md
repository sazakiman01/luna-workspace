---
description: Principal-level DB design (Firestore) — query-driven schema, denormalization economics, index cost forecasting, migration planning
---

# Nebula Principal Skill (Honest Skeleton)

> **⚠️ Status: SKELETON — evidence pending**
>
> Nebula ยังไม่เคยทำงานจริงในระบบ. Skill นี้มี framework outline + Firestore-specific patterns แต่ Anti-Patterns + Quality Bar ส่วนใหญ่ "evidence pending"
>
> **Trigger full rewrite:** เมื่อ Nebula ทำ schema task ≥ 1 ครั้ง (review Firestore schema, design new collection)

---

## 🎯 What ทำให้ Nebula เป็น Principal-Level (theoretical)

**Senior DB Designer = schema ที่เก็บข้อมูลได้.**

**Principal Nebula = query-driven schema (denormalize ตาม read pattern) + index cost forecasting + migration path ที่ revertible + composite key strategy**

จุดต่าง 3 ข้อ (Firestore-specific):
1. **Query-driven design** — Firestore ไม่ JOIN, ต้อง denormalize ตาม query pattern
2. **Index economics** — composite indexes มี cost (write x N indexes), ต้อง forecast
3. **Migration revertibility** — Firestore ไม่มี ALTER TABLE — ทุก schema change ต้องมี dual-write phase

---

## 🧭 Decision Framework (skeleton)

### Document vs Subcollection
- **Few + small** (< 100 children, doc < 1MB) → embed
- **Many + access ทั้ง parent และ child indep** → subcollection
- **Need queries across parents** → top-level collection + denormalized parent ref

### Denormalization
ถาม 3 คำถาม:
1. Read pattern คืออะไร? (1 doc, list, search)
2. Write frequency vs read frequency?
3. Stale data tolerance? (real-time, eventual, daily)

→ Denormalize เมื่อ read >> write + tolerate eventual consistency

### Index strategy
- Auto single-field indexes ครอบคลุม 80% queries
- Composite indexes เฉพาะที่จำเป็น (forecast cost: each index = +write latency)
- Avoid `array-contains-any` + `where` ผสม (limited support)

### Schema migration (Firestore)
3-phase pattern:
1. **Add new field** (dual-write) — code เขียนทั้ง old + new
2. **Backfill** — script update existing docs
3. **Remove old field** — code drop old, then cleanup

---

## 📏 Quality Bar (skeleton)

| มิติ | Senior | Principal |
|------|--------|-----------|
| Schema design | Works | Query-driven, denormalization justified |
| Index strategy | Auto only | Composite cost forecast + cleanup plan |
| Migration | Single deploy | 3-phase dual-write + rollback path |
| Composite keys | Ad-hoc | Explicit pattern (e.g., `userId_orderId`) |

---

## ⚠️ Anti-Patterns (template — evidence pending)

- **AP-1:** Normalize Firestore like SQL → N+1 read pattern
- **AP-2:** Add composite index without write-cost forecast
- **AP-3:** Schema change in single deploy → no rollback for breaking change
- **AP-4:** Embed unbounded array (> 100 items) → 1MB doc limit risk
- **AP-5:** No composite key pattern → query inefficiency + race conditions

---

## 🛠️ Tech Stack
- **DB:** Firestore (NoSQL document)
- **Tooling:** Firestore Console + Firebase Emulator (offline test)
- **Migration:** scripts (Cloud Functions for big migrations)
- **Validation:** zod schema → ensure write shape (pair with Nova)

---

## 🤝 Cross-Role Boundaries

| Role | Boundary |
|------|----------|
| Nova | Nebula = schema + index. Nova = read/write code |
| Orion | Nebula consult Orion สำหรับ system-level data flow |
| Cosmos | Schema migration deploy = Nebula plan + Cosmos execute |
| Sirius | Schema test = Nebula design test cases, Sirius implement |

---

## 📚 Required Reading
- `team/roles/nebula.md`
- Firestore data modeling guide
- Firestore index best practices
- Schema migration patterns (Firestore-specific)

---

## 🔄 When to Use
- New schema design
- Schema review + optimization
- Index strategy
- Migration planning
- Denormalization decisions

---

## 📝 Authoring Notes
- **Author:** Luna 🌙 (skeleton)
- **Version:** 2026-04-27-v0.1
- **Next rewrite trigger:** Nebula ทำ schema task จริง 1 ครั้ง
