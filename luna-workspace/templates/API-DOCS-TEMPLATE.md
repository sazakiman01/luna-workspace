# API Documentation Template

> **Template สำหรับเขียน API Documentation ตามหลักสากล (REST API, OpenAPI 3.0 standards)**
> 
> ใช้สำหรับ: Go + Fiber v2, RESTful API, JWT Authentication
> 
> วิธีใช้: Copy template นี้ไปใช้ใน project แล้วเติมข้อมูลตาม placeholders

---

## Table of Contents

- [Overview](#overview)
- [Authentication](#authentication)
- [Base URL & Environment](#base-url--environment)
- [API Endpoints](#api-endpoints)
- [Error Codes](#error-codes)
- [Rate Limiting](#rate-limiting)
- [Examples](#examples)
- [Best Practices](#best-practices)

---

## Overview

### API Information

- **API Name:** [API Name]
- **Version:** [1.0]
- **Base Path:** `/api/v1`
- **Description:** [Brief description of what this API does]
- **Contact:** 
  - Name: [Contact Name]
  - Email: [contact@example.com]

### Features

- [Feature 1]
- [Feature 2]
- [Feature 3]

### Technology Stack

- **Framework:** Fiber v2 (Go)
- **Database:** PostgreSQL / MongoDB
- **Authentication:** JWT / OAuth2
- **Documentation:** Swagger/OpenAPI 3.0

---

## Authentication

### JWT Authentication

This API uses JWT (JSON Web Token) for authentication.

#### How to Obtain Token

**Endpoint:** `POST /api/v1/auth/login`

**Request:**
```json
{
  "username": "your_username",
  "password": "your_password"
}
```

**Response:**
```json
{
  "success": true,
  "statusCode": 200,
  "data": {
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
    "expiresIn": 3600
  }
}
```

#### Using the Token

Include the JWT token in the `Authorization` header:

```bash
Authorization: Bearer {token}
```

**Example:**
```bash
curl -X GET https://api.example.com/api/v1/users \
  -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
```

#### Token Refresh

**Endpoint:** `POST /api/v1/auth/refresh`

**Request:**
```json
{
  "refreshToken": "your_refresh_token"
}
```

**Response:**
```json
{
  "success": true,
  "statusCode": 200,
  "data": {
    "token": "new_jwt_token",
    "expiresIn": 3600
  }
}
```

### OAuth2 (Optional)

If using OAuth2:

**Scopes:**
- `read` - Read access
- `write` - Write access
- `admin` - Admin access

**Authorization Flow:**
1. Redirect user to authorization endpoint
2. User grants permission
3. Receive authorization code
4. Exchange code for access token

---

## Base URL & Environment

### Environments

| Environment | Base URL | Description |
|-------------|----------|-------------|
| **Development** | `http://localhost:8080` | Local development |
| **Staging** | `https://staging-api.example.com` | Staging environment |
| **Production** | `https://api.example.com` | Production environment |

### Environment Variables

Required environment variables:

```bash
# Database
DB_HOST=localhost
DB_PORT=5432
DB_NAME=pmam_db
DB_USER=postgres
DB_PASSWORD=your_password

# JWT
JWT_SECRET=your_hex_encoded_secret_here
JWT_EXPIRATION_HOUR=24

# Server
SERVER_PORT=8080
SERVER_HOST=localhost

# Rate Limiting
RATE_LIMIT_ENABLED=true
RATE_LIMIT_MAX=100
RATE_LIMIT_EXPIRATION_SECOND=60
```

---

## API Endpoints

### Template for Each Endpoint

#### [METHOD] /path/to/endpoint

**Description:** [Brief description of what this endpoint does]

**Authentication:** `Required` / `Optional` / `None`

**Request Parameters:**

**Query Parameters:**
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `param1` | string | Yes | Description of param1 |
| `param2` | integer | No | Description of param2 |

**Path Parameters:**
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `id` | string | Yes | Resource ID |

**Request Body:**
```json
{
  "field1": "value1",
  "field2": 123,
  "field3": {
    "nestedField": "nestedValue"
  }
}
```

**Response:**

**Success (200 OK):**
```json
{
  "success": true,
  "statusCode": 200,
  "data": {
    "id": "123",
    "field1": "value1",
    "field2": 123,
    "createdAt": "2026-05-05T10:00:00Z",
    "updatedAt": "2026-05-05T10:00:00Z"
  }
}
```

**Error (400 Bad Request):**
```json
{
  "success": false,
  "statusCode": 400,
  "message": "Invalid request body",
  "errors": [
    {
      "field": "field1",
      "message": "field1 is required"
    }
  ]
}
```

**Example:**

```bash
# cURL
curl -X POST https://api.example.com/api/v1/users \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer {token}" \
  -d '{
    "field1": "value1",
    "field2": 123
  }'

# JavaScript/Fetch
fetch('https://api.example.com/api/v1/users', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer {token}'
  },
  body: JSON.stringify({
    field1: 'value1',
    field2: 123
  })
})
.then(response => response.json())
.then(data => console.log(data));
```

---

### Example Endpoints (Replace with actual endpoints)

#### Authentication

##### POST /api/v1/auth/login
Login user and return JWT token

##### POST /api/v1/auth/logout
Logout user and invalidate token

##### POST /api/v1/auth/refresh
Refresh JWT token

#### Users

##### GET /api/v1/users
Get all users (with pagination)

##### GET /api/v1/users/:id
Get user by ID

##### POST /api/v1/users
Create new user

##### PUT /api/v1/users/:id
Update user by ID

##### DELETE /api/v1/users/:id
Delete user by ID

#### [Other Resources]

##### GET /api/v1/[resource]
Get all [resource]

##### GET /api/v1/[resource]/:id
Get [resource] by ID

##### POST /api/v1/[resource]
Create new [resource]

##### PUT /api/v1/[resource]/:id
Update [resource] by ID

##### DELETE /api/v1/[resource]/:id
Delete [resource] by ID

---

## Error Codes

### HTTP Status Codes

| Code | Name | Description |
|------|------|-------------|
| 200 | OK | Request successful |
| 201 | Created | Resource created successfully |
| 204 | No Content | Request successful, no content returned |
| 400 | Bad Request | Invalid request parameters or body |
| 401 | Unauthorized | Authentication required or invalid token |
| 403 | Forbidden | User does not have permission |
| 404 | Not Found | Resource not found |
| 409 | Conflict | Resource already exists or conflict |
| 422 | Unprocessable Entity | Validation error |
| 429 | Too Many Requests | Rate limit exceeded |
| 500 | Internal Server Error | Server error |
| 503 | Service Unavailable | Service temporarily unavailable |

### Error Response Format

All error responses follow this format:

```json
{
  "success": false,
  "statusCode": 400,
  "message": "Error message",
  "errors": [
    {
      "field": "fieldName",
      "message": "Specific error message for this field"
    }
  ]
}
```

### Common Error Scenarios

#### 400 Bad Request
- Invalid JSON format
- Missing required fields
- Invalid data types

#### 401 Unauthorized
- Missing or invalid JWT token
- Token expired
- Invalid credentials

#### 403 Forbidden
- User does not have required role/permission
- Resource access denied

#### 404 Not Found
- Resource ID does not exist
- Endpoint not found

#### 409 Conflict
- Duplicate resource (e.g., email already exists)
- Version conflict

#### 429 Too Many Requests
- Rate limit exceeded
- Wait before retrying

#### 500 Internal Server Error
- Unexpected server error
- Database connection error
- External service error

---

## Rate Limiting

### Default Limits

| Endpoint | Requests | Time Window |
|----------|----------|-------------|
| All endpoints | 100 | 60 seconds |
| Auth endpoints | 10 | 60 seconds |

### Rate Limit Headers

Each response includes rate limit headers:

```
X-RateLimit-Limit: 100
X-RateLimit-Remaining: 95
X-RateLimit-Reset: 1714905600
```

### Handling Rate Limit Errors

When rate limit is exceeded (429):

```json
{
  "success": false,
  "statusCode": 429,
  "message": "Rate limit exceeded",
  "data": {
    "retryAfter": 30
  }
}
```

**Best Practice:** Implement exponential backoff when receiving 429 errors.

---

## Examples

### cURL Examples

#### Login
```bash
curl -X POST http://localhost:8080/api/v1/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "username": "admin",
    "password": "password123"
  }'
```

#### Get Users
```bash
curl -X GET http://localhost:8080/api/v1/users \
  -H "Authorization: Bearer {token}" \
  -G \
  -d "page=1" \
  -d "limit=10"
```

#### Create User
```bash
curl -X POST http://localhost:8080/api/v1/users \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer {token}" \
  -d '{
    "username": "newuser",
    "email": "newuser@example.com",
    "password": "password123"
  }'
```

### JavaScript/Fetch Examples

#### Login
```javascript
fetch('http://localhost:8080/api/v1/auth/login', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    username: 'admin',
    password: 'password123'
  })
})
.then(response => response.json())
.then(data => {
  console.log('Token:', data.data.token);
  // Store token for future requests
  localStorage.setItem('token', data.data.token);
});
```

#### Authenticated Request
```javascript
const token = localStorage.getItem('token');

fetch('http://localhost:8080/api/v1/users', {
  method: 'GET',
  headers: {
    'Authorization': `Bearer ${token}`
  }
})
.then(response => response.json())
.then(data => console.log(data));
```

### Postman Collection

Export Postman collection as JSON and include here or provide link to repository.

---

## Best Practices

### Security

1. **Always use HTTPS** in production
2. **Never hardcode credentials** in code
3. **Validate all input** on both client and server
4. **Use environment variables** for sensitive data
5. **Implement rate limiting** to prevent abuse
6. **Rotate JWT secrets** regularly
7. **Use short token expiration** with refresh tokens

### Performance

1. **Use pagination** for list endpoints
2. **Implement caching** for frequently accessed data
3. **Use connection pooling** for database
4. **Optimize database queries** with indexes
5. **Compress responses** when appropriate

### Error Handling

1. **Always check HTTP status codes**
2. **Implement retry logic** for transient errors
3. **Log errors** on server side
4. **Provide meaningful error messages** to users
5. **Never expose sensitive information** in error messages

### API Usage

1. **Use appropriate HTTP methods** (GET, POST, PUT, DELETE)
2. **Follow RESTful conventions** for resource naming
3. **Version your API** (e.g., /api/v1)
4. **Include timestamps** in responses (createdAt, updatedAt)
5. **Use consistent response formats**
6. **Document all endpoints** with examples

---

## Additional Resources

- **Swagger UI:** [Link to Swagger UI if available]
- **Postman Collection:** [Link to Postman collection]
- **GitHub Repository:** [Link to repository]
- **Support Email:** [support@example.com]

---

## Changelog

### Version 1.0 (2026-05-05)
- Initial API documentation
- Base endpoints for authentication and user management

---

*Last Updated: [Date]*
