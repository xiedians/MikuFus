# MikuFus API Design

> Version: v0.1
> Base URL: `/api/v1`

## API Design Principles

* RESTful API
* JSON Request / Response
* UTF-8 Encoding
* JWT Bearer Authentication
* Unified Response Format

---

# Response Format

## Success

```json
{
  "code": 0,
  "message": "success",
  "data": {}
}
```

## Error

```json
{
  "code": 10001,
  "message": "error message",
  "data": null
}
```

---

# Authentication

## Register

```
POST /auth/register
```

### Request

```json
{
  "username": "miku",
  "email": "miku@example.com",
  "password": "123456"
}
```

### Response

```json
{
  "code": 0,
  "message": "success",
  "data": {
    "id": 1
  }
}
```

---

## Login

```
POST /auth/login
```

### Request

```json
{
  "email": "miku@example.com",
  "password": "123456"
}
```

### Response

```json
{
  "code": 0,
  "message": "success",
  "data": {
    "token": "<jwt-token>",
    "expires_in": 86400
  }
}
```

---

# User

## Current User

```
GET /users/me
```

Header

```
Authorization: Bearer <JWT Token>
```

Response

```json
{
  "code": 0,
  "message": "success",
  "data": {
    "id": 1,
    "username": "miku",
    "email": "miku@example.com",
    "avatar_url": null,
    "role": "user"
  }
}
```

---

# Planned APIs

以下接口将在后续版本逐步设计：

## User

* GET /users/{id}
* PUT /users/me

## Post

* POST /posts
* GET /posts
* GET /posts/{id}

## Comment

* POST /posts/{id}/comments
* GET /posts/{id}/comments

## Admin

* GET /admin/posts
* PUT /admin/posts/{id}/approve

> 仅记录接口名称，详细设计将在开发对应模块时补充。
