---
title: AI Governance — ภาพรวม
pillar: overview
status: done
order: 0
updated: 2026-06-11
---

# 🛡️ AI Governance — ระบบ Luna

*ชุดเอกสารกำกับการใช้ AI อย่างมีความรับผิดชอบ — ส่งให้หัวหน้างาน / IT / ลูกค้า ดูได้*

---

## 4 เสาหลัก

| เสา | สาระ | เอกสาร |
|-----|------|--------|
| 🔒 **Data Security** | ข้อมูลอะไรส่ง AI ได้/ไม่ได้ + กลไกบังคับ | [[data-classification]] |
| 👤 **Accountability** | คนเป็นเจ้าของผลงาน + human-in-the-loop | [[ai-usage-policy]] |
| ✅ **Quality** | review งาน AI ก่อนใช้ | [[quality-accountability]] |
| 📊 **Auditability** | ตรวจย้อนหลังได้ว่า agent ทำอะไร | [[governance-checklist]] + Dashboard Audit |

มาตรฐานอ้างอิง: [[framework-mapping]] (NIST AI RMF / ISO 42001 / EU AI Act)

---

## กลไกบังคับใช้จริง (ไม่ใช่แค่เอกสาร)

- 🛡️ `opencode.json → permissions` — block อ่านไฟล์ secret อัตโนมัติ (ชั้นเสริม เลี่ยงได้ด้วย shell/grep/8.3)
- 📜 `rules/data-handling.md` — กฎ data classification ที่ Luna ยึดถือ
- 🧭 `AGENTS.md → Governance` — accountability + disclosure + data handling
- 🔍 Dashboard → Audit — log per-agent ย้อนหลัง 15 วัน

---

## Maturity

**ปัจจุบัน: Tier 2** (Documented + Partially Enforced) → **เป้า: Tier 3** (Full Enforcement ผ่าน hook)

---

## โครงสร้างโฟลเดอร์

```
governance/
├── README.md                  ← ภาพรวม (ไฟล์นี้)
├── ai-usage-policy.md         ← นโยบาย + accountability
├── data-classification.md     ← เสา Data Security
├── quality-accountability.md  ← เสา Quality
├── governance-checklist.md    ← เสา Auditability + สถานะจริง
└── framework-mapping.md       ← NIST / ISO / EU mapping
```

*เอกสารทั้งหมดแสดงบน luna-dashboard → แท็บ 🛡️ Governance*
