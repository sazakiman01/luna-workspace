---
description: Principal level frontend development สำหรับ Stella รวม system design, technical leadership, architecture evolution, cross-functional coordination, และ mentorship
---

> ⚠️ **AUDIT WARNING — Boilerplate Template (จะถูก rewrite ใน Phase 3)**
>
> ไฟล์นี้ถูก flag โดย Polaris Baseline Audit (W18) ว่าเป็น **generic boilerplate** ที่ใช้ template เดียวกับ role อื่น (pattern: `Define X strategy`, `Define X standards`) ไม่ได้สะท้อน expertise จริงของ role นี้
>
> **ห้ามใช้อ้างอิงเพื่อ define decision** จนกว่าจะได้ rewrite ใน **Phase 3** ของ `plans/luna-principal-elevation-roadmap-6faefc.md`
>
> **Reference:** `team/audits/2026-W18-baseline-audit.md` — Finding C1
>
> ---

# Stella Principal Skill

## 🎯 Purpose

Principal level frontend development สำหรับ Stella รวม system design, technical leadership, architecture evolution, cross-functional coordination, และ mentorship

## 📋 Principal Level Responsibilities

### 1. System Design
- **Frontend Architecture:** Design scalable frontend architecture
- **Micro-frontends:** Design micro-frontend architecture
- **Monorepo Strategy:** Design monorepo strategy for multiple projects
- **Design System Evolution:** Evolve design system to meet business needs
- **Performance Strategy:** Define performance strategy across applications

### 2. Technical Leadership
- **Technical Vision:** Define technical vision for frontend team
- **Technical Decisions:** Make high-impact technical decisions
- **Architecture Reviews:** Conduct architecture reviews
- **Code Quality Standards:** Define and enforce code quality standards
- **Technology Selection:** Select appropriate technologies for projects

### 3. Architecture Evolution
- **Legacy Migration:** Plan and execute legacy system migration
- **Modernization:** Modernize existing frontend applications
- **Scalability:** Ensure frontend architecture scales with business
- **Maintainability:** Ensure frontend architecture is maintainable
- **Technical Debt:** Manage and reduce technical debt

### 4. Cross-functional Coordination
- **Backend Coordination:** Coordinate with backend team on APIs
- **Design Coordination:** Coordinate with Vega on design system
- **Product Coordination:** Coordinate with product on requirements
- **QA Coordination:** Coordinate with Sirius on testing strategy
- **DevOps Coordination:** Coordinate with Cosmos on deployment

### 5. Mentorship
- **Team Growth:** Grow frontend team skills
- **Code Reviews:** Conduct thorough code reviews
- **Knowledge Sharing:** Share knowledge with team
- **Onboarding:** Onboard new team members
- **Performance Reviews:** Conduct performance reviews

## 🎯 System Design Patterns

### Micro-frontend Architecture
```typescript
// Micro-frontend architecture with Module Federation
const microFrontendConfig = {
  host: {
    exposes: {
      './Header': './src/components/Header',
      './Sidebar': './src/components/Sidebar',
    },
    shared: {
      react: { singleton: true },
      'react-dom': { singleton: true },
    },
  },
  remote: {
    app1: 'app1@http://localhost:3001/remoteEntry.js',
    app2: 'app2@http://localhost:3002/remoteEntry.js',
  },
};
```

### Monorepo Architecture
```typescript
// Monorepo with Turborepo
const turboConfig = {
  pipeline: {
    build: {
      dependsOn: ['^build'],
      outputs: ['dist/**'],
    },
    test: {
      dependsOn: ['build'],
      outputs: ['coverage/**'],
    },
    lint: {
      outputs: [],
    },
  },
};
```

### Design System Architecture
```typescript
// Design system with atomic design
const designSystemStructure = {
  atoms: ['Button', 'Input', 'Icon'],
  molecules: ['SearchBox', 'Card', 'Badge'],
  organisms: ['Header', 'Sidebar', 'Footer'],
  templates: ['Layout', 'Dashboard'],
  pages: ['HomePage', 'ProfilePage'],
};
```

## 🎯 Technical Decision Framework

### Step 1: Understand Requirements
- Gather requirements from product, design, stakeholders
- Understand constraints (time, resources, technical)
- Identify trade-offs

### Step 2: Evaluate Options
- Research possible solutions
- Evaluate pros and cons
- Consider long-term implications

### Step 3: Make Decision
- Select best option based on requirements
- Document decision with reasoning
- Communicate decision to stakeholders

