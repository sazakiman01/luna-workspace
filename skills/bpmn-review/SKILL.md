---
name: bpmn-review
description: Use this skill when reviewing BPMN workflows or Camunda processes (.bpmn files, process diagrams, user task forms, service tasks). Triggers on "review BPMN", "ตรวจ Camunda", "รีวิว workflow", "check process", or any BPMN/Camunda review. Delegates to Comet, who has the checklist preloaded.
allowed-tools: Agent, Read, Glob, Grep
---

# BPMN/Camunda Review Skill

**Delegate to `subagent_type: comet`** ด้วย Agent tool

Comet ได้ checklist เต็มอัตโนมัติจาก `skills: bpmn-review-checklist` ใน frontmatter ของตัวเอง

**ส่งไปใน prompt:** ขอบเขตงาน (ไฟล์/feature/PR) + บริบท repo + deliverable ที่ต้องการ

**จุดที่ Comet ต้องดู:**
- Process structure & maintainability
- Error boundary / compensation
- Process variables & scope
- User task forms
- Service task idempotency
- Reusability (call activity)

**Deep review** (architecture / framework-specific patterns) → บอกให้อ่าน `reference.md` ข้าง SKILL.md ของ checklist

**Output:** review report ตาม format ใน checklist + severity rating
**บันทึกที่:** `<repo>/Luna/reviews/bpmn/<process>-bpmn-review-r<round>-YYYY-MM-DD.md`
