# PMAM Web BPMN Workflow Review - Comet

**Date:** 2026-05-14
**Reviewer:** Comet (BPMN/Camunda Expert)
**Repo:** pmam-web
**Scope:** BPMN Review - SCA(DC)_Flow.bpmn (Round 1)
**Review Time:** 11:15
**Review Round:** 1

**File Naming Convention:** `sca-dc-flow-bpmn-review-r1-2026-05-14-1119.md`

---

## 📝 Language Guidelines

- **Descriptions:** เขียนเป็นภาษาไทยเพื่อให้ junior dev เข้าใจง่าย
- **Technical Terms:** ใช้ภาษาอังกฤษสำหรับ technical terms (เช่น Gateway, Service Task, Boundary Event, FEEL expression)
- **Code/Config:** เก็บ code และ config เป็นภาษาเดิม (XML, JSON, FEEL expressions)
- **Element Names:** ใช้ชื่อจาก BPMN file เป็นภาษาเดิม (ถ้าเป็นไทย ให้เป็นไทย)

---

## 🎯 TL;DR สำหรับ Junior Dev (อ่าน 30 วิ)

**สรุปสั้นๆ:** BPMN workflow สำหรับกระบวนการ Audit SCA (DC) มีโครงสร้างที่ดีเบื้องต้น (4 lanes, 7 user tasks, 36 service tasks) แต่มีปัญหาสำคัญหลายจุดที่ต้องแก้ก่อนขึ้น production โดยเฉพาะ Gateway anti-pattern, hardcoded emails, และขาด error handling

**ปัญหาใหญ่ๆ:**
1. Gateway anti-pattern (same-target flows) - Gateway_0whnkhg มีทั้ง "ผ่าน" และ "ไม่ผ่าน" ไป target เดียวกัน
2. Hardcoded email addresses - jumphonkae@gosoft.co.th ปรากฏ 16 ครั้งใน service tasks
3. Auto-generated field keys - textfield_1aosi, datetime_8094b, etc. ทำให้ maintain ยาก
4. ไม่มี error boundary events - process อาจค้างถ้า service task ล้มเหลว
5. ไม่มี timer/SLA events - ไม่มี mechanism ตรวจสอบ deadline
6. ไม่มี correlation keys - ไม่สามารถเชื่อม external events กับ process instance

**ต้องแก้ก่อน deploy:**
- แก้ Gateway_0whnkhg (ใช้ merge gateway หรือแยก flows)
- ย้าย hardcoded emails ไป process variables
- เพิ่ม error boundary events บน service tasks สำคัญ
- เปลี่ยน auto-generated field keys เป็น semantic naming
- เพิ่ม timer boundary events บน user tasks สำคัญ
- เพิ่ม correlation keys สำหรับ message flows

**คะแนน:** 6.0/10 (Needs Work)

---

## 📚 Glossary (คำศัพท์ที่ควรรู้)

| คำศัพท์ (English) | ความหมาย (ไทย) | ตัวอย่าง |
|-------------------|------------------|----------|
| **Gateway** | จุดตัดสินใจ (decision point) | แยก path ตามเงื่อนไข |
| **Exclusive Gateway** | Gateway ที่เลือก path เดียวจากหลาย path | ถ้า eval_01 = "ผ่าน" → ไป path A, else → ไป path B |
| **Service Task** | Task ที่ system ทำอัตโนมัติ | ส่ง email, call API |
| **User Task** | Task ที่คนต้องทำผ่าน form | กรอกข้อมูล, ประเมินผล |
| **Manual Task** | Task ที่คนทำนอก system | ตรวจสอบเอกสารจริง |
| **Boundary Event** | Event ที่ติดอยู่กับ task | Error boundary, Timer boundary |
| **FEEL Expression** | ภาษาสำหรับเขียน condition ใน Camunda | `=eval_01 = "ผ่าน"` |
| **Process Variable** | ตัวแปรที่ใช้ระหว่าง process | `eval_01`, `eval_02` |
| **Correlation Key** | Key สำหรับเชื่อม external events กับ process | เชื่อม email inbound กับ process instance |
| **SLA (Service Level Agreement)** | เวลาที่กำหนดให้ทำงานเสร็จ | Task ต้องเสร็จภายใน 24 ชั่วโมง |
| **Retry Configuration** | การตั้งค่า retry กรณี task ล้ม | Retry 3 ครั้ง, รอ 5 วินาที |

