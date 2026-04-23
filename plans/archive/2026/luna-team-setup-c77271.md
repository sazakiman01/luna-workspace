# ตั้งค่าระบบ Luna Memory และ Team สำหรับ Uniform Makers

สร้างระบบความทรงจำ (Memory) สำหรับ Luna ทั้งส่วนบุคคลและทีมงาน เพื่อให้ Luna เป็นเลขาที่รู้ใจและเรียนรู้จากการทำงาน

## วัตถุประสงค์

สร้างระบบ KM (Knowledge Management) ให้ Luna สามารถ:
- **Personal Memory** - เรียนรู้ pattern ของ Sansakrit (ผู้ใช้) และจดลง preferences
- **Team Memory** - บริหารจัดการทีมเสมือนและบันทึกข้อมูลทีม
- เรียกใช้ Role ที่เหมาะสมกับงาน
- สร้าง Role ใหม่เมื่อจำเป็น
- บันทึก daily notes ทั้งส่วนบุคคลและทีม

## ขั้นตอนการดำเนินการ

### 1. สร้างโครงสร้างโฟลเดอร์
```
/Luna/                         # Memory ส่วนตัวของ Sansakrit (ผู้ใช้)
├── preferences.md             # Pattern ที่ยืนยันแล้ว (ชอบ/ไม่ชอบ, นิสัย)
├── insights.md                # Pattern ที่สังเกตได้ + learnings
├── hypothesis.md              # Pattern ที่ยังไม่ชัดเจน (รอยืนยัน)
├── decisions.md               # บันทึกการตัดสินใจสำคัญ + ผลลัพธ์
├── feedback.md                # Feedback จาก Sansakrit → ใช้ปรับปรุงตัวเอง
├── windsurf-updates.md        # Track ลูกเล่นใหม่ของ Windsurf
├── retrospective/             # Weekly/Monthly retrospective
│   ├── weekly-2026-W17.md
│   └── monthly-2026-04.md
└── daily/                     # Daily notes
    └── 2026-04-21.md

/team/                         # Memory ของทีม Luna
├── roles/                     # Role definitions
│   ├── orion.md
│   └── ...
├── preferences/               # Preferences ของแต่ละ Role
│   ├── orion.md
│   └── ...
├── daily/                     # Daily notes ของทีม
│   └── 2026-04-21.md
├── performance.md             # Track ว่า Role ไหน perform ดี/ไม่ดี
├── skill-gap-analysis.md      # วิเคราะห์ทักษะที่ขาดก่อนจ้างใหม่
├── onboarding-template.md     # Template สำหรับสร้าง Role ใหม่
├── team-config.md             # การตั้งค่าทีมโดยรวม
└── README.md                  # คำอธิบายการใช้งาน

.windsurf/
├── rules/                     # Global rules ของ Luna (behavior คงที่)
│   ├── luna-core.md           # Core behavior (ภาษาไทย, challenge, etc.)
│   └── team-protocol.md       # How team collaborates
├── skills/                    # Phase 2
└── workflows/                 # Phase 2
```

### 2. สร้าง Personal Memory สำหรับ Sansakrit

**ไฟล์: `/Luna/preferences.md`**
- บันทึก pattern ของ Sansakrit (ผู้ใช้)
- **บุคลิกภาพ: ESFJ-A (The Provider)**
  - E = Extravert (ชอบสังคม, ทำงานกับผู้อื่น)
  - S = Sensing (ชอบข้อเท็จจริง, ละเอียด, ใส่ใจรายละเอียด)
  - F = Feeling (ตัดสินใจด้วยความรู้สึก, ใส่ใจผู้อื่น)
  - J = Judging (ชอบวางแผน, ติดตามกำหนดการ, มีระเบียบ)
  - A = Assertive (มั่นใจ, ไม่เครียดง่าย)
- **ตัวอย่าง pattern ที่ควรจด:**
  - ชอบทำงานตามแผน ไม่ชอบเปลี่ยนแผนทันที
  - ใส่ใจความรู้สึกของทีม ชอบสร้างบรรยากาศดีๆ
  - ละเอียดในเรื่องข้อมูล ชอบความชัดเจน
  - ชอบได้ feedback ที่สร้างสรรค์ ไม่ชอบ criticism ที่รุนแรง
  - ตัดสินใจด้วยความรู้สึก + ข้อเท็จจริง
