# 安装指南

> 官网: `https://www.postgresql.org/download/linux/redhat/`

- OS
```
~]# cat /etc/redhat-release 
CentOS Linux release 7.9.2009 (Core)
```

- 安装
```
sudo yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
sudo yum install -y postgresql14-server
sudo /usr/pgsql-14/bin/postgresql-14-setup initdb
sudo systemctl enable postgresql-14
sudo systemctl start postgresql-14
```

```
~]# su - postgres
-bash-4.2$ psql
psql (14.17)
输入 "help" 来获取帮助信息.
postgres=# \l
                                     数据库列表
   名称    |  拥有者  | 字元编码 |  校对规则   |    Ctype    |       存取权限        
-----------+----------+----------+-------------+-------------+-----------------------
 postgres  | postgres | UTF8     | zh_CN.UTF-8 | zh_CN.UTF-8 | 
 template0 | postgres | UTF8     | zh_CN.UTF-8 | zh_CN.UTF-8 | =c/postgres          +
           |          |          |             |             | postgres=CTc/postgres
 template1 | postgres | UTF8     | zh_CN.UTF-8 | zh_CN.UTF-8 | =c/postgres          +
           |          |          |             |             | postgres=CTc/postgres
(3 行记录)
```

- 远程连接

```
~]# su - postgres
-bash-4.2$ cp 14/data/postgresql.conf{,.bak}
-bash-4.2$ vim 14/data/postgresql.conf
listen_addresses = '*'            # what IP address(es) to listen on;
-bash-4.2$ cp 14/data/pg_hba.conf{,.bak}
-bash-4.2$ vim 14/data/pg_hba.conf
host    all             all             0.0.0.0/0               md5

-bash-4.2$ sudo systemctl  start postgresql-14
```

- 配置日志

```
vim 14/data/postgresql.conf
logging_collector = on                  # Enable capturing of stderr and csvlog
                                        # into log files. Required to be on for
                                        # csvlogs.
                                        # (change requires restart)
log_directory = 'log'                   # directory where log files are written,
                                        # can be absolute or relative to PGDATA
log_filename = 'postgresql-%a.log'      # log file name pattern,
                                        # can include strftime() escapes
                                        # begin with 0 to use octal notation
log_rotation_age = 365d                   # Automatic rotation of logfiles will
                                        # happen after that time.  0 disables.
log_rotation_size = 0                   # Automatic rotation of logfiles will
                                        # happen after that much log output.
                                        # 0 disables.
log_truncate_on_rotation = on 
```


# PostgreSQL创建用户并配置远程连接

```
CREATE USER 名称 [ [ WITH ] 选项 [ ... ] ] # 默认有连接权限
CREATE ROLE 名称 [ [ WITH ] 选项 [ ... ] ] #  没有连接权限
```

```
~]# su - postgres
# 创建app用户
postgres=# create  user app  with superuser  password '123456';
CREATE ROLE
postgres-# \du
 app      | 超级用户                                   | {}
 postgres | 超级用户, 建立角色, 建立 DB, 复制, 绕过RLS | {}
```

```
# 创建数据库并授权owner给app用户
postgres=# create database appdb owner app;
CREATE DATABASE
# 或者修改已经存在的库
postgres=# alter database appdb02 owner to app;
postgres=# \l
 appdb     | app      | UTF8     | zh_CN.UTF-8 | zh_CN.UTF-8 | 
 postgres  | postgres | UTF8     | zh_CN.UTF-8 | zh_CN.UTF-8 | 
 template0 | postgres | UTF8     | zh_CN.UTF-8 | zh_CN.UTF-8 | =c/postgres          +
           |          |          |             |             | postgres=CTc/postgres
 template1 | postgres | UTF8     | zh_CN.UTF-8 | zh_CN.UTF-8 | =c/postgres          +
           |          |          |             |             | postgres=CTc/postgres
```
```

```
```
-bash-4.2$ psql -U app -h 192.168.122.67  -d appdb;
用户 app 的口令：
psql (14.17)
输入 "help" 来获取帮助信息.
```

# schema & table

```
create schema t_schema;
create table t_schema.t1 (id int, name varchar(32));
```