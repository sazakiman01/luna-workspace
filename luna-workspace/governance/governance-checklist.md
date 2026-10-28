---
title: Governance Checklist (4 เสาหลัก)
pillar: auditability
status: partial
order: 4
updated: 2026-06-11
---

# 📋 Governance Checklist — สถานะจริง 4 เสาหลัก

*ประเมินจาก gap analysis ระบบ Luna (2026-06-11)*

> สถานะ: ✅ ทำแล้ว · 🟡 ทำบางส่วน · ⚠️ ยังไม่ทำ

---

## 🔒 เสา 1: Data Security

| รายการ | สถานะ |
|--------|-------|
| Deny list กันอ่านไฟล์ secret (`opencode.json → permissions` — ชั้นเสริม) | ✅ |
| กฎ data classification (rules/data-handling.md) | ✅ |
| คำเตือนเมื่อเจอ secret/PII | ✅ |
| PDPA awareness | ✅ |
| Auto-scan PII ในเนื้อหา | ⚠️ (ระดับ 3) |

## 👤 เสา 2: Accountability

| รายการ | สถานะ |
|--------|-------|
| คนเป็นเจ้าของผลงาน (ระบุชัดใน AGENTS.md) | ✅ |
| Luna = interface เดียว | ✅ |
| Human-in-the-loop | ✅ |
| Disclosure rule (mark งาน AI) | ✅ (กฎมีแล้ว) |

## ✅ เสา 3: Quality

| รายการ | สถานะ |
|--------|-------|
| Review gates 4 ชั้น | ✅ |
| นิยาม critical + adversarial verify | ✅ |
| /code-review สำหรับ AI code | ✅ |
| SLA เวลา verify | 🟡 |

## 📊 เสา 4: Auditability

| รายการ | สถานะ |
|--------|-------|
| Decision log + daily log (มีโครงสร้าง) | ✅ |
| Audit trail per-agent บน dashboard (15 วัน) | ✅ |
| Weekly audit (Polaris) | 🟡 (manual trigger) |
| บันทึก decision สม่ำเสมอ | 🟡 (ต้องมีวินัย) |

---

## 🎯 Maturity ปัจจุบัน

**Tier 2 — Documented + Partially Enforced**
- ✅ Policy ชัด + เอกสารครบ
- ✅ Enforce บางส่วน (deny list บังคับจริง)
- 🟡 ยังไม่มี hook enforcement เต็มรูปแบบ (PreToolUse classifier) → เป้า Tier 3 ภายหลัง

---

*ใช้ checklist นี้ทบทวนทุกไตรมาส — อัปเดตสถานะตามความจริง*
