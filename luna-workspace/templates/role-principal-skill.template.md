---
description: Principal-level skill ของ <Role> — [1 บรรทัด ที่บอก expertise เฉพาะของ role นี้ ไม่ใช้ "Define X strategy"]
---

<!--
================================================================================
🛡️ ROLE PRINCIPAL SKILL TEMPLATE — NO BOILERPLATE EDITION
Created: 2026-04-27 (A7 of luna-principal-elevation-roadmap-6faefc.md)
Purpose: ป้องกัน Mass-Generation Anti-Pattern (H-NEW-1 — เดิมใน Luna/hypothesis.md, retired 2026-07-23, ปัจจุบันอยู่ใน memory tool)

⛔ ห้ามใช้ template นี้แบบ batch — ห้ามสร้างหลาย role ในรอบเดียว
✅ กฎการใช้: 1 role / 1 session
✅ ก่อนเขียน: อ่าน team/roles/<role>.md + team/preferences/<role>.md อย่างจริงจัง
✅ ทุก section ต้องมี content จริงจาก experience — ไม่มี placeholder

🚫 BANNED PHRASES (ถ้าเจอใน final file = ไม่ผ่าน, rewrite):
   - "Define X strategy"
   - "Define X standards"
   - "Define X governance"
   - "Conduct thorough reviews"
   - "Drive continuous improvement"
   - "Build relationships"
   - "Communicate effectively"
   - Generic TypeScript interfaces (ArchitectureAudit, BackendAudit ฯลฯ)
   - "5 step framework" pattern (Step 1: Understand → Step 2: Evaluate → ...)

✅ REQUIRED EVIDENCE:
   - ทุก Quality Bar ต้องมี measurable threshold (number, file, behavior)
   - ทุก Anti-Pattern ต้องมีเหตุการณ์จริง (date + occurrence)
   - ทุก Decision Framework ต้องมี ตัวอย่าง concrete จาก งานจริงของ role นี้
   - ถ้า role ไม่เคยทำงาน → เขียนแค่ skeleton minimal และ mark "evidence pending"
================================================================================
-->

# <Role Name> Principal Skill

> **Self-validation checklist** (ผู้เขียนต้อง tick ก่อน commit):
> - [ ] อ่าน `team/roles/<role>.md` แล้ว
> - [ ] อ่าน `team/preferences/<role>.md` แล้ว
> - [ ] ตรวจ banned phrases — ไม่มี
> - [ ] ทุก section มี **role-specific content** ไม่ใช่ generic
> - [ ] ระบุ "evidence pending" ใน section ที่ยังไม่มี data จริง

---

## 🎯 What ทำให้ <Role> เป็น Principal-Level (ไม่ใช่ Senior)

[เขียน 2-3 ประโยค ที่ตอบคำถาม: *"ถ้า Senior <Role> โต 5 ปี เป็น Principal, อะไรเปลี่ยน?"*
- ไม่ใช่ list responsibilities
- ต้องบอก **judgment** หรือ **scope** ที่ Senior ทำไม่ได้
- ตัวอย่าง (Polaris): "Senior auditor หาปัญหา. Principal เลือกว่าปัญหาไหน *ควร* audit, ปัญหาไหน *ควรปล่อย* — และปกป้อง decision ด้วย opportunity cost analysis"]

---

## 🧭 Decision Framework (เฉพาะของ Role นี้)

> **กฎ:** อย่าใช้ generic 5-step (Understand → Evaluate → Decide → Implement → Review)
>
> ใช้ framework ที่ **role นี้** ใช้จริงเท่านั้น

### เมื่อต้องตัดสินใจ [ประเภท decision เฉพาะ role]:

