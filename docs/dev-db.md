# Development Database

## Create User

postgers 用户，为 MikuFus 创建用户 mikufus 执行下面 sql script

```sql
-- 创建项目专用数据库用户
CREATE USER mikufus
WITH PASSWORD '[sixiedian]0315';

-- 创建项目数据库
CREATE DATABASE if not exists mikufus
OWNER mikufus;

-- 连接到 mikufus 数据库
\c mikufus

-- 将 public schema 的所有者改为项目用户（推荐）
ALTER SCHEMA public OWNER TO mikufus;

-- 授予 schema 使用权限
GRANT USAGE, CREATE ON SCHEMA public TO mikufus;
```

### 表结构

#### users

```sql
-- 创建用户表
CREATE TABLE IF NOT EXISTS users (
    -- 主键：使用 BIGSERIAL 自增，对应 Go 中的 uint64
    id BIGSERIAL PRIMARY KEY,
    
    -- 用户名：唯一，必填，最长 64 字符
    username VARCHAR(64) NOT NULL UNIQUE,
    
    -- 邮箱：唯一，必填，最长 128 字符（用于登录）
    email VARCHAR(128) NOT NULL UNIQUE,
    
    -- 密码哈希：必填，bcrypt 加密后长度为 60，这里预留 255
    password_hash VARCHAR(255) NOT NULL,
    
    -- 昵称：非必填，默认与用户名一致
    nickname VARCHAR(64) DEFAULT '',
    
    -- 头像 URL：非必填
    avatar VARCHAR(255) DEFAULT '',
    
    -- 个人简介：非必填
    bio TEXT DEFAULT '',
    
    -- 角色：user(普通用户) / admin(管理员) / moderator(版主)
    role VARCHAR(20) DEFAULT 'user',
    
    -- 状态：1-正常, 2-封禁, 3-未激活
    status SMALLINT DEFAULT 1,
    
    -- 最后登录时间（可为空）
    last_login_at TIMESTAMP WITH TIME ZONE,
    
    -- 创建时间
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    
    -- 更新时间（自动更新）
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 为常用的查询字段创建索引（大幅提升登录查询速度）
CREATE INDEX idx_users_username ON users(username);
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_status ON users(status);

-- 创建自动更新 updated_at 的触发器函数（保持数据一致性）
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 将触发器绑定到 users 表
CREATE TRIGGER trigger_users_updated_at
BEFORE UPDATE ON users
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();
```
