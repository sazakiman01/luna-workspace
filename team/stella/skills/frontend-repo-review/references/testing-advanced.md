# Testing (Advanced)

## 📋 Advanced Testing Patterns

### Testing Library
```typescript
import { render, screen, fireEvent, waitFor } from '@testing-library/react';

describe('Button', () => {
  it('renders correctly', () => {
    render(<Button>Click me</Button>);
    expect(screen.getByText('Click me')).toBeInTheDocument();
  });

  it('calls onClick when clicked', () => {
    const handleClick = jest.fn();
    render(<Button onClick={handleClick}>Click me</Button>);
    fireEvent.click(screen.getByText('Click me'));
    expect(handleClick).toHaveBeenCalledTimes(1);
  });
});
```

### Custom Hooks Testing
```typescript
import { renderHook, act } from '@testing-library/react-hooks';

describe('useCounter', () => {
  it('increments counter', () => {
    const { result } = renderHook(() => useCounter());
    act(() => {
      result.current.increment();
    });
    expect(result.current.count).toBe(1);
  });
});
```

### Context Testing
```typescript
import { render, screen } from '@testing-library/react';
import { AuthProvider, useAuth } from './AuthContext';

describe('AuthContext', () => {
  it('provides auth state', () => {
    const TestComponent = () => {
      const { isAuthenticated } = useAuth();
      return <div>{isAuthenticated ? 'Authenticated' : 'Not authenticated'}</div>;
    };

    render(
      <AuthProvider>
        <TestComponent />
      </AuthProvider>
    );

    expect(screen.getByText('Not authenticated')).toBeInTheDocument();
  });
});
```

## 📋 E2E Testing

### Playwright
```typescript
import { test, expect } from '@playwright/test';

test('user can login', async ({ page }) => {
  await page.goto('https://example.com/login');
  await page.fill('input[name="email"]', 'test@example.com');
  await page.fill('input[name="password"]', 'password123');
  await page.click('button[type="submit"]');
  await expect(page).toHaveURL('https://example.com/dashboard');
});
```

### Cypress
```typescript
describe('Login', () => {
  it('user can login', () => {
    cy.visit('/login');
    cy.get('input[name="email"]').type('test@example.com');
    cy.get('input[name="password"]').type('password123');
    cy.get('button[type="submit"]').click();
    cy.url().should('include', '/dashboard');
  });
});
```

### E2E Best Practices
- Use page objects for better maintainability
- Use data-testid for selecting elements
- Use waitFor for async operations
- Use beforeEach/afterEach for setup/teardown
- Use environment-specific configurations

## 📋 Visual Regression Testing

### Percy
```typescript
import { percySnapshot } from '@percy/playwright';

test('homepage visual regression', async ({ page }) => {
  await page.goto('https://example.com');
  await percySnapshot(page, 'Homepage');
});
```

### Storybook
```typescript
import { composeStories } from '@storybook/testing-react';
import * as stories from './Button.stories';

const { Primary, Secondary } = composeStories(stories);

describe('Button Visual Regression', () => {
  it('Primary button matches snapshot', () => {
    const { container } = render(<Primary />);
    expect(container).toMatchSnapshot();
  });
});
```

### Chromatic
```typescript
// Storybook configuration
module.exports = {
  stories: ['../src/**/*.stories.@(js|jsx|ts|tsx)'],
  addons: [
    '@chromatic-com/storybook',
    '@storybook/addon-essentials',
  ],
};
```

## 📋 Integration Testing

### React Testing Library Integration
```typescript
import { render, screen, waitFor } from '@testing-library/react';
import userEvent from '@testing-library/user-event';

describe('Form Integration', () => {
  it('submits form successfully', async () => {
    render(<LoginForm />);
    const user = userEvent.setup();
    
    await user.type(screen.getByLabelText('Email'), 'test@example.com');
    await user.type(screen.getByLabelText('Password'), 'password123');
    await user.click(screen.getByRole('button', { name: 'Login' }));

    await waitFor(() => {
      expect(screen.getByText('Login successful')).toBeInTheDocument();
    });
  });
});
```

### API Integration Testing
```typescript
import { rest } from 'msw';
import { setupServer } from 'msw/node';

const server = setupServer(
  rest.post('/api/login', (req, res, ctx) => {
    return res(ctx.json({ token: 'abc123' }));
  })
);

beforeAll(() => server.listen());
afterEach(() => server.resetHandlers());
afterAll(() => server.close());

describe('API Integration', () => {
  it('logs in successfully', async () => {
    const response = await login('test@example.com', 'password123');
    expect(response.token).toBe('abc123');
  });
});
```

