# Security (Advanced)

## 📋 Advanced XSS Prevention

### DOMPurify
```typescript
import DOMPurify from 'dompurify';

function RenderHTML({ html }: { html: string }) {
  const clean = DOMPurify.sanitize(html);
  return <div dangerouslySetInnerHTML={{ __html: clean }} />;
}
```

### Content Security Policy (CSP)
```html
<meta http-equiv="Content-Security-Policy" content="
  default-src 'self';
  script-src 'self' 'nonce-random' 'strict-dynamic';
  style-src 'self' 'nonce-random';
  img-src 'self' data: https:;
  font-src 'self' data:;
  connect-src 'self' https://api.example.com;
  frame-src 'none';
  base-uri 'self';
  form-action 'self';
  frame-ancestors 'none';
  report-uri /csp-report
">
```

### CSP Header (Server-side)
```javascript
// Express.js
app.use(
  helmet.contentSecurityPolicy({
    directives: {
      defaultSrc: ["'self'"],
      scriptSrc: ["'self'", "'nonce-random'"],
      styleSrc: ["'self'", "'nonce-random'"],
      imgSrc: ["'self'", "data:", "https:"],
    },
  })
);
```

## 📋 CSRF Prevention

### CSRF Tokens
```typescript
// Generate CSRF token
function generateCSRFToken() {
  return crypto.randomBytes(32).toString('hex');
}

// Validate CSRF token
function validateCSRFToken(token: string, sessionToken: string) {
  return token === sessionToken;
}
```

### SameSite Cookies
```typescript
// Set SameSite cookie
document.cookie = 'session=abc123; SameSite=Strict; Secure; HttpOnly';
```

### CSRF Middleware
```typescript
import csrf from 'csurf';

const csrfProtection = csrf({ cookie: true });

app.post('/api/data', csrfProtection, (req, res) => {
  // Handle request
});
```

## 📋 Advanced Security Headers

### Helmet.js
```typescript
import helmet from 'helmet';

app.use(helmet());
app.use(
  helmet.contentSecurityPolicy({
    directives: {
      defaultSrc: ["'self'"],
      scriptSrc: ["'self'"],
      styleSrc: ["'self'"],
      imgSrc: ["'self'", "data:", "https:"],
    },
  })
);
app.use(helmet.hsts({ maxAge: 31536000 })); // Strict-Transport-Security
app.use(helmet.xssFilter()); // X-XSS-Protection
app.use(helmet.frameguard()); // X-Frame-Options
app.use(helmet.noSniff()); // X-Content-Type-Options
```

### Custom Security Headers
```typescript
app.use((req, res, next) => {
  res.setHeader('X-Content-Type-Options', 'nosniff');
  res.setHeader('X-Frame-Options', 'DENY');
  res.setHeader('X-XSS-Protection', '1; mode=block');
  res.setHeader('Strict-Transport-Security', 'max-age=31536000; includeSubDomains');
  res.setHeader('Content-Security-Policy', "default-src 'self'");
  next();
});
```

## 📋 Input Validation

### Zod Validation
```typescript
import { z } from 'zod';

const userSchema = z.object({
  email: z.string().email(),
  password: z.string().min(8),
  age: z.number().min(18),
});

function validateUser(data: unknown) {
  return userSchema.parse(data);
}
```

### Joi Validation
```typescript
import Joi from 'joi';

const userSchema = Joi.object({
  email: Joi.string().email().required(),
  password: Joi.string().min(8).required(),
  age: Joi.number().min(18).required(),
});

function validateUser(data: unknown) {
  return userSchema.validate(data);
}
```

### Sanitization
```typescript
import validator from 'validator';

function sanitizeInput(input: string) {
  return validator.escape(input);
}
```

## 📋 Authentication & Authorization

### JWT (JSON Web Tokens)
```typescript
import jwt from 'jsonwebtoken';

function generateToken(payload: object) {
  return jwt.sign(payload, process.env.JWT_SECRET, { expiresIn: '1h' });
}

function verifyToken(token: string) {
  return jwt.verify(token, process.env.JWT_SECRET);
}
```

