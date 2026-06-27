# Development Environment

本文档描述 MikuFus 开发环境所需的基础设施。

compose.yml 用于定义和管理 Docker 容器。
.env 用于定义环境变量。

## 依赖服务

* PostgreSQL
* Redis
* MinIO

这些服务独立于项目代码仓库运行。

---

## 基础设施部署

在同一目录下，创建下面两个文件：

并且在根目录下，运行 `docker compose up -d`

### Docker Compose 

```compose.yml
# public container of project sharing 
services:
  redis:
    image: redis:7-alpine
    container_name: dev-redis
    restart: unless-stopped
    ports:
      - "6379:6379"
    volumes:
      - redis_data:/data
    networks:
      - network

  postgres:
    image: postgres:16
    container_name: dev-postgres
    restart: unless-stopped
    environment:
      POSTGRES_USER: ${POSTGRES_USER}
      POSTGRES_PASSWORD: ${POSTGRES_PASSWORD}
      POSTGRES_DB: ${POSTGRES_DB}
    ports:
      - "5432:5432"
    volumes:
      - postgres_data:/var/lib/postgresql/data
    networks:
      - network

  minio:
    image: minio/minio
    container_name: dev-minio
    restart: unless-stopped
    environment:
      MINIO_ROOT_USER: ${MINIO_ROOT_USER}
      MINIO_ROOT_PASSWORD: ${MINIO_ROOT_PASSWORD}
    command: server /data --console-address ":9001"
    ports:
      - "9000:9000"
      - "9001:9001"
    volumes:
      - minio_data:/data
    networks:
      - network

volumes:
  postgres_data:
  minio_data:
  redis_data:

networks:
  network:
    driver: bridge
```

### .env 
```.env
# PostgreSQL
POSTGRES_USER=postgres
POSTGRES_PASSWORD=password
POSTGRES_DB=db_name

# MinIO
MINIO_ROOT_USER=minio
MINIO_ROOT_PASSWORD=password
```

### PS

docker network create 会添加项目前缀，避免与其他项目冲突。

运行 `docker network ls`检测

这里我使用的是命名 volume, 避免数据丢失, 推荐根据自己的电脑系统设置路径。
