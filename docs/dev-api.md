好的，我们先完善 `docs/dev-api.md` 和创建 `docs/dev-plan.md`，这样你就有一份清晰的开发路线图和 API 规范了。我会按 **“先完成核心认证，再逐步扩展业务”** 的原则来规划。

---

## 📄 文档一：`docs/dev-api.md`（API 接口设计）

这份文档定义所有后端 API 的接口规范，包括路径、方法、请求参数、响应示例。**当前先定义认证模块**，后续业务模块可逐步添加。

```markdown
# MikuFus API 设计文档

> 基础 URL：`http://localhost:8080/api`
> 所有接口返回 JSON 格式，统一错误结构：`{ "error": "错误信息" }`

## 认证模块（Auth）

### 1. 用户注册
- **URL**：`/register`
- **Method**：`POST`
- **请求体**（JSON）：
```json
{
  "username": "miku",      // 必填，3~64字符
  "password": "123456",    // 必填，至少6位
  "email": "miku@example.com" // 必填，合法邮箱
}
```
- **成功响应**（200）：
```json
{
  "message": "注册成功",
  "user": {
    "id": 1,
    "username": "miku",
    "email": "miku@example.com",
    "nickname": "miku",
    "avatar": "",
    "created_at": "2025-06-27T10:00:00Z"
  }
}
```
- **失败响应**（400）：
```json
{ "error": "用户名已被注册" }
```

### 2. 用户登录
- **URL**：`/login`
- **Method**：`POST`
- **请求体**（JSON）：
```json
{
  "username": "miku",
  "password": "123456"
}
```
- **成功响应**（200）：
```json
{
  "message": "登录成功",
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
}
```
- **失败响应**（401）：
```json
{ "error": "用户名或密码错误" }
```

### 3. 获取当前用户信息（需认证）
- **URL**：`/profile`
- **Method**：`GET`
- **请求头**：`Authorization: Bearer <token>`
- **成功响应**（200）：
```json
{
  "user_id": 1,
  "username": "miku",
  "message": "这是一个受保护的接口，认证成功！"
}
```

---

## 用户模块（User）—— 后续扩展

### 获取用户公开资料
- **URL**：`/users/:id`
- **Method**：`GET`
- **响应**：用户基本信息（不含敏感字段）

### 更新个人资料（需认证）
- **URL**：`/users/me`
- **Method**：`PUT`
- **请求体**：可更新 `nickname`, `avatar`, `bio` 等

---

## 内容模块（Post）—— 后续扩展

### 发布图文动态（需认证）
- **URL**：`/posts`
- **Method**：`POST`
- **请求体**：`{ "content": "...", "images": ["url1", ...] }`

### 获取动态列表
- **URL**：`/posts?page=1&size=20`
- **Method**：`GET`

### 获取单条动态
- **URL**：`/posts/:id`
- **Method**：`GET`

---

## 评论模块（Comment）—— 后续扩展

### 发表评论（需认证）
- **URL**：`/comments`
- **Method**：`POST`
- **请求体**：`{ "post_id": 1, "content": "..." }`

### 获取某动态的评论列表
- **URL**：`/comments?post_id=1&page=1`
- **Method**：`GET`

---

## 管理后台（Admin）—— 后续扩展

（略，待业务成熟后补充）
```

---

## 📄 文档二：`docs/dev-plan.md`（开发计划）

这份文档按阶段划分任务，明确当前应做什么，后续步骤是什么。你可以把它当作项目路线图。

```markdown
# MikuFus 开发计划

## 里程碑 1：基础设施与环境（已完成 ✅）
- [x] 项目初始化（Go + Vue + Docker）
- [x] 设计数据库表结构（`users` 表，包含软删除）
- [x] 编写 `docker-compose.yml` 并启动 PostgreSQL、Redis、MinIO
- [x] 编写 `docs/dev-db.md` 数据库文档

---

## 里程碑 2：用户认证系统（当前任务 🔥）
**目标**：实现用户的注册、登录，并建立 JWT 认证中间件，为后续所有需要登录的接口提供安全保障。

