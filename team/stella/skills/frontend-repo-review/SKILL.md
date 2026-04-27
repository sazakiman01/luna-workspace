---
description: รีวิว Frontend repository, pull request และ release candidate เพื่อประเมินความพร้อมก่อน merge และก่อนขึ้น production ใช้เมื่อผู้ใช้ต้องการ review React, Next.js, Vue, Angular, JavaScript หรือ TypeScript ในมุมของ functional correctness, architecture, maintainability, accessibility, performance, security, testing และ production readiness
---

# Frontend Repo Review Skill

## 🎯 Purpose

รีวิว frontend codebase ตามมาตรฐานสากลเพื่อประเมินความพร้อมก่อน:
- Merge pull request
- ขึ้น production
- ส่งงานเข้า PRD

## 📋 Review Criteria (8 Dimensions)

### 1. Functional Correctness
- Code ทำงานตรงตาม requirement ไหม
- Edge cases ครอบคลุมไหม
- Error handling ดีพอไหม
- Business logic ถูกต้องไหม

### 2. Architecture
- Component structure เป็นระเบียบไหม
- Separation of concerns ดีไหม (logic vs view)
- Reusability ของ components
- State management เหมาะสมไหม (Redux, Context, Zustand ฯลฯ)
- Folder structure ตรงตาม convention ไหม

### 3. Maintainability
- Code อ่านง่ายไหม (naming, comments)
- DRY principle ถูกใช้ไหม
- Consistency ใน code style
- Documentation เพียงพอไหม
- Code complexity ไม่สูงเกินไป

### 4. Accessibility
- Semantic HTML ใช้ถูกต้องไหม
- Keyboard navigation รองรับไหม
- ARIA labels มีไหม
- Color contrast เพียงพอไหม
- Screen reader support ดีไหม

### 5. Performance
- Bundle size ไม่ใหญ่เกินไป
- Lazy loading ใช้ไหม
- Unnecessary re-renders ลดลงไหม
- Images optimized ไหม
- Memory leaks มีไหม
- Loading states มีไหม

### 6. Security
- XSS vulnerabilities มีไหม
- Sensitive data ไม่โล่งไหม
- Input validation ดีไหม
- API calls ปลอดภัยไหม
- Environment variables ใช้ถูกต้องไหม
- Authentication/Authorization ดีไหม

### 7. Testing
- Unit tests ครอบคลุมไหม
- Integration tests มีไหม
- E2E tests จำเป็นไหม
- Test coverage เพียงพอไหม
- Test quality ดีไหม (not just coverage)

### 8. Production Readiness
- Environment variables ตั้งค่าดีไหม
- Build process พร้อมไหม
- Error tracking (Sentry ฯลฯ) มีไหม
- Monitoring พร้อมไหม
- Rollback plan มีไหม
- Documentation สำหรับ deployment มีไหม

## 🔍 Review Process

### Step 1: Scan Codebase
- อ่าน project structure
- ดู dependencies (package.json)
- ดู configuration files

### Step 2: Analyze Each Dimension
- ทำการ review ตาม 8 dimensions ข้างบน
- ให้คะแนน/ระดับ (Critical/Major/Minor/OK)
- ระบุไฟล์/บรรทัดที่มีปัญหา

### Step 3: Generate Report
- สรุปผลการ review
- แยกเป็น Critical issues (ต้องแก้ก่อน merge)
- Major issues (ควรแก้ก่อน production)
- Minor issues (แก้ได้ทีหลัง)
- Recommendations สำหรับ improvement

### Step 4: Production Readiness Assessment
- ตอบคำถาม: พร้อมขึ้น production ไหม?
- ถ้าไม่พร้อม: บอกว่าต้องแก้อะไรก่อน
- ถ้าพร้อม: บอกว่าอะไรควร monitor พิเศษ

## 📊 Output Format

ใช้ template `templates/frontend-review.template.md` สำหรับสร้าง report

Template นี้ประกอบด้วย:
- Executive Summary (สุขภาพโดยรวม, Overall Score, Production Readiness)
- Frontend Dimension Scores (8 dimensions พร้อม scores)
- Detailed Findings (Strengths, Issues แยกตาม severity)
- Priority Action Items (แยกตาม timeline)
- Framework-Specific Findings (React/Next.js/Vue/Angular/TypeScript)
- Frontend Best Practices Recommendations
- Production Readiness Assessment (Checklist + Decision)

**การใช้ template:**
1. อ่าน template จาก `templates/frontend-review.template.md`
2. Fill in ข้อมูลตามผลการ review
3. Save report ไปยัง location ที่เหมาะสม (เช่น `.windsurf/reviews/` หรือ repo-specific location)

## 🎯 Priority Levels

### Critical (Blocker)
- Security vulnerabilities
- Data loss risk
- Broken core functionality
- Performance that makes app unusable

### Major
- Accessibility violations
- Performance issues
- Code smell ที่ส่งผลต่อ maintainability อย่างมาก
- Missing error handling

### Minor
- Code style inconsistencies
- Missing comments
- Small performance optimizations
- Nice-to-have features

## 🔧 Tools to Use

- **Grep** - ค้นหา patterns ใน code
- **Read** - อ่านไฟล์ source code
- **Find** - ค้นหาไฟล์ตาม pattern
- **Edit/Multi-edit** - แก้ไข code (ถ้าได้รับอนุญาต)

## 🚀 When to Use This Skill

เรียกใช้เมื่อ:
- User ขอ review frontend codebase
- User ต้องการประเมินความพร้อมก่อน merge PR
- User ต้องการประเมินความพร้อมก่อนขึ้น production
- User ต้องการ review ก่อนส่งเข้า PRD
- Project ใช้ React, Next.js, Vue, Angular, JavaScript หรือ TypeScript

## 📝 Notes

- Focus ที่ issues ที่สำคัญที่สุดก่อน (Critical → Major → Minor)
- ให้ feedback ที่ constructive และ actionable
- ถ้าไม่แน่ใจเรื่อง technical decision ให้ถาม user
- Respect existing code style ถ้าไม่มีปัญหา
- Consider context: prototype vs production code

---
*Skill ของ Stella (Frontend Dev) - Maintained by Lyra (Windsurf Tooling)*
