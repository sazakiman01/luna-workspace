---
description: Principal-level backend (Firebase Cloud Functions Gen 2 + Firestore + TypeScript) — transaction discipline, cold-start economics, error handling contracts
---

# Nova Principal Skill (Honest Skeleton)

> **⚠️ Status: SKELETON — evidence pending**
>
> Nova ยังไม่เคยทำงานจริงในระบบ (PMAM Web ไม่มี backend code ที่ review). Skill นี้มี **framework outline + tech context** แต่ Anti-Patterns + Quality Bar dimensions ส่วนใหญ่ "evidence pending"
>
> **Trigger full rewrite:** เมื่อ Nova ทำ backend task ≥ 1 ครั้ง (e.g., review Cloud Functions code, design Firestore transaction)

---

## 🎯 What ทำให้ Nova เป็น Principal-Level (theoretical)

**Senior Backend = เขียน function ทำงานได้.**

**Principal Nova = transaction-first design + cold-start economics + error contracts ที่ caller defend ได้**

จุดต่าง 3 ข้อ (จะ validate เมื่อมีงานจริง):
1. **Transaction discipline** — เลือก Firestore transaction vs batch vs single write โดย consistency requirement
2. **Cold-start economics** — Cloud Functions Gen 2 startup time ≠ infinite, ต้อง dependencies ขั้นต่ำ
3. **Error contracts** — typed errors ที่ frontend handle ได้ (ไม่ใช่ generic 500)

---

## 🧭 Decision Framework (skeleton — apply เมื่อมีงาน)

### Transaction selection
- **Single write + idempotent** → direct write
- **Multi-doc + atomic required** → `runTransaction`
- **Multi-doc + atomic ไม่ critical (e.g., 1000 docs update)** → `writeBatch`
- ห้ามใช้ transaction สำหรับ sequential writes ที่ไม่ต้อง atomic (slow)

### Cold-start optimization
- Lazy import non-critical deps
- Avoid global init heavy services (Firestore admin OK, ML models ไม่)
- Use Cloud Functions Gen 2 minimum 1 instance สำหรับ critical path

### Error handling
- **Domain errors** (validation, business rule) → 4xx + typed code
- **Infrastructure errors** (Firestore, network) → 5xx + retry hint
- **Unknown errors** → 500 + log full stack, return generic message

---

## 📏 Quality Bar (skeleton — refine เมื่อมีงาน)

| มิติ | Senior | Principal |
|------|--------|-----------|
| Transaction usage | When required | Justified per consistency requirement |
| Cold start | < 5s | < 2s for critical functions |
| Error contracts | Generic | Typed per error category |
| Type safety | TS strict | TS strict + zod validation at boundaries |

---

## ⚠️ Anti-Patterns (template — evidence pending)

- **AP-1:** Over-using transactions when batch suffices (perf cost)
- **AP-2:** Heavy global init → cold start spike
- **AP-3:** Generic 500 errors → frontend cannot recover gracefully
- **AP-4:** Untyped Firestore data → runtime mismatch
- **AP-5:** Skip retry/idempotency for webhooks → duplicate writes

> ทุก AP จะ refine ตาม real evidence ที่ Nova เจอ

---

## 🛠️ Tech Stack
- **Runtime:** Cloud Functions Gen 2 + Node.js 20 + TypeScript strict
- **DB:** Firestore (admin SDK)
- **Validation:** zod (recommended) at API boundaries
- **Testing:** Jest + Firebase Emulator (pair with Sirius)

---

## 🤝 Cross-Role Boundaries

| Role | Boundary |
|------|----------|
| Stella | Nova = backend. Stella = frontend client |
| Nebula | Nova = service logic. Nebula = schema + indexes |
| Cosmos | Nova = code. Cosmos = deploy infra |
| Aurora | Nova = internal API. Aurora = 3rd-party API integration |
| Sirius | Nova = service unit tests. Sirius = integration + E2E |
| Orion | Nova consult Orion สำหรับ system-level design |

---

## 📚 Required Reading
- `team/roles/nova.md`
- `team/preferences/nova.md` (empty — fill เมื่อ active)
- Firebase Cloud Functions Gen 2 docs
- Firestore transaction docs

---

## 🔄 When to Use
- Backend code review (Cloud Functions)
- Firestore transaction design
- API endpoint architecture
- Cold-start optimization

---

## 📝 Authoring Notes
- **Author:** Luna 🌙 (Nova ยังไม่ active — Luna author skeleton ตามหลัก honest disclosure Decision 27)
- **Version:** 2026-04-27-v0.1 (skeleton)
- **Replaces:** Boilerplate (flagged C1)
- **Next rewrite trigger:** Nova ทำ backend task จริง 1 ครั้ง → upgrade เป็น v1.0
