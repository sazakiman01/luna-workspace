---
description: Luna System Auditor skill สำหรับ Polaris รวม system audit, quality review, behavior compliance, performance monitoring, และ improvement recommendations
---

# Polaris Skill - Luna System Auditor

## 🎯 Purpose

Luna System Auditor skill สำหรับ Polaris รวม system audit, quality review, behavior compliance, performance monitoring, และ improvement recommendations

## 📋 Core Competencies

### System Audit
- **Audit Planning:** Audit scope, Audit schedule, Audit resources
- **Audit Execution:** Data collection, Analysis, Testing
- **Audit Reporting:** Audit findings, Recommendations, Action items
- **Audit Follow-up:** Implementation tracking, Compliance verification
- **Continuous Audit:** Automated audits, Real-time monitoring

### Quality Review
- **Code Quality:** Code review, Code standards, Code metrics
- **Documentation Quality:** Documentation review, Documentation standards
- **Process Quality:** Process review, Process optimization
- **Output Quality:** Output review, Output validation
- **Quality Metrics:** Quality KPIs, Quality trends

### Behavior Compliance
- **Behavior Analysis:** Behavior patterns, Behavior deviations
- **Compliance Check:** Rule compliance, Policy compliance
- **Issue Identification:** Behavior issues, Compliance issues
- **Remediation:** Issue resolution, Process improvement
- **Monitoring:** Continuous monitoring, Alerting

## 🎯 System Audit

### Audit Planning
```typescript
// Audit plan
interface AuditPlan {
  scope: AuditScope;
  schedule: AuditSchedule;
  resources: AuditResource[];
  objectives: AuditObjective[];
}
```

### Audit Execution
```typescript
// Audit execution
interface AuditExecution {
  dataCollection: DataCollection;
  analysis: Analysis;
  testing: Testing;
  findings: Finding[];
}
```

### Audit Reporting
```typescript
// Audit report
interface AuditReport {
  executiveSummary: string;
  findings: Finding[];
  recommendations: Recommendation[];
  actionItems: ActionItem[];
}
```

## 🎯 Quality Review

### Code Quality
```typescript
// Code quality metrics
interface CodeQualityMetrics {
  complexity: number;
  maintainability: number;
  testCoverage: number;
  codeSmells: CodeSmell[];
}
```

### Documentation Quality
```typescript
// Documentation quality metrics
interface DocumentationQualityMetrics {
  completeness: number;
  accuracy: number;
  clarity: number;
  currency: number;
}
```

### Process Quality
```typescript
// Process quality metrics
interface ProcessQualityMetrics {
  efficiency: number;
  effectiveness: number;
  consistency: number;
  compliance: number;
}
```

## 🎯 Behavior Compliance

### Behavior Analysis
```typescript
// Behavior analysis
interface BehaviorAnalysis {
  patterns: BehaviorPattern[];
  deviations: BehaviorDeviation[];
  issues: BehaviorIssue[];
}
```

### Compliance Check
```typescript
// Compliance check
interface ComplianceCheck {
  rules: Rule[];
  policies: Policy[];
  compliance: ComplianceResult[];
}
```

### Issue Identification
```typescript
// Issue identification
interface IssueIdentification {
  issues: Issue[];
  severity: 'critical' | 'high' | 'medium' | 'low';
  priority: number;
}
```

## 🎯 Performance Monitoring

### Performance Metrics
```typescript
// Performance metrics
interface PerformanceMetrics {
  responseTime: number;
  throughput: number;
  errorRate: number;
  availability: number;
}
```

### Monitoring
```typescript
// Monitoring
interface Monitoring {
  metrics: Metric[];
  alerts: Alert[];
  dashboards: Dashboard[];
}
```

## 🎯 Improvement Recommendations

### Recommendations
```typescript
// Recommendations
interface Recommendations {
  immediate: Recommendation[];
  shortTerm: Recommendation[];
  longTerm: Recommendation[];
}
```

### Action Items
```typescript
// Action items
interface ActionItems {
  items: ActionItem[];
  owners: Owner[];
  timelines: Timeline[];
}
```

## 🎯 Best Practices

### DOs
- ✅ Audit regularly
- ✅ Document findings
- ✅ Provide actionable recommendations
- ✅ Track implementation
- ✅ Monitor continuously
- ✅ Communicate clearly
- ✅ Collaborate with teams
- ✅ Use data-driven approach
- ✅ Focus on improvement
- ✅ Maintain objectivity

### DON'Ts
- ❌ Don't skip audits
- ❌ Don't ignore findings
- ❌ Don't skip documentation
- ❌ Don't skip tracking
- ❌ Don't skip monitoring
- ❌ Don't communicate poorly
- ❌ Don't work in silos
- ❌ Don't rely on opinions
- ❌ Don't blame individuals
- ❌ Don't lose objectivity

## 🎯 When to Use This Skill

เรียกใช้เมื่อ:
- Conducting system audits
- Reviewing quality
- Checking compliance
- Monitoring performance
- Providing recommendations
- Tracking improvements

## 📝 Notes

- Polaris Skill ครอบคลุม system audit, quality review, behavior compliance, performance monitoring, improvement recommendations
- Focus บน Luna system quality แล compliance
- ใช้ร่วมกับ cross-functional skills สำหรับ coordination

---
*Polaris Skill - Luna System Auditor*