## 📋 Performance Testing

### Lighthouse CI
```json
{
  "ci": {
    "collect": {
      "staticDistDir": "./dist",
      "url": ["http://localhost:3000"],
      "numberOfRuns": 3
    },
    "upload": {
      "target": "temporary-public-storage"
    }
  }
}
```

### WebPageTest
```typescript
// WebPageTest API integration
const WebPageTest = require('webpagetest');

const wpt = new WebPageTest('YOUR_API_KEY');

wpt.runTest('https://example.com', (err, data) => {
  console.log(data);
});
```

### Performance Budgets
```javascript
// webpack.config.js
const PerformanceBudgetPlugin = require('@wordpress/performance-budget-plugin');

module.exports = {
  plugins: [
    new PerformanceBudgetPlugin({
      budgets: {
        script: 200 * 1024, // 200KB
        style: 50 * 1024, // 50KB
        total: 300 * 1024, // 300KB
      },
    }),
  ],
};
```

## 📋 Accessibility Testing

### Axe Core
```typescript
import { axe, toHaveNoViolations } from 'jest-axe';

expect.extend(toHaveNoViolations);

describe('Accessibility', () => {
  it('has no accessibility violations', async () => {
    const { container } = render(<App />);
    const results = await axe(container);
    expect(results).toHaveNoViolations();
  });
});
```

### Pa11y
```javascript
// pa11y configuration
module.exports = {
  defaults: {
    standard: 'WCAG2.1AA',
    runners: ['axe', 'htmlcs'],
    rules: ['best-practice'],
  },
};
```

### Lighthouse Accessibility
```typescript
import lighthouse from 'lighthouse';
import chromeLauncher from 'chrome-launcher';

const chrome = await chromeLauncher.launch();
const options = {
  logLevel: 'info',
  output: 'json',
  onlyCategories: ['accessibility'],
  port: chrome.port,
};
const runnerResult = await lighthouse('https://example.com', options);
await chrome.kill();
```

## 📋 Testing Best Practices

### DOs
- ✅ ใช้ Testing Library สำหรับ component testing
- ✅ ใช้ Playwright/Cypress สำหรับ E2E testing
- ✅ ใช้ Percy/Chromatic สำหรับ visual regression
- ✅ ใช้ MSW สำหรับ API mocking
- ✅ ใช้ custom render functions สำหรับ common setup
- ✅ ใช้ data-testid สำหรับ selecting elements
- ✅ ใช้ waitFor สำหรับ async operations
- ✅ ใช beforeEach/afterEach สำหรับ setup/teardown
- ✅ ใช้ test coverage tools (Istanbul, c8)
- ✅ ใช้ CI/CD สำหรับ automated testing

### DON'Ts
- ❌ ไม่ใช้ implementation details (className, internal state)
- ❌ ไม่ใช้ snapshot testing สำหรับ dynamic content
- ❌ ไม่ใช้ global state ใน tests
- ❌ ไม่ใช้ hardcoded data ใน tests
- ❌ ไม่ใช้ flaky tests (timing-dependent)
- ❌ ไม่ใช้ test coupling (tests depend on each other)
- ❌ ไม่ใช้ slow tests (tests that take too long)
- ❌ ไม่ใช้ complex setup ใน tests
- ❌ ไม่ใช้ test duplication
- ❌ ไม่ใช้ testing without purpose

## 📋 Test Coverage

### Istanbul/nyc
```javascript
// package.json
{
  "scripts": {
    "test": "jest",
    "test:coverage": "jest --coverage"
  }
}

// jest.config.js
module.exports = {
  collectCoverageFrom: [
    'src/**/*.{js,jsx,ts,tsx}',
    '!src/**/*.d.ts',
    '!src/**/*.stories.{js,jsx,ts,tsx}',
  ],
  coverageThreshold: {
    global: {
      branches: 80,
      functions: 80,
      lines: 80,
      statements: 80,
    },
  },
};
```

### c8 (for Node.js)
```javascript
// package.json
{
  "scripts": {
    "test": "c8 mocha"
  }
}
```

### Coverage Report
```typescript
// Generate coverage report
npm run test:coverage

// View coverage report
open coverage/index.html
```

---
*Testing (Advanced) - Reference ของ Stella*
