# MikuFus

> 类 Bilibili 二次元内容社区 · Go + Vue 全栈实战项目

## 项目简介

MikuFus 是一个面向 ACG（Anime、Comic、Game）内容创作者与爱好者的社区平台。

项目灵感来源于一个简单的问题：

> Bilibili 的频道能不能设计成论坛式社区板块？

在日常使用 Bilibili 和浏览各类 ACGN 社区的过程中，我发现视频平台拥有优秀的内容生产能力，而传统论坛拥有优秀的社区交流能力。

MikuFus 希望结合两者的特点：

* 像 Bilibili 一样方便地发布内容
* 像论坛一样围绕兴趣进行交流
* 提供轻量级的内容分享与社区互动体验

同时，这也是我的第一个完整全栈项目，用于学习和实践：

* Go Web 开发
* Vue 前后端分离
* PostgreSQL 数据库设计
* Redis 缓存设计
* 对象存储集成
* Docker 工程化部署

---

## 功能规划

### 个人空间

用户拥有独立主页，可发布：

* 图文内容
* 视频内容
* 专栏内容

采用模板化发布方式，降低创作门槛并保持内容结构统一。

### 推荐信息流

首页负责内容分发。

初期采用：

* 发布时间排序
* 标签匹配

后续根据项目发展逐步优化推荐策略。

### 后台管理

管理员负责：

* 内容审核
* 用户管理
* 举报处理

保障社区内容质量和秩序。

### 频道分享（Future）

参考传统论坛板块设计。

未来计划支持：

* 兴趣频道
* 版主管理
* 频道内容聚合

---

## 技术栈

### 前端

| 模块  | 技术                      |
| --- | ----------------------- |
| 用户端 | Vue 3 + Vite + UnoCSS   |
| 管理端 | Vue 3 + Vite + Naive UI |

### 后端

| 模块             | 技术         |
| -------------- | ---------- |
| Web Framework  | Gin        |
| Language       | Go         |
| Database       | PostgreSQL |
| Cache          | Redis      |
| Authentication | JWT        |

### 基础设施

| 模块             | 技术     |
| -------------- | ------ |
| Object Storage | MinIO  |
| Container      | Docker |

---

## 项目结构

```text
mikufus/
├── go-service/  # Go 后端服务
├── vue-client/  # 用户端
├── vue-admin/   # 管理端
├── docs/        # 项目文档
├── compose.yml  # Docker Compose 配置
└── README.md
```

---

## 开发环境说明

本仓库仅包含业务代码。

以下基础设施由开发环境独立提供，不包含在本仓库中：

* GO 
* Node
* Docker

使用

项目通过环境变量连接上述服务。

具体配置请参考 [开发环境文档](docs/dev-env.md)。

> 相关资源：

* [开发环境文档](docs/dev-env.md)
* [数据库文档](docs/dev-db.md)
* [API 文档](docs/dev-api.md)
* [开发计划](docs/dev-plan.md)

## 项目部署
