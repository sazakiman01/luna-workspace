---
name: frontend-review
description: Use this skill when reviewing frontend code (React, Vite, LIFF, TypeScript components). Triggers on requests like "review frontend", "ตรวจ frontend", "รีวิว React", "code review หน้า UI", "check component", or any frontend code review. Delegates to Stella, who has the checklist preloaded.
allowed-tools: Agent, Read, Glob, Grep
---

# Frontend Review Skill

**Delegate to `subagent_type: stella`** ด้วย Agent tool

Stella ได้ checklist เต็มอัตโนมัติจาก `skills: frontend-review-checklist` ใน frontmatter ของตัวเอง

**ส่งไปใน prompt:** ขอบเขตงาน (ไฟล์/feature/PR) + บริบท repo + deliverable ที่ต้องการ

**จุดที่ Stella ต้องดู:**
- Component structure & naming
- State management (Zustand, TanStack Query)
- Performance (memoization, code splitting)
- Accessibility (a11y)
- Type safety (TypeScript)
- Tailwind/shadcn usage consistency

**Deep review** (architecture / framework-specific patterns) → บอกให้อ่าน `reference.md` ข้าง SKILL.md ของ checklist

**Output:** review report ตาม format ใน checklist + severity rating
**บันทึกที่:** `<repo>/Luna/reviews/frontend/<component>-frontend-review-r<round>-YYYY-MM-DD.md`
