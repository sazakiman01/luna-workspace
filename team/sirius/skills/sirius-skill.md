---
description: QA Engineer skill สำหรับ Sirius รวม testing strategies, test automation, quality assurance, performance testing, security testing, และ test management
---

# Sirius Skill - QA Engineer

## 🎯 Purpose

QA Engineer skill สำหรับ Sirius รวม testing strategies, test automation, quality assurance, performance testing, security testing, และ test management

## 📋 Core Competencies

### Testing Strategies
- **Unit Testing:** Jest, Mocha, Pytest, JUnit
- **Integration Testing:** Supertest, TestContainers, WireMock
- **E2E Testing:** Playwright, Cypress, Selenium
- **API Testing:** Postman, REST Assured, Newman
- **Performance Testing:** JMeter, k6, Gatling

### Test Automation
- **Framework Design:** Page Object Model, Data-driven testing
- **Test Data Management:** Test data factories, Mock data
- **CI/CD Integration:** GitHub Actions, Jenkins, GitLab CI
- **Test Reporting:** Allure, Mochawesome, TestRail
- **Test Parallelization:** Parallel execution, Sharding

### Quality Assurance
- **Test Planning:** Test strategy, Test plan
- **Test Design:** Test cases, Test scenarios
- **Test Execution:** Manual testing, Automated testing
- **Defect Management:** Bug tracking, Triage
- **Quality Metrics:** Test coverage, Defect density

## 🎯 Testing Types

### Unit Testing
```typescript
// Unit test example
describe('UserService', () => {
  it('should create user', async () => {
    const user = await userService.createUser(userData);
    expect(user).toBeDefined();
    expect(user.email).toBe(userData.email);
  });
});
```

### Integration Testing
```typescript
// Integration test example
describe('API Integration', () => {
  it('should create user via API', async () => {
    const response = await fetch('/api/users', {
      method: 'POST',
      body: JSON.stringify(userData),
    });
    expect(response.status).toBe(201);
  });
});
```

### E2E Testing
```typescript
// E2E test example
describe('User Flow', () => {
  it('should complete user registration flow', async () => {
    await page.goto('/register');
    await page.fill('#email', 'test@example.com');
    await page.fill('#password', 'password123');
    await page.click('#submit');
    await expect(page).toHaveURL('/dashboard');
  });
});
```

## 🎯 Test Automation Framework

### Page Object Model
```typescript
// Page object
class LoginPage {
  async visit() {
    await page.goto('/login');
  }

  async login(email: string, password: string) {
    await page.fill('#email', email);
    await page.fill('#password', password);
    await page.click('#submit');
  }
}
```

### Data-driven Testing
```typescript
// Data-driven test
const testCases = [
  { email: 'test@example.com', password: 'valid123', expected: 'success' },
  { email: 'invalid@example.com', password: 'invalid', expected: 'error' },
];

testCases.forEach(({ email, password, expected }) => {
  it(`should ${expected} for ${email}`, async () => {
    const result = await login(email, password);
    expect(result).toBe(expected);
  });
});
```

### Test Data Management
```typescript
// Test data factory
function createUserData(overrides?: Partial<User>) {
  return {
    email: 'test@example.com',
    password: 'password123',
    name: 'Test User',
    ...overrides,
  };
}
```

## 🎯 Performance Testing

### Load Testing
```typescript
// Load test configuration
interface LoadTestConfig {
  target: string;
  duration: number;
  users: number;
  rampUp: number;
}
```

### Stress Testing
```typescript
// Stress test configuration
interface StressTestConfig {
  target: string;
  duration: number;
  users: number;
  rampUp: number;
}
```

### Spike Testing
```typescript
// Spike test configuration
interface SpikeTestConfig {
  target: string;
  duration: number;
  users: number;
  spikeDuration: number;
}
```

## 🎯 Security Testing

### Vulnerability Scanning
```typescript
// Security scan configuration
interface SecurityScanConfig {
  tool: 'owasp-zap' | 'burp' | 'sonarqube';
  target: string;
  rules: SecurityRule[];
}
```

### Penetration Testing
```typescript
// Penetration test configuration
interface PenTestConfig {
  scope: string[];
  techniques: PenTestTechnique[];
  reporting: ReportingConfig;
}
```

## 🎯 Test Management

### Test Planning
```typescript
// Test plan
interface TestPlan {
  scope: string;
  strategy: TestStrategy;
  schedule: Schedule;
  resources: Resource[];
  risks: Risk[];
}
```

### Test Execution
```typescript
// Test execution
interface TestExecution {
  testCases: TestCase[];
  environment: Environment;
  schedule: Schedule;
  reporting: ReportingConfig;
}
```

### Defect Management
```typescript
// Defect tracking
interface Defect {
  id: string;
  title: string;
  description: string;
  severity: 'critical' | 'high' | 'medium' | 'low';
  priority: number;
  status: 'open' | 'in-progress' | 'resolved' | 'closed';
}
```

## 🎯 Best Practices

### DOs
- ✅ Write testable code
- ✅ Write clear test cases
- ✅ Use appropriate test types
- ✅ Automate repetitive tests
- ✅ Use test data management
- ✅ Integrate with CI/CD
- ✅ Use test reporting
- ✅ Monitor test coverage
- ✅ Review test results
- ✅ Continuously improve

### DON'Ts
- ❌ Don't test implementation details
- ❌ Don't write flaky tests
- ❌ Don't skip edge cases
- ❌ Don't ignore test failures
- ❌ Don't skip documentation
- ❌ Don't skip CI/CD integration
- ❌ Don't skip test reporting
- ❌ Don't ignore coverage
- ❌ Don't ignore results
- ❌ Don't stop improving

## 🎯 When to Use This Skill

เรียกใช้เมื่อ:
- Designing test strategy
- Writing test cases
- Automating tests
- Executing tests
- Managing defects
- Reporting test results

## 📝 Notes

- Sirius Skill ครอบคลุม testing strategies, test automation, quality assurance, performance testing, security testing, test management
- Focus บน quality assurance แล test automation
- ใช้ร่วมกับ cross-functional skills สำหรับ coordination

---
*Sirius Skill - QA Engineer*
