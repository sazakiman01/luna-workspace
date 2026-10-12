# [Repo Name] Backend API Review - [Reviewer Name]

**Date:** YYYY-MM-DD
**Reviewer:** Sansakrit (Dev Lead)
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

1. **[ชื่อปัญหาสั้นๆ]** — `[file path]`
   - **ทำอะไร:** [1 ประโยค]
   - **ทำไม:** [1 ประโยค เช่น "security risk", "API พัง"]
   - **ดูรายละเอียด:** → [Issues > Critical #1](#-critical-ต้องแก้ก่อน-mergeproduction)

### 🟠 ต้องทำก่อน Production (High)

1. **[ชื่อปัญหาสั้นๆ]** — `[file path]`
   - **ทำอะไร:** [1 ประโยค]
   - **ทำไม:** [1 ประโยค]
   - **ดูรายละเอียด:** → [Issues > High #1](#-high-ควรแก้ก่อน-production)

### 🟡 ควรทำภายใน 1-2 สัปดาห์ (Medium)

1. **[ชื่อปัญหาสั้นๆ]** — `[file path]`
   - **ทำอะไร:** [1 ประโยค]
   - **ดูรายละเอียด:** → [Issues > Medium #1](#-medium-ควรแก้ภายใน-1-2-สัปดาห์)

### 🟢 ควรทำภายใน 1-3 เดือน (Low)

1. **[ชื่อปัญหาสั้นๆ]** — [ส่วนที่เกี่ยวข้อง]
   - **ทำอะไร:** [1 ประโยค]

---

## 📊 Backend API Dimension Scores (ภาพรวมคะแนน)

| ด้าน | Score | Status | หมายเหตุ | เหตุผลที่ไม่ได้เต็ม (optional) |
|------|-------|--------|----------|------------------|
| **API Design** (การออกแบบ API) | [X]/10 | ✅/⚠️/❌ | [สั้นๆ] | [ถ้ามีอะไรตกหล่น ระบุได้ที่นี่] |
| **Security** (ความปลอดภัย) | [X]/10 | ✅/⚠️/❌ | [สั้นๆ] | [ถ้ามีอะไรตกหล่น ระบุได้ที่นี่] |
| **Performance** (ความเร็ว) | [X]/10 | ✅/⚠️/❌ | [สั้นๆ] | [ถ้ามีอะไรตกหล่น ระบุได้ที่นี่] |
| **Error Handling** (การจัดการ error) | [X]/10 | ✅/⚠️/❌ | [สั้นๆ] | [ถ้ามีอะไรตกหล่น ระบุได้ที่นี่] |
| **Documentation** (เอกสาร) | [X]/10 | ✅/⚠️/❌ | [สั้นๆ] | [ถ้ามีอะไรตกหล่น ระบุได้ที่นี่] |
| **Testing** (การทดสอบ) | [X]/10 | ✅/⚠️/❌ | [สั้นๆ] | [ถ้ามีอะไรตกหล่น ระบุได้ที่นี่] |
| **Database Design** (การออกแบบฐานข้อมูล) | [X]/10 | ✅/⚠️/❌ | [สั้นๆ] | [ถ้ามีอะไรตกหล่น ระบุได้ที่นี่] |
| **Architecture** (โครงสร้าง) | [X]/10 | ✅/⚠️/❌ | [สั้นๆ] | [ถ้ามีอะไรตกหล่น ระบุได้ที่นี่] |
| **Code Quality** (คุณภาพโค้ด) | [X]/10 | ✅/⚠️/❌ | [สั้นๆ] | [ถ้ามีอะไรตกหล่น ระบุได้ที่นี่] |
| **Production Readiness** (พร้อมขึ้น prod) | [X]/10 | ✅/⚠️/❌ | [สั้นๆ] | [ถ้ามีอะไรตกหล่น ระบุได้ที่นี่] |

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

#### 1. [Category - เช่น Architecture]
- **[Aspect]:** [รายละเอียด]
- **[Aspect]:** [รายละเอียด]

#### 2. [Category - เช่น Testing]
- **[Aspect]:** [รายละเอียด]

---

### ⚠️ Issues (ปัญหาที่เจอ แบ่งตามความสำคัญ)

#### 🔴 Critical (ต้องแก้ก่อน merge/production)

**ไม่พบ critical issues** หรือ [รายการ critical issues]

1. **[Issue Title]**
   - **ที่ไหน:** `[file path]` lines [X-Y]
   - **ด้าน:** [เช่น Security, API Design]
   - **ปัญหาคืออะไร:** [อธิบายแบบง่ายๆ ให้ junior เข้าใจ]
   - **ทำไมต้องแก้:** [เช่น "ทำให้ API ช้า", "มี security risk"]
   - **วิธีแก้:** [วิธีแก้ + code example]

#### 🟠 High (ควรแก้ก่อน production)

1. **[Issue Title]**
   - **ที่ไหน:** `[file path]` lines [X-Y]
   - **ด้าน:** [เช่น Architecture, Database Design]
   - **ปัญหาคืออะไร:** [อธิบายแบบง่ายๆ]
   - **ทำไมต้องแก้:** [เช่น "ทำให้ code อ่านยาก", "maintain ยาก"]
   - **วิธีแก้:** [วิธีแก้ + code example]

#### 🟡 Medium (ควรแก้ภายใน 1-2 สัปดาห์)

1. **[Issue Title]**
   - **ที่ไหน:** `[file path]` lines [X-Y]
   - **ด้าน:** [เช่น Performance, Testing]
   - **ปัญหาคืออะไร:** [อธิบายแบบง่ายๆ]
   - **ทำไมต้องแก้:** [เหตุผล]
   - **วิธีแก้:** [วิธีแก้]

#### 🟢 Low (ควรแก้ภายใน 1-3 เดือน)

1. **[Issue Title]**
   - **ที่ไหน:** `[file path]` lines [X-Y]
   - **ด้าน:** [เช่น Code Quality, Code Style]
   - **ปัญหาคืออะไร:** [อธิบาย]
   - **วิธีแก้:** [วิธีแก้]

---

## 🚀 Deployment Security Audit

> ตรวจสอบว่ามี folder/file ที่ไม่ควรอยู่ใน repo หรือถูก deploy ไป production หรือไม่

### ✅ Checklist (ต้องเช็คทุกครั้ง)

- [ ] **Environment & Secrets** — `.env`, `.env.local`, `.secrets`, credentials
- [ ] **Development/Editor Configs** — `.vscode/`, `.idea/`, `.claude/`, `.windsurf/`, `.cursor/`
- [ ] **Source Control & CI/CD** — `.git/`, `.github/`, `.gitlab-ci.yml`
- [ ] **Documentation & Notes** — `README.md`, `docs/`, `notes/`, `CLAUDE.md`
- [ ] **Testing & Coverage** — `coverage/`, `test-results/`, `*_test.go`, `*_test.ts`
- [ ] **Build Artifacts** — `bin/`, `dist/`, `build/`, `.cache/`, `tmp/`
- [ ] **Database & Logs** — Database dumps, backup files, `logs/`, `*.log`
- [ ] **Sensitive Data** — Secrets, keys, certificates, credentials in code

### ✅ สิ่งที่เช็คแล้ว

- [x] `.gitignore` มีรายการที่จำเป็น
- [x] Dockerfile ไม่รวม sensitive files
- [x] Environment variables ไม่ถูก commit
- [x] Database credentials ไม่ถูก hardcode
- [x] API keys/secrets ไม่ถูก expose

### ❌ เจอใน repo (ควรเคลียร์ออก)

> **สำคัญ:** ถึงแม้จะถูก ignore ใน `.gitignore` แล้ว แต่ยังอยู่ใน git history ต้องเคลียร์ออกด้วย

1. **`[folder/file name]`**
   - **ที่ไหน:** `[path]`
   - **เป็นอะไร:** [เช่น env vars, database credentials, AI configs]
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
- Database credentials in code
- API keys/secrets in code
- Backup migration scripts
- Logs with sensitive data

### 📚 Reference: Folder/File ที่ไม่ควร Deploy (Backend-Specific)

<details>
<summary>คลิกเพื่อดูรายการเต็ม (8 หมวด)</summary>

**1. Environment & Secrets**
- `.env`, `.env.local`, `.env.*` — environment variables
- `.secrets`, `.credentials` — secrets files
- API keys, JWT secrets, database passwords
- SSL certificates (ถ้าไม่ได้ encrypt)

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
- `coverage/`, `test-results/`
- `*_test.go`, `*_test.ts`, test mocks

**6. Build Artifacts (intermediate)**
- `bin/`, `dist/`, `build/` (ถ้าไม่ใช่ production)
- `.cache/`, `tmp/`, `temp/`
- Docker image cache

**7. Database & Logs**
- Database dumps, backup files
- Migration backups
- `logs/`, `*.log` (ถ้ามี sensitive data)
- SQL files ที่มี credentials

**8. Sensitive Data**
- Secrets, keys, certificates (ถ้าไม่ได้ encrypt)
- Database credentials ใน code
- API keys ใน code
- User data dumps

</details>

### 💡 ทำไมต้องเคลียร์ออกจาก repo (ไม่ใช่แค่ ignore)

1. **ป้องกัน security breach** — credentials ถูก leak
2. **ป้องกัน commit โดยไม่ตั้งใจ** — `.gitignore` ถูกแก้ได้
3. **ลดขนาด repo** — folder เกินความจำเป็น
4. **Clean git history** — ประวัติสะอาด ไล่ย้อนง่าย

### 📊 Deployment Security Score

**Score:** [X]/10 | **Status:** ✅/⚠️/❌
**Notes:** [สรุปสั้นๆ]

---

## 🔧 Framework-Specific Findings

> สำหรับคนที่อยากรู้ลึก เกี่ยวกับ framework ที่ใช้

### [Go + Fiber Framework]

#### Fiber Web Framework
- **Router Configuration:** [รายละเอียด]
- **Middleware Usage:** [รายละเอียด]
- **Error Handling:** [รายละเอียด]
- **Request/Response Processing:** [รายละเอียด]

#### Go Patterns
- **Service Layer:** [รายละเอียด]
- **Repository Pattern:** [รายละเอียด]
- **Dependency Injection:** [รายละเอียด]
- **Context Usage:** [รายละเอียด]

#### Database (PostgreSQL / MongoDB)
- **Connection Management:** [รายละเอียด]
- **Query Patterns:** [รายละเอียด]
- **Transaction Handling:** [รายละเอียด]
- **Indexing Strategy:** [รายละเอียด]

### Authentication & Authorization

#### JWT
- **Token Generation:** [รายละเอียด]
- **Token Validation:** [รายละเอียด]
- **Refresh Token Strategy:** [รายละเอียด]

#### OAuth2
- **OAuth Flow:** [รายละเอียด]
- **Scope Management:** [รายละเอียด]
- **Token Storage:** [รายละเอียด]

### Testing

#### Unit Tests
- **Test Coverage:** [รายละเอียด]
- **Mock Usage:** [รายละเอียด]
- **Test Organization:** [รายละเอียด]

#### Integration Tests
- **Database Testing:** [รายละเอียด]
- **API Endpoint Testing:** [รายละเอียด]
- **External Service Mocking:** [รายละเอียด]

---

## 💡 Best Practices Learnings

> สิ่งที่ทำได้ดี + แนะนำเพิ่มเติม (ไม่ใช่ bug — เป็นการพัฒนาทักษะ)

### 1. [Category - เช่น API Design]
- **[Best Practice]:** [อธิบายสั้นๆ ว่าคืออะไร และทำไมดี]
- **[Best Practice]:** [อธิบาย]

### 2. [Category - เช่น Security]
- **[Best Practice]:** [อธิบาย]
- **[Best Practice]:** [อธิบาย]

### 3. [Category - เช่น Performance]
- **[Best Practice]:** [อธิบาย]

---

## ✅ Production Readiness Checklist

> เช็คก่อนขึ้น production

- [ ] **Environment Variables** — ตั้งค่าถูกต้องสำหรับ production
- [ ] **Database Migrations** — มี migration scripts และ rollback plan
- [ ] **Error Tracking** — มี Sentry หรือ error tracking
- [ ] **Monitoring** — มี monitoring tools (Prometheus, Grafana)
- [ ] **Logging** — มี logging strategy ชัดเจน
- [ ] **Health Checks** — มี health check endpoints
- [ ] **Rate Limiting** — มี rate limiting ป้องกัน abuse
- [ ] **Security Headers** — ตั้งค่า security headers ถูกต้อง
- [ ] **API Documentation** — มี API docs (OpenAPI/Swagger)
- [ ] **Testing** — Test coverage พอสมควร
- [ ] **Deployment Docs** — มี documentation
- [ ] **Rollback Plan** — มี plan rollback

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

**ทำไมไม่ได้ 10/10 (optional):**
- [ถ้ามีอะไรตกหล่น ระบุได้ที่นี่ เช่น ไม่มี error tracking, ไม่มี monitoring]
- [ถ้าได้คะแนนเต็ม ไม่ต้องกรอกส่วนนี้]

**ถ้าแก้ตามที่แนะนำ:** จะทำให้ [backend API] [ประโยชน์ที่จะได้รับ]

**Next Steps:**
1. [ขั้นตอนถัดไป เช่น แก้ critical issues ก่อน]
2. [ขั้นตอนถัดไป]
3. [ขั้นตอนถัดไป]

---

**ถ้ามีคำถาม:** ถามได้เลย ไม่ต้องเกร็ง 🙌

---
*Template สำหรับ Backend API Review - ใช้โดย Nova (Backend Dev)*
