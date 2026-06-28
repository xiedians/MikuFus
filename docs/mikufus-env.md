# Development Environment

本文档介绍 MikuFus 本地开发环境的搭建方式。

开发环境采用 Docker Compose 管理基础设施，业务代码（Go、Vue）运行在宿主机。

## 依赖服务

开发环境包含以下服务：

* PostgreSQL
* Redis
* MinIO

这些服务通过 Docker Compose 启动，与业务代码解耦，方便多个项目复用。

---

# 文件说明

开发环境目录包含以下文件：

```text
docker/
├── .env
├── compose.yml
└── sql-scripts/
```

| 文件          | 说明                |
| ----------- | ----------------- |
| compose.yml | Docker Compose 配置 |
| .env        | 环境变量配置            |

---

## 启动开发环境

首先，确保你已经安装了 Docker 和 Docker Compose。

### 进入 Docker 配置目录 shared ：

```bash
cd shared
```
可以复制到你的系统的任何一个文件路径下，然后进入该目录即可。

### 启动所有服务：

```bash
docker compose up -d
```

### 查看容器状态：

```bash
docker compose ps
```

### 查看日志：

```bash
docker compose logs -f
```

### 停止服务：

```bash
docker compose down
```

### 停止并删除数据卷：

```bash
docker compose down -v
```

## 根据实际情况修改配置文件

如果你的系统本地已经启动，你可能需要修改 `compose.yml` 中的端口映射，避免冲突。

如果你只需要启动部分服务，可以修改 `compose.yml` 中的 `services` 部分，只保留你需要的服务。

如果你不需要启动 postgres, 可能需要执行 sql-scripts 中的初始化脚本。
