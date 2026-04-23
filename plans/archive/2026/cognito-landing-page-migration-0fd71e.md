# Cognito Landing Page Migration Plan

สร้างหน้า landing page ให้ผู้ใช้กดปุ่ม Login เพื่อ redirect ไปยัง Cognito Hosted UI และย้ายจาก EKO OAuth ไปใช้ AWS Cognito แบบเต็มรูปแบบ

## เป้าหมาย

- สร้างหน้า landing page สวยงาม (คล้ายรูปที่ส่งมา) สำหรับผู้ใช้ที่ยังไม่ได้ login
- เปลี่ยนจาก EKO OAuth เป็น AWS Cognito OAuth2
- ผู้ใช้กดปุ่ม "เข้าสู่ระบบ" → redirect ไป Cognito Hosted UI
- หลัง login สำเร็จ → redirect กลับมาใช้งานระบบได้เลย

## ขั้นตอนการแก้ไข

### 1. อัปเดต Environment Variables

**ไฟล์ที่แก้:** `.env.dev`, `.env.staging`, `.env.prod`

```bash
# ลบ EKO variables
# VITE_EKO_LOGIN_URL=...
# VITE_EKO_CLIENT_ID=...
# VITE_EKO_REDIRECT_URL=...

# เพิ่ม Cognito variables (Frontend - ต้องขึ้นต้นด้วย VITE_)
VITE_COGNITO_ENDPOINT=https://cpalloidcuat.auth.ap-southeast-1.amazoncognito.com
VITE_COGNITO_CLIENT_ID=3ukul0kdr9nf43t2k7burnm5vs
VITE_COGNITO_REDIRECT_URL=https://eat-api-copdev.allcorporate.net/api/auth/cognito/cb
```

**หมายเหตุสำคัญ:**
- **Frontend (BPM-WEB)** ใช้เฉพาะ 3 ตัวแปรข้างบน (ต้องขึ้นต้นด้วย `VITE_` เพื่อให้ Vite build ได้)
- **Backend API** ต้องมีตัวแปรเพิ่มเติม (ไม่ต้องขึ้นต้นด้วย VITE_):
  ```bash
  COGNITO_AUTH_TOKEN_ENDPOINT=https://cpalloidcuat.auth.ap-southeast-1.amazoncognito.com/oauth2/token
  COGNITO_AUTH_CLIENT_SECRET=lan4t267643gorgde5hgtg6j46jk5obdd5ehe3917pqul40r7v7
  ```
- `CLIENT_SECRET` และ `TOKEN_ENDPOINT` **ห้ามใส่ใน frontend** (ต้องเก็บที่ backend เท่านั้นเพื่อความปลอดภัย)

### 2. แก้ไข Config File

**ไฟล์:** `src/config.ts`

- ลบ EKO config properties (`EkoLoginUrl`, `EkoClientId`, `EkoRedirectUrl`)
- เพิ่ม Cognito config properties (`CognitoEndpoint`, `CognitoClientId`, `CognitoRedirectUrl`)
- แก้ไข `getLoginUrl()` function ให้สร้าง Cognito OAuth2 authorize URL:
  ```
  https://cpalloidcuat.auth.ap-southeast-1.amazoncognito.com/oauth2/authorize?
    client_id=...&
    redirect_uri=...&
    response_type=code&
    scope=openid+profile+email
  ```
- อัปเดต `window["config"]` override logic

### 3. สร้างหน้า Landing Page ใหม่

**ไฟล์ใหม่:** `src/pages/LandingPage.tsx`

**ออกแบบตามรูปที่ส่งมา:**
- Background: gradient สีฟ้าอ่อน พร้อม animated particles/dots
- กลางหน้า: Logo "Go Flow" (ใช้ `@/assets/GoFlowLogo.svg`)
- ปุ่ม "เข้าสู่ระบบ" สีเขียว/teal ตรงกลาง
- Footer: "Power by gosoft" หรือข้อความที่เหมาะสม
- ใช้ TailwindCSS + modern UI components

**Functionality:**
- ปุ่ม onClick → `window.location.href = config.getLoginUrl()`
- Responsive design (mobile + desktop)

### 4. อัปเดต Routing

**ไฟล์:** `src/routes.tsx`

- เพิ่ม route สำหรับ landing page:
  ```tsx
  <Route path="/" element={<WithEmptyLayout component={LandingPage} />} />
  ```
- แก้ไข redirect logic: ถ้ายังไม่ login ให้ไปหน้า `/` แทน `/tasks/`
- Route `/tasks/` ยังคงต้อง auth (`auth={true}`)