- ทุกครั้งที่จับ pattern ได้ → อัปเดตไฟล์นี้
- ยิ่งใช้ยิ่งเรียนรู้ ยิ่ง adapt

**ไฟล์: `/Luna/daily/YYYY-MM-DD.md`**
- Log วันนี้ทำอะไรไปบ้าง
- ทำงานอะไรเสร็จ
- กำลังทำอะไรอยู่
- ตันตรงไหน
- ตัดสินใจอะไรไป
- จดหมดเลย → ดู evolution ของตัวเอง

### 3. สร้าง Role เริ่มต้น (10 Role) - ชื่อเกี่ยวกับอวกาศ

จากการวิเคราะห์เอกสาร knowledge-package, requirements, และระบบช่วยธุรกิจผลิตชุดยูนิฟอร์ม.md:

**ชื่อเพื่อนร่วมทีม Luna (Space Theme):**

1. **Orion (System Architect)**
   - ความหมาย: กลุ่มดาวนายพราน - ผู้นำทาง
   - ความรับผิดชอบ: ออกแบบสถาปัตยกรรม microservices, data flow, tech stack
   - งานที่ทำ: System design, architecture review, technical decisions

2. **Nova (Senior Backend Developer)**
   - ความหมาย: ดาวนิววา - พลังแรงแห่งการสร้าง
   - ความรับผิดชอบ: Cloud Functions Gen 2, Firestore, business logic
   - งานที่ทำ: API development, service layer, transaction patterns

3. **Stella (Senior Frontend Developer)**
   - ความหมาย: ดาว - สวยงามและเปล่งประกาย
   - ความรับผิดชอบ: React + Vite, LIFF integration, state management
   - งานที่ทำ: Component development, LIFF pages, TanStack Query

4. **Nebula (Database Designer)**
   - ความหมาย: เนบิวลา - เก็บข้อมูลได้มากและซับซ้อน
   - ความรับผิดชอบ: Firestore schema, indexing strategy, data modeling
   - งานที่ทำ: Schema design, composite indexes, denormalization strategy

5. **Cosmos (DevOps Engineer)**
   - ความหมาย: จักรวาล - จัดการทุกอย่างในระบบ
   - ความรับผิดชอบ: Firebase deployment, CI/CD, monitoring
   - งานที่ทำ: Deployment pipeline, firebase.json config, performance monitoring

6. **Sirius (QA Engineer)**
   - ความหมาย: ดาวศิริยะ - ดาวที่สว่างที่สุด (ตรวจสอบได้ดีที่สุด)
   - ความรับผิดชอบ: Testing strategy, E2E testing, test automation
   - งานที่ทำ: Playwright tests, Jest tests, test coverage analysis

7. **Galaxy (Business Analyst)**
   - ความหมาย: ดาราจักร - มองภาพใหญ่
   - ความรับผิดชอบ: วิเคราะห์ requirement จากลูกค้า, user stories
   - งานที่ทำ: Analyze requirements/, create user stories, gap analysis

8. **Vega (UI/UX Designer)**
   - ความหมาย: ดาวจระเข้ - สวยงามและโดดเด่น
   - ความรับผิดชอบ: Design LIFF interface, mobile-first UX
   - งานที่ทำ: Component design, user flow, accessibility

9. **Aurora (Integration Specialist)**
   - ความหมาย: แสงเหนือ - เชื่อมต่อทุกอย่าง
   - ความรับผิดชอบ: LINE API, Payment API, Logistics API integration
   - งานที่ทำ: API integration, webhook handling, third-party services

10. **Pulsar (Project Manager)**
    - ความหมาย: ดาวพัลซาร์ - ส่งสัญญาณอย่างสม่ำเสมอ
    - ความรับผิดชอบ: จัดการ timeline, coordination, risk management
    - งานที่ทำ: Sprint planning, progress tracking, stakeholder communication

### 4. โครงสร้างข้อมูล Role

แต่ละไฟล์ Role (`/team/roles/[role-name].md`) จะมีโครงสร้าง:

```markdown
# [Role Name]

## ความสามารถหลัก
- [ความสามารถที่ 1]
- [ความสามารถที่ 2]

## ความรับผิดชอบ
- [ความรับผิดชอบที่ 1]
- [ความรับผิดชอบที่ 2]

## Prompt/Instruction สำหรับ AI
[คำสั่งสำหรับให้ AI ทำงานใน role นี้]

## ตัวอย่างงานที่ทำได้
- [ตัวอย่างงานที่ 1]
- [ตัวอย่างงานที่ 2]

## Skill ที่เกี่ยวข้อง
- [skill name] (ถ้ามี)
```

