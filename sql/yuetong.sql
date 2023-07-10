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

 Date: 07/07/2023 16:43:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for carriers
-- ----------------------------
DROP TABLE IF EXISTS `carriers`;
CREATE TABLE `carriers`  (
  `carriers_id` int NOT NULL AUTO_INCREMENT COMMENT '承运单编号（字段自动编号）',
  `send_company` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发货单位',
  `send_address` varchar(100) CHARACTER SET armscii8 COLLATE armscii8_general_ci NULL DEFAULT NULL COMMENT '发货单位地址',
  `send_linkman` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发货人',
  `send_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发货人电话',
  `receive_company` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货单位',
  `fk_receive_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货单位地址',
  `receive_linkman` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人/联系人',
  `receive_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人电话/联系人电话',
  `leaver_date` datetime NULL DEFAULT NULL COMMENT '承运日期',
  `receive_date` datetime NULL DEFAULT NULL COMMENT '收货时间',
  `finished_state` tinyint NOT NULL COMMENT '完成情况：0:待调度 1:已调度 2:已签收 3:已结算',
  `insurance_cost` float NULL DEFAULT NULL COMMENT '保险费',
  `transport_cost` float NULL DEFAULT NULL COMMENT '运费',
  `other_cost` float NULL DEFAULT NULL COMMENT '其他费用',
  `total_cost` float NULL DEFAULT NULL COMMENT '合计费用',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `fk_user_id` int NOT NULL COMMENT '业务员',
  `check_in_time` datetime NOT NULL COMMENT '录入时间',
  `is_delete` tinyint NOT NULL COMMENT '数据记录状态 : 0:使用中 1:该记录已删',
  `alter_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`carriers_id`) USING BTREE,
  INDEX `FK_Carriers_User`(`fk_user_id` ASC) USING BTREE,
  CONSTRAINT `FK_Carriers_User` FOREIGN KEY (`fk_user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '承运单信息表用于存放和管理承运单信息' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '车辆司机关联表用于连接车辆与驾驶员' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of contact
-- ----------------------------

-- ----------------------------
-- Table structure for driver
-- ----------------------------
DROP TABLE IF EXISTS `driver`;
CREATE TABLE `driver`  (
  `driver_id` int NOT NULL AUTO_INCREMENT COMMENT '司机编号（字段自动编号）',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '司机姓名',
  `sex` tinyint NULL DEFAULT NULL COMMENT '性别 ： 0男 1女',
  `birth` datetime NULL DEFAULT NULL COMMENT '出生日期',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `id_card` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证号码',
  `fk_team_id` int NULL DEFAULT NULL COMMENT '车队编号',
  `state` tinyint NULL DEFAULT NULL COMMENT '工作状态 : 1:承运中 2:空闲',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `check_in_time` datetime NULL DEFAULT NULL COMMENT '加入时间',
  `is_delete` tinyint NULL DEFAULT NULL COMMENT '数据记录状态 : 0:使用中 1:该记录已删除',
  `alter_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`driver_id`) USING BTREE,
  INDEX `FK_Driver_TruckTeam`(`fk_team_id` ASC) USING BTREE,
  CONSTRAINT `FK_Driver_TruckTeam` FOREIGN KEY (`fk_team_id`) REFERENCES `truck_team` (`team_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '驾驶员信息表用于存放和管理驾驶员信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of driver
-- ----------------------------

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `goods_id` int NOT NULL AUTO_INCREMENT COMMENT '货物编号（字段自动编号）',
  `goods_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '货物名称',
  `amount` int NULL DEFAULT NULL COMMENT '货物数量',
  `weight` float NULL DEFAULT NULL COMMENT '货物重量',
  `volume` float NULL DEFAULT NULL COMMENT '货物体积',
  `fk_carriers_id` int NULL DEFAULT NULL COMMENT '承运单编号',
  `is_delete` tinyint NOT NULL COMMENT '数据记录状态 : 0:使用中 1:该记录已删除',
  PRIMARY KEY (`goods_id`) USING BTREE,
  INDEX `FK_Goods_Carriers`(`fk_carriers_id` ASC) USING BTREE,
  CONSTRAINT `FK_Goods_Carriers` FOREIGN KEY (`fk_carriers_id`) REFERENCES `carriers` (`carriers_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '货物单信息表用于存放和管理货物单信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------

-- ----------------------------
-- Table structure for log_dic
-- ----------------------------
DROP TABLE IF EXISTS `log_dic`;
CREATE TABLE `log_dic`  (
  `type_id` int NOT NULL AUTO_INCREMENT COMMENT '类型 ID（字段自动编号）',
  `type_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型名',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统日志信息表用于存放系统日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log_dic
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` int NOT NULL AUTO_INCREMENT COMMENT '角色编号（字段自动编号）',
  `role_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `role_purview` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色权限，多个权限用 / 区分',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统角色表用于存放系统权限数据，管理用户权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '承运业务员', 'a/123');

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
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `check_in_time` datetime NULL DEFAULT NULL COMMENT '调度时间',
  `is_delete` tinyint NOT NULL COMMENT '数据记录状态 : 0:使用中 1:该记录已删除',
  `alter_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`scheduling_id`) USING BTREE,
  INDEX `FK_Scheduling_Truck`(`fk_truck_id` ASC) USING BTREE,
  INDEX `FK_Scheduling_User`(`fk_user_id` ASC) USING BTREE,
  CONSTRAINT `FK_Scheduling_Truck` FOREIGN KEY (`fk_truck_id`) REFERENCES `truck` (`truck_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Scheduling_User` FOREIGN KEY (`fk_user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '调度作业信息表用于存放和管理调度作业信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scheduling
-- ----------------------------

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `log_id` int NOT NULL AUTO_INCREMENT COMMENT '日志编号（字段自动编号）',
  `behavior` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作行为',
  `fk_type_id` int NULL DEFAULT NULL COMMENT '行为类型',
  `fk_user_id` int NULL DEFAULT NULL COMMENT '用户ID',
  `parameters` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数',
  `proc_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '存储过程名',
  `ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录 IP',
  `check_in_time` datetime NULL DEFAULT NULL COMMENT '写入时间',
  `exception` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异常信息详情',
  `is_exception` tinyint NULL DEFAULT NULL COMMENT '0：正常 1：异常',
  PRIMARY KEY (`log_id`) USING BTREE,
  INDEX `FK_SysLog_LogDic`(`fk_type_id` ASC) USING BTREE,
  INDEX `FK_SysLog_User`(`fk_user_id` ASC) USING BTREE,
  CONSTRAINT `FK_SysLog_LogDic` FOREIGN KEY (`fk_type_id`) REFERENCES `log_dic` (`type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_SysLog_User` FOREIGN KEY (`fk_user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统日志信息表用于存放系统日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for truck
-- ----------------------------
DROP TABLE IF EXISTS `truck`;
CREATE TABLE `truck`  (
  `truck_id` int NOT NULL AUTO_INCREMENT COMMENT '车辆编号（字段自动编号）',
  `number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车牌号码',
  `buy_date` datetime NULL DEFAULT NULL COMMENT '购车日期',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆类型',
  `tonnage` int NULL DEFAULT NULL COMMENT '吨位',
  `fk_team_id` int NULL DEFAULT NULL COMMENT '所属车队编号',
  `state` tinyint NULL DEFAULT NULL COMMENT '工作状态 : 1:承运中 2:空闲',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `check_in_time` datetime NULL DEFAULT NULL COMMENT '加入时间',
  `is_delete` tinyint NOT NULL COMMENT '数据记录状态 : 0:使用中 1:该记录已删',
  `alter_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`truck_id`) USING BTREE,
  INDEX `FK_Truck_TruckTeam`(`fk_team_id` ASC) USING BTREE,
  CONSTRAINT `FK_Truck_TruckTeam` FOREIGN KEY (`fk_team_id`) REFERENCES `truck_team` (`team_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '车辆信息表用于存放和管理车辆信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of truck
-- ----------------------------

-- ----------------------------
-- Table structure for truck_team
-- ----------------------------
DROP TABLE IF EXISTS `truck_team`;
CREATE TABLE `truck_team`  (
  `team_id` int NOT NULL AUTO_INCREMENT COMMENT '车队编号（字段自动编号）',
  `team_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT ' 车队名称',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车队负责人',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `check_in_time` datetime NULL DEFAULT NULL COMMENT '创队时间',
  `is_delete` tinyint NULL DEFAULT NULL COMMENT '数据记录状态 0:使用中 1:该记录已删',
  `alter_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`team_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '车队信息表用于存放和管理车队信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of truck_team
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `role_id` int NOT NULL COMMENT '用户角色编号',
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '用户编号（字段自动编号）',
  `account` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户密码',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户姓名',
  `sex` tinyint NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `check_in_time` datetime NOT NULL COMMENT '加入时间',
  `is_delete` tinyint NOT NULL COMMENT '数据记录状态 0:使用中 1:该记录已删除',
  `alter_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `account`(`account` ASC) USING BTREE,
  INDEX `FK_User_Role`(`role_id` ASC) USING BTREE,
  CONSTRAINT `FK_User_Role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统用户表用于存放用户账户密码信息及用户信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 1, 'abc', '123', 'hahah', NULL, NULL, NULL, '2023-07-06 11:13:01', 0, '2023-07-06 11:13:11');

-- ----------------------------
-- View structure for view_cost
-- ----------------------------
DROP VIEW IF EXISTS `view_cost`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_cost` AS select `carriers`.`carriers_id` AS `carriers_id`,`truck`.`truck_id` AS `truck_id`,`truck`.`number` AS `number`,`truck_team`.`team_id` AS `team_id`,`truck_team`.`team_name` AS `team_name`,`driver`.`driver_id` AS `driver_id`,`driver`.`name` AS `name`,`user`.`user_id` AS `salesman_id`,`user`.`account` AS `username`,`carriers`.`total_cost` AS `income`,`scheduling`.`total_cost` AS `expenditure`,`carriers`.`insurance_cost` AS `insurance_cost`,`carriers`.`transport_cost` AS `transport_cost`,`carriers`.`other_cost` AS `other_income_cost`,`scheduling`.`oil_cost` AS `oil_cost`,`scheduling`.`fine` AS `fine`,`scheduling`.`toll` AS `toll`,`scheduling`.`other_cost` AS `other_expenditure_cost`,`carriers`.`receive_date` AS `receive_date` from (((((`carriers` join `user` on((`carriers`.`fk_user_id` = `user`.`user_id`))) join `truck`) join `truck_team` on((`truck`.`fk_team_id` = `truck_team`.`team_id`))) join `driver` on((`truck_team`.`team_id` = `driver`.`fk_team_id`))) join `scheduling` on(((`truck`.`truck_id` = `scheduling`.`fk_truck_id`) and (`user`.`user_id` = `scheduling`.`fk_user_id`))));

SET FOREIGN_KEY_CHECKS = 1;
