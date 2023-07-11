/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80033
 Source Host           : localhost:3306
 Source Schema         : yuetong

 Target Server Type    : MySQL
 Target Server Version : 80033
 File Encoding         : 65001

 Date: 11/07/2023 20:55:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for carriers
-- ----------------------------
DROP TABLE IF EXISTS `carriers`;
CREATE TABLE `carriers`  (
  `carriers_id` int NOT NULL AUTO_INCREMENT COMMENT '承运单编号（字段自动编号）',
  `send_company` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '发货单位',
  `send_address` varchar(100) CHARACTER SET armscii8 COLLATE armscii8_general_ci NULL DEFAULT NULL COMMENT '发货单位地址',
  `send_linkman` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '发货人',
  `send_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '发货人电话',
  `receive_company` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '收货单位',
  `fk_receive_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '收货单位地址',
  `receive_linkman` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '收货人/联系人',
  `receive_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '收货人电话/联系人电话',
  `leaver_date` datetime NULL DEFAULT NULL COMMENT '承运日期',
  `receive_date` datetime NULL DEFAULT NULL COMMENT '收货时间',
  `finished_state` tinyint NOT NULL COMMENT '完成情况：0:待调度 1:已调度 2:已签收 3:已结算',
  `insurance_cost` float NULL DEFAULT NULL COMMENT '保险费',
  `transport_cost` float NULL DEFAULT NULL COMMENT '运费',
  `other_cost` float NULL DEFAULT NULL COMMENT '其他费用',
  `total_cost` float NULL DEFAULT NULL COMMENT '合计费用',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `fk_user_id` int NOT NULL COMMENT '业务员',
  `check_in_time` datetime NOT NULL COMMENT '录入时间',
  `is_delete` tinyint NOT NULL COMMENT '数据记录状态 : 0:使用中 1:该记录已删',
  `alter_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`carriers_id`) USING BTREE,
  INDEX `FK_Carriers_User`(`fk_user_id` ASC) USING BTREE,
  CONSTRAINT `FK_Carriers_User` FOREIGN KEY (`fk_user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '承运单信息表用于存放和管理承运单信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carriers
-- ----------------------------

-- ----------------------------
-- Table structure for contact
-- ----------------------------
DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact`  (
  `contact_id` int NOT NULL AUTO_INCREMENT COMMENT '联系编号（字段自动编号）',
  `fk_truck_id` int NULL DEFAULT NULL COMMENT '车辆编号',
  `fk_driver_id` int NULL DEFAULT NULL COMMENT '司机编号',
  PRIMARY KEY (`contact_id`) USING BTREE,
  INDEX `FK_Contact_Driver`(`fk_driver_id` ASC) USING BTREE,
  INDEX `FK_Contact_Truck`(`fk_truck_id` ASC) USING BTREE,
  CONSTRAINT `FK_Contact_Driver` FOREIGN KEY (`fk_driver_id`) REFERENCES `driver` (`driver_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Contact_Truck` FOREIGN KEY (`fk_truck_id`) REFERENCES `truck` (`truck_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '车辆司机关联表用于连接车辆与驾驶员' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of contact
-- ----------------------------

-- ----------------------------
-- Table structure for driver
-- ----------------------------
DROP TABLE IF EXISTS `driver`;
CREATE TABLE `driver`  (
  `driver_id` int NOT NULL AUTO_INCREMENT COMMENT '司机编号（字段自动编号）',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '司机姓名',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '性别',
  `birth` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '出生日期',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '联系电话',
  `id_card` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '身份证号码',
  `fk_team_id` int NOT NULL COMMENT '车队编号',
  `state` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '工作状态（承运中、空闲）',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '备注',
  `check_in_time` datetime NOT NULL COMMENT '加入时间',
  `alter_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`driver_id`) USING BTREE,
  INDEX `FK_Driver_TruckTeam`(`fk_team_id` ASC) USING BTREE,
  CONSTRAINT `FK_Driver_TruckTeam` FOREIGN KEY (`fk_team_id`) REFERENCES `truck_team` (`team_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '驾驶员信息表用于存放和管理驾驶员信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of driver
-- ----------------------------
INSERT INTO `driver` VALUES (1, '张三', '男', '1988-10-01', '12345678900', '123456789123456789', 1, '空闲', '无', '2023-07-21 15:58:15', '2023-07-11 15:58:15');
INSERT INTO `driver` VALUES (2, '李四', '男', '1975-01-21', '98765432100', '123456789123456780', 1, '空闲', '无', '2023-07-21 15:58:15', '2023-07-11 15:58:15');
INSERT INTO `driver` VALUES (3, '张三', '男', '1988-10-01', '12345678900', '123456789123456789', 1, '空闲', '无', '2023-07-25 16:00:40', '2023-07-11 16:00:40');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `goods_id` int NOT NULL AUTO_INCREMENT COMMENT '货物编号（字段自动编号）',
  `goods_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '货物名称',
  `amount` int NULL DEFAULT NULL COMMENT '货物数量',
  `weight` float NULL DEFAULT NULL COMMENT '货物重量',
  `volume` float NULL DEFAULT NULL COMMENT '货物体积',
  `fk_carriers_id` int NULL DEFAULT NULL COMMENT '承运单编号',
  `is_delete` tinyint NOT NULL COMMENT '数据记录状态 : 0:使用中 1:该记录已删除',
  PRIMARY KEY (`goods_id`) USING BTREE,
  INDEX `FK_Goods_Carriers`(`fk_carriers_id` ASC) USING BTREE,
  CONSTRAINT `FK_Goods_Carriers` FOREIGN KEY (`fk_carriers_id`) REFERENCES `carriers` (`carriers_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '货物单信息表用于存放和管理货物单信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------

-- ----------------------------
-- Table structure for log_login
-- ----------------------------
DROP TABLE IF EXISTS `log_login`;
CREATE TABLE `log_login`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '序号(自增)',
  `account` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录状态',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '描述',
  `ipaddr` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ip地址',
  `access_time` datetime NOT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '登录日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log_login
-- ----------------------------
INSERT INTO `log_login` VALUES (1, 'abc', 'success', '登录成功', '127.0.0.1', '2023-07-09 09:06:28');
INSERT INTO `log_login` VALUES (2, 'abc', 'success', '登录成功', '127.0.0.1', '2023-07-09 09:15:56');
INSERT INTO `log_login` VALUES (3, 'abc', 'success', '登录成功', '127.0.0.1', '2023-07-11 12:42:08');
INSERT INTO `log_login` VALUES (4, 'abc', 'failed', '用户名或密码错误', '127.0.0.1', '2023-07-11 15:45:29');
INSERT INTO `log_login` VALUES (5, 'abc', 'failed', '验证码错误', '127.0.0.1', '2023-07-11 15:45:41');
INSERT INTO `log_login` VALUES (6, 'abc', 'success', '登录成功', '127.0.0.1', '2023-07-11 15:47:22');
INSERT INTO `log_login` VALUES (7, 'abc', 'success', '登录成功', '127.0.0.1', '2023-07-11 15:49:59');
INSERT INTO `log_login` VALUES (8, 'abc', 'success', '登录成功', '192.168.3.187', '2023-07-11 18:23:44');
INSERT INTO `log_login` VALUES (9, 'abc', 'success', '登录成功', '192.168.3.187', '2023-07-11 19:31:16');
INSERT INTO `log_login` VALUES (10, 'abc', 'success', '登录成功', '192.168.3.187', '2023-07-11 20:00:31');
INSERT INTO `log_login` VALUES (11, 'abc', 'success', '登录成功', '192.168.3.187', '2023-07-11 20:00:53');

-- ----------------------------
-- Table structure for log_operate
-- ----------------------------
DROP TABLE IF EXISTS `log_operate`;
CREATE TABLE `log_operate`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '操作序号',
  `oper_time` datetime NOT NULL COMMENT '操作时间',
  `oper_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作人员account',
  `oper_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '源ip地址',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作模块',
  `business_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '业务类型(0=其它,1=新增,2=删除,3=修改,,4=查询,5=导出)',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '请求方法',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '请求地址',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作状态',
  `cost_time` bigint NOT NULL COMMENT '消耗时间(ms)',
  `error_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '错误消息',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log_operate
-- ----------------------------
INSERT INTO `log_operate` VALUES (1, '2023-07-09 09:16:17', 'abc', '127.0.0.1', '操作日志测试', '0', 'GET', '/system/test', '0', 12, NULL);
INSERT INTO `log_operate` VALUES (2, '2023-07-09 09:19:28', 'abc', '127.0.0.1', '操作日志测试', '0', 'GET', '/system/test', '0', 1, NULL);
INSERT INTO `log_operate` VALUES (3, '2023-07-09 09:22:22', 'abc', '127.0.0.1', '操作日志测试', '0', 'GET', '/system/test', '0', 1, NULL);
INSERT INTO `log_operate` VALUES (4, '2023-07-09 09:40:34', 'abc', '127.0.0.1', '操作日志测试', '0', 'GET', '/system/test', '1', 13, '异常测试');
INSERT INTO `log_operate` VALUES (5, '2023-07-09 09:42:29', 'abc', '127.0.0.1', '操作日志测试', '0', 'GET', '/system/test', '0', 13, NULL);
INSERT INTO `log_operate` VALUES (6, '2023-07-09 09:54:55', 'abc', '127.0.0.1', '操作日志测试', '0', 'GET', '/system/test', '0', 10, NULL);
INSERT INTO `log_operate` VALUES (7, '2023-07-09 11:37:21', 'abc', '127.0.0.1', '日志测试', 'OTHER', 'GET', '/system/user/test', 'success', 20, NULL);
INSERT INTO `log_operate` VALUES (8, '2023-07-11 12:42:44', 'abc', '127.0.0.1', '删除用户信息', 'DELETE', 'DELETE', '/system/user', 'success', 57, NULL);
INSERT INTO `log_operate` VALUES (9, '2023-07-11 12:44:52', 'abc', '127.0.0.1', '查询用户信息', 'SELECT', 'GET', '/system/user', 'failed', 401, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'LIMIT 10\' at line 3\r\n### The error may exist in file [D:\\Project\\shixun\\YuetongLogistics\\yuetong-system-serv\\yuetong-system-impl\\target\\classes\\mybatis\\UserMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select *         from user;  LIMIT ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'LIMIT 10\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'LIMIT 10\' at line 3');
INSERT INTO `log_operate` VALUES (10, '2023-07-11 12:46:01', 'abc', '127.0.0.1', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 151, NULL);
INSERT INTO `log_operate` VALUES (11, '2023-07-11 12:48:15', 'abc', '127.0.0.1', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 191, NULL);
INSERT INTO `log_operate` VALUES (12, '2023-07-11 12:51:43', 'abc', '127.0.0.1', '修改用户角色', 'UPDATE', 'PUT', '/system/user', 'success', 47, NULL);
INSERT INTO `log_operate` VALUES (13, '2023-07-11 12:51:51', 'abc', '127.0.0.1', '修改用户角色', 'UPDATE', 'PUT', '/system/user', 'failed', 160, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`yuetong`.`user`, CONSTRAINT `FK_User_Role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`))\r\n### The error may exist in file [D:\\Project\\shixun\\YuetongLogistics\\yuetong-system-serv\\yuetong-system-impl\\target\\classes\\mybatis\\UserMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: update user         set role_id = ?         where user_id = ?;\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`yuetong`.`user`, CONSTRAINT `FK_User_Role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`))\n; Cannot add or update a child row: a foreign key constraint fails (`yuetong`.`user`, CONSTRAINT `FK_User_Role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`yuetong`.`user`, CONSTRAINT `FK_User_Role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`))');
INSERT INTO `log_operate` VALUES (14, '2023-07-11 12:55:50', 'abc', '127.0.0.1', '修改用户角色', 'UPDATE', 'PUT', '/system/user', 'failed', 167, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`yuetong`.`user`, CONSTRAINT `FK_User_Role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`))\r\n### The error may exist in file [D:\\Project\\shixun\\YuetongLogistics\\yuetong-system-serv\\yuetong-system-impl\\target\\classes\\mybatis\\UserMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: update user         set role_id = ?         where user_id = ?;\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`yuetong`.`user`, CONSTRAINT `FK_User_Role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`))\n; Cannot add or update a child row: a foreign key constraint fails (`yuetong`.`user`, CONSTRAINT `FK_User_Role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`yuetong`.`user`, CONSTRAINT `FK_User_Role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`))');
INSERT INTO `log_operate` VALUES (15, '2023-07-11 12:57:40', 'abc', '127.0.0.1', '修改用户角色', 'UPDATE', 'PUT', '/system/user', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (16, '2023-07-11 13:04:52', 'abc', '127.0.0.1', '修改个人信息', 'UPDATE', 'PUT', '/system/self/userInfo', 'failed', 1662, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'phone\' not found. Available parameters are [date, param3, param1, account, info, param2]');
INSERT INTO `log_operate` VALUES (17, '2023-07-11 13:07:34', 'abc', '127.0.0.1', '修改个人信息', 'UPDATE', 'PUT', '/system/self/userInfo', 'success', 1830, NULL);
INSERT INTO `log_operate` VALUES (18, '2023-07-11 13:09:13', 'abc', '127.0.0.1', '修改个人账号密码', 'UPDATE', 'PUT', '/system/self/password', 'failed', 49, '原密码错误');
INSERT INTO `log_operate` VALUES (19, '2023-07-11 13:10:39', 'abc', '127.0.0.1', '修改个人账号密码', 'UPDATE', 'PUT', '/system/self/password', 'success', 1706, NULL);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` int NOT NULL AUTO_INCREMENT COMMENT '角色编号（字段自动编号）',
  `role_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色名称',
  `role_purview` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色权限，多个权限用 / 区分',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统角色表用于存放系统权限数据，管理用户权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '测试人员', 'system/fleet/carrier/capacity/scheduling/cost');
INSERT INTO `role` VALUES (2, '测试', 'a/123');

-- ----------------------------
-- Table structure for scheduling
-- ----------------------------
DROP TABLE IF EXISTS `scheduling`;
CREATE TABLE `scheduling`  (
  `scheduling_id` int NOT NULL AUTO_INCREMENT COMMENT '调度编号（字段自动编号）',
  `start_time` datetime NULL DEFAULT NULL COMMENT '出发时间',
  `fk_carriers_id` int NULL DEFAULT NULL COMMENT '承运单编号',
  `fk_truck_id` int NULL DEFAULT NULL COMMENT '车辆编号',
  `oil_cost` float NULL DEFAULT NULL COMMENT '油费',
  `toll` float NULL DEFAULT NULL COMMENT '过桥费',
  `fine` float NULL DEFAULT NULL COMMENT '罚款',
  `other_cost` float NULL DEFAULT NULL COMMENT '其他费用',
  `total_cost` float NULL DEFAULT NULL COMMENT '合计成本',
  `fk_user_id` int NULL DEFAULT NULL COMMENT '调度员',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `check_in_time` datetime NULL DEFAULT NULL COMMENT '调度时间',
  `is_delete` tinyint NOT NULL COMMENT '数据记录状态 : 0:使用中 1:该记录已删除',
  `alter_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`scheduling_id`) USING BTREE,
  INDEX `FK_Scheduling_Truck`(`fk_truck_id` ASC) USING BTREE,
  INDEX `FK_Scheduling_User`(`fk_user_id` ASC) USING BTREE,
  CONSTRAINT `FK_Scheduling_Truck` FOREIGN KEY (`fk_truck_id`) REFERENCES `truck` (`truck_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Scheduling_User` FOREIGN KEY (`fk_user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度作业信息表用于存放和管理调度作业信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scheduling
-- ----------------------------

-- ----------------------------
-- Table structure for truck
-- ----------------------------
DROP TABLE IF EXISTS `truck`;
CREATE TABLE `truck`  (
  `truck_id` int NOT NULL AUTO_INCREMENT COMMENT '车辆编号（字段自动编号）',
  `number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '车牌号码',
  `buy_date` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '购车日期',
  `truck_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '车辆类型',
  `tonnage` int NOT NULL COMMENT '吨位',
  `fk_team_id` int NOT NULL COMMENT '所属车队编号',
  `state` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '工作状态',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '备注',
  `check_in_time` datetime NOT NULL COMMENT '加入时间',
  `alter_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`truck_id`) USING BTREE,
  INDEX `FK_Truck_TruckTeam`(`fk_team_id` ASC) USING BTREE,
  CONSTRAINT `FK_Truck_TruckTeam` FOREIGN KEY (`fk_team_id`) REFERENCES `truck_team` (`team_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '车辆信息表用于存放和管理车辆信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of truck
-- ----------------------------
INSERT INTO `truck` VALUES (1, '湘A12345', '2022-10-01', '大货车', 20, 1, '空闲', '无', '2023-07-11 17:17:32', '2023-07-11 17:17:32');

-- ----------------------------
-- Table structure for truck_team
-- ----------------------------
DROP TABLE IF EXISTS `truck_team`;
CREATE TABLE `truck_team`  (
  `team_id` int NOT NULL AUTO_INCREMENT COMMENT '车队编号（字段自动编号）',
  `team_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '车队名称',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '车队负责人',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '备注',
  `check_in_time` datetime NOT NULL COMMENT '创队时间',
  `alter_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`team_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '车队信息表用于存放和管理车队信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of truck_team
-- ----------------------------
INSERT INTO `truck_team` VALUES (1, 'hhh', '清', '无', '2023-07-11 15:27:34', '2023-07-11 15:27:37');
INSERT INTO `truck_team` VALUES (3, 'bbb', '李四', '无', '2023-07-11 16:54:28', '2023-07-11 16:54:28');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '用户编号（字段自动编号）',
  `role_id` int NOT NULL COMMENT '用户角色编号',
  `account` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户密码',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户姓名',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '性别',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '电子邮箱',
  `check_in_time` datetime NOT NULL COMMENT '加入时间',
  `alter_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `account`(`account` ASC) USING BTREE,
  INDEX `FK_User_Role`(`role_id` ASC) USING BTREE,
  CONSTRAINT `FK_User_Role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统用户表用于存放用户账户密码信息及用户信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 1, 'abc', '123', 'hahah', '男', '15813482972', '12345@test.com', '2023-07-06 11:13:01', '2023-07-11 13:10:38');
INSERT INTO `user` VALUES (3, 2, 'fwf57', '8vvnreWH', '李四', '男', '98765432100', '9876543210@csu.edu.com', '2023-07-11 09:49:05', '2023-07-11 09:49:05');

-- ----------------------------
-- View structure for view_cost
-- ----------------------------
DROP VIEW IF EXISTS `view_cost`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_cost` AS select `carriers`.`carriers_id` AS `carriers_id`,`truck`.`truck_id` AS `truck_id`,`truck`.`number` AS `number`,`truck_team`.`team_id` AS `team_id`,`truck_team`.`team_name` AS `team_name`,`driver`.`driver_id` AS `driver_id`,`driver`.`name` AS `name`,`user`.`user_id` AS `salesman_id`,`user`.`account` AS `username`,`carriers`.`total_cost` AS `income`,`scheduling`.`total_cost` AS `expenditure`,`carriers`.`insurance_cost` AS `insurance_cost`,`carriers`.`transport_cost` AS `transport_cost`,`carriers`.`other_cost` AS `other_income_cost`,`scheduling`.`oil_cost` AS `oil_cost`,`scheduling`.`fine` AS `fine`,`scheduling`.`toll` AS `toll`,`scheduling`.`other_cost` AS `other_expenditure_cost`,`carriers`.`receive_date` AS `receive_date` from (((((`carriers` join `user` on((`carriers`.`fk_user_id` = `user`.`user_id`))) join `truck`) join `truck_team` on((`truck`.`fk_team_id` = `truck_team`.`team_id`))) join `driver` on((`truck_team`.`team_id` = `driver`.`fk_team_id`))) join `scheduling` on(((`truck`.`truck_id` = `scheduling`.`fk_truck_id`) and (`user`.`user_id` = `scheduling`.`fk_user_id`))));

SET FOREIGN_KEY_CHECKS = 1;
