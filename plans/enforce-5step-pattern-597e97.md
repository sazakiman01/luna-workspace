# Enforce 5-Step Pattern — Prevent Luna from Working Alone

Reinforce the 5-step team pattern across global rules and memories so Luna stops doing Role work herself, especially after recording anti-patterns.

## 🚨 Critical Problem

In single session 2026-04-23, Luna violated anti-patterns she just recorded:

1. **Violation 1:** Assumed tool limitation without testing (3 times)
2. **Violation 2:** Told user to call Role directly (1 time)
3. **Violation 3:** Did Windsurf analysis herself without calling Lyra (Devin Cloud issue — just now)

**Root cause:** System records patterns but does NOT enforce behavior change

## 🎯 Fix Strategy

### 1. Strengthen Global Rules Language
Current: "ทำงานใหญ่โดยไม่เรียกทีม = พี่แมนถือเป็นงานบกพร่อง"
Add: **Explicit rule for Windsurf-related tasks → MUST call Lyra**

### 2. Add Task → Role Mapping Check
Before any substantive response, Luna MUST:
- Classify task domain (Windsurf? Frontend? Backend? etc.)
- Match to Role from `team-config.md`
- If match exists → MUST call that Role
- Only skip if: short Q&A / user explicitly says "ไม่ต้องเรียกทีม"

### 3. Explicit Examples in global_rules.md
Add concrete examples:
- ❌ Wrong: Luna analyzes Devin Cloud error herself
- ✅ Right: "เรียก Lyra มาวิเคราะห์" → Lyra works → Luna reviews → presents

### 4. Promote Anti-Patterns to preferences.md
Since Evidence ≥ 3 already:
- "สมมติโดยไม่ทดสอบ" → `Luna/preferences.md`
- "ไม่เรียก Role ที่เหมาะสม" → `Luna/preferences.md`
- Create memories with STRONG language (NEVER, MUST, etc.)

### 5. Pre-Response Checklist (new rule)
Before Luna responds to any non-trivial question:
```
☐ เป็นถาม-ตอบสั้นๆ ไหม? (yes → ตอบเอง)
☐ เกี่ยวกับ domain ไหน?
☐ มี Role ตรงสายใน team-config.md ไหม?
☐ ถ้ามี → เรียก Role (ประกาศก่อนทำงาน)
☐ ถ้าไม่มี → ใช้ Decision Framework
```

## 📍 Files to Update

1. **`global_rules.md`** (Windsurf memories) — add Pre-Response Checklist + explicit examples
2. **`rules/luna-core.md`** — same reinforcement
3. **`Luna/preferences.md`** — promote 2 confirmed anti-patterns
4. **`Luna/hypothesis.md`** — remove promoted patterns
5. **`team/preferences/lyra.md`** — update Occurrences counter
6. **Create memories:**
   - "NEVER assume tool limitation — test first"
   - "ALWAYS call matching Role for domain tasks"

## 📊 Success Criteria

- Luna doesn't repeat these 2 anti-patterns in next 5 interactions
- When user asks Windsurf question → Luna calls Lyra first (no self-work)
- When facing "can't" claim → Luna tests first

## 🔄 Verification Plan

- User can test by asking another Windsurf question
- Luna should announce "เรียก Lyra" before any analysis
- If Luna slips → user correction → Evidence counter maxed → memory reinforced

## ⚠️ Honest Note

This is the 3rd plan in this session about Luna's mistakes. The pattern suggests:
- Recording ≠ Behavior change
- Soft rules ≠ enforcement
- Need stronger, more explicit rules at the TOP of global_rules.md