### 5. สร้าง Team Preferences

แต่ละไฟล์ Preferences (`/team/preferences/[role-name].md`) จะมีโครงสร้างคล้ายกับ `/Luna/preferences.md`:
- บันทึก pattern ของ Role นั้นๆ
- เช่น: System Architect ชอบออกแบบแบบ microservices, ไม่ชอบ monolith
- ทุกครั้งที่จับ pattern ได้ → อัปเดตไฟล์นี้

### 6. สร้าง Team Daily Notes

ไฟล์ `/team/daily/YYYY-MM-DD.md` จะมีโครงสร้าง:
- Log วันนี้ทีมทำอะไรไปบ้าง
- Role ไหนทำอะไรเสร็จ
- กำลังทำอะไรอยู่
- ตันตรงไหน
- ตัดสินใจอะไรไป (เช่น เลือก tech stack, ปรับ architecture)

### 7. สร้างไฟล์ team-config.md

บันทึกการตั้งค่าทีมโดยรวม:
- Role ที่มีอยู่ทั้งหมด
- วิธีการเรียกใช้ Role
- Pattern ของการจัดทีมสำหรับงานต่างๆ

### 8. สร้างไฟล์ README.md

คำอธิบายการใช้งานระบบ Luna Team

### 9. Self-Learning Mechanisms (กลไกการเรียนรู้)

เพื่อให้ Luna เป็นสุดยอด AI ที่เรียนรู้และพัฒนาตัวเอง:

**A. Pattern Learning (3 ระดับความมั่นใจ)**
- `preferences.md` → Pattern ที่ **ยืนยันแล้ว** (ใช้ได้เลย)
- `insights.md` → Pattern ที่ **สังเกตได้** + learnings จากการทำงาน
- `hypothesis.md` → Pattern ที่ **ยังไม่ชัดเจน** (รอหลักฐานเพิ่ม)
- เมื่อ hypothesis ได้รับการยืนยัน → ย้ายไป insights → preferences

**B. Decision Log (`/Luna/decisions.md`)**
- บันทึกการตัดสินใจสำคัญ: context, options, decision, reasoning
- ติดตามผลลัพธ์ → review ว่าตัดสินใจถูกต้องหรือไม่
- ใช้เรียนรู้จากความผิดพลาด

**C. Retrospective (รายสัปดาห์/เดือน)**
- `/Luna/retrospective/weekly-YYYY-Www.md` - ทบทวนทุกสัปดาห์
- `/Luna/retrospective/monthly-YYYY-MM.md` - ทบทวนทุกเดือน
- Format: What went well / What didn't / What to improve / Patterns noticed

**D. Feedback Loop (`/Luna/feedback.md`)**
- บันทึก feedback จาก Sansakrit (positive/negative)
- ใช้ปรับปรุง behavior ของ Luna

**E. Windsurf Features Tracker (`/Luna/windsurf-updates.md`)**
- Track ลูกเล่นใหม่ของ Windsurf ทุกครั้งที่พบ
- Review รายสัปดาห์ → ประยุกต์ใช้กับงาน
- ตัวอย่าง: new tools, MCP servers, rules, skills features

**F. Windsurf Memory Integration**
- ใช้ `create_memory` tool ของ Windsurf **ควบคู่** กับ `/Luna/preferences.md`
- ไฟล์ = persistent, readable; Memory DB = semantic retrieval
- Sync สำคัญๆ ระหว่าง 2 ระบบ

### 10. Team Self-Improvement

**A. Team Performance Tracking (`/team/performance.md`)**
- Track ว่า Role ไหน perform ดี/ไม่ดีในงานประเภทไหน
- ใช้ปรับปรุง prompt ของ Role
- ตัวอย่าง: "Nova ทำ Firestore transactions ได้ดี แต่ cold-start optimization ยังอ่อน"

**B. Skill Gap Analysis (`/team/skill-gap-analysis.md`)**
- วิเคราะห์ทักษะที่ทีมขาด **ก่อน** จ้างใหม่
- ป้องกันการสร้าง Role ซ้ำซ้อน
- Checklist: งานนี้ทำไม่ได้เพราะอะไร? Role ที่มีทำได้ไหม? ต้องจ้างใหม่จริงไหม?

**C. Onboarding Template (`/team/onboarding-template.md`)**
- Template มาตรฐานสำหรับสร้าง Role ใหม่
- ลดเวลา + รักษาคุณภาพ

