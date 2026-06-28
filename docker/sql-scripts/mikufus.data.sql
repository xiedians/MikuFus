create user mikufus with password '[sixiedian]0315';

-- 创建项目数据库
 create database mikufus;

-- 设置项目数据库所有者
alter database mikufus owner to mikufus;

-- 授予权限
grant all privileges on database mikufus to mikufus;
