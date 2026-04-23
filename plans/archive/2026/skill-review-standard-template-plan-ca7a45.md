# แผนสร้าง Agent Skill Review Standard Template

แผนนี้มีวัตถุประสงค์เพื่อสร้าง agent skill ใหม่ที่ใช้มาตรฐานจาก `frontend-repo-review` เพื่อรีวิวความสมบูรณ์ของ agent skills อื่นๆ เป็นมาตรฐาน

## มาตรฐานที่จะนำมาจาก frontend-repo-review

### 1. โครงสร้าง Directory มาตรฐาน
```
skill-name/
├── SKILL.md                    🧠 สมองของ agent
├── README.md                   📖 คู่มือการใช้ (Junior-friendly)
├── assets/                     📁 เอกสารทำงาน
│   ├── review-report-template.md  📄 แม่แบบรายงาน
│   └── intake-template.md         📄 แบบสอบถามก่อนรีวิว
└── references/                 📁 คู่มืออ้างอิง
    ├── review-checklist.md        📋 Checklist หลัก
    ├── domain-heuristics.md       🔧 ความรู้เฉพาะทาง
    └── severity-guide.md          ⚖️ ระดับความรุนแรง
```

### 2. มาตรฐาน SKILL.md
- **Required Fields:** name, description, metadata
- **Role Definition:** กำหนดบทบาทชัดเจน
- **Workflow:** 5-6 ขั้นตอนการทำงาน
- **Usage Guidelines:** เวลาใช้งาน
- **Output Guidelines:** สิ่งที่ต้องสร้าง

### 3. มาตรฐาน Content Quality
- **Junior-Friendly:** ภาษาง่าย, ตัวอย่างโค้ด
- **Comprehensive:** ครอบคลุมทุกด้านของ domain
- **Actionable:** มีตัวอย่าง Before/After
- **Practical:** ใช้ได้จริงใน production

### 4. มาตรฐาน Supporting Files
- **Checklist:** แบ่งตามระดับความยาก
- **Templates:** สำหรับรีวิวและรายงาน
- **Domain Knowledge:** heuristics เฉพาะทาง
- **Severity Guide:** ระดับความรุนแรงชัดเจน

## Agent Skill ที่จะสร้าง: `skill-review-standard`

### 🎯 วัตถุประสงค์
รีวิว agent skills ว่าครบถ้วนตามมาตรฐานหรือไม่

### 📋 สิ่งที่ตรวจสอบ
1. **Structure Compliance** - โครงสร้างตามมาตรฐาน
2. **Content Quality** - ความสมบูรณ์ของเนื้อหา
3. **Documentation** - README และคู่มือ
4. **Practicality** - ใช้ได้จริงหรือไม่
5. **Best Practices** - มี extras ที่ดีกว่ามาตรฐาน

### 🏗️ โครงสร้างที่จะสร้าง
```
skill-review-standard/
├── SKILL.md
├── README.md
├── assets/
│   ├── skill-review-report-template.md
│   └── skill-intake-template.md
└── references/
    ├── skill-review-checklist.md
    ├── skill-category-heuristics.md
    └── skill-severity-guide.md
```

## เนื้อหาที่จะสร้าง

### 1. SKILL.md
- Role: Skill Quality Assurance Agent
- Workflow: 5 ขั้นตอนการรีวิว skill
- Verdict: APPROVED/NEEDS_IMPROVEMENT/REWRITE_REQUIRED

### 2. README.md
- Quick Start สำหรับ skill creators
- มาตรฐานการสร้าง skill
- วิธีใช้ skill-review-standard

### 3. Review Checklist
- **Structure Review** - directory, files, naming
- **Content Review** - SKILL.md, references, assets
- **Quality Review** - documentation, examples
- **Compliance Review** - Windsurf standards

### 4. Templates
- **Skill Intake** - เก็บข้อมูลก่อนรีวิว skill
- **Review Report** - รายงานผลการรีวิว skill

### 5. Domain Heuristics
- **Code Skills** - สิ่งที่ต้องตรวจสำหรับ coding skills
- **DevOps Skills** - สิ่งที่ต้องตรวจสำหรับ deployment skills
- **Design Skills** - สิ่งที่ต้องตรวจสำหรับ design skills
- **Testing Skills** - สิ่งที่ต้องตรวจสำหรับ testing skills

## การปรับปรุงจาก frontend-repo-review

### ที่จะเก็บไว้:
- ✅ โครงสร้าง directory มาตรฐาน
- ✅ รูปแบบ YAML frontmatter
- ✅ การแบ่งระดับความยาก
- ✅ ตัวอย่าง Before/After
- ✅ Junior-friendly approach
- ✅ Template system
- ✅ README documentation

### ที่จะปรับเปลี่ยน:
- 🔄 เปลี่ยนจาก frontend เป็น skill domain
- 🔄 เปลี่ยนจาก code review เป็น skill review
- 🔄 ปรับ heuristics สำหรับ skill categories
- 🔄 ปรับ severity สำหรับ skill quality

## ผลลัพธ์ที่คาดหวัง

1. **Standard Template** - สำหรับสร้าง agent skills ในอนาคต
2. **Quality Gate** - ตรวจสอบความสมบูรณ์ของ skills
3. **Consistency** - ทำให้ทุก skill มีมาตรฐานเดียวกัน
4. **Learning Tool** - สอนคนใหม่ให้สร้าง skills ที่ดี
5. **Maintenance** - ช่วย maintain skills ให้คุณภาพ

## ขั้นตอนการสร้าง

1. สร้าง directory structure ตามมาตรฐาน
2. เขียน SKILL.md สำหรับ skill review
3. สร้าง README.md สำหรับ skill creators
4. สร้าง review checklist สำหรับ skill domains
5. สร้าง templates สำหรับ intake และ report
6. สร้าง domain heuristics สำหรับ skill categories
7. ทดสอบกับ existing skills