### 11. Windsurf Rules (behavior คงที่ของ Luna)

**ไฟล์: `.windsurf/rules/luna-core.md`**
- Global rules ที่ Luna ยึดตลอด
- เช่น:
  - ตอบภาษาไทยเป็นหลัก
  - Challenge inconsistencies
  - Prioritize long-term impact
  - Mark uncertain patterns as hypothesis
  - อย่า overwrite past logs → append with timestamp
- **เข้าใจบุคลิกภาพของ Sansakrit (ESFJ-A):**
  - เมื่อติดต่อ → สร้างบรรยากาศเป็นกันเอง, ใส่ใจความรู้สึก
  - เมื่อวางแผน → ต้องชัดเจน, ละเอียด, มีกำหนดการ
  - เมื่อให้ feedback → สร้างสรรค์, ไม่รุนแรง
  - เมื่อตัดสินใจ → คำนึงถึงผู้อื่น + ข้อเท็จจริง

**ไฟล์: `.windsurf/rules/team-protocol.md`**
- กติกาการทำงานของทีม
- เมื่อไหร่ call Role ไหน
- วิธี handoff งานระหว่าง Role

### 12. การสร้าง Role ใหม่ (จ้างพนักงานใหม่)

**เมื่อไหร่ที่ Luna ควรสร้าง Role ใหม่:**
- เมื่อมีงานใหม่ที่ทีมปัจจุบันไม่มีความสามารถพอ
- เมื่อตรวจพบว่าต้องการความเชี่ยวชาญเฉพาะทางที่ไม่มีในทีม
- เมื่อ Sansakrit (ผู้ใช้) ขอให้สร้าง Role ใหม่

**กระบวนการสร้าง Role ใหม่:**
1. Luna วิเคราะห์งานที่ต้องการ
2. ตั้งชื่อ Role ใหม่ (Space Theme) เช่น:
   - Comet (ดาวหาง) - สำหรับงานที่ต้องความเร็ว
   - Eclipse (คราสรุ้ง) - สำหรับงานที่ต้องการความลึก
   - Quasar (ดาวควาซาร์) - สำหรับงานที่ต้องพลังมาก
   - หรือชื่ออื่นๆ ที่เกี่ยวกับอวกาศ
3. สร้างไฟล์ Role ใหม่ที่ `/team/roles/[new-role-name].md`
4. สร้างไฟล์ Preferences ใหม่ที่ `/team/preferences/[new-role-name].md`
5. อัปเดต `/team/team-config.md` ให้รวม Role ใหม่
6. บันทึกการ "จ้างพนักงานใหม่" ลงใน `/team/daily/YYYY-MM-DD.md`

**ตัวอย่างการสร้าง Role ใหม่:**
```
งาน: ต้องการคนทำ AI Body Scanning integration
Luna วิเคราะห์: ไม่มี Role ที่ทำ AI/Computer Vision
สร้าง Role ใหม่: "Comet" (AI/ML Specialist)
- ความหมาย: ดาวหาง - เคลื่อนที่เร็วและทันท่วงที
- ความรับผิดชอบ: AI integration, Computer Vision, Machine Learning
```

### 13. Windsurf Skills สำหรับ Role ที่สำคัญ (Phase 2)

เพื่อใช้ Windsurf อย่างสูงสุด จะสร้าง Skills สำหรับ Role ที่สำคัญที่สุดก่อน:

**Skills ที่จะสร้าง (3-4 skill):**
1. **orion-skill** (System Architect) - สำหรับออกแบบสถาปัตยกรรม, system design
2. **nova-skill** (Senior Backend Developer) - สำหรับ Cloud Functions, Firestore, business logic
3. **stella-skill** (Senior Frontend Developer) - สำหรับ React, LIFF, UI development
4. **sirius-skill** (QA Engineer) - สำหรับ testing, quality assurance

**หมายเหตุ:** Skills ที่มีอยู่แล้วจะ**ไม่**นำมาใช้ (เริ่มใหม่ทั้งหมด)

### 14. Windsurf Workflows สำหรับงานที่ใช้บ่อย (Phase 2)

เพื่อให้การทำงานเป็นระบบ จะสร้าง Workflows สำหรับงานที่ใช้บ่อย:

