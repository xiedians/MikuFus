# MikuFus Development Plan

> Version: v0.1

## Development Principles

* MVP First
* Implement Before Optimize
* Keep Documentation in Sync with Code
* Avoid Over Engineering

---

# Milestone 1 - Project Bootstrap

Status: **Completed**

* [x] Repository initialization
* [x] Project structure
* [x] Docker development environment
* [x] PostgreSQL
* [x] Redis
* [x] MinIO
* [x] Users table
* [x] Database initialization script
* [x] Project documentation

---

# Milestone 2 - Authentication

Status: **In Progress**

Goal

完成用户认证系统。

Tasks

* [ ] Gin router
* [ ] Configuration
* [ ] Database connection
* [ ] Repository
* [ ] Service
* [ ] Handler
* [ ] User register
* [ ] User login
* [ ] Password bcrypt
* [ ] JWT
* [ ] Authentication middleware
* [ ] GET /users/me
* [ ] API testing

Completion Criteria

* 用户可以注册
* 用户可以登录
* 返回 JWT Token
* JWT 可以访问受保护接口
* 密码使用 bcrypt 存储

---

# Milestone 3 - Content

Status: **Planned**

* [ ] Posts table
* [ ] Publish post
* [ ] Post list
* [ ] Post detail
* [ ] MinIO upload

---

# Milestone 4 - Community

Status: **Planned**

* [ ] Comments
* [ ] Likes
* [ ] Favorites

---

# Milestone 5 - Administration

Status: **Planned**

* [ ] User management
* [ ] Content review
* [ ] Report handling

---

# Current Focus

当前开发顺序：

```
Project
    ↓
Authentication
    ↓
Content
    ↓
Community
    ↓
Administration
```

暂不开发：

* 推荐算法
* 频道系统
* 消息通知
* 视频播放
* 搜索优化

待核心功能完成后，再规划下一阶段。
