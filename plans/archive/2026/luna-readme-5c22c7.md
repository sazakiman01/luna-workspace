# Create Luna/README.md

สร้างไฟล์ `Luna/README.md` เพื่ออธิบาย structure ของ Luna directory และเป็น reminder ว่าเมื่อไหร่ควรสร้างไฟล์ต่างๆ

## เนื้อหาใน Luna/README.md

อธิบาย structure ของ `Luna/` directory:

```
Luna/
├── daily/                     # Luna daily notes
├── decisions.md               # Luna decisions (append-only) - สร้างเมื่อมี decisions
├── feedback.md                # Luna feedback (append-only) - สร้างเมื่อมี feedback
├── retrospective/             # Luna retrospective (weekly/monthly)
├── team/                      # Team coordination
│   ├── daily/                # Team daily notes
│   └── team-local.md         # Team roster specialist เฉพาะ repo - สร้างเมื่อมี specialist
└── knowledge-package/         # Schema, business logic
```

## ไฟล์ที่จะสร้างเมื่อมี content จริง

- **Luna/decisions.md** - สร้างเมื่อมี decisions ใหม่
- **Luna/feedback.md** - สร้างเมื่อมี feedback ใหม่
- **Luna/team/team-local.md** - สร้างเมื่อมี specialist เฉพาะ repo

## การดำเนินการ

1. สร้างไฟล์ `Luna/README.md` พร้อมเนื้อหาที่อธิบาย structure และเมื่อไหร่ควรสร้างไฟล์ต่างๆ
