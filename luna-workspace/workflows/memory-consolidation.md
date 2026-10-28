# Memory Consolidation Workflow

*รัน skill `anthropic-skills:consolidate-memory` ทุกเดือน เพื่อ maintain memory quality*

---

## จุดประสงค์

Claude memory สะสม entries ข้าม session — ถ้าปล่อยทิ้งไว้จะมี:
- Duplicate entries (เรื่องเดิม บันทึกหลายครั้ง)
- Stale facts (ข้อมูลที่ outdated แล้ว)
- Index bloat (ค้นหาช้า, เปลืองบริบท)

## Trigger

- วันที่ 1 ของทุกเดือน (auto-remind — Luna ตรวจเองเมื่อขึ้นเดือนใหม่)
- หรือเมื่อสังเกตเห็น memory entries > 50 รายการ
- หรือพี่แมนสั่งตรงๆ

## ขั้นตอน

### 1. Luna Trigger Skill
```
/anthropic-skills:consolidate-memory
```

### 2. Review Diff
Luna แสดง diff ของการเปลี่ยนแปลงก่อน apply:
- Entries ที่จะ merge (duplicates)
- Entries ที่จะลบ (stale / contradicted)
- Entries ที่จะ update (outdated facts)

### 3. พี่แมน Confirm
- ถ้า diff ดูสมเหตุสมผล → apply
- ถ้ามี entry สำคัญที่ไม่ควรลบ → แจ้ง Luna ก่อน apply

### 4. รายงานสรุป
Luna รายงาน:
- จำนวน entries ก่อน/หลัง
- รายการที่ merge/ลบ/update
- บันทึกเป็น decision log ถ้ามีการเปลี่ยนแปลงมาก

## หมายเหตุ

- ไม่ลบ `type=feedback` entries โดยไม่มีเหตุผล — เป็น learning record สำคัญ
- `type=project` ที่ repo ปิดแล้ว → ย้าย archive ก่อนลบ
- หลัง consolidate → recall ครั้งแรกอาจช้ากว่าปกติ (index rebuild)

---
*สร้าง 2026-05-25: Phase 3*
