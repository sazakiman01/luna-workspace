# architecture.json — Extraction Checklist & Schema

*Payload สำหรับ skill `generate-arch-json` · อ่านไฟล์นี้ก่อนเริ่มสกัดเสมอ*

---

## หลักการ

ไฟล์นี้ไม่ใช่ "ผังที่อยากให้ระบบเป็น" — มันคือ **บันทึกของจริงที่ทีมจะใช้ตัดสินใจ**
เส้นที่ลากผิดหนึ่งเส้น = คนวางแผนแก้ระบบผิดทั้งงาน

→ **จดของจริง + มีที่มาอ้างอิงได้ทุกบรรทัด + ไม่รู้ให้เว้นว่าง ไม่ใช่เดา**

ผลลัพธ์ถูกนำเข้า sys-blueprint เป็นชิ้นงาน `ARCH-nn` (ADR-0039) — ตัวอ่านฝั่งนั้นคือ
`src/lib/archSchema.js` ซึ่ง **บล็อกไฟล์ที่อ้างถึงของที่ไม่มีอยู่** (ดู §สัญญากับ viewer)

---

## Phase 1 — Extraction checklist

ไล่ตามลำดับนี้ อย่าข้าม:

### 1.1 หา "ระบบ" ที่มีอยู่จริง
- [ ] repo/monorepo — โฟลเดอร์ service, `package.json` แต่ละตัว, `go.mod`, `pom.xml`
- [ ] ไฟล์ deploy — `docker-compose.yml`, k8s manifest, `firebase.json`, IaC (Terraform/Bicep)
- [ ] เอกสารสถาปัตยกรรมที่มีอยู่ (SDD/SA Blueprint/`DOC-nn` ในระบบ) — **ถ้าเป็นผลสกัดด้วย AI ให้เปิดต้นฉบับยืนยัน**
- [ ] ระบบภายนอกที่ไม่ได้อยู่ใน repo — SAP, LINE, payment gateway, ระบบของคู่ค้า
- [ ] **คนก็เป็น "ระบบ" ชนิด `user`** ถ้าเป็นต้นทางของการไหล

### 1.2 หาการเชื่อมต่อจริง (ส่วนที่พลาดง่ายที่สุด)
- [ ] grep base URL / `fetch(` / `axios` / client SDK ที่ชี้ออกนอกระบบตัวเอง
- [ ] คิว/หัวข้อของ message broker — `topic`, `queue`, `subscribe`, Kafka config
- [ ] ตารางฐานข้อมูลที่ระบบอื่นอ่านตรงๆ (integration ที่ไม่มี API — เจอบ่อยในระบบเก่า)
- [ ] งานตามเวลา/แบตช์ — cron, scheduler, ไฟล์ที่ drop ลงโฟลเดอร์แล้วอีกระบบมาอ่าน
- [ ] RPA / งานที่คนคีย์เอง — **ต้องจดด้วย** เพราะเป็นจุดเปราะที่สุดของ landscape
- [ ] **โพรโทคอลต้องมาจากหลักฐาน** — เห็น `fetch` ไม่ได้แปลว่า REST เสมอ (อาจเป็น SOAP over HTTP)

### 1.3 ข้อมูลประกอบของแต่ละระบบ
- [ ] เจ้าของธุรกิจ / เจ้าของเทคนิค / ทีม — จากเอกสารหรือ `CODEOWNERS` · ไม่มีให้เว้น
- [ ] วงจรชีวิต — ระบบที่กำลังเลิกใช้ **สำคัญมาก** (ทีมต้องรู้ว่าอย่าไปต่อยอด)
- [ ] เทคโนโลยีจริง — จาก manifest ไม่ใช่จากความจำ
- [ ] environment ที่ระบบนั้นถูกติดตั้ง — เป็น **ป้ายข้อความ** ไม่ใช่ระเบียนแยก

### 1.4 สถานการณ์การไหล (`flows`) — 1-3 เรื่องพอ
- [ ] เลือกงานที่ **อธิบายระบบได้ดีที่สุด** (เส้นทางหลัก + เส้นทางที่ข้ามหลายระบบ)
- [ ] ไล่ทีละขั้นจากต้นทางถึงปลายทาง · ทุกขั้นต้องชี้ **เส้นที่มีอยู่จริงในมุมมองนั้น**
- [ ] เขียนคำอธิบายขั้นเป็นภาษาที่คนนอกทีมอ่านรู้เรื่อง