**ไฟล์:** `src/constants/routePath.ts`
- เพิ่ม `LANDING: "/"` ถ้าจำเป็น

### 5. ปรับ Auth Flow

**ไฟล์:** `src/components/authRoute.tsx`

- ตรวจสอบว่า redirect logic ยังใช้ `config.getLoginUrl()` อยู่ (ไม่ต้องแก้)
- เมื่อ `/api/auth/ping` ล้มเหลว → redirect ไป landing page (`/`) แทน

**ไฟล์:** `src/pages/logout.tsx`

- หลัง logout → redirect ไป landing page (`/`) แทน `config.getLoginUrl()`

**ไฟล์:** `src/pages/verifytoken.tsx`

- ตรวจสอบว่าใช้ `config.getLoginUrl()` อยู่ (ไม่ต้องแก้)

### 6. ปรับ Main Layout (Optional)

**ไฟล์:** `src/layouts/mainLayout.tsx`

- ซ่อนปุ่ม "Login" ใน navbar (เพราะมีหน้า landing แล้ว)
- หรือเปลี่ยนให้ redirect ไป `/` แทน

### 7. ลบโค้ดเก่าที่ไม่ใช้

**ไฟล์:** `src/pages/login.tsx`

- ไฟล์นี้มี hardcoded EKO URL → ลบหรือ refactor ให้ใช้ `config.getLoginUrl()`
- หรือลบทิ้งถ้าไม่ใช้แล้ว (ตรวจสอบ routes ก่อน)

## Flow หลังแก้ไข

```
1. User เปิด localhost:3000/ 
   → แสดงหน้า Landing Page (logo + ปุ่มเข้าสู่ระบบ)

2. User กดปุ่ม "เข้าสู่ระบบ"
   → redirect ไป Cognito Hosted UI
   → URL: https://cpalloidcuat.auth.ap-southeast-1.amazoncognito.com/oauth2/authorize?...

3. User login บน Cognito
   → Cognito redirect กลับมา: https://eat-api-copdev.allcorporate.net/api/auth/cognito/cb?code=xxx

4. Backend แลก code กับ token
   → Set cookie/session
   → Redirect กลับมา frontend (เช่น /auth?token=xxx หรือ /tasks/)

5. Frontend เรียก /api/auth/ping
   → ได้ user info → login สำเร็จ → ใช้งานได้เลย
```

## ข้อควรระวัง

1. **Backend Readiness:** Backend ต้องมี endpoint `/api/auth/cognito/cb` พร้อมใช้งาน
2. **Cognito Configuration:** ตรวจสอบใน AWS Console:
   - App Client ID ตรงกับ env
   - Allowed callback URLs มี `https://eat-api-copdev.allcorporate.net/api/auth/cognito/cb`
   - Allowed sign-out URLs (ถ้ามี)
3. **Environment-specific URLs:** แต่ละ environment (.dev, .staging, .prod) ต้องใช้ `COGNITO_REDIRECT_URL` ที่ถูกต้อง
4. **Local Development:** ถ้า localhost ไม่มี Cognito callback → อาจต้องใช้ mock/bypass สำหรับ dev

## ไฟล์ที่ต้องแก้ไข (สรุป)

| ไฟล์ | การแก้ไข |
|------|----------|
| `.env.dev`, `.env.staging`, `.env.prod` | เปลี่ยน EKO → Cognito variables |
| `src/config.ts` | เปลี่ยน config properties + `getLoginUrl()` |
| `src/pages/LandingPage.tsx` | **สร้างใหม่** - หน้า landing page |
| `src/routes.tsx` | เพิ่ม route `/` สำหรับ landing page |
| `src/components/authRoute.tsx` | ตรวจสอบ redirect logic (อาจไม่ต้องแก้) |
| `src/pages/logout.tsx` | redirect ไป `/` หลัง logout |
| `src/pages/login.tsx` | ลบหรือ refactor (ถ้าไม่ใช้แล้ว) |
| `src/layouts/mainLayout.tsx` | ซ่อนปุ่ม Login (optional) |

## คำถามที่ต้องยืนยันก่อน Implement

1. **Backend พร้อมหรือยัง?** มี `/api/auth/cognito/cb` endpoint รองรับแล้วหรือยัง?
2. **Local dev จะทำยังไง?** localhost:3000 จะ redirect ไป Cognito ด้วยหรือใช้วิธีอื่น?
3. **Design landing page:** มี design spec เพิ่มเติมหรือไม่ (สี, font, animation)?