### OAuth 2.0
```typescript
// LINE Login OAuth
const LINE_LOGIN_URL = 'https://access.line.me/oauth2/v2.1/authorize';

function getLineLoginURL() {
  const params = new URLSearchParams({
    response_type: 'code',
    client_id: process.env.LINE_CLIENT_ID,
    redirect_uri: process.env.LINE_REDIRECT_URI,
    state: generateState(),
    scope: 'profile openid email',
  });

  return `${LINE_LOGIN_URL}?${params.toString()}`;
}
```

### Role-Based Access Control (RBAC)
```typescript
interface User {
  id: string;
  role: 'admin' | 'user' | 'guest';
}

function checkPermission(user: User, permission: string) {
  const permissions = {
    admin: ['read', 'write', 'delete'],
    user: ['read', 'write'],
    guest: ['read'],
  };

  return permissions[user.role].includes(permission);
}
```

## 📋 API Security

### Rate Limiting
```typescript
import rateLimit from 'express-rate-limit';

const limiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 100, // limit each IP to 100 requests per windowMs
});

app.use('/api/', limiter);
```

### API Key Validation
```typescript
function validateAPIKey(req: Request, res: Response, next: NextFunction) {
  const apiKey = req.headers['x-api-key'];
  if (!apiKey || apiKey !== process.env.API_KEY) {
    return res.status(401).json({ error: 'Invalid API key' });
  }
  next();
}
```

### Request Validation
```typescript
function validateRequest(schema: z.ZodSchema) {
  return (req: Request, res: Response, next: NextFunction) => {
    try {
      schema.parse(req.body);
      next();
    } catch (error) {
      res.status(400).json({ error: 'Invalid request data' });
    }
  };
}
```

## 📋 Environment Security

### Environment Variables
```typescript
// .env.example
API_URL=https://api.example.com
JWT_SECRET=your-secret-key
LINE_CLIENT_ID=your-client-id

// Load environment variables
import dotenv from 'dotenv';
dotenv.config();
```

### Secrets Management
```typescript
// Use environment variables ไม่ใช้ hardcoded secrets
const API_KEY = process.env.API_KEY;
const JWT_SECRET = process.env.JWT_SECRET;
```

### Secure Configuration
```typescript
// Disable console.log in production
if (process.env.NODE_ENV === 'production') {
  console.log = () => {};
  console.error = () => {};
  console.warn = () => {};
}
```

## 📋 Security Best Practices

### DOs
- ✅ ใช้ DOMPurify สำหรับ sanitize HTML
- ✅ ใช้ CSP สำหรับ prevent XSS
- ✅ ใช้ CSRF tokens สำหรับ prevent CSRF
- ✅ ใช้ security headers (Helmet.js)
- ✅ ใช้ input validation (Zod, Joi)
- ✅ ใช้ JWT สำหรับ authentication
- ✅ ใช้ rate limiting สำหรับ API
- ✅ ใช้ environment variables สำหรับ secrets
- ✅ ใช้ HTTPS สำหรับ all communications
- ✅ ใช้ secure cookies (HttpOnly, Secure, SameSite)

### DON'Ts
- ❌ ไม่ใช้ dangerouslySetInnerHTML โดยไม่ sanitize
- ❌ ไม่ใช้ eval() หรือ Function() constructor
- ❌ ไม่ใช้ inline event handlers
- ❌ ไม่ใช้ hardcoded secrets
- ❌ ไม่ใช้ insecure cookies
- ❌ ไม่ใช้ unvalidated input
- ❌ ไม่ใช้ insecure APIs
- ❌ ไม่ใช้ outdated dependencies
- ❌ ไม่ใช้ console.log ใน production
- ❌ ไม่ใช้ error messages ที่ reveal sensitive information

---
*Security (Advanced) - Reference ของ Stella*
