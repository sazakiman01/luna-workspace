---
description: Windsurf Tooling skill สำหรับ Lyra รวม workflow automation, skill development, rules management, memory management, และ tool optimization
---

# Lyra Skill - Windsurf Tooling

## 🎯 Purpose

Windsurf Tooling skill สำหรับ Lyra รวม workflow automation, skill development, rules management, memory management, และ tool optimization

## 📋 Core Competencies

### Workflow Automation
- **Workflow Design:** Workflow structure, Workflow templates
- **Workflow Implementation:** YAML, Markdown, Automation scripts
- **Workflow Testing:** Workflow validation, Workflow execution
- **Workflow Maintenance:** Workflow updates, Workflow deprecation
- **Workflow Documentation:** Workflow guides, Workflow examples

### Skill Development
- **Skill Structure:** Skill template, Skill metadata
- **Skill Implementation:** TypeScript, Markdown, Tool integration
- **Skill Testing:** Skill validation, Skill execution
- **Skill Maintenance:** Skill updates, Skill deprecation
- **Skill Documentation:** Skill guides, Skill examples

### Rules Management
- **Rule Structure:** Rule template, Rule metadata
- **Rule Implementation:** TypeScript, Markdown, Rule logic
- **Rule Testing:** Rule validation, Rule execution
- **Rule Maintenance:** Rule updates, Rule deprecation
- **Rule Documentation:** Rule guides, Rule examples

## 🎯 Workflow Design

### Workflow Structure
```typescript
// Workflow structure
interface Workflow {
  name: string;
  description: string;
  steps: WorkflowStep[];
  triggers: Trigger[];
  conditions: Condition[];
}
```

### Workflow Template
```typescript
// Workflow template
interface WorkflowTemplate {
  name: string;
  description: string;
  template: Template;
  parameters: Parameter[];
}
```

### Workflow Execution
```typescript
// Workflow execution
interface WorkflowExecution {
  workflow: Workflow;
  context: Context;
  state: State;
  result: Result;
}
```

## 🎯 Skill Development

### Skill Structure
```typescript
// Skill structure
interface Skill {
  name: string;
  description: string;
  metadata: Metadata;
  implementation: Implementation;
}
```

### Skill Template
```typescript
// Skill template
interface SkillTemplate {
  name: string;
  description: string;
  template: Template;
  parameters: Parameter[];
}
```

### Skill Integration
```typescript
// Skill integration
interface SkillIntegration {
  skill: Skill;
  tools: Tool[];
  context: Context;
  execution: Execution;
}
```

## 🎯 Rules Management

### Rule Structure
```typescript
// Rule structure
interface Rule {
  name: string;
  description: string;
  metadata: Metadata;
  implementation: Implementation;
}
```

### Rule Template
```typescript
// Rule template
interface RuleTemplate {
  name: string;
  description: string;
  template: Template;
  parameters: Parameter[];
}
```

### Rule Integration
```typescript
// Rule integration
interface RuleIntegration {
  rule: Rule;
  context: Context;
  validation: Validation;
  enforcement: Enforcement;
}
```

## 🎯 Memory Management

### Memory Structure
```typescript
// Memory structure
interface Memory {
  id: string;
  title: string;
  content: string;
  tags: string[];
  corpus: string[];
}
```

### Memory Retrieval
```typescript
// Memory retrieval
interface MemoryRetrieval {
  query: string;
  filters: Filter[];
  results: Memory[];
  relevance: number;
}
```

## 🎯 Tool Optimization

### Tool Integration
```typescript
// Tool integration
interface ToolIntegration {
  tool: Tool;
  configuration: Configuration;
  optimization: Optimization;
}
```

### Performance Optimization
```typescript
// Performance optimization
interface PerformanceOptimization {
  metrics: Metric[];
  bottlenecks: Bottleneck[];
  improvements: Improvement[];
}
```

## 🎯 Best Practices

### DOs
- ✅ Use clear naming
- ✅ Document thoroughly
- ✅ Test extensively
- ✅ Maintain regularly
- ✅ Optimize performance
- ✅ Follow conventions
- ✅ Use templates
- ✅ Validate inputs
- ✅ Handle errors
- ✅ Monitor usage

### DON'Ts
- ❌ Don't use unclear names
- ❌ Don't skip documentation
- ❌ Don't skip testing
- ❌ Don't skip maintenance
- ❌ Don't ignore performance
- ❌ Don't break conventions
- ❌ Don't skip templates
- ❌ Don't skip validation
- ❌ Don't ignore errors
- ❌ Don't ignore usage

## 🎯 When to Use This Skill

เรียกใช้เมื่อ:
- Creating workflows
- Developing skills
- Managing rules
- Managing memories
- Optimizing tools

## 📝 Notes

- Lyra Skill ครอบคลุม workflow automation, skill development, rules management, memory management, tool optimization
- Focus บน Windsurf tooling แล automation
- ใช้ร่วมกับ cross-functional skills สำหรับ coordination

---
*Lyra Skill - Windsurf Tooling*
