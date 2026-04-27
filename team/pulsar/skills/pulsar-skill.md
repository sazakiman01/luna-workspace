---
description: Project Manager skill สำหรับ Pulsar รวม project planning, timeline management, team coordination, risk management, stakeholder communication, และ delivery
---

# Pulsar Skill - Project Manager

## 🎯 Purpose

Project Manager skill สำหรับ Pulsar รวม project planning, timeline management, team coordination, risk management, stakeholder communication, และ delivery

## 📋 Core Competencies

### Project Planning
- **Methodologies:** Agile, Scrum, Kanban, Waterfall
- **Planning Tools:** Jira, Trello, Asana, Monday
- **Sprint Planning:** Sprint goals, Sprint backlog, Velocity tracking
- **Roadmap Planning:** Product roadmap, Release planning
- **Resource Planning:** Capacity planning, Resource allocation

### Timeline Management
- **Scheduling:** Gantt charts, Milestones, Deadlines
- **Tracking:** Progress tracking, Burndown charts, Velocity
- **Adjustments:** Scope changes, Timeline adjustments
- **Dependencies:** Task dependencies, Critical path
- **Buffering:** Time buffers, Contingency plans

### Team Coordination
- **Daily Standups:** Daily sync, Blocker identification
- **Sprint Reviews:** Sprint demo, Feedback collection
- **Retrospectives:** Continuous improvement, Action items
- **Team Meetings:** Planning, Review, Sync meetings
- **Communication:** Slack, Email, Documentation

## 🎯 Project Planning

### Sprint Planning
```typescript
// Sprint plan
interface SprintPlan {
  sprintNumber: number;
  startDate: Date;
  endDate: Date;
  goals: SprintGoal[];
  backlog: BacklogItem[];
  capacity: Capacity;
}
```

### Roadmap Planning
```typescript
// Roadmap
interface Roadmap {
  quarters: Quarter[];
  releases: Release[];
  milestones: Milestone[];
  dependencies: Dependency[];
}
```

### Resource Planning
```typescript
// Resource plan
interface ResourcePlan {
  team: TeamMember[];
  capacity: Capacity;
  allocation: Allocation[];
  utilization: Utilization;
}
```

## 🎯 Timeline Management

### Gantt Chart
```typescript
// Gantt chart
interface GanttChart {
  tasks: Task[];
  dependencies: Dependency[];
  milestones: Milestone[];
  criticalPath: Task[];
}
```

### Progress Tracking
```typescript
// Progress tracking
interface ProgressTracking {
  tasks: Task[];
  completed: number;
  remaining: number;
  velocity: number;
  burndown: BurndownChart;
}
```

### Critical Path
```typescript
// Critical path
interface CriticalPath {
  tasks: Task[];
  duration: number;
  buffers: Buffer[];
  risks: Risk[];
}
```

## 🎯 Risk Management

### Risk Identification
```typescript
// Risk register
interface RiskRegister {
  risks: Risk[];
  probability: number;
  impact: number;
  mitigation: MitigationPlan[];
}
```

### Risk Mitigation
```typescript
// Mitigation plan
interface MitigationPlan {
  strategy: 'avoid' | 'mitigate' | 'transfer' | 'accept';
  actions: Action[];
  timeline: Timeline;
  owner: string;
}
```

## 🎯 Stakeholder Communication

### Communication Plan
```typescript
// Communication plan
interface CommunicationPlan {
  stakeholders: Stakeholder[];
  channels: Channel[];
  frequency: Frequency[];
  content: Content[];
}
```

### Status Reporting
```typescript
// Status report
interface StatusReport {
  period: Period;
  progress: Progress;
  blockers: Blocker[];
  risks: Risk[];
  nextSteps: NextStep[];
}
```

## 🎯 Best Practices

### DOs
- ✅ Plan iteratively
- ✅ Communicate regularly
- ✅ Manage expectations
- ✅ Track progress continuously
- ✅ Manage risks proactively
- ✅ Empower team
- ✅ Celebrate successes
- ✅ Learn from failures
- ✅ Adapt to changes
- ✅ Focus on delivery

### DON'Ts
- ❌ Don't overcommit
- ❌ Don't ignore blockers
- ❌ Don't skip communication
- ❌ Don't ignore risks
- ❌ Don't micromanage
- ❌ Don't ignore team
- ❌ Don't skip retrospectives
- ❌ Don't ignore failures
- ❌ Don't resist change
- ❌ Don't lose focus

## 🎯 When to Use This Skill

เรียกใช้เมื่อ:
- Planning projects
- Managing timelines
- Coordinating teams
- Managing risks
- Communicating with stakeholders
- Ensuring delivery

## 📝 Notes

- Pulsar Skill ครอบคลุม project planning, timeline management, team coordination, risk management, stakeholder communication, delivery
- Focus บน project management แล team coordination
- ใช้ร่วมกับ cross-functional skills สำหรับ coordination

---
*Pulsar Skill - Project Manager*
