---
title: การจัดประเภทข้อมูล & ความลับ (Data Classification)
pillar: data-security
status: partial
updated: 2026-06-11
order: 2
---

# 🔒 การจัดประเภทข้อมูล & การป้องกันความลับ

*เสา Data Security — ข้อมูลอะไรส่งให้ AI ได้/ไม่ได้*

> เอกสารนี้คือ "มุมโชว์ภายนอก" ของกฎบังคับใช้ `rules/data-handling.md`

---

## 🏷️ 4 ระดับชั้นข้อมูล

| ระดับ | ตัวอย่าง | ส่งให้ AI |
|-------|---------|-----------|
| 🟢 Public | เอกสารเปิด, open-source code, คำถามหลักการ | ✅ ได้ |
| 🔵 Internal | code โครงสร้างทั่วไป, แผนงานภายใน | ✅ ได้ (ระวัง context) |
| 🟠 Confidential | ข้อมูลลูกค้า, business logic, ต้นทุน | ⚠️ mask/dummy ก่อน |
| 🔴 Restricted | credential, PII จริง, สัญญา, การเงิน | ❌ ห้ามเด็ดขาด |

---

## ❌ ห้ามส่งเด็ดขาด

- **Secret/Credential:** API key, password, token, `.env`, `.credentials.json`, `*.key`, `*.pem`
- **PII จริง:** ชื่อจริง+เบอร์, เลขบัตรประชาชน, เลขบัญชี/บัตรเครดิต
- **ความลับธุรกิจ:** สัญญาลูกค้า, ข้อมูลการเงินจริง

### 🛡️ กลไกบังคับ (Enforcement — ไม่ใช่แค่กฎบนกระดาษ)
`opencode.json → permissions` (rule `read` effect `deny`) block การอ่านไฟล์ secret patterns อัตโนมัติ ทั้ง main session + subagents (rule ระดับ global ถูก merge เข้าทุก agent):
```
*.env / *.env.* / *credentials.json / *credentials / *.key / *.pem / *secrets* / *.aws* / *::* ฯลฯ (รายการเต็มดู opencode.json)
```
⚠️ เป็น **ชั้นเสริม ไม่ใช่ security boundary** — เลี่ยงได้ด้วย shell `cat` / grep tool / ชื่อสั้น 8.3 (ผล Sirius verify 2026-10-28) · *เดิม (Claude Code): `settings.json → permissions.deny`*

---

## ✅ ส่งได้อย่างปลอดภัย

- Code โครงสร้างทั่วไป / pseudocode
- คำถามเชิงสถาปัตยกรรม/หลักการ
- ข้อมูล **mask แล้ว** (`0812345678` → `08XXXXXXXX`)
- Dummy / synthetic data

---

## 🇹🇭 PDPA

- ข้อมูลส่วนบุคคล → ต้องมีฐานทางกฎหมาย (ยินยอม/สัญญา/ประโยชน์โดยชอบ)
- ห้ามใช้นอกขอบเขตที่เจ้าของยินยอม
- ส่งข้อมูลส่วนบุคคลให้ AI = การประมวลผล → ใช้ข้อมูล mask เมื่อทำได้

---

## 📌 สถานะ (partial → กำลังเสริม)

- ✅ Deny list บังคับใช้แล้ว (`opencode.json → permissions` — ชั้นเสริม เลี่ยงได้)
- ✅ กฎ data-handling.md เขียนแล้ว
- 🟡 ยังไม่มี auto-scanner ตรวจ PII ในเนื้อหา (ระดับ 3 — ภายหลัง)
