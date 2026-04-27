# Cross-functional Skills

## 📋 Frontend-Backend Coordination

### API Contract Design
```typescript
interface APIContract {
  endpoint: string;
  method: 'GET' | 'POST' | 'PUT' | 'DELETE';
  request: RequestSchema;
  response: ResponseSchema;
  errors: ErrorSchema;
  version: string;
  deprecationDate?: Date;
}
```

### API Versioning Strategy
```typescript
// Version 1
GET /api/v1/users

// Version 2
GET /api/v2/users

// Deprecation policy
// - Notify 3 months before deprecation
// - Maintain deprecated endpoint for 6 months
// - Provide migration guide
```

### Error Handling Coordination
```typescript
// Frontend error handling
try {
  const response = await fetch('/api/users');
  if (!response.ok) {
    throw new Error(response.statusText);
  }
  const data = await response.json();
} catch (error) {
  // Handle error
  showErrorToast(error.message);
}

// Backend error response
{
  "error": {
    "code": "USER_NOT_FOUND",
    "message": "User not found",
    "details": {
      "userId": "123"
    }
  }
}
```

## 📋 Frontend-Design Coordination

### Design System Implementation
```typescript
// Design tokens from Figma
const designTokens = {
  colors: {
    primary: '#0ea5e9',
    secondary: '#6366f1',
  },
  spacing: {
    sm: '8px',
    md: '16px',
    lg: '24px',
  },
};

// Use in components
function Button({ variant = 'primary' }) {
  const backgroundColor = designTokens.colors[variant];
  const padding = designTokens.spacing.md;
  return <button style={{ backgroundColor, padding }}>Click</button>;
}
```

### Design Review Process
```typescript
// Design review checklist
interface DesignReviewChecklist {
  visualDesign: boolean;
  accessibility: boolean;
  responsiveness: boolean;
  performance: boolean;
  implementation: boolean;
}

// Review workflow
async function conductDesignReview(design: Design) {
  const checklist: DesignReviewChecklist = {
    visualDesign: true,
    accessibility: true,
    responsiveness: true,
    performance: true,
    implementation: true,
  };
  return checklist;
}
```

### Component Handoff
```typescript
// Component specification from design
interface ComponentSpec {
  name: string;
  props: PropSpec[];
  states: State[];
  variants: Variant[];
  accessibility: AccessibilitySpec;
}

// Implementation guide
interface ImplementationGuide {
  component: ComponentSpec;
  code: string;
  examples: Example[];
  tests: Test[];
}
```

## 📋 Frontend-QA Coordination

### Test Strategy Alignment
```typescript
// Test strategy
interface TestStrategy {
  unitTests: TestSpec[];
  integrationTests: TestSpec[];
  e2eTests: TestSpec[];
  accessibilityTests: TestSpec[];
  performanceTests: TestSpec[];
}

// Test coverage
interface TestCoverage {
  unit: number; // percentage
  integration: number; // percentage
  e2e: number; // percentage
  accessibility: number; // percentage
}
```

### Bug Triage Process
```typescript
// Bug classification
interface BugClassification {
  severity: 'critical' | 'high' | 'medium' | 'low';
  type: 'frontend' | 'backend' | 'integration' | 'design';
  priority: number; // 1-10
  assignee: string;
}

// Triage workflow
async function triageBug(bug: Bug) {
  const classification: BugClassification = {
    severity: determineSeverity(bug),
    type: determineType(bug),
    priority: determinePriority(bug),
    assignee: determineAssignee(bug),
  };
  return classification;
}
```

### Test Environment Setup
```typescript
// Test environment configuration
interface TestEnvironment {
  environment: 'development' | 'staging' | 'production';
  apiEndpoint: string;
  database: string;
  features: FeatureFlag[];
}

// Setup test environment
async function setupTestEnvironment(environment: TestEnvironment) {
  // Configure environment
  // Seed database
  // Set up feature flags
  // Start test server
}
```

## 📋 Frontend-DevOps Coordination

### Deployment Pipeline
```typescript
// Deployment pipeline stages
interface DeploymentPipeline {
  stages: PipelineStage[];
  environment: string;
  rollbackStrategy: RollbackStrategy;
}

// Pipeline stage
interface PipelineStage {
  name: string;
  commands: string[];
  timeout: number;
  onFailure: 'stop' | 'continue';
}

// Example pipeline
const pipeline: DeploymentPipeline = {
  stages: [
    {
      name: 'build',
      commands: ['npm run build'],
      timeout: 300,
      onFailure: 'stop',
    },
    {
      name: 'test',
      commands: ['npm run test'],
      timeout: 600,
      onFailure: 'stop',
    },
    {
      name: 'deploy',
      commands: ['npm run deploy'],
      timeout: 300,
      onFailure: 'continue',
    },
  ],
  environment: 'staging',
  rollbackStrategy: 'automatic',
};
```

### CI/CD Configuration
```typescript
// CI/CD configuration
interface CIConfig {
  triggers: Trigger[];
  stages: Stage[];
  cache: CacheConfig;
  artifacts: Artifact[];
}

// Example CI config
const ciConfig: CIConfig = {
  triggers: ['push', 'pull_request'],
  stages: ['build', 'test', 'deploy'],
  cache: {
    paths: ['node_modules', '.next'],
  },
  artifacts: ['dist', 'coverage'],
};
```

