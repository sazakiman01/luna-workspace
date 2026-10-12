# [Repo Name] BPMN Workflow Review - [Reviewer Name]

**Date:** YYYY-MM-DD
**Reviewer:** [Reviewer Name] ([Role])
**Repo:** [repo-name]
**Scope:** [ขอบเขตการรีวิว เช่น PR #123, Full Repo Audit, Release v2.1.0]
**Review Time:** [HH:MM]
**Review Round:** [N]

**File Naming Convention:** `[process-name]-bpmn-review-r[round]-YYYY-MM-DD-[HHMM].md`
**Example:** `sca-isa-flow-bpmn-review-r1-2026-05-07-1026.md`
**Save Location:** `repo-index/<repo-name>/reviews/bpmn/`

---

## 📝 Language Guidelines

- **Descriptions:** เขียนเป็นภาษาไทยเพื่อให้ junior dev เข้าใจง่าย
- **Technical Terms:** ใช้ภาษาอังกฤษสำหรับ technical terms (เช่น Gateway, Service Task, Boundary Event, FEEL expression)
- **Code/Config:** เก็บ code และ config เป็นภาษาเดิม (XML, JSON, FEEL expressions)
- **Element Names:** ใช้ชื่อจาก BPMN file เป็นภาษาเดิม (ถ้าเป็นไทย ให้เป็นไทย)

---

## 🎯 TL;DR สำหรับ Junior Dev (อ่าน 30 วิ)

**สรุปสั้นๆ:** [สรุป BPMN file แบบสั้นๆ ในภาษาไทย]

**ปัญหาใหญ่ๆ:**
1. [ปัญหาที่ 1] - [คำอธิบายสั้นๆ]
2. [ปัญหาที่ 2] - [คำอธิบายสั้นๆ]
3. [ปัญหาที่ 3] - [คำอธิบายสั้นๆ]
4. [ปัญหาที่ 4] - [คำอธิบายสั้นๆ]

**ต้องแก้ก่อน deploy:**
- [สิ่งที่ต้องแก้ 1]
- [สิ่งที่ต้องแก้ 2]
- [สิ่งที่ต้องแก้ 3]
- [สิ่งที่ต้องแก้ 4]

**คะแนน:** [Overall Score]/10 ([Production Readiness status])

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

**ไม่มี** หรือ [รายการ action items]

1. **[ชื่อปัญหาสั้นๆ]** — `[element ID]` ในไฟล์ BPMN
   - **ทำอะไร:** [1 ประโยค]
   - **ทำไม:** [1 ประโยค เช่น "security risk", "process ติดขัด"]
   - **ดูรายละเอียด:** → [Issues > Critical #1](#-critical-ต้องแก้ก่อน-mergeproduction)

### 🟠 ต้องทำก่อน Production (High)

1. **[ชื่อปัญหาสั้นๆ]** — `[element ID]` ในไฟล์ BPMN
   - **ทำอะไร:** [1 ประโยค]
   - **ทำไม:** [1 ประโยค]
   - **ดูรายละเอียด:** → [Issues > High #1](#-high-ควรแก้ก่อน-production)

### 🟡 ควรทำภายใน 1-2 สัปดาห์ (Medium)

1. **[ชื่อปัญหาสั้นๆ]** — `[element ID]` ในไฟล์ BPMN
   - **ทำอะไร:** [1 ประโยค]
   - **ดูรายละเอียด:** → [Issues > Medium #1](#-medium-ควรแก้ภายใน-1-2-สัปดาห์)

### 🟢 ควรทำภายใน 1-3 เดือน (Low)

1. **[ชื่อปัญหาสั้นๆ]** — [ส่วนที่เกี่ยวข้อง]
   - **ทำอะไร:** [1 ประโยค]

---

## 📊 BPMN Dimension Scores (ภาพรวมคะแนน)

| ด้าน | Score | Status | หมายเหตุ |
|------|-------|--------|----------|
| **Workflow Design** (การออกแบบ workflow) | [X]/10 | ✅/⚠️/❌ | Process logic, gateways, events |
| **Form Design** (การออกแบบฟอร์ม) | [X]/10 | ✅/⚠️/❌ | UX, validation, layout |
| **Camunda Best Practices** (มาตรฐาน Camunda) | [X]/10 | ✅/⚠️/❌ | Platform-specific standards |
| **Integration Points** (จุดเชื่อมต่อ) | [X]/10 | ✅/⚠️/❌ | External systems, connectors |
| **Error Handling** (การจัดการ error) | [X]/10 | ✅/⚠️/❌ | Boundary events, error paths |
| **Security** (ความปลอดภัย) | [X]/10 | ✅/⚠️/❌ | Access control, data validation |
| **Maintainability** (ดูแลง่าย) | [X]/10 | ✅/⚠️/❌ | Modularity, documentation |
| **Performance** (ความเร็ว) | [X]/10 | ✅/⚠️/❌ | Process optimization |
| **Naming Conventions** (การตั้งชื่อ) | [X]/10 | ✅/⚠️/❌ | IDs, variables consistency |
| **Production Readiness** (พร้อมขึ้น prod) | [X]/10 | ✅/⚠️/❌ | Deployment readiness |

---

## 🔍 Detailed Findings

### ✅ Strengths (จุดแข็ง - ดีอยู่แล้ว คงรักษาไว้)

#### 1. [Category - เช่น Workflow Design]
- **[Aspect]:** [รายละเอียด]
- **[Aspect]:** [รายละเอียด]

#### 2. [Category - เช่น Form Design]
- **[Aspect]:** [รายละเอียด]

---

### ⚠️ Issues (ปัญหาที่เจอ แบ่งตามความสำคัญ)

#### 🔴 Critical (ต้องแก้ก่อน merge/production)

**ไม่พบ critical issues** หรือ [รายการ critical issues]

1. **[Issue Title]**
   - **ที่ไหน:** `[element ID]` ในไฟล์ BPMN
   - **ด้าน:** [เช่น Workflow Design, Security]
   - **ปัญหาคืออะไร:** [อธิบายแบบง่ายๆ ให้ junior เข้าใจ]
   - **ทำไมต้องแก้:** [เช่น "ทำให้ process ติดขัด", "security risk"]
   - **วิธีแก้:** [วิธีแก้ + BPMN structure example]

#### 🟠 High (ควรแก้ก่อน production)

1. **[Issue Title]**
   - **ที่ไหน:** `[element ID]` ในไฟล์ BPMN
   - **ด้าน:** [เช่น Camunda Best Practices, Integration Points]
   - **ปัญหาคืออะไร:** [อธิบายแบบง่ายๆ]
   - **ทำไมต้องแก้:** [เช่น "ทำให้ maintain ยาก", "ไม่เป็นไปตามมาตรฐาน"]
   - **วิธีแก้:** [วิธีแก้ + BPMN structure example]

#### 🟡 Medium (ควรแก้ภายใน 1-2 สัปดาห์)

1. **[Issue Title]**
   - **ที่ไหน:** `[element ID]` ในไฟล์ BPMN
   - **ด้าน:** [เช่น Performance, Naming Conventions]
   - **ปัญหาคืออะไร:** [อธิบายแบบง่ายๆ]
   - **ทำไมต้องแก้:** [เหตุผล]
   - **วิธีแก้:** [วิธีแก้]

#### 🟢 Low (ควรแก้ภายใน 1-3 เดือน)

1. **[Issue Title]**
   - **ที่ไหน:** `[element ID]` ในไฟล์ BPMN
   - **ด้าน:** [เช่น Naming Conventions, Documentation]
   - **ปัญหาคืออะไร:** [อธิบาย]
   - **วิธีแก้:** [วิธีแก้]

---

## 🚀 Deployment Security Audit

> ตรวจสอบว่ามี folder/file ที่ไม่ควรอยู่ใน repo หรือถูก deploy ไป Camunda Cloud หรือไม่

### ✅ สิ่งที่เช็คแล้ว

- [x] `.gitignore` มีรายการที่จำเป็น
- [x] Process variables ไม่มี sensitive data
- [x] Connector configurations ไม่มี API keys
- [x] User task forms ไม่ expose sensitive fields
- [x] Deployment scripts ไม่มี hardcoded credentials

### ❌ เจอใน repo (ควรเคลียร์ออก)

> **สำคัญ:** ถึงแม้จะถูก ignore ใน `.gitignore` แล้ว แต่ยังอยู่ใน git history ต้องเคลียร์ออกด้วย

1. **`[folder/file name]`**
   - **ที่ไหน:** `[path]`
   - **เป็นอะไร:** [เช่น env vars, process data, AI configs]
   - **ทำไมต้องเคลียร์:** [เช่น sensitive data, เรื่องส่วนตัว, ไม่จำเป็น]
   - **วิธีเคลียร์:**
     ```bash
     git rm -r --cached [folder/file]
     git commit -m "chore: remove [folder] from git tracking"
     git push
     ```

### ✅ ไม่เจอใน repo (ดี)

- `.env`, `.env.local` — environment variables
- `.windsurf/`, `.claude/`, `.cursor/` — AI configs
- Process variables ที่มี sensitive data
- API keys ใน connector configurations
- BPMN files ที่มี hardcoded credentials
- Deployment scripts ที่มี secrets

### 📚 Reference: Folder/File ที่ไม่ควร Deploy (BPMN-Specific)

<details>
<summary>คลิกเพื่อดูรายการเต็ม (8 หมวด)</summary>

**1. Environment & Secrets**
- `.env`, `.env.local`, `.env.*` — environment variables
- `.secrets`, `.credentials` — secrets files
- Camunda Cloud API keys, Zeebe client secrets
- Connector credentials (OAuth tokens, API keys)

**2. Development/Editor Configs**
- `.vscode/`, `.idea/`, `.cursor/` — editor settings
- `.claude/`, `.windsurf/` — AI assistant configs (เรื่องส่วนตัว)
- `.editorconfig` — editor conventions

**3. Source Control & CI/CD**
- `.git/`, `.github/`, `.gitlab-ci.yml`
- `.gitignore`, `.dockerignore`

**4. Documentation & Notes**
- `README.md`, `CHANGELOG.md`, `docs/`, `notes/`
- `CLAUDE.md`, `AI_INSTRUCTIONS.md`

**5. Testing & Coverage**
- Test BPMN files (mock processes)
- Test data exports
- Coverage reports

**6. Build Artifacts (intermediate)**
- `.cache/`, `tmp/`, `temp/`
- Docker image cache
- Build logs

**7. Process & Logs**
- Process instance exports ที่มี sensitive data
- Execution logs ที่มี sensitive data
- Variable dumps
- Audit logs (ถ้ามี sensitive data)

**8. Sensitive Data**
- Process variables ที่มี credentials, PII
- BPMN files ที่มี hardcoded secrets
- Connector configurations ที่มี API keys
- User task forms ที่ expose sensitive fields

</details>

### 💡 ทำไมต้องเคลียร์ออกจาก repo (ไม่ใช่แค่ ignore)

1. **ป้องกัน security breach** — credentials ถูก leak ไป Camunda Cloud
2. **ป้องกัน commit โดยไม่ตั้งใจ** — `.gitignore` ถูกแก้ได้
3. **ลดขนาด repo** — folder เกินความจำเป็น
4. **Clean git history** — ประวัติสะอาด ไล่ย้อนง่าย

### 📊 Deployment Security Score

**Score:** [X]/10 | **Status:** ✅/⚠️/❌
**Notes:** [สรุปสั้นๆ]

---

## 🔧 Framework-Specific Findings

> สำหรับคนที่อยากรู้ลึก เกี่ยวกับ framework ที่ใช้

### Camunda Cloud 8.x

**✅ Best Practice Checks:**
- [ ] Process variables ใช้ semantic naming (เช่น `ofi_number` ไม่ใช่ `textfield_k0lhrs`)
- [ ] ระบุ variable scope ชัดเจน (local vs process-level)
- [ ] Variable typing ชัดเจน (string / number / date / context)
- [ ] มี documentation สำหรับทุก variable ที่ process ใช้
- [ ] Job worker types มี convention ชัดเจน
- [ ] Service tasks มี retry & backoff config (`retries` count + `retryBackoff`)
- [ ] Message correlation keys ระบุชัดเจน
- [ ] ใช้ DMN แทน complex gateway logic (ถ้า logic ซับซ้อน)

**⚠️ Anti-patterns:**
- ❌ Variable keys auto-generated (textfield_k0lhrs, datetime_jzop2v)
- ❌ ไม่มี variable documentation
- ❌ Service tasks ไม่มี retry config
- ❌ Correlation keys ไม่ชัดเจน

**Findings:** [รายละเอียดที่พบในไฟล์นี้]

#### Process Variables Management
- **Variable Scoping:** [รายละเอียด]
- **Variable Types:** [รายละเอียด]
- **Variable Lifecycle:** [รายละเอียด]

#### Zeebe Extension Usage
- **User Task Forms:** [รายละเอียด]
- **Form Validation:** [รายละเอียด]
- **Dynamic Components:** [รายละเอียด]

#### Timer Events Configuration
- **Timer Types:** [รายละเอียด]
- **Timer Expressions:** [รายละเอียด]
- **Timezone Handling:** [รายละเอียด]

#### Timer & SLA Configuration

**✅ Best Practice Checks:**
- [ ] มี timeout boundary events ที่ user task สำคัญ
- [ ] Timer expressions ใช้ ISO 8601 (`PT1H`, `P1D`)
- [ ] ระบุ timezone offset ชัดเจน (UTC+7)
- [ ] มี mechanism วัด process duration (SLA tracking)
- [ ] Timer events มี error handling

**⚠️ Anti-patterns:**
- ❌ Timer expressions ไม่ใช้ ISO 8601
- ❌ ไม่ระบุ timezone → ambiguous timing
- ❌ ไม่มี timeout บน user tasks สำคัญ

**Findings:** [รายละเอียดที่พบในไฟล์นี้]

#### Message Flows & Correlation
- **Message Definition:** [รายละเอียด]
- **Correlation Keys:** [รายละเอียด]
- **Message Subscription:** [รายละเอียด]

### BPMN 2.0 Standards

#### Event Types
- **Start Events:** [รายละเอียด]
- **Intermediate Events:** [รายละเอียด]
- **End Events:** [รายละเอียด]
- **Boundary Events:** [รายละเอียด]

#### Gateway Types

**✅ Best Practice Checks:**
- [ ] Exclusive gateways มี default flow (กัน deadlock ถ้า condition ไม่ตรง)
- [ ] Condition expressions ครอบคลุมทุกกรณี (mutually exclusive + complete)
- [ ] ทุก outgoing flow จาก gateway มี label ที่อ่านเข้าใจ
- [ ] ไม่มี "same-target flows" (ทุก path ไป activity เดียวกัน = code smell)
- [ ] Parallel gateway ใช้ split+join เป็นคู่ (symmetric)
- [ ] ไม่มี condition บน outgoing flows จาก parallel gateway
- [ ] Event-based gateway ใช้กับ intermediate catch events เท่านั้น

**⚠️ Anti-patterns:**
- ❌ Exclusive gateway ที่ทุก path ไป target เดียวกัน (ไม่ใช่ decision จริง)
- ❌ ขาด default flow → process ค้างถ้า condition ไม่ตรง
- ❌ ใช้ parallel gateway แต่มี condition (ผิด semantic)
- ❌ Gateway แยก branch แต่ไม่มี gateway ปิด (unterminated branch)

**Findings:** [รายละเอียดที่พบในไฟล์นี้]

#### Task Types

**✅ Best Practice Checks:**
- [ ] Service tasks ใช้ `taskDefinition.type` มี convention ชัดเจน
- [ ] Service tasks มี error handling (boundary error events)
- [ ] Service tasks idempotent (retry ได้โดยไม่ side-effect)
- [ ] ไม่มี hardcoded values ใน I/O mappings (emails, IDs, URLs)
- [ ] ไม่มี credentials/API keys ใน BPMN (ใช้ Camunda secrets)
- [ ] User tasks มี assignee หรือ candidate groups ชัดเจน
- [ ] Manual tasks ใช้เมื่อไม่ต้องการ system automation

**⚠️ Anti-patterns:**
- ❌ Hardcoded emails/URLs ใน service task I/O mappings
- ❌ Service tasks ไม่มี boundary error events
- ❌ ใช้ script tasks ใน Camunda Cloud (ใช้ service tasks แทน)
- ❌ User tasks ไม่มี assignee หรือ candidate groups

**Findings:** [รายละเอียดที่พบในไฟล์นี้]

#### Sub-process Usage
- **Embedded Sub-processes:** [รายละเอียด]
- **Event Sub-processes:** [รายละเอียด]
- **Call Activities:** [รายละเอียด]

#### Collaboration Patterns

**✅ Best Practice Checks:**
- [ ] แต่ละ lane = 1 role/responsibility ชัดเจน
- [ ] Activity อยู่ใน lane ของผู้รับผิดชอบจริง
- [ ] Lane naming ใช้ role/department ไม่ใช่ชื่อบุคคล
- [ ] Cross-lane flows มีความหมาย (handoff ระหว่าง role)
- [ ] ไม่มี activities ที่ไม่ได้ assign lane

**⚠️ Anti-patterns:**
- ❌ Lane ตั้งชื่อด้วยชื่อบุคคล (ควรใช้ role)
- ❌ Activity อยู่ใน lane ที่ไม่ใช่ผู้รับผิดชอบ
- ❌ Cross-lane flows ไร้ความหมาย (ควรใช้ message flows)

**Findings:** [รายละเอียดที่พบในไฟล์นี้]

#### Sequence Flow Best Practices

**✅ Best Practice Checks:**
- [ ] Condition expressions ใช้ FEEL syntax ถูกต้อง (`=eval_01 = "ผ่าน"`)
- [ ] Outgoing flows จาก gateway มี label ที่อ่านเข้าใจ
- [ ] ไม่มี crossing flows (visual readability)
- [ ] ทุก flow มี source + target ที่ valid
- [ ] ไม่มี flows จาก end event หรือ เข้า start event
- [ ] Sequence flow naming สื่อความหมาย (ถ้ามี)

**⚠️ Anti-patterns:**
- ❌ Condition expressions ผิด syntax หรือ logic ไม่ครบถ้วน
- ❌ Flows ไขวกัน (crossing) ทำให้อ่านยาก
- ❌ Flows ไปยัง nodes ที่ไม่ valid

**Findings:** [รายละเอียดที่พบในไฟล์นี้]

#### Process Soundness

**✅ Best Practice Checks:**
- [ ] ทุก node ต้องเข้าถึงได้จาก start event (no orphan nodes)
- [ ] ทุก path ต้องไปถึง end event (no dead ends)
- [ ] ไม่มี activities ที่ไม่มี incoming flow
- [ ] ไม่มี flows ที่ไม่มี source หรือ target
- [ ] ถ้ามี loop ต้องมี exit condition
- [ ] ไม่มี unreachable nodes

**⚠️ Anti-patterns:**
- ❌ Activities ที่ไม่มี incoming flow (dead activity)
- ❌ Paths ที่ไม่ไปถึง end event (dead end)
- ❌ Orphan nodes ที่ไม่เชื่อมต่อกับ main flow

**Findings:** [รายละเอียดที่พบในไฟล์นี้]

### Form Design

**✅ Best Practice Checks:**
- [ ] ไม่มี hardcoded dropdown values (เช่น ชื่อบุคคล) - ควรใช้ dynamic data sources
- [ ] ใช้ `conditional.hide` สำหรับ progressive disclosure
- [ ] Form versioning: schemaVersion + executionPlatformVersion ตรงกัน
- [ ] Readonly logic consistency - field เดียวกันใน task ต่างๆ ควร readonly สม่ำเสมอ
- [ ] Required fields ที่จำเป็น มี validation rules
- [ ] Field keys ใช้ semantic naming (เช่น `ofi_number` ไม่ใช่ `textfield_k0lhrs`)
- [ ] ไม่มี sensitive fields ที่ expose ใน form

**⚠️ Anti-patterns:**
- ❌ Hardcoded dropdown values (ชื่อบุคคล, department names)
- ❌ Field keys auto-generated (textfield_k0lhrs, datetime_jzop2v)
- ❌ ไม่มี validation rules บน required fields
- ❌ Readonly logic ไม่ consistent ระหว่าง tasks

**Findings:** [รายละเอียดที่พบในไฟล์นี้]

#### Field Validation Rules
- **Required Fields:** [รายละเอียด]
- **Field Type Validation:** [รายละเอียด]
- **Custom Validation:** [รายละเอียด]

#### Dynamic Components
- **Dynamic Lists:** [รายละเอียด]
- **Tables:** [รายละเอียด]
- **Conditional Fields:** [รายละเอียด]

#### Layout Organization
- **Row/Column Structure:** [รายละเอียด]
- **Responsive Design:** [รายละเอียด]
- **Accessibility:** [รายละเอียด]

#### Required Field Logic
- **Validation Triggers:** [รายละเอียด]
- **Error Messages:** [รายละเอียด]
- **Form Submission:** [รายละเอียด]

#### Readonly Field Logic
- **Readonly Conditions:** [รายละเอียด]
- **Field Dependencies:** [รายละเอียด]
- **Data Pre-population:** [รายละเอียด]

### Documentation Standards

**✅ Best Practice Checks:**
- [ ] มี process-level documentation ใน `<bpmn:documentation>` element
- [ ] มี element-level documentation บน activity/gateway สำคัญ
- [ ] ใช้ text annotations ขยายความเหตุการณ์/ข้อยกเว้น
- [ ] มี process owner / version metadata ชัดเจน
- [ ] มี README หรือ docs สำหรับ process architecture

**⚠️ Anti-patterns:**
- ❌ ไม่มี documentation ใดๆ บน BPMN elements
- ❌ Process ซับซ้อนแต่ไม่มีคำอธิบาย
- ❌ Text annotations ไม่สื่อความหมาย

**Findings:** [รายละเอียดที่พบในไฟล์นี้]

---

## 💡 Best Practices Learnings

> สิ่งที่ทำได้ดี + แนะนำเพิ่มเติม (ไม่ใช่ bug — เป็นการพัฒนาทักษะ)

### 1. [Category - เช่น Workflow Design]
- **[Best Practice]:** [อธิบายสั้นๆ ว่าคืออะไร และทำไมดี]
- **[Best Practice]:** [อธิบาย]

### 2. [Category - เช่น Camunda Configuration]
- **[Best Practice]:** [อธิบาย]
- **[Best Practice]:** [อธิบาย]

### 3. [Category - เช่น Form Design]
- **[Best Practice]:** [อธิบาย]

---

## 🏛️ 5-Pillar Architecture Review (Principal-Level)

> **Principal-level architectural view** — เสริม dimension scoring ข้างบน ด้วยมุมมอง architecture ที่ scale ได้

| Pillar | Score | Weight | Weighted | สรุปสั้นๆ |
|--------|-------|--------|----------|-----------|
| **1. Workflow Structure** | [X]/10 | 1.5x | [X] | [สรุป] |
| **2. Process Coupling** | [X]/10 | 1.0x | [X] | [สรุป] |
| **3. Variable Management** | [X]/10 | 1.5x | [X] | [สรุป] |
| **4. Failure Modes** | [X]/10 | 1.0x | [X] | [สรุป] |
| **5. Evolution Path** | [X]/10 | 1.0x | [X] | [สรุป] |

**Weighted Average:** [sum] / 6.0 = **[X.XX] / 10**

### รายละเอียดแต่ละ Pillar

#### 1. Workflow Structure ([X]/10)
- [✅/❌] [จุดที่ดี/ต้องแก้]

#### 2. Process Coupling ([X]/10)
- [✅/⚠️/❌] [จุดที่ดี/ต้องแก้]

#### 3. Variable Management ([X]/10)
- [✅/⚠️/❌] [จุดที่ดี/ต้องแก้]

#### 4. Failure Modes ([X]/10)
- [✅/⚠️/❌] [จุดที่ดี/ต้องแก้]

#### 5. Evolution Path ([X]/10)
- [✅/⚠️/❌] [จุดที่ดี/ต้องแก้]

---

## 🔀 Rejected Alternatives (ADR-Style)

> **"Reject 2, Choose 1" framework** — ทุก architectural decision ต้องระบุทางเลือกที่ **ไม่เลือก** + เหตุผล

### ADR-1: [Decision Title]

**Context:** [บริบทของการตัดสินใจ]

**Options:**
1. ✅ **[Option ที่เลือก]**
2. ❌ [Option ที่ไม่เลือก #1]
3. ❌ [Option ที่ไม่เลือก #2]

**Decision:** [ทางเลือกที่เลือก]

**Reason to Choose:** [เหตุผล]

**Reason to Reject Option 2:** [เหตุผล]

**Reason to Reject Option 3:** [เหตุผล]

**Consequences:** [ผลกระทบที่ยอมรับได้]

**Reversibility:** 🟢/🟡/🔴 [Low/Medium/High] cost — [คำอธิบาย]

---

### ADR-2: [Decision Title]

[ตามรูปแบบเดียวกับ ADR-1]

---

### ADR-3: [Decision Title]

[ตามรูปแบบเดียวกับ ADR-1]

---

## 🌐 Cross-System Flow Analysis (End-to-End)

> **Principal-level view:** ไม่ใช่แค่ BPMN — flow ผ่าน Camunda → Backend → External systems

### End-to-End Boundary

```
[ASCII diagram ของ end-to-end flow]
```

### Variable Ownership Matrix

| Variable | Producer (Lane) | Consumer (Lane) | Scope | ปัญหา |
|----------|----------------|----------------|-------|--------|
| `[variable]` | [producer] | [consumer] | Process/Form | [comment] |

### Integration Touchpoints

| # | Touchpoint | Boundary Owner | Failure Impact | Current Handling |
|---|-----------|----------------|----------------|------------------|
| 1 | [touchpoint] | [boundary] | [impact] | [handling] |

### Cross-System Weak Points

1. **[Weak Point 1]** — [คำอธิบาย]
2. **[Weak Point 2]** — [คำอธิบาย]

---

## 📈 Performance Forecast (6-12 Months)

> **สมมติฐาน (Assumptions):** [ระบุ current load และ assumptions]

### Load Assumptions

| Metric | Current (1x) | 6-month (10x) | 12-month (100x) |
|--------|-------------|----------------|-----------------|
| [metric] | [value] | [value] | [value] |

### Predicted Bottlenecks

#### 🔴/🟠/🟡 Bottleneck #1: [Name]

**เมื่อไหร่:** [trigger condition]

**อาการ:** [symptoms]

**Optimization path:**
- **Phase 1 (Immediate):** [action]
- **Phase 2 (Scale):** [action]
- **Phase 3 (Enterprise):** [action]

---

## 🔄 Migration Path & Reversibility

> **"ถ้า scale 10x อะไรพังก่อน?"** — ranked list + migration strategies

### Breakage Priority (จากพังก่อน → พังหลัง)

| # | อะไรพัง | Trigger | Severity |
|---|---------|---------|----------|
| 1 | [issue] | [trigger] | 🔴/🟠/🟡 |

### Migration Strategies

#### Migration 1: [Name]

**Cost:** 🟢/🟡/🟠 [Low/Medium/High] ([duration])

**Steps:**
1. [step]
2. [step]

**Reversibility:** 🟢/🟡/🔴 [High/Medium/Low] — [คำอธิบาย]

**Blast radius:** [ผลกระทบ]

---

### Overall Reversibility Assessment

| Aspect | Current State | Post-Fix State |
|--------|--------------|----------------|
| Rollback complexity | [🟢/🟡/🔴] | [🟢/🟡/🔴] |
| Data migration risk | [🟢/🟡/🔴] | [🟢/🟡/🔴] |
| In-flight instance impact | [🟢/🟡/🔴] | [🟢/🟡/🔴] |
| External dependency | [🟢/🟡/🔴] | [🟢/🟡/🔴] |

---

## ✅ Production Readiness Checklist

> เช็คก่อนขึ้น production

- [ ] **Process Variables** — ตั้งค่าถูกต้องสำหรับ production
- [ ] **User Task Forms** — ทดสอบแล้ว ทำงานได้ถูกต้อง
- [ ] **Error Handling** — มี boundary events และ error paths ครบถ้วน
- [ ] **Monitoring** — มี Camunda Operate/Optimize พร้อม
- [ ] **Logging** — มี logging strategy ชัดเจน
- [ ] **Timer Configuration** — ตั้งค่าถูกต้อง รองรับ timezone
- [ ] **Security** — มี access control และ data validation
- [ ] **Process Documentation** — มี docs สำหรับ process architecture
- [ ] **Integration Testing** — Test integration กับ external systems ผ่าน
- [ ] **Deployment Docs** — มี documentation
- [ ] **Rollback Plan** — มี plan rollback
- [ ] **Version Compatibility** — ตรวจสอบ compatibility กับ Camunda Cloud version

### 📊 Production Readiness Decision

**Status:** [✅ Ready / ⚠️ Ready with Minor Concerns / ❌ Not Ready]

**เหตุผล:** [อธิบายว่าทำไมตัดสินใจแบบนี้]

**คำแนะนำ:**
- [ถ้า Not Ready] ต้องแก้อะไรก่อนขึ้น production
- [ถ้า Ready with Concerns] ควร monitor อะไรพิเศษ
- [ถ้า Ready] พร้อมขึ้น — แต่ควร monitor X, Y, Z

---

## 📝 Conclusion & Next Steps

**สรุปสั้นๆ:** [2-4 ประโยค ใช้ภาษาง่ายๆ]

**ถ้าแก้ตามที่แนะนำ:** จะทำให้ [BPMN workflow] [ประโยชน์ที่จะได้รับ]

**Next Steps:**
1. [ขั้นตอนถัดไป เช่น แก้ critical issues ก่อน]
2. [ขั้นตอนถัดไป]
3. [ขั้นตอนถัดไป]

---

**ถ้ามีคำถาม:** ถามได้เลย ไม่ต้องเกร็ง 🙌

---
*Template สำหรับ BPMN Workflow Review - ใช้โดย Comet (BPMN/Camunda Expert)*
