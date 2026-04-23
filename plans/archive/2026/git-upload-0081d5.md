# Upload UniformFlow to GitHub

อัปโหลดโค้ด UniformFlow ขึ้น GitHub repository ใหม่หลังจากลบ repository เดิม

## ขั้นตอน

### 1. ลบและสร้าง Repository บน GitHub (User Action)
- ลบ repository `sazakiman01/UniformFlow` ทาง web UI
- สร้าง repository ใหม่ชื่อ `UniformFlow` เหมือนเดิม
- ไม่ต้องเพิ่ม README, .gitignore หรือ license (มีอยู่แล้วใน local)

### 2. Initialize Git Repository
```bash
git init
```

### 3. Configure Git
```bash
git config user.name "sazakiman01"
git config user.email "sazakiman01@users.noreply.github.com"
```

### 4. Add Remote Origin
```bash
git remote add origin https://github.com/sazakiman01/UniformFlow.git
```

### 5. Add Files and Commit
```bash
git add .
git commit -m "Initial commit: UniformFlow project"
```

### 6. Push to GitHub
```bash
git branch -M main
git push -u origin main
```

## หมายเหตุ
- .gitignore ได้ config ไว้แล้วครบถ้วน (node_modules, .env, .firebase, .next, etc.)
- ใช้ branch `main` เป็น default
