# Team Lead Planner – Phase 0 (Standalone MVP)
แผนนี้ออกแบบ MVP ที่แยกจากข้อมูลหลัก เพื่อให้ Team Lead คนเดียวสามารถวางแผน high-level ได้รวดเร็วด้วยการป้อนข้อมูลเองทั้งหมด.

## เป้าหมาย
1. ให้ Lead สร้าง/แก้ไขแผน high-level ได้เองทันทีโดยไม่รอดึงข้อมูลจากระบบอื่น.
2. เน้นความคล่องตัว: UI เรียบง่าย, แยกจาก Delivery Hub หลัก, refresh ไม่กระทบใคร.
3. เก็บข้อมูลในฝั่งผู้ใช้ (localStorage + export/import JSON) เพื่อทดลองไอเดียก่อนเชื่อม Firestore.

## หลักการออกแบบ
- Standalone panel/route (เช่น `/high-level/planner`) ไม่พึ่ง services เดิม.
- ข้อมูลทุกชิ้นสร้าง/แก้ไขด้วยฟอร์มง่ายๆ; ไม่มี auto-sync.
- ลบ/เพิ่ม/เรียงบล็อกได้ในคลิกเดียว, drag & drop ทันที.
- รองรับการ duplicate plan และ share ผ่านไฟล์ JSON ที่ส่งต่อได้.
- Offline-first เพื่อลด Firestore reads/writes ให้เป็นศูนย์ใน Phase 0.

## ฟีเจอร์หลักของ MVP
1. **Project Buckets**
   - Lead เพิ่มรายการ project ได้ไม่จำกัด (ชื่อ, owner, timeframe text).
   - Toggle collapse เพื่อโฟกัสเฉพาะบาง project.
2. **Timeline Blocks (Manual)**
   - เพิ่ม Block ต่อ project ด้วย input: ชื่อ phase, start/end date, status color.
   - Drag/resize block ภายใน UI เพื่อปรับวันที่ (state-only).
   - Quick badge เช่น "Risk", "Need Decision" ที่ toggle ได้ทันที.
3. **Notes Drawer & Checklist**
   - คลิก block เปิด drawer (reuse `DailyTaskDrawer` pattern) กรอก note, checklist สั้นๆ.
   - Checklist ใช้ simple toggle list (จำได้เฉพาะ local).
4. **Plan Management**
   - LocalStorage auto-save ทุก 2 วินาที.
   - ปุ่ม Export JSON / Import JSON เพื่อแชร์ให้ทีมอื่น.
   - ปุ่ม Reset (ยืนยันก่อน) เพื่อเริ่มวางแผนใหม่.

## ข้อมูลและที่จัดเก็บ
| รายการ | รูปแบบ | ที่เก็บ |
| --- | --- | --- |
| Project metadata | { id, title, owner, goal, color } | `localStorage['hlp-projects']` |
| Timeline blocks | { id, projectId, title, start, end, status, badges } | `localStorage['hlp-blocks']` |
| Notes/checklist | ติดกับ block object | รวมใน JSON เดียวกัน |
| UI state | zoom level, filter, layout mode | `localStorage['hlp-ui']` |

## UX Flow (ง่ายที่สุด)
1. เข้าหน้าพิเศษ → ถ้าไม่มีข้อมูล แสดง Empty State + ปุ่ม "สร้างแผนแรก".
2. Stepper 3 ขั้น: (1) เพิ่ม Project, (2) เพิ่ม Block, (3) ปรับ timeline.
3. บน viewport แสดง swimlane แนวตั้ง, มี mini toolbar (เพิ่ม block, filter, zoom, export).
4. Drawer ด้านขวาใช้ form เดียว เพิ่ม/แก้ข้อมูล block & note.

## งานเทคนิคหลัก
1. **Routing/Entry**: เพิ่ม route ใหม่ + lazy load component `StandalonePlanner.jsx` ใน `src/features/planner/`.
2. **State Layer**: ใช้ `useReducer` + custom `useLocalStorageReducer` (เก็บ snapshot อัตโนมัติ).
3. **Drag & Resize**: ใช้ `dnd-kit` หรือ `react-rnd` เฉพาะในหน้า planner (ไม่กระทบส่วนอื่น).
4. **Form Controls**: ใช้ component พื้นฐาน (Input, Select, Badge chips) จาก `src/components/ui`.
5. **Import/Export**: ปุ่ม download/upload JSON (ใช้ FileReader + blob).
6. **Styling**: Tailwind + สีเรียบง่าย (ไม่ต้องตาม STATUS_CONFIG เดิมแต่ reuse ได้ถ้าต้องการ).

## แนวทางประหยัด Firebase Cost
1. **LocalStorage-Only**: เก็บทุก state/plan ในเครื่อง ไม่เรียก Firestore/Realtime DB.
2. **Manual Sync Option**: หากต้องการบันทึกเข้าระบบ ให้ทำผ่านปุ่ม Export JSON แล้วนำเข้าอย่างเป็นทางการภายหลัง (ไม่มี background sync).
3. **No Firebase Listener**: หน้า planner ไม่ subscribe หรือ init service ของ Firebase เพื่อลด connection/reads.
4. **Lazy Integration Hook**: วาง interface (`savePlanDraft`) ที่ปัจจุบันเป็น no-op (หรือเขียนลง localStorage) เพื่อพร้อมเชื่อมภายหลังแบบ batch write เท่านั้น.
5. **Asset Reuse**: ใช้ component/UI ที่มีอยู่เพื่อลด bundle เพิ่มเติม (ไม่ต้องโหลด lib ใหม่ที่หนัก/ต้อง network เพิ่ม).

## นอกขอบเขต (ไว้ Phase ถัดไป)
- ไม่มีการ sync กับ projects หรือ tasks จริง.
- ไม่ต้องแชร์ร่วมกับผู้ใช้อื่น real-time.
- ไม่มี scenario overlay/capacity/export PDF.

## คำถามเปิด
1. ต้องการ limit จำนวน plan/blocks ต่อคนไหม หรือปล่อยไม่จำกัด?
2. ต้องการ preset template (เช่น Discovery/Build/Launch) หรือให้ user ใส่เองทั้งหมด?
3. จำเป็นต้องมี auto-backup (เช่นดาวน์โหลดไฟล์อัตโนมัติ) หรือให้ผู้ใช้ export เอง?

## ขั้นตอนถัดไป
1. ยืนยันคำตอบคำถามเปิดเพื่อ finalize scope.
2. สร้าง wireframe ง่ายๆ (project list + timeline + drawer).
3. แยก backlog งาน dev ตามหัวข้อ "งานเทคนิคหลัก" แล้วเริ่ม implement MVP.
