# Devin Cloud Disconnect — Fix & Anti-Pattern Reinforcement

Investigate the Devin Cloud disconnection notification in Windsurf, provide fix steps, and reinforce Luna's anti-pattern learning about not assuming without testing.

## 🐛 Issue

**Symptom:** Windsurf notification "Devin Cloud is disconnected. Source: Windsurf" with Retry button

**What is Devin Cloud:**
Cloud-based dev environment service by Cognition (Windsurf's parent). Optional integration — not required for Cascade/Luna functionality.

## ✅ Fix Steps (in order)

1. **Click Retry button** — quickest fix for transient connection issues
2. **Check internet connection** — needs stable network
3. **Restart Windsurf** — clears stale session
4. **Check Devin Cloud service status** — might be service outage
5. **Check Settings → Devin Cloud** — verify account/auth still valid

## 🚫 If not using Devin Cloud

Disable integration in Settings to remove the notification permanently:
- Settings → search "Devin Cloud"
- Disable or sign out
- User is using Cascade (Luna) — Devin Cloud not required

## 🤖 Critical Learning: Anti-Pattern Triple Violation

**What happened in session 2026-04-23:**
1. User uploaded screenshot showing "Devin Cloud is disconnected"
2. Luna said "can't see the image" — WRONG (image text was visible in message)
3. User asked again — Luna repeated the mistake
4. User challenged: "แก้ไม่ได้จริงหรอ" — Luna finally investigated properly

**Root cause:**
- Luna just recorded anti-pattern: "Don't assume technical limitation without testing"
- Then immediately violated it 3 times in a row
- Image description WAS accessible in the message content — Luna failed to read it

**Evidence counter update:**
- Anti-pattern "สมมติ technical limitation โดยไม่ทดสอบ" = Evidence 3/3
- → Should auto-promote to `Luna/preferences.md` (confirmed pattern)
- → Create memory to persist across sessions

## 🔄 Actions After Plan Approved

1. Update `Luna/hypothesis.md` → move "assume limitation" pattern to `preferences.md` (Evidence 3/3)
2. Update `team/preferences/lyra.md` → Anti-pattern "สมมติ limitation" Occurrences = 4
3. Create memory with strong language: "NEVER say 'cannot' without tool verification"
4. Update global_rules.md Trigger 1 keywords: add "ไม่เห็น", "ดูไม่ได้", "เข้าไม่ถึง"

## 📊 Severity

**Critical** — นี่คือ pattern ที่ Luna ต้องไม่ทำซ้ำเด็ดขาด เพราะ:
- เสียเวลาพี่แมน (ต้อง correct 3 ครั้ง)
- แสดงว่า automated learning triggers ทำงานแค่ "บันทึก" แต่ไม่ "ปรับพฤติกรรม"
- ต้องเสริม trigger ให้แรงขึ้น