### 1.5 สิ่งที่ห้ามใส่เด็ดขาด
- [ ] credential / token / รหัสผ่าน / connection string ที่มีรหัสผ่าน / private key
- [ ] ชื่อ-นามสกุลจริงคู่กับเบอร์/อีเมลส่วนตัว (เจ้าของระบบใช้ชื่อทีมหรือชื่อเล่นพอ)
- [ ] URL ภายในที่มี query string ซึ่งมีข้อมูลลับ
> ไฟล์นี้อัปโหลดเข้าระบบกลางที่สมาชิกทุกคนในโปรเจกต์อ่านได้ · ยึด `rules/data-handling.md`

---

## Phase 2 — Schema

```jsonc
{
  "schemaVersion": 1,
  "name": "ชื่อผัง",
  "description": "ทำไมผังนี้ถึงมีอยู่ (ไม่บังคับ)",
  "demo": false,              // true = ข้อมูลตัวอย่าง ไม่ใช่ระบบจริง — ระบบจะติดป้ายให้ทุกที่

  "systems": [{
    "id": "api",             // ★ ห้ามเปลี่ยนภายหลัง (ดู §สัญญากับ viewer)
    "code": "SYS-03",        // รหัสที่ทีมใช้เรียก (ไม่บังคับ)
    "name": "Backend API",
    "nameTh": "บริการหลังบ้าน",
    "type": "backend",       // user|frontend|backend|service|database|external|workflow|messageBroker|file|infrastructure
    "description": "…",
    "domain": "Contract",
    "businessOwner": "…", "technicalOwner": "…", "team": "…",
    "criticality": "สูง",
    "lifecycle": "ACTIVE",   // PLANNING|DEVELOPMENT|ACTIVE|MAINTENANCE|DEPRECATED|RETIRED
    "techStack": ["Node.js", "Express"],
    "repositoryUrl": "https://…", "docsUrl": "https://…",
    "environments": ["DEV", "SIT", "UAT", "PROD"],
    "status": "SUCCESS"      // SUCCESS|PROCESSING|WARNING|FAILED|INACTIVE — ★ ข้อมูลตัวอย่างเท่านั้น ไม่ใช่สถานะสด
  }],

  "modules": [{ "id": "m1", "systemId": "api", "code": "MOD-01", "name": "…", "capability": "…", "owner": "…" }],

  "integrations": [{
    "id": "e2",
    "name": "เรียก API",
    "sourceId": "web", "targetId": "api",
    "direction": "two-way",  // one-way|two-way
    "protocol": "REST",      // REST|SOAP|MQ|KAFKA|DB|SFTP|BATCH_FILE|TEXT_FILE|RPA|MANUAL
    "dataFormat": "JSON", "authType": "OAuth2 (Bearer)",
    "endpoint": "/api/v1/contracts",     // ★ ห้ามมีความลับ
    "trigger": "ผู้ใช้กดบันทึก", "frequency": "ตามการใช้งาน",
    "timeout": "30s", "retryPolicy": "3 ครั้ง เว้น 5 วิ",
    "errorHandling": "แจ้งทีมทาง e-mail",
    "dataClassification": "Confidential",
    "owner": "ทีม Backend"
  }],

  "views": [{
    "id": "v1",
    "name": "ภาพรวมระบบ",
    "type": "SYSTEM_CONTEXT", // SYSTEM_CONTEXT|APPLICATION|MODULE|INTEGRATION|DATA_FLOW|DEPLOYMENT|SECURITY
    "nodes": [{ "id": "n-api", "systemId": "api", "position": { "x": 410, "y": 280 } }],
    "edges": [{ "id": "ed2", "integrationId": "e2", "source": "n-web", "target": "n-api", "animated": false }]
  }],

  "flows": [{
    "id": "f1", "viewId": "v1", "name": "การสร้างสัญญา",
    "steps": [{ "seq": 1, "edgeId": "ed1", "title": "ผู้ใช้เปิดเว็บ", "description": "…", "durationMs": 1200, "status": "SUCCESS" }]
  }]
}
```

**ตำแหน่ง (`position`)**: ใส่ได้ก็ดี (จัดผังให้อ่านง่ายตามการไหลซ้าย→ขวา ระยะห่างแนวนอน ~190px
แนวตั้ง ~180px) · **ไม่ใส่ก็ได้** — ระบบจัดวางให้อัตโนมัติเป็นตาราง แล้วคนไปลากจัดทีหลังในตัวแก้

---

## สัญญากับ viewer (ทำไมรูปถึงบังคับ)

ไฟล์นี้ถูกอ่านโดย `src/lib/archSchema.js` ของ sys-blueprint ⇒ ผู้เขียนกับผู้อ่านเป็น
**สองครึ่งของสัญญาเดียวกัน** แก้ที่นี่ต้องดูอีกฝั่งเสมอ

