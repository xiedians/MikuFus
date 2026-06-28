# MikuFus

> 类 Bilibili 二次元内容社区 · Go + Vue 全栈实战项目

## 项目简介

MikuFus 是一个面向 ACG（Anime、Comic、Game）内容创作者与爱好者的内容分享社区。

项目灵感来源于一个问题：

> 如果将 Bilibili 的内容生产能力，与传统论坛的社区交流模式结合，会是什么样？

MikuFus 希望实现一个轻量级社区平台，支持图文、视频等内容发布，并围绕兴趣建立社区互动。

本项目也是我的第一个完整全栈实践项目，用于学习和实践：

* Go Web 开发
* Vue 前后端分离
* PostgreSQL 数据库设计
* Redis 缓存
* MinIO 对象存储
* Docker 容器化开发与部署

---

# 功能规划

## 当前版本

* 用户注册 / 登录
* 用户个人主页
* 图文内容发布
* 内容推荐流
* 评论与点赞
* 后台内容审核

## 后续计划

* 视频投稿
* 兴趣频道
* 收藏与关注
* 消息通知

---

# 技术栈

## Frontend

| Module | Technology              |
| ------ | ----------------------- |
| Client | Vue 3 + Vite + UnoCSS   |
| Admin  | Vue 3 + Vite + Naive UI |

## Backend

| Module         | Technology |
| -------------- | ---------- |
| Language       | Go         |
| Framework      | Gin        |
| Database       | PostgreSQL |
| Cache          | Redis      |
| Authentication | JWT        |

## Infrastructure

| Module         | Technology              |
| -------------- | ----------------------- |
| Object Storage | MinIO                   |
| Container      | Docker & Docker Compose |

---

# 项目结构

```text
MikuFus/
├── go-service/
├── vue-client/
├── vue-admin/
├── shared/
├── docs/
└── README.md
```

---

# 开发环境

开发环境采用 Docker Compose 统一管理。

包括：

* Go Service
* Vue Client
* Vue Admin
* PostgreSQL
* Redis
* MinIO

所有服务运行在同一个 Docker Network 中。

---

# 快速开始

## 1. 克隆仓库

```bash
git clone https://github.com/xiedians/MikuFus.git

cd MikuFus
```

---

## 2. 启动  postgre minio redis

相关内容参考[开发环境文档](docs/mikufus-env.md)

---

## 3. 启动 Go Service

………

## 4. 启动 Vue Client

………

## 5. 启动 Vue Admin

………

# 相关文档

## mikufus 相关文档

* [API 文档](docs/mikufus-api.md)
* [环境变量文档](docs/mikufus-env.md)
* [数据库迁移文档](docs/mikufus-db.md)

## mikufus 服务文档

* [Go Service 文档](go-service/README.md)
* [Vue Client 文档](vue-client/README.md)
* [Vue Admin 文档](vue-admin/README.md)