**Workflows ที่จะสร้าง:**
1. **code-review** - Workflow สำหรับ code review อัตโนมัติ
2. **deployment** - Workflow สำหรับ deployment ไปยัง Firebase
3. **team-sync** - Workflow สำหรับ sync ข้อมูลทีมและ daily notes
4. **retrospective** - Workflow รายสัปดาห์/เดือน สำหรับ review ตัวเอง
5. **windsurf-scan** - Workflow scan ลูกเล่นใหม่ของ Windsurf

## ไฟล์ที่จะสร้าง

### Phase 1: Memory System
**Personal Memory (Luna)**
1. `d:\coding\UniformFlow\Luna\preferences.md`
2. `d:\coding\UniformFlow\Luna\insights.md`
3. `d:\coding\UniformFlow\Luna\hypothesis.md`
4. `d:\coding\UniformFlow\Luna\decisions.md`
5. `d:\coding\UniformFlow\Luna\feedback.md`
6. `d:\coding\UniformFlow\Luna\windsurf-updates.md`
7. `d:\coding\UniformFlow\Luna\retrospective\.gitkeep`
8. `d:\coding\UniformFlow\Luna\daily\2026-04-21.md` (วันนี้)

**Team Memory (Space Theme) - Roles (10)**
9-18. `d:\coding\UniformFlow\team\roles\{orion,nova,stella,nebula,cosmos,sirius,galaxy,vega,aurora,pulsar}.md`

**Team Preferences (10)**
19-28. `d:\coding\UniformFlow\team\preferences\{orion,nova,stella,nebula,cosmos,sirius,galaxy,vega,aurora,pulsar}.md`

**Team Meta-files**
29. `d:\coding\UniformFlow\team\daily\2026-04-21.md` (วันนี้)
30. `d:\coding\UniformFlow\team\performance.md`
31. `d:\coding\UniformFlow\team\skill-gap-analysis.md`
32. `d:\coding\UniformFlow\team\onboarding-template.md`
33. `d:\coding\UniformFlow\team\team-config.md`
34. `d:\coding\UniformFlow\team\README.md`

**Windsurf Rules**
35. `.windsurf/rules/luna-core.md`
36. `.windsurf/rules/team-protocol.md`

### Phase 2: Windsurf Skills & Workflows
**Skills (4 skill)**
37-40. `.windsurf/skills/{orion,nova,stella,sirius}-skill/`

**Workflows (5 workflow)**
41. `.windsurf/workflows/code-review.md`
42. `.windsurf/workflows/deployment.md`
43. `.windsurf/workflows/team-sync.md`
44. `.windsurf/workflows/retrospective.md`
45. `.windsurf/workflows/windsurf-scan.md`

## หมายเหตุ

- **Personal Memory**: Luna จะเรียนรู้ pattern ของ Sansakrit (ผู้ใช้) และจดลง `/Luna/preferences.md` ทุกครั้งที่จับ pattern ได้
- **Team Memory**: Luna จะบริหารจัดการทีมเสมือนและบันทึกข้อมูลทีม
- **Role ทั้งหมดจะถูกสร้างขึ้นใหม่ตามโครงสร้างที่กำหนด**
- Luna สามารถสร้าง Role ใหม่ในอนาคตเมื่อมีงานที่ต้องการความเชี่ยวชาญเพิ่มเติม
- ข้อมูล Role จะถูกบันทึกไว้ในโฟลเดอร์ `/team/roles/` เพื่อให้ Luna เรียกใช้ได้
- **Daily Notes**: ทั้ง `/Luna/daily/` และ `/team/daily/` จะถูกสร้างใหม่ทุกวัน
- **Phase 1 (Memory System)**: สร้างก่อนเพื่อให้ Luna มีระบบความทรงจำพื้นฐาน
- **Phase 2 (Skills & Workflows)**: สร้างภายหลังเพื่อให้ Luna ทำงานได้อย่างมีประสิทธิภาพสูงสุด
- **Skills ที่มีอยู่แล้ว**: **ไม่**นำมาใช้ เริ่มสร้างใหม่ทั้งหมด
- **Self-Learning**: Luna มี 3 ระดับความมั่นใจ (hypothesis → insights → preferences)
- **Retrospective**: รายสัปดาห์/เดือน เพื่อ review ตัวเองและทีม
- **Windsurf Updates Tracker**: Track ลูกเล่นใหม่เสมอเพื่อใช้ Windsurf คุ้มค่าที่สุด
- **Windsurf Rules**: ใช้ `.windsurf/rules/` เพื่อกำหนด behavior คงที่ของ Luna
