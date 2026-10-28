---
title: คุณภาพ & ความรับผิดชอบ (Quality & Accountability)
pillar: quality
status: done
order: 3
updated: 2026-06-11
---

# ✅ คุณภาพงาน & ความรับผิดชอบ

*เสา Quality — งานที่ AI ทำต้องผ่านการตรวจ*

---

## 1. หลักการ

> AI ช่วยร่าง — **คนรับผิดชอบและอนุมัติขั้นสุดท้าย**

Code/งานที่ AI สร้าง ต้องผ่าน review เหมือนงานที่คนเขียน ไม่ใช้ทันทีโดยไม่ตรวจ

---

## 2. Review Gates ที่มีอยู่จริง

| ชั้น | กลไก | ใครทำ |
|------|------|-------|
| 1. Self-check | Luna ตรวจ output ก่อนส่ง | Luna |
| 2. Skill review | `/frontend-review`, `/backend-api-review`, `/bpmn-review` | Stella / Nova / Comet |
| 3. Adversarial verify | งาน critical → agent คนละตัวตรวจ | Sirius (QA) / Polaris (audit) |
| 4. Human approval | พี่แมนอนุมัติขั้นสุดท้าย | พี่แมน |

---

## 3. งาน Critical = ต้อง verify โดย agent อื่น

นิยาม critical (ห้าม self-approve):
- 🔐 Security (auth, permission, secret)
- 🗄️ Schema / database migration
- 💰 Money / financial logic
- 🚀 Production deploy
- 👤 Customer data

→ ใช้ pattern **adversarial-verify**: agent ที่ทำ ≠ agent ที่ตรวจ

---

## 4. Code Review สำหรับ AI-generated code

- ผ่าน `/code-review` (built-in) ตรวจ correctness + reuse + efficiency
- หรือ skill review เฉพาะ layer
- บันทึกผลว่า "ผ่าน review แล้ว" ในงานสำคัญ → audit trail

---

## 5. ความรับผิดชอบชัดเจน

- **Luna = Interface เดียว** — Role อื่นไม่คุยกับพี่แมนโดยตรง → ไม่สับสนว่าใครทำอะไร
- ผลงานสุดท้าย = ความรับผิดชอบของพี่แมน (เจ้าของ)
- ดู [[ai-usage-policy]] ข้อ 2

---

*สถานะ: done — review gates ครบ 4 ชั้น, นิยาม critical ชัดเจน*
