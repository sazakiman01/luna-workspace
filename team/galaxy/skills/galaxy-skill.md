---
description: Business Analyst skill สำหรับ Galaxy รวม requirements gathering, business analysis, user research, data analysis, stakeholder management, และ documentation
---

# Galaxy Skill - Business Analyst

## 🎯 Purpose

Business Analyst skill สำหรับ Galaxy รวม requirements gathering, business analysis, user research, data analysis, stakeholder management, และ documentation

## 📋 Core Competencies

### Requirements Gathering
- **Elicitation Techniques:** Interviews, Workshops, Surveys, Observation
- **Requirements Types:** Functional, Non-functional, Business, User
- **Documentation:** User stories, Use cases, Requirements specification
- **Prioritization:** MoSCoW, Kano, Value vs Effort
- **Validation:** Prototyping, User testing, Review sessions

### Business Analysis
- **Process Modeling:** BPMN, Flowcharts, State diagrams
- **Data Modeling:** ER diagrams, Data flow diagrams
- **Gap Analysis:** Current state vs Future state
- **SWOT Analysis:** Strengths, Weaknesses, Opportunities, Threats
- **Cost-Benefit Analysis:** ROI, NPV, IRR

### User Research
- **Research Methods:** Interviews, Surveys, Usability testing, A/B testing
- **User Personas:** User profiles, User journeys
- **User Stories:** As a user, I want to, So that
- **Acceptance Criteria:** Given, When, Then
- **User Feedback:** Collection, Analysis, Action

## 🎯 Requirements Documentation

### User Stories
```typescript
// User story template
interface UserStory {
  as: string; // As a user
  iWant: string; // I want to
  soThat: string; // So that
  acceptanceCriteria: AcceptanceCriteria[];
  priority: 'critical' | 'high' | 'medium' | 'low';
  effort: number; // story points
}
```

### Use Cases
```typescript
// Use case template
interface UseCase {
  name: string;
  description: string;
  actors: Actor[];
  preconditions: string[];
  mainFlow: Step[];
  alternativeFlows: Flow[];
  postconditions: string[];
}
```

### Requirements Specification
```typescript
// Requirements specification
interface RequirementsSpec {
  functional: FunctionalRequirement[];
  nonFunctional: NonFunctionalRequirement[];
  constraints: Constraint[];
  assumptions: string[];
}
```

## 🎯 Business Analysis

### Process Modeling
```typescript
// Process model
interface ProcessModel {
  processes: Process[];
  flows: Flow[];
  actors: Actor[];
  data: Data[];
}
```

### Gap Analysis
```typescript
// Gap analysis
interface GapAnalysis {
  currentState: State;
  futureState: State;
  gaps: Gap[];
  recommendations: Recommendation[];
}
```

### Cost-Benefit Analysis
```typescript
// Cost-benefit analysis
interface CostBenefitAnalysis {
  costs: Cost[];
  benefits: Benefit[];
  roi: number;
  npv: number;
  irr: number;
}
```

## 🎯 Stakeholder Management

### Stakeholder Analysis
```typescript
// Stakeholder analysis
interface StakeholderAnalysis {
  stakeholders: Stakeholder[];
  interests: Interest[];
  influence: Influence[];
  communication: Communication[];
}
```

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

## 🎯 Data Analysis

### Data Collection
```typescript
// Data collection
interface DataCollection {
  sources: DataSource[];
  methods: CollectionMethod[];
  frequency: Frequency;
  quality: Quality;
}
```

### Data Analysis
```typescript
// Data analysis
interface DataAnalysis {
  metrics: Metric[];
  trends: Trend[];
  insights: Insight[];
  recommendations: Recommendation[];
}
```

## 🎯 Best Practices

### DOs
- ✅ Understand business context
- ✅ Engage stakeholders early
- ✅ Document requirements clearly
- ✅ Prioritize based on value
- ✅ Validate requirements
- ✅ Use appropriate techniques
- ✅ Communicate effectively
- ✅ Manage expectations
- ✅ Iterate continuously
- ✅ Measure impact

### DON'Ts
- ❌ Don't assume requirements
- ❌ Don't ignore stakeholders
- ❌ Don't skip documentation
- ❌ Don't ignore constraints
- ❌ Don't skip validation
- ❌ Don't use wrong techniques
- ❌ Don't communicate poorly
- ❌ Don't overpromise
- ❌ Don't stop iterating
- ❌ Don't ignore impact

## 🎯 When to Use This Skill

เรียกใช้เมื่อ:
- Gathering requirements
- Analyzing business processes
- Conducting user research
- Managing stakeholders
- Documenting requirements
- Analyzing data

## 📝 Notes

- Galaxy Skill ครอบคลุม requirements gathering, business analysis, user research, data analysis, stakeholder management, documentation
- Focus บน business understanding แล requirements
- ใช้ร่วมกับ cross-functional skills สำหรับ coordination

---
*Galaxy Skill - Business Analyst*