### สิ่งที่ทำให้ไฟล์ **ถูกปฏิเสธ** (ระดับ `error` — อัปโหลดไม่ผ่าน)

| อาการ | ตัวอย่าง |
|---|---|
| ไม่มี `systems` หรือไม่ใช่ array | `{ "views": [] }` |
| `id` ซ้ำในคอลเลกชันเดียวกัน | ระบบสองตัวใช้ `"id": "api"` |
| เส้นชี้กล่องที่ไม่มีในมุมมองนั้น | `edges[0].target = "n-xxx"` ที่ไม่มีใน `nodes` |
| กล่องชี้ระบบ/โมดูลที่ไม่มี | `nodes[0].systemId = "ไม่มี"` |
| การเชื่อมต่อชี้ระบบที่ไม่มี | `sourceId`/`targetId` ผิด |
| เส้นชี้ `integrationId` ที่ไม่มี | — |
| สถานการณ์ชี้มุมมองที่ไม่มี | `flows[0].viewId` ผิด |
| **ขั้นของสถานการณ์ชี้เส้นที่อยู่คนละมุมมอง** | กับดักที่ตาคนมองข้ามบ่อยที่สุด |
| ลำดับขั้น (`seq`) ซ้ำกันในสถานการณ์เดียว | — |

### สิ่งที่ **เตือนแต่ผ่าน** (ระดับ `warn`)

ค่า enum ที่ระบบไม่รู้จัก (เก็บไว้ตามเดิม) · มุมมองที่ยังไม่มีกล่อง · กล่องที่ไม่มีตำแหน่ง ·
ระบบที่ไม่อยู่ในมุมมองไหนเลย · `schemaVersion` ใหม่กว่าตัวอ่าน
→ ตั้งใจให้ผ่าน เพราะไฟล์ของทีมอื่นย่อมมีคำที่ระบบไม่รู้จัก

### กฎที่ต้องรู้เพิ่ม

- **`id` ทุกตัวห้ามเปลี่ยนภายหลัง** — คลื่นถัดไปจะผูกคอมเมนต์/ลิงก์กับ `id` ของกล่อง
  เปลี่ยนแล้วของที่ผูกไว้จะพังเงียบ (บทเรียนเดียวกับ element id ของ BPMN, ADR-0009)
  เลิกใช้ระบบไหนให้ตั้ง `lifecycle: "RETIRED"` **อย่าลบ id ทิ้งแล้วสร้างใหม่**
- **ฟิลด์แปลกปลอมที่ระบบไม่รู้จักจะถูกเก็บไว้ครบ** — ทีมใส่ข้อมูลของตัวเองเพิ่มได้ตามสบาย
- **`status` คือข้อมูลตัวอย่าง** ระบบติดป้าย "ตัวอย่าง:" ให้ทุกที่ — ถ้าไม่มีข้อมูลสถานะจริง
  **ให้เว้นว่างดีกว่าใส่มั่ว**
- แยกมุมมองตามคำถามที่คนถาม อย่ายัดทุกอย่างลงผังเดียว — เช่น `SYSTEM_CONTEXT` ภาพรวม ·
  `INTEGRATION` เน้นเส้นเชื่อม · `DEPLOYMENT` ว่าอะไรอยู่เครื่องไหน

---

## Phase 3 — Self-check ก่อนส่ง

- [ ] ทุกระบบ/เส้น มีที่มาอ้างอิงได้ (บอกได้ว่ารู้จาก `file:line` หรือเอกสารหัวข้อไหน)
- [ ] **ไม่มี credential/PII หลุดลงไฟล์**
- [ ] `id` ทุกตัวไม่ซ้ำ · ทุก `source`/`target`/`integrationId`/`viewId`/`edgeId` ชี้ของที่มีจริง
- [ ] ทุกขั้นของสถานการณ์ชี้เส้น **ในมุมมองเดียวกับ `viewId` ของมัน**
- [ ] `JSON.parse` ผ่าน (รัน `node -e "JSON.parse(require('fs').readFileSync('architecture.json','utf8'))"`)
- [ ] ระบบที่จดไว้แต่ไม่โผล่ในมุมมองไหนเลย — ตั้งใจหรือลืม
- [ ] ถ้ามี sys-blueprint อยู่ในเครื่อง ตรวจซ้ำด้วยตัวอ่านจริง:
      `node -e "import('./src/lib/archSchema.js').then(m=>console.log(JSON.stringify(m.parseArchJson(require('fs').readFileSync(process.argv[1],'utf8')).problems,null,1)))" architecture.json`
- [ ] รายงานกลับต้องบอก **จุดที่เว้นว่างเพราะไม่มีหลักฐาน** ไม่ใช่รายงานแต่ของที่ทำได้
