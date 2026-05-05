# [Repo Name] BPMN Workflow Review - [Reviewer Name]

**Date:** YYYY-MM-DD
**Reviewer:** [Reviewer Name] ([Role])
**Repo:** [repo-name]
**Scope:** [ขอบเขตการรีวิว เช่น PR #123, Full Repo Audit, Release v2.1.0]
**Review Time:** [HH:MM]
**Review Round:** [N]

---

## 🎯 TL;DR สำหรับ Junior Dev (อ่าน 30 วิ)

> **อ่านแค่ส่วนนี้ก็เข้าใจภาพรวมได้ทันที**

- **สุขภาพโดยรวม:** [ดีมาก/ดี/ปานกลาง/ต้องปรับปรุง] ✅/⚠️/❌
- **Overall Score:** [X]/10
- **Production Ready?:** [✅ Ready / ⚠️ Ready with Minor Concerns / ❌ Not Ready]

**3 เรื่องที่ต้องรู้ก่อน:**

1. **[เรื่องที่ 1 - สำคัญสุด]** → ดูรายละเอียดใน [Action Plan](#-action-plan-สิ่งที่ต้องทำ)
2. **[เรื่องที่ 2]** → ดูรายละเอียดใน [Detailed Findings](#-detailed-findings)
3. **[เรื่องที่ 3]** → ดูรายละเอียดใน [Deployment Security Audit](#-deployment-security-audit)

**ต้องทำก่อนอะไร?** → เลื่อนไปอ่าน **"Action Plan"** ด้านล่างได้เลย

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
- **Exclusive Gateways:** [รายละเอียด]
- **Parallel Gateways:** [รายละเอียด]
- **Inclusive Gateways:** [รายละเอียด]
- **Event-based Gateways:** [รายละเอียด]

#### Task Types
- **User Tasks:** [รายละเอียด]
- **Service Tasks:** [รายละเอียด]
- **Script Tasks:** [รายละเอียด]
- **Send Tasks:** [รายละเอียด]
- **Receive Tasks:** [รายละเอียด]

#### Sub-process Usage
- **Embedded Sub-processes:** [รายละเอียด]
- **Event Sub-processes:** [รายละเอียด]
- **Call Activities:** [รายละเอียด]

#### Collaboration Patterns
- **Participants:** [รายละเอียด]
- **Message Flows:** [รายละเอียด]
- **Pools:** [รายละเอียด]

### Form Design

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
