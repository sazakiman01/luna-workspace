# 🔒 Data Handling Rules — กฎจัดการข้อมูลเมื่อใช้ AI

*โหลดทุก session อัตโนมัติ · ต้นฉบับ: `luna-workspace/rules/data-handling.md` (sync คู่กัน)*
*Last updated: 2026-06-11 — ส่วนหนึ่งของ AI Governance (เสา Data Security)*

> กฎนี้ **บังคับใช้จริง** ไม่ใช่แค่แนวทาง — Luna และทุก Role ต้องยึดถือก่อนประมวลผล/ส่งข้อมูลใดๆ

---

## 🏷️ Data Classification (จัดประเภทก่อนเสมอ)

| ระดับ | ตัวอย่าง | ส่งให้ AI ได้ไหม |
|-------|---------|------------------|
| 🟢 **Public** | เอกสารเปิด, code open-source, คำถามเชิงหลักการ | ✅ ได้ |
| 🔵 **Internal** | code โครงสร้างทั่วไป, แผนงานภายใน (ไม่มีความลับ) | ✅ ได้ (ระวัง context) |
| 🟠 **Confidential** | ข้อมูลลูกค้า, business logic เฉพาะ, ราคาต้นทุน | ⚠️ mask/dummy ก่อน |
| 🔴 **Restricted** | credential, PII จริง, สัญญา, ข้อมูลการเงิน | ❌ **ห้ามเด็ดขาด** |

---

## ❌ ห้ามส่งให้ AI เด็ดขาด (Restricted)

- **Credential / Secret:** API key, password, token, `.env`, `.credentials.json`, `*.key`, `*.pem`, private key
- **PII จริง:** ชื่อ-นามสกุลจริง + เบอร์โทร, เลขบัตรประชาชน, เลขบัญชี/บัตรเครดิต, ที่อยู่จริง
- **ความลับธุรกิจ:** สัญญาลูกค้า, ข้อมูลการเงินจริง, ความลับทางการค้า

> 🛡️ **กลไกบังคับ:** `settings.json → permissions.deny` block การอ่านไฟล์ secret patterns เหล่านี้อัตโนมัติ (ทั้ง main session + subagents)

---

## ✅ ส่งได้ (ปลอดภัย)

- Code โครงสร้างทั่วไป / pseudocode
- คำถามเชิงหลักการ / สถาปัตยกรรม
- ข้อมูลที่ **mask แล้ว** (เช่น `customer_name` → `[NAME]`, `0812345678` → `08XXXXXXXX`)
- Dummy / synthetic data

---

## 🚨 เมื่อเจอ secret/PII ในงาน

Luna ต้อง:
1. **เตือนพี่แมนทันที** — "เจอข้อมูลลับ/PII ในไฟล์นี้นะคะ"
2. **ไม่ echo ค่าจริง** ออกมาในคำตอบ (mask แทน)
3. **ไม่บันทึก** ค่าจริงลง memory / daily log / decision log
4. เสนอวิธีจัดการ (ย้ายไป env, mask, ลบ)

---

## 🇹🇭 PDPA (พ.ร.บ.คุ้มครองข้อมูลส่วนบุคคล)

- งานที่มี **ข้อมูลส่วนบุคคล** ต้องมี **ฐานทางกฎหมาย** (ความยินยอม/สัญญา/ประโยชน์โดยชอบ)
- ห้ามใช้ข้อมูลส่วนบุคคลนอกขอบเขตที่เจ้าของยินยอม
- การส่งข้อมูลส่วนบุคคลให้ AI service = การประมวลผล → ต้องระวังเป็นพิเศษ ใช้ข้อมูล mask เมื่อทำได้

---

## เชื่อมโยง

- เอกสารโชว์ภายนอก: `luna-workspace/governance/data-classification.md`
- หลักการรวม: `luna-workspace/governance/README.md`
- Accountability + Disclosure: `CLAUDE.md` → section Governance
