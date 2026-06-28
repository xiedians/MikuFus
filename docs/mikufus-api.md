# MikuFus API Specification

> REST API Specification for MikuFus

---

# 目录

* API 版本
* Base URL
* 认证方式
* 请求规范
* 响应规范
* 错误码
* 分页规范
* 排序规范
* 时间格式
* 用户认证
* 用户接口
* 文件接口
* 帖子接口
* 评论接口
* 点赞接口
* 收藏接口
* 通知接口
* 后台接口
* HTTP 状态码
* API 设计规范

---

# API Version

当前版本：

```text
v1
```

API 前缀：

```text
/api/v1
```

示例：

```text
GET /api/v1/posts
```

未来版本：

```text
/api/v2
```

---

# Base URL

开发环境

```text
http://localhost:8080/api/v1
```

生产环境

```text
https://api.example.com/api/v1
```

---

# Authentication

采用 JWT Bearer Token。

请求头：

```http
Authorization: Bearer <access_token>
```

未登录接口无需携带 Token。

---

# Request

## Content-Type

JSON 请求：

```http
Content-Type: application/json
```

文件上传：

```http
Content-Type: multipart/form-data
```

---

# Response

所有接口统一返回 JSON。

成功：

```json
{
  "code": 0,
  "message": "success",
  "data": {}
}
```

失败：

```json
{
  "code": 10001,
  "message": "user not found"
}
```

字段说明：

| 字段      | 类型      | 说明    |
| ------- | ------- | ----- |
| code    | integer | 业务状态码 |
| message | string  | 提示信息  |
| data    | object  | 返回数据  |

---

# Error Codes

## Common

| Code  | Description        |
| ----- | ------------------ |
| 0     | Success            |
| 10000 | Unknown Error      |
| 10001 | Unauthorized       |
| 10002 | Forbidden          |
| 10003 | Invalid Token      |
| 10004 | Validation Failed  |
| 10005 | Resource Not Found |

## User

| Code  | Description     |
| ----- | --------------- |
| 20001 | User Not Found  |
| 20002 | Username Exists |
| 20003 | Email Exists    |
| 20004 | Wrong Password  |

## Post

| Code  | Description       |
| ----- | ----------------- |
| 30001 | Post Not Found    |
| 30002 | Permission Denied |

## Comment

| Code  | Description       |
| ----- | ----------------- |
| 40001 | Comment Not Found |

## File

| Code  | Description           |
| ----- | --------------------- |
| 50001 | Upload Failed         |
| 50002 | File Too Large        |
| 50003 | Unsupported File Type |

---

# Pagination

统一分页参数：

```text
?page=1&page_size=20
```

返回格式：

```json
{
  "list": [],
  "total": 120,
  "page": 1,
  "page_size": 20
}
```

---

# Sorting

统一排序参数：

```text
?sort=created_at
```

降序：

```text
?sort=-created_at
```

支持：

* created_at
* updated_at
* like_count
* comment_count

---

# Time Format

所有时间统一采用：

```text
ISO 8601 (UTC)
```

例如：

```text
2026-06-27T12:30:45Z
```

---

# Authentication APIs

## Register

```http
POST /auth/register
```

## Login

```http
POST /auth/login
```

## Refresh Token

```http
POST /auth/refresh
```

## Logout

```http
POST /auth/logout
```

---

# User APIs

## Current User

```http
GET /users/me
```

## User Detail

```http
GET /users/{id}
```

## Update Profile

```http
PATCH /users/me
```

## User Posts

```http
GET /users/{id}/posts
```

---

# File APIs

## Upload

```http
POST /files
```

## Delete

```http
DELETE /files/{id}
```

## Detail

```http
GET /files/{id}
```

---

# Post APIs

## List

```http
GET /posts
```

## Detail

```http
GET /posts/{id}
```

## Create

```http
POST /posts
```

## Update

```http
PATCH /posts/{id}
```

## Delete

```http
DELETE /posts/{id}
```

---

# Comment APIs

## List

```http
GET /posts/{id}/comments
```

## Create

```http
POST /posts/{id}/comments
```

## Delete

```http
DELETE /comments/{id}
```

---

# Like APIs

点赞：

```http
POST /posts/{id}/like
```

取消点赞：

```http
DELETE /posts/{id}/like
```

---

# Favorite APIs

收藏：

```http
POST /posts/{id}/favorite
```

取消收藏：

```http
DELETE /posts/{id}/favorite
```

---

# Notification APIs

通知列表：

```http
GET /notifications
```

标记已读：

```http
PATCH /notifications/{id}/read
```

全部已读：

```http
PATCH /notifications/read-all
```

---

# Admin APIs

用户列表：

```http
GET /admin/users
```

删除帖子：

```http
DELETE /admin/posts/{id}
```

删除评论：

```http
DELETE /admin/comments/{id}
```

举报列表：

```http
GET /admin/reports
```

处理举报：

```http
PATCH /admin/reports/{id}
```

---

# HTTP Status Codes

| Status | Description           |
| ------ | --------------------- |
| 200    | OK                    |
| 201    | Created               |
| 204    | No Content            |
| 400    | Bad Request           |
| 401    | Unauthorized          |
| 403    | Forbidden             |
| 404    | Not Found             |
| 409    | Conflict              |
| 422    | Unprocessable Entity  |
| 429    | Too Many Requests     |
| 500    | Internal Server Error |

---

# API Design Guidelines

## RESTful

API 应以资源（Resource）为中心进行设计。

正确：

```text
GET /posts
POST /posts
GET /posts/{id}
PATCH /posts/{id}
DELETE /posts/{id}
```

避免：

```text
POST /createPost
POST /deletePost
GET /getPost
```

---

## URL Naming

统一使用：

* 小写
* 复数资源名
* 短横线（kebab-case）

例如：

```text
/user-profiles
/post-comments
```

---

## HTTP Methods

| Method | Description |
| ------ | ----------- |
| GET    | 查询资源        |
| POST   | 创建资源        |
| PATCH  | 更新资源        |
| DELETE | 删除资源        |

---

## JSON Naming

统一采用：

```text
snake_case
```

例如：

```json
{
  "user_id": 1,
  "created_at": "2026-06-27T12:00:00Z",
  "avatar_url": "/avatar.png"
}
```

---

## Empty Response

删除等无返回内容的接口：

```http
204 No Content
```

---

## Idempotency

* GET：幂等
* DELETE：幂等
* PATCH：尽量保持幂等
* POST：非幂等

---

## Versioning

API 版本通过 URL 管理：

```text
/api/v1
/api/v2
```

避免在 Header 中维护版本。

---

## Compatibility

* 不随意删除字段
* 不修改字段含义
* 新增字段保持向后兼容
* 废弃接口保留一个完整版本周期

---

# Future APIs

计划支持：

* WebSocket
* OAuth Login
* OpenAPI
* RSS Feed
* Search API
* Recommendation API
* Public API Key
* Webhook

---

# License

本规范适用于 MikuFus 所有 REST API。

新增接口应遵循本规范，保持统一的设计风格与兼容性。
