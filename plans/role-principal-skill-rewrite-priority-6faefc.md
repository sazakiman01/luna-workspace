# Role Principal Skill Rewrite Priority

แผน priority order สำหรับ rewrite `*-principal-skill.md` ของ 12 roles ที่ถูก flag boilerplate ใน audit W18 (Phase 3 ของ `luna-principal-elevation-roadmap-6faefc.md`).

---

## 🎯 Priority Criteria (3 มิติ)

| Criterion | Weight | คำอธิบาย |
|-----------|--------|----------|
| **Activity** | 40% | Role active แค่ไหน (Tasks completed, Last active) — มี data เขียน skill ได้ดีกว่า |
| **Impact** | 35% | Role นี้ใช้บ่อยแค่ไหนในอนาคต (frequency expectation) |
| **Self-Tooling** | 25% | Role นี้ใช้สำหรับ improve ระบบเอง (Polaris, Lyra) → urgent กว่า |

---

## 📊 Priority Matrix

| Rank | Role | Activity | Impact | Self-Tool | Reason |
|------|------|----------|--------|-----------|--------|
| **#1** | **Lyra** | 🟢 6 tasks | 🟢 High | 🟢 Yes | active ที่สุด, มี real preferences (Anti-Patterns + Hypothesis), self-tooling, Phase 2 ใช้บ่อย |
| **#2** | **Polaris** | 🟡 1 task | 🟢 High | 🟢 Yes | Self-tooling for audit, ทำ baseline + จะทำ weekly audit ทุกอาทิตย์ |
| **#3** | **Stella** | 🟢 2 tasks | 🟢 High | 🔵 No | Frontend = main domain ของ PMAM, มี knowledge/skills เยอะ |
| **#4** | **Orion** | 🟡 1 task | 🟢 High | 🔵 No | Architecture decisions ใช้บ่อย, PMAM review confirmed value |
| **#5** | **Sirius** | 🟡 1 task | 🟡 Med | 🔵 No | QA review + Phase 4 จะ pair กับ scoring rubric work |
| **#6** | **Vega** | ⚪ 0 task | 🟡 Med | 🔵 No | Pair กับ Stella สำหรับ frontend — แต่ยังไม่มี case จริง |
| **#7** | **Pulsar** | ⚪ 0 task (W18) | 🟡 Med | 🟡 Partial | Coordinated W17 retro แล้ว — Phase 5 (continuous loop) ใช้บ่อย |
| **#8** | **Nova** | ⚪ 0 task | 🟡 Med | 🔵 No | Backend — รอ project ที่มี backend (PMAM ไม่มี) |
| **#9** | **Cosmos** | ⚪ 0 task | 🟡 Med | 🔵 No | DevOps — รอ deploy work |
| **#10** | **Aurora** | ⚪ 0 task | 🔵 Low | 🔵 No | Integration — รอ 3rd-party API work |
| **#11** | **Nebula** | ⚪ 0 task | 🔵 Low | 🔵 No | DB — รอ schema design work |
| **#12** | **Galaxy** | ⚪ 0 task | 🔵 Low | 🔵 No | BA — รอ requirement gathering work |

> **Note:** Luna's principal skill **ไม่ต้อง rewrite** — เป็น genuine แล้ว (audit ℹ️ I1)

---

## 🚦 Phase 3 Execution Plan

### **Wave 1 (urgent — ทำใน Phase 3 main)**

> เป้าหมาย: Roles ที่ Phase 4-5 ต้องใช้, มี data จริง

- [ ] **#1 Lyra** — self-author + Polaris review
- [ ] **#2 Polaris** — Luna author (Polaris ไม่ self-edit ตัวเอง — bias) + Pulsar review
- [ ] **#3 Stella** — self-author + Vega review (frontend pair)
- [ ] **#4 Orion** — self-author + Polaris review

### **Wave 2 (medium priority)**

> เป้าหมาย: Roles ที่ active บ้างแล้ว หรือมี knowledge ครบ

- [ ] **#5 Sirius** — self-author + Polaris review
- [ ] **#6 Vega** — self-author + Stella review (frontend pair)
- [ ] **#7 Pulsar** — self-author + Galaxy review

### **Wave 3 (deferred — wait for activity)**

> เป้าหมาย: Roles ที่ยังไม่มี case จริง — เขียน minimal skeleton + mark "evidence pending"

- [ ] **#8 Nova** — minimal skeleton (rewrite เต็มเมื่อมี backend project)
- [ ] **#9 Cosmos** — minimal skeleton
- [ ] **#10 Aurora** — minimal skeleton
- [ ] **#11 Nebula** — minimal skeleton
- [ ] **#12 Galaxy** — minimal skeleton

---

## 🛡️ Quality Guards (กัน Mass-Generation อีกครั้ง)

ก่อน rewrite ต้องผ่านทุกข้อ:

1. ✅ ใช้ `templates/role-principal-skill.template.md` (anti-boilerplate template)
2. ✅ **1 role / 1 session** — ห้าม batch
3. ✅ อ่าน `team/roles/<role>.md` + `team/preferences/<role>.md` ก่อนเริ่ม
4. ✅ Self-validation checklist ใน template ต้อง tick ครบ
5. ✅ ไม่มี banned phrase (template ระบุ list)
6. ✅ Reviewer (อีก role หรือ Polaris) approve ก่อน finalize
7. ✅ บันทึก daily log + update performance.md ของ author + reviewer

---

## 📅 Timing

ตามหลัก roadmap "ไม่ระบุ timeline" — แต่ลำดับ execution:

- **Wave 1:** เริ่ม session ถัดไป หลัง พี่แมน approve A7+A8 (4 roles)
- **Wave 2:** หลัง Wave 1 เสร็จ + Polaris W18 audit ผ่าน
- **Wave 3:** เมื่อ role ที่เกี่ยวข้องมี case จริง (event-driven, ไม่ schedule)

---

## 🔗 References

- Roadmap: `plans/luna-principal-elevation-roadmap-6faefc.md`
- Audit finding C1: `team/audits/2026-W18-baseline-audit.md`
- Anti-pattern hypothesis: `Luna/hypothesis.md` (Mass-Generation, Evidence 1/3)
- Template: `templates/role-principal-skill.template.md`

---

*Author: Luna 🌙 — A8 of audit W18 — Reviewed pending: พี่แมน*
