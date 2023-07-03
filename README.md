# YuetongLogistics

粤通物流管理系统

## 技术选型

### 1. 后端

* Spring Cloud Alibaba
* Spring Boot
* JDK 1.8
* MySQL 8.*
* Redis
* Docker

### 2. 前端

* Vue 3
* Node 16

## 系统模块

~~~
YuetongLogistics
├── yuetong-ui              // 前端框架 [80]
├── yuetong-common          // 通用模块
│       └── yuetong-common-exception        // 异常处理
│       └── yuetong-common-response         // 统一响应
│       └── yuetong-common-log              // 日志记录
│       └── yuetong-common-redis            // 缓存服务
│       └── yuetong-common-swagger          // 生成接口文档
├── yuetong-auth-serv        // 认证中心
│       └── yuetong-auth-api
│               └── beans                   // 实体类
│               └── intf                    // openFeign调用接口
│       └── yuetong-auth-dao
│               └── mapper                  // 持久化
│       └── yuetong-auth-impl
│               └── controller              // 表示层
│               └── service                 // 业务层
├── yuetong-fleet-serv       // 业务模块
├── yuetong-system-serv      // 业务模块
├── yuetong-transport-serv   // 业务模块
├── pom.xml                  // 公共依赖
~~~

## 系统架构图

![](https://pic.imgdb.cn/item/64a2671a1ddac507cc9da6b5.jpg)