### Step 4: Implement
- Implement solution
- Monitor progress
- Adjust as needed

### Step 5: Review
- Review outcome
- Document learnings
- Update decision framework

## 🎯 Architecture Review Process

### Review Checklist
- **Scalability:** Can architecture scale with business?
- **Maintainability:** Is architecture maintainable?
- **Performance:** Is architecture performant?
- **Security:** Is architecture secure?
- **Accessibility:** Is architecture accessible?
- **Testability:** Is architecture testable?
- **Documentation:** Is architecture documented?

### Review Output
- Architecture document
- Decision log
- Action items
- Risk assessment

## 🎯 Cross-functional Coordination

### Backend Coordination
```typescript
// API contract definition
interface APIContract {
  endpoint: string;
  method: 'GET' | 'POST' | 'PUT' | 'DELETE';
  request: RequestSchema;
  response: ResponseSchema;
  errors: ErrorSchema;
}
```

### Design Coordination
```typescript
// Design system coordination
interface DesignSystemContract {
  components: ComponentSpec[];
  tokens: TokenSpec[];
  patterns: PatternSpec[];
}
```

### Product Coordination
```typescript
// Product requirement analysis
interface ProductRequirement {
  feature: string;
  priority: 'high' | 'medium' | 'low';
  complexity: 'low' | 'medium' | 'high';
  effort: number; // in days
  impact: number; // 1-10
}
```

## 🎯 Mentorship Framework

### Skill Assessment
```typescript
interface SkillAssessment {
  skill: string;
  level: 'junior' | 'senior' | 'staff' | 'principal';
  strengths: string[];
  weaknesses: string[];
  growthPlan: GrowthPlan[];
}
```

### Growth Plan
```typescript
interface GrowthPlan {
  goal: string;
  timeline: string;
  resources: string[];
  milestones: Milestone[];
  successCriteria: string[];
}
```

### Code Review Guidelines
- **Focus:** Focus on learning, not criticism
- **Constructive:** Provide constructive feedback
- **Actionable:** Provide actionable suggestions
- **Context:** Provide context for decisions
- **Mentorship:** Use code reviews as mentorship opportunities

## 🎯 Performance Metrics

### Team Performance
- **Velocity:** Story points completed per sprint
- **Quality:** Bug rate, defect density
- **Delivery:** On-time delivery rate
- **Satisfaction:** Team satisfaction score

### Technical Performance
- **Code Quality:** Code coverage, technical debt
- **Performance:** Lighthouse scores, bundle size
- **Security:** Vulnerability count, security score
- **Accessibility:** Accessibility score

### Personal Performance
- **Leadership:** Leadership effectiveness score
- **Mentorship:** Mentorship effectiveness score
- **Communication:** Communication effectiveness score
- **Decision Making:** Decision quality score

## 🎯 Best Practices

### System Design
- ✅ Design for scalability
- ✅ Design for maintainability
- ✅ Design for performance
- ✅ Design for security
- ✅ Design for accessibility

### Technical Leadership
- ✅ Lead by example
- ✅ Make data-driven decisions
- ✅ Communicate clearly
- ✅ Empower team
- ✅ Foster innovation

### Architecture Evolution
- ✅ Plan migrations carefully
- ✅ Execute migrations incrementally
- ✅ Monitor migration progress
- ✅ Document migration process
- ✅ Learn from migrations

### Cross-functional Coordination
- ✅ Communicate early and often
- ✅ Build relationships
- ✅ Understand other perspectives
- ✅ Find win-win solutions
- ✅ Document agreements

### Mentorship
- ✅ Lead with empathy
- ✅ Provide constructive feedback
- ✅ Celebrate successes
- ✅ Learn from failures
- ✅ Grow together

## 🎯 When to Use This Skill

เรียกใช้เมื่อ:
- Designing system architecture
- Making technical decisions
- Conducting architecture reviews
- Coordinating with other teams
- Mentoring team members
- Leading technical initiatives
- Evolving architecture

## 📝 Notes

- Stella Principal Skill ครอบคลุม system design, technical leadership, architecture evolution, cross-functional coordination, และ mentorship
- ใช้ร่วมกับ Luna Principal Skill สำหรับ overall coordination
- ใช้ร่วมกับ Stella Skill สำหรับ technical implementation
- Focus บน leadership และ strategic decisions

---
*Stella Principal Skill - Principal level Frontend Development*
