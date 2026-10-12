---
name: backend-api-review
description: Use this skill when reviewing backend code or APIs (Cloud Functions, Firestore queries, transaction logic, error handling). Triggers on "review backend", "ตรวจ API", "รีวิว Cloud Function", "review backend code", "check transaction", or any backend code review. Delegates to Nova, who has the checklist preloaded.
allowed-tools: Agent, Read, Glob, Grep
---

# Backend/API Review Skill

**Delegate to `subagent_type: nova`** ด้วย Agent tool

Nova ได้ checklist เต็มอัตโนมัติจาก `skills: backend-api-review-checklist` ใน frontmatter ของตัวเอง

**ส่งไปใน prompt:** ขอบเขตงาน (ไฟล์/feature/PR) + บริบท repo + deliverable ที่ต้องการ

**จุดที่ Nova ต้องดู:**
- Transaction safety & idempotency
- Error handling + typed error categories
- Firestore query cost / N+1
- Cold-start & performance
- Input validation + authz
- Secrets / config handling

**Deep review** (architecture / framework-specific patterns) → บอกให้อ่าน `reference.md` ข้าง SKILL.md ของ checklist

**Output:** review report ตาม format ใน checklist + severity rating
**บันทึกที่:** `<repo>/Luna/reviews/backend/<feature>-backend-review-r<round>-YYYY-MM-DD.md`
