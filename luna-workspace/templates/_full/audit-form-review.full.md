# [Form Name] Audit Form Review - [Reviewer Name]

**Date:** YYYY-MM-DD
**Reviewer:** [Reviewer Name] ([Role])
**Repo:** [repo-name]
**Form:** [form-name / form-id] version [X.Y]
**Scope:** [ขอบเขตการรีวิว เช่น New form, Schema change PR #123, Full form audit]
**Review Time:** [HH:MM]
**Review Round:** [N]

**File Naming Convention:** `YYYY-MM-DD-<form>.md`
**Example:** `2026-07-23-safety-inspection-v2.md`
**Save Location:** `<repo>/Luna/reviews/audit-form/`

---

## 🎯 TL;DR สำหรับ Junior (อ่าน 30 วิ)

> **อ่านแค่ส่วนนี้ก็เข้าใจภาพรวมได้ทันที**

- **สุขภาพโดยรวม:** [ดีมาก/ดี/ปานกลาง/ต้องปรับปรุง] ✅/⚠️/❌
- **Overall Score:** [X]/10
- **Production Ready?:** [✅ Ready / ⚠️ Ready with Minor Concerns / ❌ Not Ready]

**3 เรื่องที่ต้องรู้ก่อน:**

1. **[เรื่องที่ 1 - สำคัญสุด]** → ดูรายละเอียดใน [Action Plan](#-action-plan-สิ่งที่ต้องทำ)
2. **[เรื่องที่ 2]** → ดูรายละเอียดใน [Detailed Findings](#-detailed-findings)
3. **[เรื่องที่ 3]** → ดูรายละเอียดใน [Scoring & Audit Logic Verification](#-scoring--audit-logic-verification)

**ต้องทำก่อนอะไร?** → เลื่อนไปอ่าน **"Action Plan"** ด้านล่างได้เลย

---

## 🚨 Action Plan (สิ่งที่ต้องทำ)

> **Junior เริ่มที่ส่วนนี้** — บอกชัดว่าทำอะไร ทำไม ที่ไหน

### 🔴 ต้องทำทันที (Critical - Blocker)

**ไม่มี** หรือ [รายการ action items]

1. **[ชื่อปัญหาสั้นๆ]** — `[field/section หรือ file path]`
   - **ทำอะไร:** [1 ประโยค]
   - **ทำไม:** [1 ประโยค เช่น "คะแนนคำนวณผิด", "ข้อมูล audit หายได้"]
   - **ดูรายละเอียด:** → [Issues > Critical #1](#-critical-ต้องแก้ก่อน-mergeproduction)

### 🟠 ต้องทำก่อน Production (High)

1. **[ชื่อปัญหาสั้นๆ]** — `[field/section หรือ file path]`
   - **ทำอะไร:** [1 ประโยค]
   - **ทำไม:** [1 ประโยค]
   - **ดูรายละเอียด:** → [Issues > High #1](#-high-ควรแก้ก่อน-production)

### 🟡 ควรทำภายใน 1-2 สัปดาห์ (Medium)

1. **[ชื่อปัญหาสั้นๆ]** — `[field/section]`
   - **ทำอะไร:** [1 ประโยค]
   - **ดูรายละเอียด:** → [Issues > Medium #1](#-medium-ควรแก้ภายใน-1-2-สัปดาห์)

### 🟢 ควรทำภายใน 1-3 เดือน (Low)

1. **[ชื่อปัญหาสั้นๆ]** — [ส่วนที่เกี่ยวข้อง]
   - **ทำอะไร:** [1 ประโยค]

---

## 📊 Audit Form Dimension Scores (ภาพรวมคะแนน)

| ด้าน | Score | Status | หมายเหตุ |
|------|-------|--------|----------|
| **Schema Definition** (โครงสร้าง schema) | [X]/10 | ✅/⚠️/❌ | [สั้นๆ] |
| **Validation Rules** (กฎ validation) | [X]/10 | ✅/⚠️/❌ | [สั้นๆ] |
| **Audit Logic** (scoring/weighting/pass-fail) | [X]/10 | ✅/⚠️/❌ | [สั้นๆ] |
| **Conditional Visibility** (show/hide logic) | [X]/10 | ✅/⚠️/❌ | [สั้นๆ] |
| **Data Integrity** (ความถูกต้องของข้อมูล) | [X]/10 | ✅/⚠️/❌ | [สั้นๆ] |
| **Traceability** (audit trail) | [X]/10 | ✅/⚠️/❌ | [สั้นๆ] |
| **Form UX** (flow/grouping/mobile) | [X]/10 | ✅/⚠️/❌ | [สั้นๆ] |
| **i18n / Labels** (ภาษาไทย) | [X]/10 | ✅/⚠️/❌ | [สั้นๆ] |
| **Edge Case Handling** (empty/partial/resubmit) | [X]/10 | ✅/⚠️/❌ | [สั้นๆ] |
| **Production Readiness** (พร้อมใช้จริง) | [X]/10 | ✅/⚠️/❌ | [สั้นๆ] |

---

## 📐 Scoring Criteria (optional)

> อธิบายวิธีคำนวณคะแนน เพื่อให้เข้าใจว่าทำไมคะแนนไม่เต็ม

**Action Plan vs Dimension Scores:**
- **Action Plan** = Requirements (ต้องมีถึงจะขึ้น production)
  - Critical/High/Medium = ต้องแก้ก่อนขึ้น production ❌
  - Low = ควรแก้ แต่ไม่ block production ⚠️
  - ไม่มี Critical/High/Medium = พร้อมขึ้น production ✅
- **Dimension Scores** = Best Practices (คุณภาพโดยรวม)
  - ไม่ใช่ requirements สำหรับขึ้น production
  - เป็นคะแนนคุณภาพโดยรวม

**Scoring Guide:**
- **10/10** = Perfect (มีทั้ง requirements + best practices ครบถ้วน)
- **9/10** = Excellent (มี requirements ครบ แต่ขาด best practices 1-2 อย่าง)
- **8/10** = Good (มี requirements ครบ แต่ขาด best practices 3-4 อย่าง)
- **6-7/10** = Acceptable (มี requirements แต่ขาดหลาย best practices)
- **<6/10** = Not Ready (ขาด requirements)

---

## 🔍 Detailed Findings

### ✅ Strengths (จุดแข็ง - ดีอยู่แล้ว คงรักษาไว้)

#### 1. [Category - เช่น Schema Definition]
- **[Aspect]:** [รายละเอียด]
- **[Aspect]:** [รายละเอียด]

#### 2. [Category - เช่น Audit Logic]
- **[Aspect]:** [รายละเอียด]

---

### ⚠️ Issues (ปัญหาที่เจอ แบ่งตามความสำคัญ)

#### 🔴 Critical (ต้องแก้ก่อน merge/production)

**ไม่พบ critical issues** หรือ [รายการ critical issues]

1. **[Issue Title]**
   - **ที่ไหน:** `[field id / section / file path]`
   - **ด้าน:** [เช่น Audit Logic, Data Integrity]
   - **ปัญหาคืออะไร:** [อธิบายแบบง่ายๆ ให้ junior เข้าใจ]
   - **ทำไมต้องแก้:** [เช่น "ผล audit ผิด ทำให้ตัดสิน pass/fail พลาด"]
   - **วิธีแก้:** [วิธีแก้ + ตัวอย่าง schema/rule ถ้าจำเป็น]

#### 🟠 High (ควรแก้ก่อน production)

1. **[Issue Title]**
   - **ที่ไหน:** `[field id / section / file path]`
   - **ด้าน:** [เช่น Validation Rules, Conditional Visibility]
   - **ปัญหาคืออะไร:** [อธิบายแบบง่ายๆ]
   - **ทำไมต้องแก้:** [เช่น "ข้อมูลเสียเข้าระบบได้", "field ค้างค่าเก่า"]
   - **วิธีแก้:** [วิธีแก้ + ตัวอย่าง]

#### 🟡 Medium (ควรแก้ภายใน 1-2 สัปดาห์)

1. **[Issue Title]**
   - **ที่ไหน:** `[field id / section]`
   - **ด้าน:** [เช่น Form UX, i18n]
   - **ปัญหาคืออะไร:** [อธิบายแบบง่ายๆ]
   - **ทำไมต้องแก้:** [เหตุผล]
   - **วิธีแก้:** [วิธีแก้]

#### 🟢 Low (ควรแก้ภายใน 1-3 เดือน)

1. **[Issue Title]**
   - **ที่ไหน:** `[field id / section]`
   - **ด้าน:** [เช่น Naming, Wording]
   - **ปัญหาคืออะไร:** [อธิบาย]
   - **วิธีแก้:** [วิธีแก้]

---

## 🧮 Scoring & Audit Logic Verification

> ตรวจสูตรคะแนนทีละส่วน — ส่วนที่ผิดพลาดแล้วเจ็บที่สุดของ audit form

### Weighting Matrix (ตรวจทุก section)

| Section | จำนวนข้อ | Weight | คะแนนเต็ม | หมายเหตุ |
|---------|---------|--------|-----------|----------|
| [Section 1] | [N] | [X]% | [Y] | [สั้นๆ] |
| [Section 2] | [N] | [X]% | [Y] | [สั้นๆ] |
| **รวม** | [N] | **ต้องได้ 100%** | [Y] | ✅/❌ |

### ✅ Checklist (ต้องเช็คทุกครั้ง)

- [ ] **Weight รวม = 100%** — หรือมี normalization ที่ถูกต้อง
- [ ] **คะแนนต่อข้อ** — scale เดียวกันทั้ง form (เช่น 0-5 ทุกข้อ) หรือระบุ scale ต่อข้อชัดเจน
- [ ] **Pass/fail threshold** — ค่า boundary ถูกต้อง (≥ vs > ตรงกับ business rule)
- [ ] **N/A handling** — ข้อที่ตอบ N/A ไม่ถูกนับเป็น 0 + weight ถูก redistribute
- [ ] **Conditional scoring** — ข้อที่ถูกซ่อน ไม่ถูกนำมาคำนวณ
- [ ] **Rounding** — จุดที่ปัดเศษระบุชัด (ปัดตอนไหน กี่ตำแหน่ง) + สม่ำเสมอ
- [ ] **Auto-fail rules** — ข้อ critical ที่ fail แล้ว fail ทั้ง form (ถ้ามี) ทำงานถูกต้อง

### 🧪 Sample Calculation (ทดสอบด้วยตัวอย่างจริง)

> ใส่ sample submission อย่างน้อย 3 ชุด: ผ่านชัดเจน / ตกชัดเจน / boundary case

1. **Case: [ชื่อ case เช่น คะแนนเท่ากับ threshold พอดี]**
   - **Input:** [คำตอบโดยย่อ]
   - **Expected:** [คะแนน + ผล pass/fail]
   - **Actual:** [ผลที่ระบบคำนวณ]
   - **Result:** ✅/❌

---

## 🔒 Data Integrity & Traceability Audit

> ตรวจว่าข้อมูล audit เชื่อถือได้และตรวจย้อนหลังได้

### ✅ Checklist (ต้องเช็คทุกครั้ง)

- [ ] **Field IDs/keys** — unique ทั้ง form + naming convention เดียว + ไม่มี ID ซ้ำข้าม version
- [ ] **Orphan fields** — ไม่มี field ใน schema ที่ไม่ถูก render / field ที่ render แต่ไม่อยู่ใน schema
- [ ] **Referential consistency** — option values, lookup keys, section refs ชี้ไปที่ที่มีอยู่จริง
- [ ] **Audit trail** — ทุกคำตอบเก็บ who/when + การแก้ไขเก็บ old value → new value
- [ ] **Resubmission** — submit ซ้ำเก็บเป็น version ใหม่ ไม่ overwrite ของเดิม
- [ ] **Form versioning** — submission ผูกกับ form version — แก้ form แล้ว submission เก่า render/คำนวณได้เหมือนเดิม
- [ ] **Immutability** — submission ที่ finalize แล้ว แก้ไม่ได้ (หรือแก้ได้เฉพาะ role ที่กำหนด + log ครบ)
- [ ] **Timestamps** — ใช้ timezone เดียวกัน (แนะนำ UTC + แสดงผลเป็นเวลาไทย)

### ❌ เจอปัญหา (ต้องแก้)

1. **[ปัญหา]**
   - **ที่ไหน:** `[field/collection/path]`
   - **เป็นอะไร:** [เช่น field ถูกลบจาก schema แต่ submission เก่ายังอ้างถึง]
   - **ทำไมต้องแก้:** [เช่น audit ย้อนหลังไม่ได้, ข้อมูลขัดแย้ง]
   - **วิธีแก้:** [วิธีแก้]

### 📊 Data Integrity Score

**Score:** [X]/10 | **Status:** ✅/⚠️/❌
**Notes:** [สรุปสั้นๆ]

---

## 🔧 Domain-Specific Findings

> สำหรับคนที่อยากรู้ลึก เกี่ยวกับส่วนประกอบของ form

### Schema & Validation

#### Field Types
- **Type Correctness:** [รายละเอียด — number/date/select/multi-select/file ใช้ถูก type]
- **Enum/Option Sets:** [รายละเอียด — options ครบ ไม่ซ้ำ ไม่มีค่ากำพร้า]
- **Default Values:** [รายละเอียด]

#### Validation Rules
- **Required/Optional:** [รายละเอียด]
- **min/max/regex:** [รายละเอียด]
- **Conditional Validation:** [รายละเอียด — required-when, visible-when]
- **Client/Server Parity:** [รายละเอียด — กฎตรงกันสองฝั่ง]

### Conditional Visibility Logic
- **Dependency Graph:** [รายละเอียด — ไม่มี circular dependency]
- **Hidden Field Behavior:** [รายละเอียด — เคลียร์ค่า + ไม่นับคะแนน]
- **Cascade Effects:** [รายละเอียด — เปลี่ยนคำตอบต้นทางแล้ว field ปลายทาง reset ถูกต้อง]

### Form UX (มุมมอง Vega/Stella)
- **Grouping & Ordering:** [รายละเอียด — เรียงตาม flow การเดินตรวจจริง]
- **Mobile-Friendliness:** [รายละเอียด — touch targets, กรอกมือเดียวได้, offline/poor signal]
- **Progress & Draft:** [รายละเอียด — save draft, resume, progress indicator]
- **Input Effort:** [รายละเอียด — ใช้ select/checkbox แทน free text เท่าที่ได้]

### i18n / Labels (ภาษาไทย)
- **Label Completeness:** [รายละเอียด — ครบทุก field/section/error message]
- **Terminology Consistency:** [รายละเอียด — ศัพท์ audit ใช้คำเดียวกันทั้ง form]
- **Tone & Clarity:** [รายละเอียด — ภาษาที่ผู้ตรวจหน้างานเข้าใจ ไม่ใช่ศัพท์ dev]

### Process Integration (ถ้ามี BPMN/Camunda)
- **Form-Task Binding:** [รายละเอียด — form key ผูกกับ user task ถูกตัว]
- **Variable Mapping:** [รายละเอียด — คำตอบ map เป็น process variables ถูกต้อง]
- **Gateway Conditions:** [รายละเอียด — ผล pass/fail ขับ gateway ถูกเส้น]

### Edge Cases
- **Empty Submission:** [รายละเอียด — submit ฟอร์มเปล่าถูก block หรือ handle ชัดเจน]
- **Partial Submission:** [รายละเอียด — draft ไม่ถูกคำนวณคะแนน / ไม่เข้ารายงาน]
- **Resubmission:** [รายละเอียด — เก็บ history, แสดง version ล่าสุดถูกต้อง]
- **Concurrent Edit:** [รายละเอียด — สองคนแก้ submission เดียวกันพร้อมกัน]

---

## 💡 Best Practices Learnings

> สิ่งที่ทำได้ดี + แนะนำเพิ่มเติม (ไม่ใช่ bug — เป็นการพัฒนาทักษะ)

### 1. [Category - เช่น Schema Design]
- **[Best Practice]:** [อธิบายสั้นๆ ว่าคืออะไร และทำไมดี]
- **[Best Practice]:** [อธิบาย]

### 2. [Category - เช่น Audit Logic]
- **[Best Practice]:** [อธิบาย]

### 3. [Category - เช่น Form UX]
- **[Best Practice]:** [อธิบาย]

---

## ✅ Production Readiness Checklist

> เช็คก่อนใช้ form จริง

- [ ] **Schema Validation** — schema ผ่าน validation ไม่มี orphan/duplicate fields
- [ ] **Scoring Verified** — สูตรคะแนนทดสอบด้วย sample submissions (ผ่าน/ตก/boundary/N/A)
- [ ] **Validation Parity** — client + server validation ตรงกัน
- [ ] **Conditional Logic Tested** — ทุก show/hide path ทดสอบแล้ว
- [ ] **Audit Trail** — เก็บ who/when/what ครบ + resubmission ไม่ overwrite
- [ ] **Form Versioning** — submission เก่า render ได้หลังแก้ form
- [ ] **Thai Labels** — ครบ สะกดถูก ผ่านการตรวจโดยเจ้าของงาน
- [ ] **Mobile Tested** — ทดสอบบนมือถือจริงที่หน้างานใช้
- [ ] **Edge Cases Tested** — empty/partial/resubmit/concurrent
- [ ] **BPMN Integration** — form-task binding + variable mapping ทดสอบแล้ว (ถ้ามี)
- [ ] **Rollback Plan** — มี plan ถอย form กลับ version เดิมถ้าเกิดปัญหา

### 📊 Production Readiness Decision

**Status:** [✅ Ready / ⚠️ Ready with Minor Concerns / ❌ Not Ready]

**เหตุผล:** [อธิบายว่าทำไมตัดสินใจแบบนี้]

**คำแนะนำ:**
- [ถ้า Not Ready] ต้องแก้อะไรก่อนใช้จริง
- [ถ้า Ready with Concerns] ควร monitor อะไรพิเศษ (เช่น คะแนนชุดแรกๆ ที่ submit เข้ามา)
- [ถ้า Ready] พร้อมใช้ — แต่ควร monitor X, Y, Z

---

## 📝 Conclusion & Next Steps

**สรุปสั้นๆ:** [2-4 ประโยค ใช้ภาษาง่ายๆ]

**ทำไมไม่ได้ 10/10 (optional):**
- [ถ้ามีอะไรตกหล่น ระบุได้ที่นี่ เช่น ไม่มี form versioning, N/A handling ไม่ชัด]
- [ถ้าได้คะแนนเต็ม ไม่ต้องกรอกส่วนนี้]

**ถ้าแก้ตามที่แนะนำ:** จะทำให้ [audit form] [ประโยชน์ที่จะได้รับ เช่น ผล audit เชื่อถือได้ ตรวจย้อนหลังได้ครบ]

**Next Steps:**
1. [ขั้นตอนถัดไป เช่น แก้ scoring critical ก่อน]
2. [ขั้นตอนถัดไป]
3. [ขั้นตอนถัดไป]

---

**ถ้ามีคำถาม:** ถามได้เลย ไม่ต้องเกร็ง 🙌

---
*Template สำหรับ Audit Form Review - ใช้โดย Galaxy (Business Analyst) ร่วมกับ Nebula/Nova (schema), Vega/Stella (UX), Comet (BPMN)*
