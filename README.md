# YuetongLogistics

粤通物流管理系统

## 技术选型

### 1. 后端

* JDK 1.8
* Spring Boot 2.6.11
* Spring Cloud 2021.0.4
* Spring Cloud Alibaba 2021.0.4.0
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
│       └── yuetong-common-core                  // 公共类
│       └── yuetong-common-gateway               // 网关
│       └── yuetong-common-auth                  // 认证中心
│       └── yuetong-common-log                   // 日志切面
├── yuetong-fleet-serv       // 业务模块
├── yuetong-system-serv      // 业务模块
├── yuetong-transport-serv   // 业务模块
~~~

## 系统架构图

![](https://pic.imgdb.cn/item/64a2671a1ddac507cc9da6b5.jpg)
