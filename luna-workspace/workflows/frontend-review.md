---
description: รีวิว frontend codebase ตามมาตรฐานสากล 8 dimensions เพื่อประเมินความพร้อมก่อน merge, ขึ้น production หรือส่งเข้า PRD
---

# Frontend Review Workflow

วิธีการรีวิว frontend code โดยใช้ Stella (Frontend Dev) และ skill `frontend-repo-review`

## 📋 Flow การรีวิว

```
พี่แมน → Luna → Stella (ใช้ skill + template) → Luna → พี่แมน
```

## 🚀 ขั้นตอน

### Step 1: พี่แมนขอรีวิว
พี่แมนคุยกับ Luna:
- "ช่วยรีวิว frontend code ให้หน่อย"
- "รีวิว frontend ก่อนขึ้น PRD หน่อย"
- "ตรวจสอบ frontend code ก่อน merge PR หน่อย"

### Step 2: Luna วิเคราะห์และเรียก Stella
Luna วิเคราะห์:
- Domain: Frontend review
- Role: Stella (Frontend Dev)
- Skill: `frontend-repo-review` (อยู่ที่ `team/stella/skills/frontend-repo-review/`)

Luna เรียก Stella:
- "Stella ช่วยรีวิว frontend code ให้พี่แมนหน่อย"
- ให้ path ของ repo ที่ต้องรีวิว

### Step 3: Stella ทำงานในนาม Stella
Stella อ่าน skill จาก `team/stella/skills/frontend-repo-review/`:
1. **Scan Codebase**
   - อ่าน project structure
   - ดู dependencies (package.json)
   - ดู configuration files

2. **Review ตาม 8 Dimensions**
   - Functional Correctness
   - Architecture
   - Maintainability
   - Accessibility
   - Performance
   - Security
   - Testing
   - Production Readiness

3. **Generate Report**
   - อ่าน template จาก `templates/frontend-review.template.md`
   - Fill in ข้อมูลตามผลการ review
   - Save report ไปยัง location ที่เหมาะสม

### Step 4: Stella ส่งผลลัพธ์กลับ Luna
Stella ส่ง report ให้ Luna:
- "รีวิวเสร็จแล้วค่ะ นี่คือ report"
- แนบ report ที่สร้าง

### Step 5: Luna รีวิวและสรุปให้พี่แมน
Luna รีวิวงาน Stella:
- ตรวจสอบว่า review ครอบคลุมไหม
- ตรวจสอบว่า recommendations actionable ไหม

Luna สรุปให้พี่แมน:
- "รีวิวเสร็จแล้วค่ะพี่แมน สรุปดังนี้..."
- แสดง Executive Summary
- แสดง Critical Issues (ถ้ามี)
- แสดง Production Readiness Decision

## 📁 Files ที่เกี่ยวข้อง

### Skill
- `team/stella/skills/frontend-repo-review/SKILL.md` - Skill definition
- `team/stella/skills/frontend-repo-review/README.md` - Skill overview
- `team/stella/skills/frontend-repo-review/checklist.md` - Quick reference checklist
- `team/stella/skills/frontend-repo-review/references/best-practices.md` - Best practices reference
- `team/stella/skills/frontend-repo-review/references/security-checklist.md` - Security checklist

### Template
- `templates/frontend-review.template.md` - Template สำหรับสร้าง report

### Role
- `team/roles/stella.md` - Stella role definition (ชี้ไป skill)

## 🎯 ตัวอย่างการใช้

### พี่แมน:
```
"ลูน่า ช่วยรีวิว frontend project นี้ก่อนขึ้น PRD หน่อย"
```

### Luna:
```
✓ Pre-Response: Frontend review → Role: Stella

เข้าใจค่ะพี่แมน! ลูน่าจะเรียก Stella มารีวิว frontend code ให้

[เรียก Stella ทำงาน]

Stella รีวิวเสร็จแล้วค่ะ สรุปดังนี้:

📊 Executive Summary
- Overall Status: Needs Work
- Overall Score: 6/10
- Production Readiness: ❌ Not Ready

🔴 Critical Issues (Must Fix Before PRD)
1. XSS vulnerability ใน component X
2. Missing authentication check

🟠 High Issues
...

✅ Production Readiness Decision
Not Ready - ต้องแก้ Critical issues ก่อน
```

## 📝 Notes

- พี่แมนคุยกับ Luna เท่านั้น - Stella ไม่คุยกับพี่แมนโดยตรง
- Stella ใช้ skill เป็น manual guide - อ่านจาก `team/stella/skills/frontend-repo-review/`
- Luna เป็น interface - รับคำสั่งจากพี่แมน, มอบหมายให้ Stella, รีวิวผลลัพธ์, สรุปให้พี่แมน
- Skill ไม่ auto-invoke เพราะอยู่ใต้ luna-workspace ไม่ใช่ `~/.claude/skills/`

---
*Workflow สำหรับ Frontend Review - ใช้โดย Luna และ Stella*
