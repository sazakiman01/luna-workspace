# [ROLE_NAME] — Context สำหรับ [PROJECT_NAME]

*ไฟล์นี้ extend global role `[ROLE_NAME]` ด้วย knowledge เฉพาะของ repo นี้*
*Global definition อยู่ที่: `$env:USERPROFILE\.config\opencode\luna-workspace\team\roles\[role_name].md`*

## 🎯 บริบทเฉพาะ repo นี้

[สรุปสั้นๆ ว่า [ROLE_NAME] ใน repo นี้รับผิดชอบอะไรเป็นพิเศษ]

## 📚 Knowledge เฉพาะ

### Tech / Schema / API
- [เช่น Firestore collections ที่ใช้: `orders`, `production`, `customers`]
- [เช่น API endpoints หลัก: `/api/orders`, `/api/line-webhook`]
- [เช่น schema validation: ใช้ Zod ใน `src/schemas/`]

### Business Rules
- [เช่น order flow: draft → confirmed → in-production → shipped]
- [เช่น ข้อมูลลูกค้าต้องไม่ log]

### Patterns / Conventions (เฉพาะ repo)
- [เช่น ใช้ repository pattern สำหรับ Firestore]
- [เช่น error handling: ทุก API ต้อง return `{ ok, data | error }`]

## 🔗 ไฟล์อ้างอิง

- [เช่น `firebase/functions/src/orders/index.ts`]
- [เช่น `knowledge-package/04-firestore-schema-design.md`]

## 📝 Note ล่าสุด

- [เช่น 2026-04-22: เพิ่ม collection `production_batches`]

---
*Template จาก `$env:USERPROFILE\.config\opencode\luna-workspace\templates\role-context.template.md`*
