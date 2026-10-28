---
title: Framework Mapping (NIST / ISO / EU AI Act)
pillar: reference
status: done
order: 5
updated: 2026-06-11
---

# 🗺️ Framework Mapping — Luna ↔ มาตรฐานสากล

*ระบบ Luna จับคู่กับกรอบ AI governance ที่โลกใช้อ้างอิง*

---

## 1. NIST AI RMF (สหรัฐฯ — สมัครใจ, ภาษากลาง)

4 ฟังก์ชันหลัก: **Govern – Map – Measure – Manage**

| ฟังก์ชัน | ความหมาย | Luna ทำอะไร |
|----------|---------|-------------|
| **Govern** | วางนโยบาย, วัฒนธรรม, ความรับผิดชอบ | AGENTS.md governance section, rules/data-handling.md, ชุดเอกสาร governance/ |
| **Map** | รู้บริบท + ความเสี่ยง | Data classification, นิยามงาน critical |
| **Measure** | วัด/ตรวจสอบ | Audit trail per-agent (dashboard), /code-review, weekly audit |
| **Manage** | จัดการความเสี่ยง + ปรับปรุง | Deny list, adversarial verify, human-in-the-loop, decision log |

> NIST RMF เป็น **สมัครใจ** — เลือกหยิบเท่าที่ใช้ได้ (ที่มา: NIST AI RMF Playbook)

---

## 2. ISO/IEC 42001 (ระบบจัดการ AI)

มาตรฐานระบบจัดการ AI (คล้าย ISO 27001 ของ security)

| หลักการ ISO 42001 | Luna |
|-------------------|------|
| AI policy เป็นลายลักษณ์ | ✅ governance/ + rules/ |
| Roles & responsibilities | ✅ team-config + accountability |
| Risk + impact assessment | 🟡 gap analysis (ad-hoc) |
| Continual improvement | ✅ learning loop + quarterly audit |

> องค์กรใหญ่เริ่มขอ ISO 42001 — Luna มีโครงพื้นฐานรองรับ

---

## 3. EU AI Act (จัดระดับความเสี่ยง)

| ระดับ | งานพี่แมน |
|-------|-----------|
| Unacceptable | ❌ ไม่เกี่ยว |
| High-risk | ❌ ไม่เกี่ยว (ไม่ใช่ HR/credit/medical) |
| **Limited risk** | ✅ **เข้าข่ายนี้** → แค่ต้อง **โปร่งใสว่าใช้ AI** (Disclosure) |
| Minimal risk | ส่วนใหญ่ของงาน |

> หน้าที่หลักภายใต้ EU AI Act สำหรับงานระดับนี้ = **transparency** ซึ่ง Luna มี disclosure rule รองรับ

---

## สรุป

ทุกกรอบลงเอยที่ **4 เสาเดียวกัน**: Data Security · Accountability · Quality · Auditability → ดู [[governance-checklist]]
