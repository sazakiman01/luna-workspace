---
description: Integration Specialist skill สำหรับ Aurora รวม LINE API, Payment integration, Third-party API integration, API design, error handling, และ security
---

# Aurora Skill - Integration Specialist

## 🎯 Purpose

Integration Specialist skill สำหรับ Aurora รวม LINE API, Payment integration, Third-party API integration, API design, error handling, และ security

## 📋 Core Competencies

### LINE API Integration
- **LINE Login:** OAuth 2.0, OpenID Connect
- **LINE Messaging API:** Webhooks, Messages, Templates
- **LINE Pay:** Payment integration, Refunds
- **LINE LIFF:** LIFF v2, LIFF API
- **LINE Frontend Framework:** LIFF, Flex Message

### Payment Integration
- **Payment Gateways:** Stripe, PayPal, Omise
- **LINE Pay:** LINE Pay API, Webhooks
- **Credit Cards:** Tokenization, 3D Secure
- **Digital Wallets:** LINE Pay, PromptPay
- **Refunds:** Refund API, Dispute handling

### Third-party API Integration
- **REST APIs:** HTTP clients, Request handling
- **Webhooks:** Webhook handling, Signature verification
- **Rate Limiting:** Rate limit handling, Backoff strategies
- **Error Handling:** Retry logic, Circuit breakers
- **Security:** API keys, OAuth, Encryption

## 🎯 LINE API Integration

### LINE Login
```typescript
// LINE Login configuration
interface LINELoginConfig {
  channelId: string;
  channelSecret: string;
  redirectUri: string;
  scope: string[];
}
```

### LINE Messaging API
```typescript
// LINE Messaging API
interface MessagingAPI {
  webhook: WebhookHandler;
  messages: MessageAPI;
  templates: TemplateAPI;
  flex: FlexMessageAPI;
}
```

### LINE LIFF
```typescript
// LIFF configuration
interface LIFFConfig {
  liffId: string;
  view: LIFFView;
  features: LIFFFeatures;
}
```

## 🎯 Payment Integration

### Stripe Integration
```typescript
// Stripe configuration
interface StripeConfig {
  publicKey: string;
  secretKey: string;
  webhookSecret: string;
}
```

### LINE Pay Integration
```typescript
// LINE Pay configuration
interface LINEPayConfig {
  channelId: string;
  channelSecret: string;
  apiEndpoint: string;
}
```

### Payment Processing
```typescript
// Payment processing
interface PaymentProcessing {
  createPayment: PaymentRequest;
  confirmPayment: PaymentConfirmation;
  refundPayment: RefundRequest;
  handleWebhook: WebhookHandler;
}
```

## 🎯 Third-party API Integration

### REST API Client
```typescript
// REST API client
interface RESTClient {
  baseURL: string;
  headers: Headers;
  timeout: number;
  retry: RetryConfig;
}
```

### Webhook Handling
```typescript
// Webhook handler
interface WebhookHandler {
  verifySignature: (signature: string, payload: string) => boolean;
  handleEvent: (event: WebhookEvent) => void;
  retry: RetryConfig;
}
```

### Rate Limiting
```typescript
// Rate limiting
interface RateLimiter {
  limit: number;
  window: number;
  strategy: 'token-bucket' | 'sliding-window';
  backoff: BackoffStrategy;
}
```

## 🎯 Error Handling

### Retry Logic
```typescript
// Retry configuration
interface RetryConfig {
  maxRetries: number;
  backoff: 'exponential' | 'linear' | 'fixed';
  initialDelay: number;
  maxDelay: number;
}
```

### Circuit Breaker
```typescript
// Circuit breaker
interface CircuitBreaker {
  threshold: number;
  timeout: number;
  fallback: () => any;
}
```

### Error Response
```typescript
// Error response
interface ErrorResponse {
  code: string;
  message: string;
  details: any;
  timestamp: Date;
}
```

## 🎯 Security

### API Security
```typescript
// API security
interface APISecurity {
  authentication: 'jwt' | 'oauth2' | 'api-key';
  encryption: EncryptionConfig;
  rateLimiting: RateLimitConfig;
  ipWhitelist: string[];
}
```

### Webhook Security
```typescript
// Webhook security
interface WebhookSecurity {
  signatureVerification: boolean;
  encryption: boolean;
  ipWhitelist: string[];
}
```

## 🎯 Best Practices

### DOs
- ✅ Use secure authentication
- ✅ Validate input
- ✅ Handle errors gracefully
- ✅ Implement retry logic
- ✅ Use circuit breakers
- ✅ Monitor integrations
- ✅ Log all requests
- ✅ Test integrations
- ✅ Document APIs
- ✅ Handle rate limits

### DON'Ts
- ❌ Don't hardcode secrets
- ❌ Don't ignore errors
- ❌ Don't skip validation
- ❌ Don't skip security
- ❌ Don't skip monitoring
- ❌ Don't skip logging
- ❌ Don't skip testing
- ❌ Don't skip documentation
- ❌ Don't ignore rate limits
- ❌ Don't ignore webhooks

## 🎯 When to Use This Skill

เรียกใช้เมื่อ:
- Integrating LINE APIs
- Integrating payment gateways
- Integrating third-party APIs
- Designing APIs
- Handling webhooks
- Implementing security

## 📝 Notes

- Aurora Skill ครอบคลุม LINE API, Payment integration, Third-party API integration, API design, error handling, security
- Focus บน external integrations แล API security
- ใช้ร่วมกับ cross-functional skills สำหรับ coordination

---
*Aurora Skill - Integration Specialist*
