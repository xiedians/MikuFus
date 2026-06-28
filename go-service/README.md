# MikuFus Go Service

> Backend service for MikuFus.

## Overview

`go-service` 是 MikuFus 的后端服务，负责提供 REST API、用户认证、业务逻辑、数据库访问以及文件管理等功能。

本项目使用 **Gin** 作为 Web 框架，采用简单的三层架构（Handler → Service → Repository），便于学习、维护和后续扩展。

---

# Tech Stack

| Component      | Technology     |
| -------------- | -------------- |
| Language       | Go 1.24+       |
| Web Framework  | Gin            |
| ORM            | GORM           |
| Database       | PostgreSQL     |
| Cache          | Redis          |
| Object Storage | MinIO          |
| Authentication | JWT            |
| Container      | Docker Compose |

---

# Project Structure

```text
go-service/
├── cmd/
│   └── server/
│       └── main.go          # 程序入口
│
├── configs/                 # 配置文件
│
├── internal/
│   ├── config/              # 配置加载
│   ├── router/              # Gin 路由
│   ├── middleware/          # 中间件
│   ├── handler/             # HTTP Handler
│   ├── service/             # 业务逻辑
│   ├── repository/          # 数据访问
│   ├── model/               # 数据模型
│   ├── dto/                 # 请求/响应对象
│   ├── response/            # 统一响应
│   ├── auth/                # JWT
│   └── storage/             # MinIO
│
├── migrations/              # 数据库迁移
│
├── pkg/                     # 公共工具
│
├── go.mod
└── README.md
```

---

# Architecture

```text
             HTTP Request
                   │
                   ▼
              Gin Router
                   │
                   ▼
              Middleware
                   │
                   ▼
               Handler
                   │
                   ▼
               Service
                   │
                   ▼
             Repository
                   │
             GORM Database
                   │
             PostgreSQL
```

说明：

* **Router**：注册所有 API。
* **Handler**：处理 HTTP 请求和响应。
* **Service**：编写业务逻辑。
* **Repository**：负责数据库操作。
* **Model**：数据库模型。

业务逻辑应尽量放在 Service 中，而不是 Handler。

---

# Development

## Requirements

* Go 1.24+
* Docker
* PostgreSQL
* Redis
* MinIO

---

## Install

```bash
go mod tidy
```

---

## Run

```bash
go run ./cmd/server
```

---

## Build

```bash
go build -o bin/server ./cmd/server
```

---

# Configuration

所有配置通过环境变量加载。

示例：

```env
APP_ENV=development

HTTP_HOST=0.0.0.0
HTTP_PORT=8080

POSTGRES_HOST=postgres
POSTGRES_PORT=5432
POSTGRES_USER=postgres
POSTGRES_PASSWORD=password
POSTGRES_DB=mikufus

REDIS_HOST=redis
REDIS_PORT=6379

MINIO_ENDPOINT=minio:9000
MINIO_ACCESS_KEY=minioadmin
MINIO_SECRET_KEY=minioadmin
```

---

# API

API 默认前缀：

```text
/api/v1
```

接口规范请参考：

```text
docs/mikufus-api.md
```

---

# Development Guide

建议按照以下顺序开发一个新功能：

```text
Model
   ↓
Repository
   ↓
Service
   ↓
Handler
   ↓
Router
```

例如新增 **Post** 模块：

```text
model/post.go

↓

repository/post_repository.go

↓

service/post_service.go

↓

handler/post_handler.go

↓

router/post.go
```

这样每个模块职责清晰，不容易混乱。

---

# Coding Style

* 一个文件只负责一个主要职责。
* Handler 不处理业务逻辑。
* Repository 不处理 HTTP 请求。
* Service 不直接返回 Gin Context。
* 所有数据库操作统一放在 Repository。
* 所有 API 返回统一 JSON 格式。

---

# Future

计划逐步增加：

* Redis Cache
* 文件上传
* WebSocket
* 限流
* OpenAPI
* 定时任务
* 消息队列

随着项目规模增长，再考虑拆分服务或引入更复杂的架构。

---

# License

Part of the MikuFus project.