### 开发任务
- [ ] **编写 Go Model**（`internal/model/user.go`）与数据库表映射
- [ ] **实现注册逻辑**：密码 bcrypt 加密，用户名/邮箱唯一性检查
- [ ] **实现登录逻辑**：验证密码，签发 JWT Token（24小时过期）
- [ ] **编写 JWT 中间件**：验证 Token，注入用户信息到 context
- [ ] **编写 API 接口**：`/register`、`/login`、`/profile`（测试中间件）
- [ ] **编写 `docs/dev-api.md`**（已初步完成，需随接口完善更新）
- [ ] **使用 Postman 完成接口测试**

### 验证标准
- 注册成功后可登录，返回有效 token。
- 使用该 token 访问 `/profile` 能正确返回用户 ID。
- 数据库表中 `password_hash` 存储的是 bcrypt 密文。
- 软删除（`deleted_at`）不影响普通查询。

---

## 里程碑 3：用户个人空间（后续）
**目标**：用户能查看和编辑自己的资料，以及查看他人公开资料。

### 开发任务
- [ ] 实现 `GET /users/:id` 获取公开资料
- [ ] 实现 `PUT /users/me` 更新昵称、头像、个人简介
- [ ] 前端页面（Vue）对接，展示个人主页

### 依赖
- 需认证模块已完善。

---

## 里程碑 4：内容发布（核心功能）
**目标**：用户能发布图文动态（类似微博），并能在首页看到动态流。

### 开发任务
- [ ] 设计 `posts` 表结构（含 content, images, author_id, etc.）
- [ ] 实现 `POST /posts` 发布动态（需认证）
- [ ] 实现 `GET /posts` 获取动态列表（分页，按时间倒序）
- [ ] 实现 `GET /posts/:id` 获取单条详情
- [ ] 集成 MinIO 实现图片上传（或先用URL占位）

---

## 里程碑 5：社交互动
**目标**：用户可以对动态进行评论、点赞、收藏。

### 开发任务
- [ ] 设计 `comments`、`likes`、`favorites` 表
- [ ] 实现评论接口（增删查）
- [ ] 实现点赞/取消点赞
- [ ] 实现收藏/取消收藏

---

## 里程碑 6：推荐信息流
**目标**：首页展示个性化推荐（可按标签、发布时间、热度排序）。

### 开发任务
- [ ] 设计标签系统（可选）
- [ ] 实现多种排序算法（简单时间排序 -> 热度）
- [ ] 前端信息流展示

---

## 里程碑 7：管理后台
**目标**：管理员能管理用户、内容审核、处理举报。

### 开发任务
- [ ] 设计管理员权限（`role` 字段）
- [ ] 实现用户管理（列表、封禁、解封）
- [ ] 实现内容审核（通过/驳回）
- [ ] 实现举报处理

---

## 里程碑 8：高级功能（未来）
- 视频上传与播放
- 专栏功能
- 频道与分享
- 消息通知

---

## 🧭 开发顺序建议
1. **立即开始**：里程碑 2（认证系统）—— **现在就该动手！**
2. **接着**：里程碑 3（个人空间）—— 完善用户基础
3. **然后**：里程碑 4（内容发布）—— 让社区有内容
4. **逐步**：里程碑 5～7 按需推进

---

## 当前任务（下一步）
- 按照 `dev-api.md` 中认证模块的设计，编写 Go 代码（已提供完整代码参考）。
- 完成测试，确保 `register`、`login`、`profile` 接口工作正常。
- 将代码提交到仓库。

```

---

## ✅ 现在你应该做什么？

1. **将以上两个文档内容**分别保存为 `docs/dev-api.md` 和 `docs/dev-plan.md`，并提交到 GitHub。
2. **立即开始“里程碑 2”**：参考我前一回复中的完整 Go 代码，在 `go-service/` 下创建相应的文件（`model/user.go`、`service/auth_service.go`、`handler/auth_handler.go`、`middleware/auth_middleware.go`、`config/config.go`、`main.go`），并安装依赖。
3. **启动 PostgreSQL**（用 Docker），配置 `.env`，运行 `go run main.go`，用 Postman 测试接口。

一旦认证系统跑通，整个项目的“地基”就牢固了，后续所有业务接口都能安全地加进来。

如果遇到任何问题（比如数据库连接失败、JWT 验证报错），随时把错误日志贴出来，我帮你解决。现在就开始编码吧！🚀
