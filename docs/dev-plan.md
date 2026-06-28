# MikuFus Development Plan

> Last Updated: 2026-06-27

## 文档说明

本文档用于记录当前开发计划。

原则：

* 只规划近期目标。
* 每完成一个阶段，再规划下一阶段。
* 文档与代码保持同步更新。

---

# Milestone 1 - Project Bootstrap

## Status

Completed

## Tasks

* [x] 创建项目仓库
* [x] 完成项目目录规划
* [x] 初始化 Go Module
* [x] PostgreSQL 开发环境
* [x] Redis 开发环境
* [x] MinIO 开发环境
* [x] users 表设计
* [x] 数据库连接测试
* [x] 编写测试接口（/users）
* [x] 完成项目 README
* [x] 完成开发文档

---

# Milestone 2 - Authentication

## Status

In Progress

## Goal

完成用户认证闭环。

## Tasks

* [ ] Gin 路由初始化
* [ ] 配置管理
* [ ] Repository 层
* [ ] Service 层
* [ ] Handler 层
* [ ] 用户注册
* [ ] 密码 bcrypt 加密
* [ ] 用户登录
* [ ] JWT Token 签发
* [ ] JWT 中间件
* [ ] 获取当前用户（GET /users/me）
* [ ] Postman 测试

### Done When

满足以下条件：

* 用户可以注册
* 用户可以登录
* 返回 JWT Token
* Token 可以访问受保护接口
* 密码以 bcrypt Hash 存储

---

# Milestone 3 - Post

## Status

Planned

## Goal

实现社区内容发布。

## Tasks

* [ ] posts 表
* [ ] 发布内容
* [ ] 获取内容列表
* [ ] 获取内容详情
* [ ] MinIO 图片上传

---

# Milestone 4 - Community

## Status

Planned

## Goal

实现基础社区互动。

## Tasks

* [ ] comments 表
* [ ] 评论
* [ ] 点赞
* [ ] 收藏

---

# Milestone 5 - Administration

## Status

Planned

## Goal

实现管理员后台基础能力。

## Tasks

* [ ] 内容审核
* [ ] 用户管理
* [ ] 举报处理

---

# Current Focus

当前开发重点：

```
Environment
        │
        ▼
Authentication
        │
        ▼
Post
        │
        ▼
Comment
        │
        ▼
Administration
```

当前不开发：

* 推荐算法
* 频道系统
* 消息通知
* 视频播放
* 合集

待核心功能稳定后，再进入下一阶段。

---

# Development Principles

* 先实现，再优化
* 先完成，再重构
* 保持最小可运行版本（MVP）
* 不进行过度设计
* 每完成一个功能，再进入下一个功能
