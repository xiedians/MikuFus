# MikuFus Development Plan

> MikuFus 开发路线图（Roadmap）

## 目录

* [项目简介](#项目简介)
* [项目目标](#项目目标)
* [开发原则](#开发原则)
* [技术栈](#技术栈)
* [开发阶段](#开发阶段)
* [Milestone 1：基础设施](#milestone-1基础设施)
* [Milestone 2：用户认证](#milestone-2用户认证)
* [Milestone 3：文件存储](#milestone-3文件存储)
* [Milestone 4：内容系统](#milestone-4内容系统)
* [Milestone 5：社区互动](#milestone-5社区互动)
* [Milestone 6：用户中心](#milestone-6用户中心)
* [Milestone 7：搜索系统](#milestone-7搜索系统)
* [Milestone 8：通知系统](#milestone-8通知系统)
* [Milestone 9：后台管理](#milestone-9后台管理)
* [Milestone 10：优化与发布](#milestone-10优化与发布)

---

# 项目简介

MikuFus 是一个基于 **Go + Vue** 构建的现代 ACG 社区平台。

项目采用前后端分离架构，目标是在保证代码质量、可维护性和可扩展性的基础上，实现一个轻量、高性能的社区系统。

---

# 项目目标

## 功能目标

* 用户注册与登录
* 用户主页
* 图片上传
* 帖子发布
* 评论互动
* 点赞收藏
* 搜索功能
* 消息通知
* 后台管理

## 技术目标

* RESTful API
* Docker 开发环境
* PostgreSQL 数据存储
* Redis 缓存
* MinIO 对象存储
* JWT 身份认证
* 前后端完全分离

---

# 开发原则

## MVP 优先

优先实现核心业务功能，再逐步增加高级特性。

## 文档先行

所有模块开发前应完成设计文档。

## 接口优先

前后端通过 API 协同开发。

## 模块化

各模块保持低耦合、高内聚。

## 可维护

优先保证代码可读性，而不是过度优化。

---

# 技术栈

| 模块             | 技术             |
| -------------- | -------------- |
| Backend        | Go             |
| Frontend       | Vue 3          |
| Admin          | Vue 3          |
| Database       | PostgreSQL     |
| Cache          | Redis          |
| Storage        | MinIO          |
| Container      | Docker Compose |
| API            | RESTful        |
| Authentication | JWT            |

---

# 开发阶段

| Milestone | 内容   | 状态 |
| --------- | ---- | -- |
| 1         | 基础设施 | ⏳  |
| 2         | 用户认证 | ⏳  |
| 3         | 文件存储 | ⏳  |
| 4         | 内容系统 | ⏳  |
| 5         | 社区互动 | ⏳  |
| 6         | 用户中心 | ⏳  |
| 7         | 搜索系统 | ⏳  |
| 8         | 通知系统 | ⏳  |
| 9         | 后台管理 | ⏳  |
| 10        | 优化发布 | ⏳  |

---

# Milestone 1：基础设施

## 目标

完成开发环境与项目基础框架。

## Backend

* [ ] Go 项目初始化
* [ ] 配置管理
* [ ] 日志系统
* [ ] 路由初始化
* [ ] 中间件框架
* [ ] 错误处理
* [ ] 数据库连接
* [ ] Redis 连接
* [ ] MinIO 连接

## Database

* [ ] 初始化数据库
* [ ] 创建基础表
* [ ] Migration

## Docker

* [ ] PostgreSQL
* [ ] Redis
* [ ] MinIO
* [ ] Compose 配置

## Deliverables

* 项目能够正常启动
* 数据库连接正常
* Redis 可用
* MinIO 可用

---

# Milestone 2：用户认证

## 功能

### 用户

* [ ] 注册
* [ ] 登录
* [ ] 登出
* [ ] 修改密码

### Token

* [ ] JWT
* [ ] Refresh Token
* [ ] Token 刷新

### 权限

* [ ] 登录认证
* [ ] 权限中间件

### 用户信息

* [ ] 获取个人资料
* [ ] 修改个人资料

## Deliverables

完成完整用户认证系统。

---

# Milestone 3：文件存储

## 功能

### 图片上传

* [ ] 上传图片
* [ ] 删除图片
* [ ] 获取图片

### 用户头像

* [ ] 上传头像
* [ ] 修改头像

### MinIO

* [ ] Bucket 管理
* [ ] Object 管理

## Deliverables

完成统一文件服务。

---

# Milestone 4：内容系统

## 帖子

* [ ] 发布帖子
* [ ] 编辑帖子
* [ ] 删除帖子
* [ ] 浏览帖子
* [ ] 帖子详情

## Markdown

* [ ] Markdown 编辑
* [ ] 图片插入

## 标签

* [ ] 标签管理
* [ ] 分类

## Deliverables

完成帖子系统。

---

# Milestone 5：社区互动

## 评论

* [ ] 评论
* [ ] 回复
* [ ] 删除评论

## 点赞

* [ ] 点赞
* [ ] 取消点赞

## 收藏

* [ ] 收藏
* [ ] 取消收藏

## Deliverables

完成社区互动功能。

---

# Milestone 6：用户中心

## 用户主页

* [ ] 用户资料
* [ ] 发帖记录
* [ ] 评论记录

## 社交

* [ ] 关注
* [ ] 取消关注
* [ ] 粉丝列表
* [ ] 关注列表

## Deliverables

完成用户中心。

---

# Milestone 7：搜索系统

## 搜索

* [ ] 搜索帖子
* [ ] 搜索用户
* [ ] 搜索标签

## 排序

* [ ] 最新
* [ ] 最热
* [ ] 综合

## Deliverables

完成搜索模块。

---

# Milestone 8：通知系统

## 通知

* [ ] 评论通知
* [ ] 回复通知
* [ ] 点赞通知
* [ ] 系统通知

## Deliverables

完成站内通知。

---

# Milestone 9：后台管理

## 用户管理

* [ ] 用户列表
* [ ] 禁用用户
* [ ] 权限管理

## 内容管理

* [ ] 删除帖子
* [ ] 删除评论

## 举报

* [ ] 举报审核
* [ ] 举报处理

## Deliverables

完成后台管理系统。

---

# Milestone 10：优化与发布

## 性能

* [ ] Redis Cache
* [ ] SQL 优化
* [ ] 图片优化

## 安全

* [ ] 限流
* [ ] 防刷
* [ ] 请求校验

## 运维

* [ ] 日志
* [ ] Metrics
* [ ] Health Check

## 发布

* [ ] Release v1.0.0
* [ ] 完整文档
* [ ] CI/CD

## Deliverables

发布 MikuFus v1.0.0。

---

# 开发规范

## Git

采用 Git Flow。

* `main`
* `develop`
* `feature/*`
* `fix/*`
* `release/*`

---

## Commit

建议使用 Conventional Commits。

```text
feat: 新增功能
fix: 修复问题
docs: 文档更新
style: 格式调整
refactor: 重构
test: 测试
chore: 构建或工具修改
```

---

## 版本规划

| Version | 内容   |
| ------- | ---- |
| v0.1    | 基础框架 |
| v0.2    | 用户系统 |
| v0.3    | 文件系统 |
| v0.4    | 帖子系统 |
| v0.5    | 评论系统 |
| v0.6    | 用户中心 |
| v0.7    | 搜索   |
| v0.8    | 通知   |
| v0.9    | 后台   |
| v1.0    | 正式发布 |

---

# 长期规划

未来版本计划支持以下能力：

* WebSocket 实时通知
* 全文搜索
* 推荐算法
* 多媒体内容
* OAuth 登录
* 多语言支持
* PWA
* 移动端客户端
* OpenAPI
* 插件系统

---

# License

本开发计划会随着项目推进持续更新。
