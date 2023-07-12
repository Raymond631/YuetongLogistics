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

 Date: 12/07/2023 21:52:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for carriers
-- ----------------------------
DROP TABLE IF EXISTS `carriers`;
CREATE TABLE `carriers`  (
  `carriers_id` int NOT NULL AUTO_INCREMENT COMMENT '承运单编号（字段自动编号）',
  `send_company` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发货单位',
  `send_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发货单位地址',
  `send_linkman` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发货人',
  `send_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发货人电话',
  `receive_company` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收货单位',
  `receive_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收货单位地址',
  `receive_linkman` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收货人',
  `receive_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收货人电话',
  `leaver_date` date NOT NULL COMMENT '承运日期',
  `receive_date` datetime NULL DEFAULT NULL COMMENT '收货时间',
  `finished_state` int NOT NULL COMMENT '完成情况（0:待调度 1:运输中 2:已完成 3:成本已录入）',
  `insurance_cost` double NOT NULL COMMENT '保险费',
  `transport_cost` double NOT NULL COMMENT '运费',
  `other_cost` double NOT NULL COMMENT '其他费用',
  `total_cost` double NOT NULL COMMENT '合计费用',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '备注',
  `account` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '承运业务员',
  `check_in_time` datetime NOT NULL COMMENT '录入时间',
  `alter_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`carriers_id`) USING BTREE,
  INDEX `FK_Carriers_User`(`account` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '承运单信息表用于存放和管理承运单信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of carriers
-- ----------------------------

-- ----------------------------
-- Table structure for contact
-- ----------------------------
DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact`  (
  `contact_id` int NOT NULL AUTO_INCREMENT COMMENT '联系编号（字段自动编号）',
  `fk_truck_id` int NOT NULL COMMENT '车辆编号',
  `fk_driver_id` int NOT NULL COMMENT '司机编号',
  PRIMARY KEY (`contact_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '车辆司机关联表用于连接车辆与驾驶员' ROW_FORMAT = DYNAMIC;

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
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '性别',
  `birth` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '出生日期',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系电话',
  `id_card` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '身份证号码',
  `fk_team_id` int NOT NULL COMMENT '车队编号',
  `state` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工作状态（承运中、空闲）',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '备注',
  `check_in_time` datetime NOT NULL COMMENT '加入时间',
  `alter_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`driver_id`) USING BTREE,
  INDEX `FK_Driver_TruckTeam`(`fk_team_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '驾驶员信息表用于存放和管理驾驶员信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of driver
-- ----------------------------

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `goods_id` int NOT NULL AUTO_INCREMENT COMMENT '货物编号（字段自动编号）',
  `fk_carriers_id` int NOT NULL COMMENT '承运单编号',
  `goods_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '货物名称',
  `amount` int NOT NULL COMMENT '货物数量',
  `weight` double NOT NULL COMMENT '货物重量',
  `volume` double NOT NULL COMMENT '货物体积',
  PRIMARY KEY (`goods_id`) USING BTREE,
  INDEX `FK_Goods_Carriers`(`fk_carriers_id` ASC) USING BTREE,
  CONSTRAINT `FK_Goods_Carriers` FOREIGN KEY (`fk_carriers_id`) REFERENCES `carriers` (`carriers_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '货物单信息表用于存放和管理货物单信息' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '登录日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of log_login
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of log_operate
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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统角色表用于存放系统权限数据，管理用户权限' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '系统管理员', 'system');
INSERT INTO `role` VALUES (2, '运输管理员', 'fleet');
INSERT INTO `role` VALUES (3, '承运业务员', 'carrier');
INSERT INTO `role` VALUES (4, '调度员', 'scheduling');
INSERT INTO `role` VALUES (5, '财务人员', 'cost');
INSERT INTO `role` VALUES (6, '测试人员', 'system/fleet/carrier/scheduling/cost');

-- ----------------------------
-- Table structure for scheduling
-- ----------------------------
DROP TABLE IF EXISTS `scheduling`;
CREATE TABLE `scheduling`  (
  `scheduling_id` int NOT NULL AUTO_INCREMENT COMMENT '调度编号（字段自动编号）',
  `start_time` datetime NOT NULL COMMENT '出发时间',
  `fk_carriers_id` int NOT NULL COMMENT '承运单编号',
  `fk_truck_id` int NOT NULL COMMENT '车辆编号',
  `oil_cost` double NULL DEFAULT NULL COMMENT '油费',
  `toll` double NULL DEFAULT NULL COMMENT '过桥费',
  `fine` double NULL DEFAULT NULL COMMENT '罚款',
  `other_cost` double NULL DEFAULT NULL COMMENT '其他费用',
  `total_cost` double NULL DEFAULT NULL COMMENT '合计成本',
  `account` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度员',
  `check_in_time` datetime NOT NULL COMMENT '调度时间',
  `alter_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`scheduling_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '调度作业信息表用于存放和管理调度作业信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of scheduling
-- ----------------------------

-- ----------------------------
-- Table structure for truck
-- ----------------------------
DROP TABLE IF EXISTS `truck`;
CREATE TABLE `truck`  (
  `truck_id` int NOT NULL AUTO_INCREMENT COMMENT '车辆编号（字段自动编号）',
  `number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车牌号码',
  `buy_date` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '购车日期',
  `truck_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车辆类型',
  `tonnage` int NOT NULL COMMENT '吨位',
  `fk_team_id` int NOT NULL COMMENT '所属车队编号',
  `state` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工作状态',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '备注',
  `check_in_time` datetime NOT NULL COMMENT '加入时间',
  `alter_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`truck_id`) USING BTREE,
  INDEX `FK_Truck_TruckTeam`(`fk_team_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '车辆信息表用于存放和管理车辆信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of truck
-- ----------------------------

-- ----------------------------
-- Table structure for truck_team
-- ----------------------------
DROP TABLE IF EXISTS `truck_team`;
CREATE TABLE `truck_team`  (
  `team_id` int NOT NULL AUTO_INCREMENT COMMENT '车队编号（字段自动编号）',
  `team_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车队名称',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车队负责人',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '备注',
  `check_in_time` datetime NOT NULL COMMENT '创队时间',
  `alter_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`team_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '车队信息表用于存放和管理车队信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of truck_team
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '用户编号（字段自动编号）',
  `role_id` int NOT NULL COMMENT '用户角色编号',
  `account` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户密码',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户姓名',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '性别',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '电子邮箱',
  `check_in_time` datetime NOT NULL COMMENT '加入时间',
  `alter_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `account`(`account` ASC) USING BTREE,
  INDEX `FK_User_Role`(`role_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统用户表用于存放用户账户密码信息及用户信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 6, 'abc', '123', 'hahah', '男', '15813482972', '12345@test.com', '2023-07-06 11:13:01', '2023-07-11 13:10:38');
INSERT INTO `user` VALUES (2, 2, 'pr', '123', '李四', '男', '98765432100', '9876543210@csu.edu.com', '2023-07-11 09:49:05', '2023-07-11 09:49:05');

SET FOREIGN_KEY_CHECKS = 1;
