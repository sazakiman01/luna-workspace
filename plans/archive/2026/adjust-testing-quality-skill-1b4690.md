# แผนการปรับสกิล Testing Quality ให้ตรงกับ LandingPage.test.tsx

## สรุปแผน
ปรับสกิล frontend-repo-review ในส่วนมิติที่ 8 (Testing Quality) ให้โฟกัสเฉพาะรูปแบบการทดสอบที่ LandingPage.test.tsx ทำอยู่ โดยยังคง 17 มิติไว้เหมือนเดิม

## สิ่งที่ต้องปรับ

### 1. ปรับไฟล์ `references/review-checklist-th.md`
**ลดสเกล Testing Quality (มิติที่ 8) ให้เหลือเฉพาะ:**

**✅ สิ่งที่ตรงกับ LandingPage.test.tsx:**
- Component rendering tests (`renders without crashing`)
- UI element presence tests (`displays logo`, `displays title`)
- Basic interaction tests (`redirects when button clicked`)
- Mock configuration (`vi.mock`)
- Test structure & organization

**❌ สิ่งที่จะลด/ลบออก:**
- Async UI testing (LandingPage ไม่มี async operations)
- Snapshot testing (LandingPage ไม่ใช้ snapshots)
- Integration testing (ยังไม่ถึงขั้นนี้)
- E2E testing patterns
- Complex data flow testing

### 2. เพิ่มตัวอย่างที่ตรงกับ LandingPage.test.tsx
**Mock config examples:**
```typescript
// Mock config module
vi.mock("@/config", () => ({
  default: {
    getLoginUrl: () => "https://cognito.example.com/login",
    ApiUrl: "http://localhost:3000",
  },
}));
```

**Basic component testing:**
```typescript
it("renders without crashing", () => {
  const { container } = render(<LandingPage />);
  expect(container).toBeInTheDocument();
});

it("displays title 'Go Flow'", () => {
  render(<LandingPage />);
  expect(screen.getByText("Go Flow")).toBeInTheDocument();
});
```

**Simple interaction testing:**
```typescript
it("redirects to login URL when login button is clicked", () => {
  render(<LandingPage />);
  const loginButton = screen.getByRole("button", { name: /เข้าสู่ระบบ/i });
  
  act(() => {
    fireEvent.click(loginButton);
  });
  
  expect(window.location.href).toBe("https://cognito.example.com/login");
});
```

## สิ่งที่ไม่ต้องเปลี่ยน

### ✅ 17 มิติหลักยังคงเหมือนเดิม
- 1. Functional correctness
- 2. Architecture & Maintainability
- 3. Code Quality
- 4. UX / UI Quality
- 5. Accessibility
- 6. Performance
- 7. Security
- 8. Testing Quality ← ปรับเฉพาะนี้
- 9-17. มิติอื่นๆ ยังเหมือนเดิม

### ✅ โครงสร้างสกิลยังเหมือนเดิม
- SKILL.md ไม่ต้องเปลี่ยน
- วิธีทำงาน 6 ขั้นตอนยังเหมือนเดิม
- Report templates ยังเหมือนเดิม

## ผลลัพธ์ที่คาดหวัง

**ก่อนปรับ:** Testing Quality ครอบคลุมทุกรูปแบบการทดสอบ (ซับซ้อนเกินไป)
**หลังปรับ:** Testing Quality เหมาะกับระดับปัจจุบัน (LandingPage.test.tsx level)

**ประโยชน์:**
- รีวิวเร็วขึ้น
- เจาะจงมากขึ้น  
- ตรงกับความเป็นจริงที่ทีมทำอยู่
- ลดความซับซ้อนที่ไม่จำเป็น

## ขั้นตอนการทำงาน

1. อ่านไฟล์ `references/review-checklist-th.md` ส่วน Testing Quality ปัจจุบัน
2. แก้ไขส่วน Testing Quality ให้เหลือเฉพาะที่เกี่ยวข้องกับ LandingPage.test.tsx
3. เพิ่มตัวอย่างโค้ดที่ตรงกับ LandingPage.test.tsx
4. ทดสอบสกิลว่าทำงานถูกต้อง