---

## 🚨 Action Plan (สิ่งที่ต้องทำ)

> **Junior Dev เริ่มที่ส่วนนี้** — บอกชัดว่าทำอะไร ทำไม ที่ไหน

### 🔴 ต้องทำทันที (Critical - Blocker)

1. **Gateway anti-pattern (same-target flows)** — `Gateway_0whnkhg` ในไฟล์ BPMN
   - **ทำอะไร:** เปลี่ยน Gateway_0whnkhg ให้ flows แยกกัน หรือใช้ merge gateway pattern
   - **ทำไม:** Gateway ที่ทุก path ไป target เดียวกันไม่ใช่ decision จริง ทำให้ logic ซับซ้อนและอ่านยาก
   - **ดูรายละเอียด:** → [Issues > Critical #1](#-critical-ต้องแก้ก่อน-mergeproduction)

2. **Hardcoded email addresses** — Service tasks ทั้งหมดในไฟล์ BPMN
   - **ทำอะไร:** ย้าย `jumphonkae@gosoft.co.th` ไป process variables (เช่น `email_default_recipient`)
   - **ทำไม:** Hardcoded values ทำให้ promote environment (dev→staging→prod) ยากและ security risk
   - **ดูรายละเอียด:** → [Issues > Critical #2](#-critical-ต้องแก้ก่อน-mergeproduction)

### 🟠 ต้องทำก่อน Production (High)

1. **Auto-generated field keys** — Forms ทั้งหมดในไฟล์ BPMN
   - **ทำอะไร:** เปลี่ยน `textfield_1aosi`, `datetime_8094b`, `select_t8x2i` เป็น semantic naming (เช่น `ofi_number`, `audit_date`)
   - **ทำไม:** Auto-generated keys ทำให้ maintain ยากและไม่สื่อความหมาย
   - **ดูรายละเอียด:** → [Issues > High #1](#-high-ควรแก้ก่อน-production)

2. **Missing error boundary events** — Service tasks ทั้งหมดในไฟล์ BPMN
   - **ทำอะไร:** เพิ่ม error boundary events บน service tasks สำคัญ (email connector, SQL connector)
   - **ทำไม:** ถ้า service task ล้มเหลว process จะค้าง ไม่มี error handling
   - **ดูรายละเอียด:** → [Issues > High #2](#-high-ควรแก้ก่อน-production)

3. **Missing timer/SLA events** — User tasks ทั้งหมดในไฟล์ BPMN
   - **ทำอะไร:** เพิ่ม timer boundary events บน user tasks สำคัญ (เช่น ประเมินครั้งที่ 1, กรอกแผนการแก้ไข)
   - **ทำไม:** ไม่มี mechanism ตรวจสอบ deadline และ escalate ถ้าค้างนาน
   - **ดูรายละเอียด:** → [Issues > High #3](#-high-ควรแก้ก่อน-production)

4. **No correlation keys** — Process ทั้งหมดในไฟล์ BPMN
   - **ทำอะไร:** เพิ่ม correlation keys สำหรับ message flows (เช่น `doc_no`)
   - **ทำไม:** ไม่สามารถเชื่อม external events กับ process instance ได้
   - **ดูรายละเอียด:** → [Issues > High #4](#-high-ควรแก้ก่อน-production)

### 🟡 ควรทำภายใน 1-2 สัปดาห์ (Medium)

1. **Inconsistent retry configuration** — Service tasks ในไฟล์ BPMN
   - **ทำอะไร:** ตั้งค่า `retries` และ `retryBackoff` ให้ consistent ทุก service task
   - **ดูรายละเอียด:** → [Issues > Medium #1](#-medium-ควรแก้ภายใน-1-2-สัปดาห์)

### 🟢 ควรทำภายใน 1-3 เดือน (Low)

1. **Missing process documentation** — BPMN file
   - **ทำอะไร:** เพิ่ม `<bpmn:documentation>` elements บน process และ activities สำคัญ
   - **ดูรายละเอียด:** → [Issues > Low #1](#-low-ควรแก้ภายใน-1-3-เดือน)

---

## 📊 BPMN Dimension Scores (ภาพรวมคะแนน)

| ด้าน | Score | Status | หมายเหตุ |
|------|-------|--------|----------|
| **Workflow Design** (การออกแบบ workflow) | 6/10 | ⚠️ | Gateway anti-pattern, ไม่มี error handling |
| **Form Design** (การออกแบบฟอร์ม) | 5/10 | ❌ | Auto-generated field keys |
| **Camunda Best Practices** (มาตรฐาน Camunda) | 5/10 | ❌ | ไม่มี correlation keys, retry inconsistent |
| **Integration Points** (จุดเชื่อมต่อ) | 7/10 | ⚠️ | ใช้ secrets ดี แต่ hardcoded emails |
| **Error Handling** (การจัดการ error) | 3/10 | ❌ | ไม่มี boundary events |
| **Security** (ความปลอดภัย) | 6/10 | ⚠️ | Hardcoded emails, ใช้ secrets ดี |
| **Maintainability** (ดูแลง่าย) | 5/10 | ❌ | Auto-generated keys, ไม่มี docs |
| **Performance** (ความเร็ว) | 7/10 | ⚠️ | ไม่มี timer/SLA |
| **Naming Conventions** (การตั้งชื่อ) | 4/10 | ❌ | Auto-generated field keys |
| **Production Readiness** (พร้อมขึ้น prod) | 5/10 | ❌ | หลาย critical issues |

---

## 🔍 Detailed Findings

### ✅ Strengths (จุดแข็ง - ดีอยู่แล้ว คงรักษาไว้)

#### 1. Workflow Design
- **Lane separation:** 4 lanes แยก role ชัดเจน (ผู้ดำเนินการแก้ไข, Auditor-Follow Up Car, ผู้บริหารพื้นที่แก้ไข, Head of Auditor)
- **Process structure:** Flow เป็นระบบ มี start event 1 จุด, end events 2 จุด (สำหรับ CAR และ Suggestion)
- **Gateway conditions:** ใช้ FEEL expressions ถูกต้อง (`=eval_01 = "ผ่าน"`, `=eval_02 = "ผ่าน"`)
- **Task types:** ไม่มี script tasks (เหมาะสมสำหรับ Camunda Cloud)

#### 2. Integration Points
- **Secret management:** ใช้ Camunda secrets สำหรับ database credentials (`{{secret.HOST_POSTGRESQL_PMAM}}`, etc.)
- **Database connector:** ใช้ PostgreSQL connector อย่างถูกต้อง
- **Email connector:** ใช้ GoflowEmail authentication
- **Retry configuration:** บาง service tasks มี `retries="3"` และ `retryBackoff`

#### 3. Form Design
- **Form coverage:** ทุก user task มี forms (7 forms)
- **Conditional logic:** มี conditional text แสดงผลตาม `item_type` (CAR vs Suggestion)
- **Readonly fields:** มี readonly fields สำหรับข้อมูลที่ไม่ควรแก้ไข (doc_no, process)

---

### ⚠️ Issues (ปัญหาที่เจอ แบ่งตามความสำคัญ)

#### 🔴 Critical (ต้องแก้ก่อน merge/production)

1. **Gateway anti-pattern (same-target flows)**
   - **ที่ไหน:** `Gateway_0whnkhg` ในไฟล์ BPMN
   - **ด้าน:** Workflow Design
   - **ปัญหาคืออะไร:** Gateway_0whnkhg มีทั้ง flow "ผ่าน" และ "ไม่ผ่าน" ไปยัง target เดียวกัน (Activity_12gdiu0) ทั้งคู่
   - **ทำไมต้องแก้:** ทำให้ logic ซับซ้อน อ่านยาก และอาจทำให้ process ทำงานผิด
   - **วิธีแก้:** ใช้ merge gateway pattern หรือแยก flows ไป targets ต่างกัน

2. **Hardcoded email addresses**
   - **ที่ไหน:** Service tasks ทั้งหมดในไฟล์ BPMN (16 ครั้ง)
   - **ด้าน:** Security, Maintainability
   - **ปัญหาคืออะไร:** Email `jumphonkae@gosoft.co.th` ถูก hardcoded ใน `<zeebe:input>` mappings
   - **ทำไมต้องแก้:** Security risk, maintainability issue, environment promotion problem
   - **วิธีแก้:** ย้ายไป process variables หรือ secrets

#### 🟠 High (ควรแก้ก่อน production)

1. **Auto-generated field keys** - Forms ทั้งหมดในไฟล์ BPMN
2. **Missing error boundary events** - Service tasks ทั้งหมดในไฟล์ BPMN
3. **Missing timer/SLA events** - User tasks ทั้งหมดในไฟล์ BPMN
4. **No correlation keys** - Process ทั้งหมดในไฟล์ BPMN

#### 🟡 Medium (ควรแก้ภายใน 1-2 สัปดาห์)

1. **Inconsistent retry configuration** - Service tasks ในไฟล์ BPMN

#### 🟢 Low (ควรแก้ภายใน 1-3 เดือน)

1. **Missing process documentation** - BPMN file

---

## 🚀 Deployment Security Audit

**Score:** 7/10 | **Status:** ⚠️
**Notes:** ใช้ secrets ดีสำหรับ database credentials แต่ยังมี hardcoded emails ที่ต้องแก้

---

## ✅ Production Readiness Checklist

**Status:** ❌ Not Ready

**เหตุผล:** มี critical issues หลายจุด (Gateway anti-pattern, hardcoded emails, ไม่มี error handling) ที่ต้องแก้ก่อนขึ้น production

**คำแนะนำ:**
- แก้ critical issues ก่อนขึ้น production
- เพิ่ม error boundary events บน service tasks สำคัญ
- เพิ่ม timer/SLA events บน user tasks สำคัญ
- เปลี่ยน auto-generated field keys เป็น semantic naming
- คาดว่าต้องใช้เวลา 2-3 สัปดาห์ สำหรับ critical และ high-priority fixes

---

## 📝 Conclusion & Next Steps

**สรุปสั้นๆ:** BPMN workflow สำหรับกระบวนการ Audit SCA (DC) มีโครงสร้างที่ดีเบื้องต้น แต่มีปัญหาสำคัญหลายจุดที่ต้องแก้ก่อนขึ้น production

**ถ้าแก้ตามที่แนะนำ:** จะทำให้ BPMN workflow มีความ reliable, maintainable, และ production-ready มากขึ้น

**Next Steps:**
1. แก้ Gateway_0whnkhg (merge gateway pattern)
2. ย้าย hardcoded emails ไป process variables
3. เพิ่ม error boundary events บน service tasks สำคัญ
4. เพิ่ม timer/SLA events บน user tasks สำคัญ
5. เปลี่ยน auto-generated field keys เป็น semantic naming

---

**ถ้ามีคำถาม:** ถามได้เลย ไม่ต้องเกร็ง 🙌

---

*Template สำหรับ BPMN Workflow Review - ใช้โดย Comet (BPMN/Camunda Expert)*
