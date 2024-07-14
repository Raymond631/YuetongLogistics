# YuetongLogistics

粤通物流管理系统demo

## 技术选型

### 1. 后端

* JDK 1.8
* Spring Boot 2.6.11
* Spring Cloud 2021.0.4
* Spring Cloud Alibaba 2021.0.4.0
* MySQL 8.*
* Redis 5.*

### 2. 前端

* Vue 3
* Node 16

## 系统模块

~~~
YuetongLogistics
├── yuetong-ui              // 前端框架 [7878]
├── yuetong-common          // 通用模块
│       └── yuetong-common-core                  // 公共类
│       └── yuetong-common-gateway               // 网关 [10000]
│       └── yuetong-common-auth                  // 认证中心 [11010]
│       └── yuetong-common-log                   // 日志切面
├── yuetong-system-serv      // 系统管理模块 [11020]
├── yuetong-fleet-serv       // 运输管理模块 [11030]
├── yuetong-transport-serv   // 承运业务模块 [11040]
~~~
