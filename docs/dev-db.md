# Development Database

## Create User

postgers 用户，为 MikuFus 创建用户 mikufus 执行下面 sql script

```sql
-- 创建项目专用用户
create user mikufus with password '[sixiedian]0315';

-- 创建项目数据库
 create database mikufus;

-- 设置项目数据库所有者
alter database mikufus owner to mikufus;

-- 授予权限
grant all privileges on database mikufus to mikufus;
```

### 表结构

#### users

```sql
-- 创建用户表，所有约束均为表级
create table if not exists users (
    id bigserial,
    username varchar(64) not null,
    email varchar(128) not null,
    password_hash varchar(255) not null,
    nickname varchar(64) default '',
    avatar varchar(255) default '',
    bio text default '',
    role varchar(20) default 'user',
    status smallint default 1,
    last_login_at timestamp with time zone,
    created_at timestamp with time zone default current_timestamp,
    updated_at timestamp with time zone default current_timestamp,

    -- 主键约束
    constraint users_pkey primary key (id),
    -- 唯一约束
    constraint users_username_key unique (username),
    constraint users_email_key unique (email)
);

-- 索引（增加 if not exists 避免重复创建）
create index if not exists idx_users_username on users(username);
create index if not exists idx_users_email on users(email);
create index if not exists idx_users_status on users(status);

-- 自动更新 updated_at 的函数（已存在则替换）
create or replace function update_updated_at_column()
returns trigger as $$
begin
    new.updated_at = current_timestamp;
    return new;
end;
$$ language plpgsql;

-- 条件创建触发器（避免重复执行时报错）
do $$
begin
    if not exists (select 1 from pg_trigger where tgname = 'trigger_users_updated_at') then
        create trigger trigger_users_updated_at
        before update on users
        for each row
        execute function update_updated_at_column();
    end if;
end;
$$;
```