### Monitoring Setup
```typescript
// Monitoring configuration
interface MonitoringConfig {
  logging: LoggingConfig;
  metrics: MetricsConfig;
  alerts: AlertConfig;
}

// Example monitoring config
const monitoringConfig: MonitoringConfig = {
  logging: {
    level: 'info',
    format: 'json',
  },
  metrics: {
    enabled: true,
    interval: 60,
  },
  alerts: {
    enabled: true,
    channels: ['slack', 'email'],
  },
};
```

## 📋 Frontend-Product Coordination

### Requirement Analysis
```typescript
// Product requirement
interface ProductRequirement {
  feature: string;
  userStory: string;
  acceptanceCriteria: string[];
  priority: 'high' | 'medium' | 'low';
  complexity: 'low' | 'medium' | 'high';
  effort: number; // in days
  impact: number; // 1-10
}

// Requirement analysis
function analyzeRequirement(requirement: ProductRequirement) {
  const roi = requirement.impact / requirement.effort;
  const priority = roi > 0.5 ? 'high' : roi > 0.2 ? 'medium' : 'low';
  return { roi, priority };
}
```

### Feature Planning
```typescript
// Feature roadmap
interface FeatureRoadmap {
  quarters: Quarter[];
  priorities: Priority[];
  dependencies: Dependency[];
}

// Feature planning
function planFeature(feature: Feature) {
  const timeline = estimateTimeline(feature);
  const dependencies = identifyDependencies(feature);
  const risks = identifyRisks(feature);
  return { timeline, dependencies, risks };
}
```

### User Feedback Integration
```typescript
// User feedback
interface UserFeedback {
  feature: string;
  feedback: string;
  sentiment: 'positive' | 'negative' | 'neutral';
  priority: number;
}

// Feedback analysis
function analyzeFeedback(feedbacks: UserFeedback[]) {
  const positiveCount = feedbacks.filter(f => f.sentiment === 'positive').length;
  const negativeCount = feedbacks.filter(f => f.sentiment === 'negative').length;
  const netPromoterScore = (positiveCount - negativeCount) / feedbacks.length;
  return { positiveCount, negativeCount, netPromoterScore };
}
```

## 📋 Cross-functional Communication

### Communication Channels
```typescript
// Communication channels
interface CommunicationChannels {
  slack: string;
  email: string;
  meetings: Meeting[];
  documentation: string;
}

// Channel usage
interface ChannelUsage {
  channel: string;
  purpose: string;
  audience: string[];
  frequency: string;
}
```

### Meeting Structure
```typescript
// Meeting structure
interface MeetingStructure {
  agenda: AgendaItem[];
  attendees: Attendee[];
  duration: number;
  outcomes: Outcome[];
}

// Example meeting
const dailyStandup: MeetingStructure = {
  agenda: [
    { topic: 'Yesterday', time: 2 },
    { topic: 'Today', time: 2 },
    { topic: 'Blockers', time: 1 },
  ],
  attendees: ['frontend', 'backend', 'design', 'product', 'qa'],
  duration: 15,
  outcomes: [],
};
```

### Documentation Standards
```typescript
// Documentation structure
interface DocumentationStructure {
  overview: string;
  architecture: string;
  api: string;
  components: string;
  deployment: string;
  troubleshooting: string;
}

// Documentation template
const documentationTemplate: DocumentationStructure = {
  overview: 'Project overview',
  architecture: 'System architecture',
  api: 'API documentation',
  components: 'Component documentation',
  deployment: 'Deployment guide',
  troubleshooting: 'Troubleshooting guide',
};
```

## 📋 Conflict Resolution

### Conflict Types
```typescript
// Conflict types
interface ConflictTypes {
  technical: Conflict[];
  process: Conflict[];
  interpersonal: Conflict[];
}

// Conflict resolution
function resolveConflict(conflict: Conflict) {
  const resolution = identifyResolution(conflict);
  const stakeholders = identifyStakeholders(conflict);
  const timeline = estimateResolutionTime(conflict);
  return { resolution, stakeholders, timeline };
}
```

### Escalation Path
```typescript
// Escalation path
interface EscalationPath {
  level1: string; // Team lead
  level2: string; // Engineering manager
  level3: string; // Director
  level4: string; // VP
}

// Escalation criteria
interface EscalationCriteria {
  timelineExceeded: boolean;
  impactHigh: boolean;
  resolutionBlocked: boolean;
  stakeholderDisagreement: boolean;
}
```

## 📋 Best Practices

### DOs
- ✅ Communicate early and often
- ✅ Build relationships across teams
- ✅ Understand other perspectives
- ✅ Find win-win solutions
- ✅ Document agreements
- ✅ Follow through on commitments
- ✅ Be proactive
- ✅ Be flexible
- ✅ Be respectful
- ✅ Be collaborative

### DON'Ts
- ❌ Don't wait until last minute
- ❌ Don't work in silos
- ❌ Don't ignore other perspectives
- ❌ Don't create win-lose situations
- ❌ Don't leave agreements undocumented
- ❌ Don't break commitments
- ❌ Don't be reactive
- ❌ Don't be rigid
- ❌ Don't be disrespectful
- ❌ Don't be uncooperative

---
*Cross-functional Skills*
