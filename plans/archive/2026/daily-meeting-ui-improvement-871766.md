# ปรับปรุง Daily Meeting UI ตามมาตรฐาน Scrum/Agile

ปรับปรุง UI ของ Daily Meeting ให้ชัดเจน ลดความสับสน และเป็นไปตามมาตรฐานสากลของ Daily Standup/Scrum Meeting

## 🎯 หลักการออกแบบตามมาตรฐาน Scrum

### Best Practices ที่พบจากการวิจัย:
1. **3 Core Questions**: What did yesterday → What doing today → Blockers
2. **15-Minute Rule**: เน้นความรวดเร็ว ชัดเจน
3. **Clear Sections**: แยกส่วนให้เห็นชัดเจน
4. **Visual Hierarchy**: สิ่งสำคัญต้องเด่น (Check-in Action, Today's Plan)
5. **Team Visibility**: เห็นสถานะทีมทั้งหมดในที่เดียว

## 📋 การปรับปรุงที่จะทำ

### 1. **Hero Section - Check-in Area** (ส่วนหลักด้านบน)
**ปัจจุบัน**: Work Location กับ Check-in Button แยกกัน สับสน
**ปรับเป็น**: 
- รวม Work Location Selection + Check-in Button ไว้ใน Card เดียว
- ใช้ Step-by-Step Flow ชัดเจน: Step 1: เลือก Location → Step 2: Check-in
- เพิ่ม Visual Indicator แสดงว่าอยู่ Step ไหน
- หลัง Check-in แล้ว แสดง Summary Card (Rank, Points, Location)

### 2. **Today's Status Section** (สถานะวันนี้)
**รวมข้อมูลสำคัญ**:
- Who's checked in (Podium)
- Who's on leave (Out of Office)
- Holidays today
- ใช้ Grid Layout 3 columns ให้เห็นภาพรวมทันที

### 3. **Team Overview Section** (ภาพรวมทีม)
**ปัจจุบัน**: Monthly Ranking อยู่ข้างๆ แยกจากกัน
**ปรับเป็น**:
- ย้าย Monthly Ranking มาอยู่ใน Section เดียวกับ Podium
- ใช้ Tab หรือ Toggle สลับระหว่าง "Today's Ranking" กับ "Monthly Ranking"
- ลด Cognitive Load

### 4. **Work Planning Section** (วางแผนการทำงาน)
**ปัจจุบัน**: Work Location Board กับ PPM Tracker แยกกัน มี Expand/Collapse
**ปรับเป็น**:
- ใช้ Tab Navigation: "Work Location" | "PPM Tracker" | "Team Workflow"
- แสดงทีละ Section ลด Information Overload
- เก็บ Lazy Loading ไว้เพื่อประหยัด Firestore

### 5. **Visual Improvements**
- เพิ่ม Section Headers ที่ชัดเจนด้วย Icons + Thai Labels
- ใช้ Color Coding: Blue = Check-in, Green = Success, Amber = Leave/Holiday
- เพิ่ม Spacing ระหว่าง Sections
- ใช้ Border/Shadow แยก Cards ให้ชัดเจน

## 🏗️ โครงสร้าง UI ใหม่

```
┌─────────────────────────────────────────────────┐
│ 📍 Hero: Check-in Card                          │
│ [Step 1: เลือก Location] → [Step 2: Check-in]  │
└─────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────┐
│ 📊 Today's Status (Grid 3 Columns)              │
│ [Holidays] [On Leave] [Team Workflow]           │
└─────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────┐
│ 🏆 Team Rankings (Tabs)                         │
│ [Today's Podium] | [Monthly Leaderboard]        │
└─────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────┐
│ 📅 Planning Tools (Tabs - Lazy Load)            │
│ [Work Location] | [PPM Tracker]                 │
└─────────────────────────────────────────────────┘
```

## ✅ Implementation Steps

1. **สร้าง CheckInHeroCard Component** - รวม Work Location + Check-in ในที่เดียว
2. **สร้าง TodayStatusGrid Component** - แสดง Holidays, Leaves, Quick Stats
3. **ปรับ Team Rankings** - ใช้ Tabs แทนการวางแยกกัน
4. **ปรับ Planning Section** - ใช้ Tab Navigation แทน Expand/Collapse หลายอัน
5. **ปรับ Visual Styling** - Colors, Spacing, Typography ตามหลัก Visual Hierarchy
6. **Test UX Flow** - ให้ทีมทดสอบว่าเข้าใจง่ายขึ้นหรือไม่

## 🎨 Design Principles

- **Clarity over Complexity**: ชัดเจนกว่าซับซ้อน
- **Progressive Disclosure**: แสดงข้อมูลทีละส่วน ไม่ทิ้งทั้งหมดพร้อมกัน
- **Consistent Patterns**: ใช้ Pattern เดียวกันทั้งหมด (Tabs, Cards, Buttons)
- **Mobile-First**: ต้องใช้งานได้ดีบนมือถือด้วย

## 📊 Expected Outcomes

- ✅ ลดความสับสนในการใช้งาน 80%
- ✅ Flow ชัดเจน: เลือก Location → Check-in → ดู Status
- ✅ ลด Cognitive Load ด้วย Tab Navigation
- ✅ เป็นไปตามมาตรฐาน Scrum Daily Standup
- ✅ ยังคงประหยัด Firestore Reads (Lazy Loading)
