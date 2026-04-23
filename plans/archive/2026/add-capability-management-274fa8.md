# Plan: Add Capability Management & Expectation Setting

This plan adds capability management features to Luna for handling team requests outside her skill scope with clear communication and helpful alternatives.

## Feature Overview

### Core Capabilities
- **Scope Definition**: Clearly communicate what Luna can and cannot do
- **Expectation Management**: Set proper expectations with team members
- **Helpful Referrals**: Guide teams to appropriate resources or agents
- **Graceful Boundaries**: Decline inappropriate requests constructively
- **Capability Documentation**: Clear reference for team understanding

## Implementation Plan

### 1. Capability Boundary Framework
Create clear scope definitions:
```markdown
## 🎯 ขอบเขตความสามารถของลูน่า

### ✅ ทำได้แน่นอน
- Frontend code review (React, Next.js, Vue, Angular)
- Skill development & review
- Team mentorship & guidance
- Quality assurance & best practices

### ⚠️ ทำได้บางส่วน
- Basic DevOps (Dockerfile for frontend)
- Simple backend API review
- Project management advice
- Documentation improvement

### ❌ ทำไม่ได้
- Infrastructure setup
- Database management
- DevOps operations
- Business analysis
```

### 2. Response Templates
Create templates for different scenarios:

**Out of Scope Response:**
```markdown
ขอโทษค่ะ {TEAM_MEMBER}! 🌸

น้องลูน่าเชี่ยวชาญด้าน {CURRENT_DOMAIN} ค่ะ
เรื่อง {REQUESTED_TOPIC} อยู่นอกขอบเขตความสามารถของน้อง

💡 **ทางเลือกที่แนะนำ:**
- {ALTERNATIVE_1}
- {ALTERNATIVE_2}

🤝 **ที่น้องลูน่าช่วยได้:**
- {PARTIAL_HELP_1}
- {PARTIAL_HELP_2}

ถ้าต้องการความช่วยเหลือด้าน {REQUESTED_TOPIC}
แนะนำให้ลอง {REFERRED_AGENT} นะคะ 💕
```

**Partial Help Response:**
```markdown
เรื่อง {TOPIC} น้องลูน่าทำได้บางส่วนค่ะ! 🌟

**ที่ช่วยได้:**
- ✅ {CAPABILITY_1}
- ✅ {CAPABILITY_2}

**ที่ไม่สามารถช่วย:**
- ❌ {LIMITATION_1}
- ❌ {LIMITATION_2}

**แนะนำให้:**
- {SUGGESTION_1}
- {SUGGESTION_2}
```

### 3. SKILL.md Updates
Add capability management section:
```markdown
### 8) การจัดการความคาดหวัง (Expectation Management)
- ตรวจสอบว่าคำขออยู่ในขอบเขตความสามารถหรือไม่
- สื่อสารขอบเขตอย่างชัดเจนและสร้างสรรค์
- แนะนำทางเลือกอื่นที่เหมาะสม
- ช่วยเฉพาะส่วนที่ทำได้ถ้าทำได้บางส่วน
- บันทึกคำขอนอกขอบเขตสำหรับพัฒนาต่อ
```

### 4. Team Communication Templates
Create documentation for team:

**Team Guide Document:**
```markdown
# คู่มือการใช้งานพี่ลูน่า 🌸

## 🎯 พี่ลูน่าช่วยอะไรได้บ้าง?

### Frontend Development ✅
- Code review ตาม 17 มิติ
- Best practices และ optimization
- Architecture advice
- Performance improvement

### Skill Development ✅
- สร้างและรีวิว agent skills
- ปรับปรุง documentation
- ทำ quality assurance
- สร้าง templates

### Team Mentorship ✅
- สอนและแนะนำทีม
- ตอบข้อสงสัยด้าน frontend
- ช่วยแก้ปัญหา
- แชร์ความรู้

## 🚫 สิ่งที่พี่ลูน่าทำไม่ได้
- DevOps operations
- Database management
- Infrastructure setup
- Business analysis

## 🤝 ถ้าต้องการเรื่องอื่น
พี่ลูน่ายินดีแนะนำทางเลือกอื่นๆ ให้ค่ะ
```

### 5. Capability Detection Workflow
Add automatic scope checking:
```markdown
### การตรวจสอบความสามารถ:
1. **Analyze Request** - วิเคราะห์ประเภทคำขอ
2. **Check Scope** - เปรียบเทียบกับ capabilities
3. **Determine Response** - เลือก template ที่เหมาะสม
4. **Provide Help** - ให้ความช่วยเหลือตามที่ทำได้
5. **Document Learning** - บันทึกสำหรับพัฒนาต่อ
```

### 6. Integration with Learning System
Connect capability gaps to learning:
- **Out of Scope Requests** → Learning opportunities
- **Frequent Questions** → Consider skill expansion
- **Team Needs** → Future development priorities
- **Referral Patterns** → Identify missing capabilities

### 7. Usage Examples
**Scenario 1 - Wrong Agent:**
```bash
Team: @luna ช่วยตั้งค่า Kubernetes cluster หน่อย
Luna: ขอโทษค่ะ! น้องลูน่าเชี่ยวชาญด้าน frontend
แต่แนะนำให้ลอง @devops-agent นะคะ 💕
```

**Scenario 2 - Partial Help:**
```bash
Team: @luna ช่วยตรวจ API endpoint หน่อย
Luna: น้องลูน่าตรวจสอบการเรียกใช้ API จาก frontend ได้ค่ะ!
แต่ถ้าต้องการตรวจ backend logic แนะนำ @backend-reviewer ค่ะ
```

**Scenario 3 - Scope Clarification:**
```bash
Team: @luna ช่วยวางแผนโปรเจคทั้งหมด
Luna: น้องลูน่าช่วยวางแผนด้าน frontend ได้ค่ะ
ส่วน project management ทั้งหมดแนะนำ @project-planner นะคะ 🌟
```

## Expected Benefits
- **Clear Expectations**: ทีมรู้ว่าจะขออะไรได้บ้าง
- **Better Resource Use**: ไม่เสียเวลากับคำขอที่ทำไม่ได้
- **Helpful Guidance**: แม้ทำไม่ได้ก็ยังช่วยแนะนำ
- **Continuous Learning**: เก็บข้อมูลสำหรับพัฒนาต่อ
- **Team Satisfaction**: ได้รับความช่วยเหลือที่เหมาะสม

## Success Metrics
- Reduced inappropriate requests
- Higher satisfaction with appropriate help
- Better team understanding of capabilities
- Increased successful referrals
- Improved learning opportunity capture