[ตัวอย่างจริงจาก experience — เช่น Polaris อาจเขียน:
"เมื่อพบ finding — ถาม 3 คำถาม:
1. ถ้าไม่ flag, จะส่งผลอะไรต่อระบบ Luna ใน 30 วัน?
2. มี evidence ที่ verifiable ไหม หรือ inference?
3. ใครจะแก้? ถ้าไม่มี owner ชัดเจน → flag เป็น Info ไม่ใช่ Critical"]

### เมื่อต้อง trade-off ระหว่าง [A] vs [B]:

[ระบุ trade-off เฉพาะที่ role นี้เจอ — ไม่ใช่ generic trade-off]

---

## 📏 Quality Bar (Measurable Standards)

> **กฎ:** ทุกข้อต้องมี threshold วัดได้

| มิติ | Senior level | Principal level |
|------|--------------|-----------------|
| [Dimension 1 specific to role] | [วัดได้] | [วัดได้ + สูงกว่า] |
| [Dimension 2] | ... | ... |
| [Dimension 3] | ... | ... |

ตัวอย่าง (Stella):
| มิติ | Senior | Principal |
|------|--------|-----------|
| Code review depth | 5 dimensions, identify issues | 8 dimensions, **trade-off analysis** ระหว่าง issues + recommend prioritization |
| Component design | Working component | Working component **+ accessibility audit + performance budget** |
| Architecture impact | Per-component decisions | Cross-component patterns ที่ team ตามได้ |

---

## ⚠️ Anti-Patterns (จากเหตุการณ์จริงของ role นี้)

> **กฎ:** ห้ามคัดลอกจาก role อื่น — ต้องเป็น anti-pattern เฉพาะที่ role นี้เคยทำผิด หรือเสี่ยงทำผิด

### ❌ [ชื่อ anti-pattern เฉพาะ]
- **เคยเกิดเมื่อ:** YYYY-MM-DD (ระบุ context จริง)
- **ทำไมผิด:** [เหตุผลที่ specific กับ role's domain]
- **ทำให้ถูก:** [วิธีที่ specific]
- **Reference:** `team/preferences/<role>.md` (Anti-Patterns section)

[ถ้า role ยังไม่มี anti-pattern → mark *"Evidence pending — จะ fill หลัง role active ≥ 3 tasks"*]

---

## 🛠️ Tools & Outputs ที่ Role นี้ Master

[List **เครื่องมือ + output format** ที่ role นี้ต้อง excel — เฉพาะ role นี้]

ตัวอย่าง (Lyra):
- **Tools:** Edit (file edit), workflow files, rules files, skill files
- **Outputs:**
  - Workflow files ที่ทดสอบแล้วทำงาน (ไม่ใช่แค่ design)
  - Rule files ที่ enforce ได้จริง (rule-level vs workflow-level)
  - Skill files ที่ตรงกับ Windsurf invocation pattern
- **Verification habit:** ทดสอบ tool capability ก่อน claim limitation

---

## 🤝 Cross-Role Boundaries

> **กฎ:** ระบุ "อะไรไม่ใช่งานของ role นี้" + "เมื่อไหร่ต้อง handoff"

| Role อื่น | Boundary | Handoff trigger |
|-----------|----------|-----------------|
| [Role X] | [งานที่ overlap] | [เมื่อไหร่ต้องส่งให้ X] |
| [Role Y] | ... | ... |

ตัวอย่าง (Polaris):
| Role | Boundary | Handoff |
|------|----------|---------|
| Sirius (QA) | Polaris = Luna system audit, Sirius = product/code QA | ถ้าเจอ code bug ใน audit → handoff Sirius |
| Pulsar (PM) | Polaris หา issue, Pulsar coordinate fix | หลัง audit เสร็จ → action items ส่ง Pulsar |

---

## 📚 Required Reading (ก่อนทำงานในระดับ Principal)

[List ไฟล์/resource ที่ role นี้ต้องอ่านเพื่อทำงานระดับ Principal — เฉพาะ role-relevant]

- `team/roles/<role>.md` — role definition
- `team/preferences/<role>.md` — learning history
- [ไฟล์เฉพาะ domain ของ role]
- [knowledge/skill ภายใต้ `team/<role>/`]

---

## 🔄 When to Use This Skill

> **กฎ:** ระบุ **trigger conditions** ที่ Luna ใช้เลือก role นี้

ใช้ <Role> Principal Skill เมื่อ:
- [Trigger 1 — specific situation]
- [Trigger 2]
- [Trigger 3]

**อย่าใช้** เมื่อ:
- [Counter-trigger — งานที่ดูเหมือนเข้า scope แต่จริงๆ ไม่ใช่]

---

## 📝 Authoring Notes

- **Author:** [Role name] (self-authored ในนาม role) — Reviewed by Luna + Polaris
- **Version:** YYYY-MM-DD-vN
- **Replaces:** [previous boilerplate file] — see `audits/2026-W18-baseline-audit.md` C1
- **Next review:** [YYYY-MM-DD] (ทุก 90 วัน หรือเมื่อ role ทำงาน 10 tasks)

---

<!--
✅ FINAL CHECK ก่อน commit:
1. Self-validation checklist ✓
2. ไม่มี banned phrase ✓
3. ทุก section มี role-specific content (ไม่ใช่ template echo) ✓
4. มี evidence จริง หรือ mark "evidence pending" ✓
5. Length: 100-300 lines (ไม่ใหญ่เกิน — boilerplate มักยาว 200+ lines เพราะ inflation)
-->
