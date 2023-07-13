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

 Date: 13/07/2023 18:32:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for carriers
-- ----------------------------
DROP TABLE IF EXISTS `carriers`;
CREATE TABLE `carriers`  (
  `carriers_id` int NOT NULL AUTO_INCREMENT COMMENT '承运单编号（字段自动编号）',
  `send_company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发货单位',
  `send_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发货单位地址',
  `send_linkman` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发货人',
  `send_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发货人电话',
  `receive_company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收货单位',
  `receive_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收货单位地址',
  `receive_linkman` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收货人',
  `receive_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收货人电话',
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
INSERT INTO `carriers` VALUES (1, 'qui', '云南省佳木斯市雁江区', 'elit ut sunt', '19840510269', 'ad Ut', '四川省三沙市景谷傣族彝族自治县', 'ut', '13138768380', '1988-01-07', NULL, 1, 9, 81, 23, 113, 'labore tempor exercitation pariatur deserunt', 'abc', '2023-07-12 22:53:23', '2023-07-12 22:53:23');
INSERT INTO `carriers` VALUES (2, 'nisi officia cupidatat', '内蒙古自治区楚雄彝族自治州腾冲县', 'dolore', '18138488508', 'enim Excepteur', '重庆九龙友谊县', 'in et', '18134034468', '1981-06-05', '2023-07-13 12:57:36', 3, 47, 77, 2, 126, 'officia nostrud cillum dolore', 'pr', '2023-07-13 12:52:22', '2023-07-13 12:52:22');
INSERT INTO `carriers` VALUES (3, 'nisi officia cupidatat', '内蒙古自治区楚雄彝族自治州腾冲县', 'dolore', '18138488508', 'enim Excepteur', '重庆九龙友谊县', 'in et', '18134034468', '1981-06-05', NULL, 1, 47, 77, 2, 126, 'officia nostrud cillum dolore', 'carrier', '2023-07-13 12:54:28', '2023-07-13 12:54:28');
INSERT INTO `carriers` VALUES (4, 'consequat dolor', '河北省上海市细河区', 'Excepte', '13568548132', 'dolore tempor', '河北省天津市其它区', 'velit', '18196211785', '1981-07-29', NULL, 1, 59, 69, 14, 142, 'pariatur consequat deserunt Duis incididunt', 'carrier', '2023-07-13 12:54:58', '2023-07-13 12:54:58');
INSERT INTO `carriers` VALUES (5, 'tempor', '四川省铜川市西塞山区', 'amet', '18117087744', 'consequat enim irure', '海外楚雄彝族自治州其它区', 'int', '19831783463', '2021-03-08', NULL, 0, 58, 29, 71, 158, 'Lorem occaecat laborum pariatur', 'carrier', '2023-07-13 12:55:07', '2023-07-13 12:55:07');
INSERT INTO `carriers` VALUES (6, 'do', '黑龙江省临沧市广汉市', 'occaec', '18174095150', 'ullamco', '江苏省遵义市诸暨市', 'cillu', '18144843166', '1985-08-16', NULL, 0, 12, 35, 62, 109, 'proident', 'carrier', '2023-07-13 12:55:15', '2023-07-13 12:55:15');
INSERT INTO `carriers` VALUES (7, 'in nostrud in', '澳门特别行政区北京市应城市', 'laborum', '18653421121', 'venia', '河北省长春市其它区', 'dolor Lorem', '18145839783', '1977-07-16', NULL, 0, 69, 63, 92, 224, 'veniam consequat magna est', 'carrier', '2023-07-13 12:55:29', '2023-07-13 12:55:29');
INSERT INTO `carriers` VALUES (8, 'mollit amet minim', '山东省玉林市南区', 'non labore in', '19848185972', 'dolor exercitation commodo sit aute', '海南省运城市铁东区', 'irure aliquip ut enim', '13277832224', '2016-11-04', NULL, 0, 10, 40, 53, 103, 'aliquip incididunt amet consequat nulla', 'carrier', '2023-07-13 13:06:44', '2023-07-13 13:06:44');
INSERT INTO `carriers` VALUES (9, '清华大学', '山东省玉林市南区', 'non', '19848185972', '中南大学', '海南省运城市铁东区', 'irure ', '13277832224', '2016-11-04', '2023-07-13 14:40:00', 3, 10, 40, 53, 103, 'aliquip incididunt amet consequat nulla', 'carrier', '2023-07-13 14:22:38', '2023-07-13 14:22:38');
INSERT INTO `carriers` VALUES (10, '北京大学', '山东省玉林市南区', 'non labore in', '19848185972', '铁道学院', '海南省运城市铁东区', 'irure aliquip ut enim', '13277832224', '2016-11-04', NULL, 0, 10, 40, 53, 103, 'amet consequat nulla', 'carrier', '2023-07-13 14:24:07', '2023-07-13 14:24:07');
INSERT INTO `carriers` VALUES (11, '湖南林科大', '山东省玉林市南区', 'non labore in', '19848185972', '南京大学', '海南省运城市铁东区', 'irure aliqui', '13277832224', '2016-11-04', '2023-07-13 15:51:19', 3, 10, 40, 53, 103, 'aliquip incididunt amet consequat nulla', 'carrier', '2023-07-13 15:49:19', '2023-07-13 15:49:19');
INSERT INTO `carriers` VALUES (12, '湖南林科大', '山东省玉林市南区', 'non lab', '19848185972', '中南大学', '海南省运城市铁东区', 'irure ali', '13277832224', '2016-11-04', '2023-07-13 16:25:36', 3, 10, 40, 53, 103, 'aliquip incididunt amet consequat nulla', 'carrier', '2023-07-13 16:22:47', '2023-07-13 16:22:47');

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
INSERT INTO `contact` VALUES (1, 1, 1);
INSERT INTO `contact` VALUES (2, 2, 2);
INSERT INTO `contact` VALUES (3, 3, 3);
INSERT INTO `contact` VALUES (4, 4, 4);
INSERT INTO `contact` VALUES (9, 7, 8);
INSERT INTO `contact` VALUES (10, 5, 7);
INSERT INTO `contact` VALUES (11, 8, 9);
INSERT INTO `contact` VALUES (12, 9, 6);

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
INSERT INTO `driver` VALUES (1, '张三', '男', '1988-10-01', '12345678900', '123456789123456789', 1, 'Working', '无', '2023-07-12 22:51:58', '2023-07-12 22:51:58');
INSERT INTO `driver` VALUES (2, '李四', '男', '1975-01-21', '98765432100', '123456789123456789', 1, 'Working', '无', '2023-07-12 22:51:58', '2023-07-12 22:51:58');
INSERT INTO `driver` VALUES (3, '王五', '男', '1988-10-01', '12345678900', '123456789123456789', 1, 'Working', '无', '2023-07-13 12:07:45', '2023-07-13 12:07:45');
INSERT INTO `driver` VALUES (4, '赵六', '男', '1975-01-21', '98765432100', '123456789123456789', 1, 'Working', '无', '2023-07-13 12:07:45', '2023-07-13 12:07:45');
INSERT INTO `driver` VALUES (6, '吴九', '男', '1975-01-21', '98765432100', '123456789123456789', 1, 'Free', '无', '2023-07-13 12:07:45', '2023-07-13 12:07:45');
INSERT INTO `driver` VALUES (7, '蔡十', '男', '1975-01-21', '98765432100', '123456789123456789', 1, 'Working', '无', '2023-07-13 12:07:45', '2023-07-13 12:07:45');
INSERT INTO `driver` VALUES (8, '李一', '男', '1975-01-21', '98765432100', '123456789123456789', 1, 'Working', '无', '2023-07-13 12:07:45', '2023-07-13 12:07:45');
INSERT INTO `driver` VALUES (9, '李二', '男', '1975-01-21', '98765432100', '123456789123456789', 1, 'Working', '无', '2023-07-13 12:07:45', '2023-07-13 12:07:45');
INSERT INTO `driver` VALUES (10, '李三', '男', '1975-01-21', '98765432100', '123456789123456789', 1, 'Free', '无', '2023-07-13 12:07:45', '2023-07-13 12:07:45');
INSERT INTO `driver` VALUES (11, '李四', '男', '1975-01-21', '98765432100', '123456789123456789', 1, 'Free', '无', '2023-07-13 12:07:45', '2023-07-13 12:07:45');
INSERT INTO `driver` VALUES (12, '李四', '男', '1975-01-21', '98765432100', '123456789123456789', 1, 'Free', '无', '2023-07-13 12:07:45', '2023-07-13 12:07:45');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `goods_id` int NOT NULL AUTO_INCREMENT COMMENT '货物编号（字段自动编号）',
  `fk_carriers_id` int NOT NULL COMMENT '承运单编号',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '货物名称',
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
INSERT INTO `goods` VALUES (1, 1, '问马青', 67, 59, 0);
INSERT INTO `goods` VALUES (2, 1, '根强农', 46, 85, 0);
INSERT INTO `goods` VALUES (3, 2, '出表治学理心', 44, 27, 0);
INSERT INTO `goods` VALUES (4, 3, '出表治学理心', 44, 27, 0);
INSERT INTO `goods` VALUES (5, 4, '织大群证使圆', 3, 66, 0);
INSERT INTO `goods` VALUES (6, 4, '没六声具', 30, 32, 0);
INSERT INTO `goods` VALUES (7, 4, '发力直管号', 27, 13, 0);
INSERT INTO `goods` VALUES (8, 4, '种信观命级', 21, 36, 0);
INSERT INTO `goods` VALUES (9, 5, '教马生', 89, 88, 0);
INSERT INTO `goods` VALUES (10, 5, '众只知', 99, 14, 0);
INSERT INTO `goods` VALUES (11, 5, '毛水图性', 68, 31, 0);
INSERT INTO `goods` VALUES (12, 6, '方重物据四严', 4, 10, 0);
INSERT INTO `goods` VALUES (13, 7, '规教可王再', 91, 22, 0);
INSERT INTO `goods` VALUES (14, 7, '转消很适位', 47, 71, 0);
INSERT INTO `goods` VALUES (15, 7, '百回五然与队', 4, 86, 0);
INSERT INTO `goods` VALUES (16, 8, '当叫八存并', 38, 24.12, 0);
INSERT INTO `goods` VALUES (17, 8, '者家头达', 24, 92.12, 0);
INSERT INTO `goods` VALUES (18, 9, '书包', 38, 24.12, 0);
INSERT INTO `goods` VALUES (19, 9, '课本', 24, 92.12, 0);
INSERT INTO `goods` VALUES (20, 10, '笔记本', 38, 24.12, 0);
INSERT INTO `goods` VALUES (21, 10, '钢笔', 24, 92.12, 0);
INSERT INTO `goods` VALUES (22, 11, '鼠标', 38, 24.12, 0);
INSERT INTO `goods` VALUES (23, 11, '键盘', 24, 92.12, 0);
INSERT INTO `goods` VALUES (24, 12, '老虎', 38, 24.12, 0);
INSERT INTO `goods` VALUES (25, 12, '豹子', 24, 92.12, 0);

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
INSERT INTO `log_login` VALUES (13, 'abc', 'success', '登录成功', '127.0.0.1', '2023-07-12 22:41:47');
INSERT INTO `log_login` VALUES (14, 'pr', 'success', '登录成功', '192.168.3.187', '2023-07-12 23:35:10');
INSERT INTO `log_login` VALUES (15, 'abc', 'success', '登录成功', '127.0.0.1', '2023-07-13 07:25:30');
INSERT INTO `log_login` VALUES (16, 'abc', 'success', '登录成功', '192.168.3.107', '2023-07-13 07:53:51');
INSERT INTO `log_login` VALUES (17, 'abc', 'success', '登录成功', '192.168.3.107', '2023-07-13 07:54:33');
INSERT INTO `log_login` VALUES (18, 'pr', 'success', '登录成功', '192.168.3.107', '2023-07-13 07:54:52');
INSERT INTO `log_login` VALUES (19, 'pr', 'success', '登录成功', '192.168.3.107', '2023-07-13 08:07:52');
INSERT INTO `log_login` VALUES (20, 'pr', 'success', '登录成功', '127.0.0.1', '2023-07-13 08:41:00');
INSERT INTO `log_login` VALUES (21, 'pr', 'failed', '验证码错误', '127.0.0.1', '2023-07-13 08:47:37');
INSERT INTO `log_login` VALUES (22, 'pr', 'failed', '验证码错误', '127.0.0.1', '2023-07-13 08:47:42');
INSERT INTO `log_login` VALUES (23, 'pr', 'failed', '验证码错误', '127.0.0.1', '2023-07-13 08:47:51');
INSERT INTO `log_login` VALUES (24, 'pr', 'success', '登录成功', '127.0.0.1', '2023-07-13 08:47:59');
INSERT INTO `log_login` VALUES (25, 'pr', 'success', '登录成功', '127.0.0.1', '2023-07-13 08:54:58');
INSERT INTO `log_login` VALUES (26, 'pr', 'success', '登录成功', '127.0.0.1', '2023-07-13 08:59:21');
INSERT INTO `log_login` VALUES (27, 'pr', 'success', '登录成功', '127.0.0.1', '2023-07-13 09:01:03');
INSERT INTO `log_login` VALUES (28, 'pr', 'success', '登录成功', '127.0.0.1', '2023-07-13 09:09:12');
INSERT INTO `log_login` VALUES (29, 'abc', 'success', '登录成功', '127.0.0.1', '2023-07-13 09:12:54');
INSERT INTO `log_login` VALUES (30, 'pr', 'success', '登录成功', '127.0.0.1', '2023-07-13 09:23:23');
INSERT INTO `log_login` VALUES (31, 'pr', 'success', '登录成功', '127.0.0.1', '2023-07-13 09:23:42');
INSERT INTO `log_login` VALUES (32, 'pr', 'success', '登录成功', '127.0.0.1', '2023-07-13 09:24:07');
INSERT INTO `log_login` VALUES (33, 'pr', 'failed', '验证码错误', '127.0.0.1', '2023-07-13 09:36:41');
INSERT INTO `log_login` VALUES (34, 'pr', 'success', '登录成功', '127.0.0.1', '2023-07-13 09:37:46');
INSERT INTO `log_login` VALUES (35, 'pr', 'success', '登录成功', '127.0.0.1', '2023-07-13 09:43:54');
INSERT INTO `log_login` VALUES (36, 'pr', 'success', '登录成功', '127.0.0.1', '2023-07-13 09:46:17');
INSERT INTO `log_login` VALUES (37, 'pr', 'success', '登录成功', '127.0.0.1', '2023-07-13 10:00:41');
INSERT INTO `log_login` VALUES (38, 'pr', 'success', '登录成功', '127.0.0.1', '2023-07-13 10:47:53');
INSERT INTO `log_login` VALUES (39, 'pr', 'success', '登录成功', '192.168.48.33', '2023-07-13 11:43:31');
INSERT INTO `log_login` VALUES (40, 'pr', 'success', '登录成功', '192.168.48.33', '2023-07-13 11:54:17');
INSERT INTO `log_login` VALUES (41, 'pr', 'success', '登录成功', '192.168.48.4', '2023-07-13 12:15:00');
INSERT INTO `log_login` VALUES (42, 'pr', 'success', '登录成功', '192.168.48.4', '2023-07-13 12:17:27');
INSERT INTO `log_login` VALUES (43, 'pr', 'success', '登录成功', '192.168.48.4', '2023-07-13 12:32:05');
INSERT INTO `log_login` VALUES (44, 'pr', 'success', '登录成功', '192.168.48.4', '2023-07-13 12:44:15');
INSERT INTO `log_login` VALUES (45, 'pr', 'success', '登录成功', '192.168.48.4', '2023-07-13 12:46:51');
INSERT INTO `log_login` VALUES (46, 'abc', 'success', '登录成功', '127.0.0.1', '2023-07-13 12:48:33');
INSERT INTO `log_login` VALUES (47, 'pr', 'failed', '验证码错误', '192.168.48.4', '2023-07-13 12:58:56');
INSERT INTO `log_login` VALUES (48, 'pr', 'success', '登录成功', '192.168.48.4', '2023-07-13 13:00:08');
INSERT INTO `log_login` VALUES (49, 'pr', 'success', '登录成功', '192.168.48.4', '2023-07-13 13:03:06');
INSERT INTO `log_login` VALUES (50, 'pr', 'success', '登录成功', '192.168.48.4', '2023-07-13 13:03:35');
INSERT INTO `log_login` VALUES (51, 'pr', 'success', '登录成功', '192.168.48.4', '2023-07-13 13:04:10');
INSERT INTO `log_login` VALUES (52, 'pr', 'failed', '验证码错误', '192.168.48.4', '2023-07-13 13:34:58');
INSERT INTO `log_login` VALUES (53, 'pr', 'success', '登录成功', '192.168.48.4', '2023-07-13 13:36:22');
INSERT INTO `log_login` VALUES (54, 'system', 'success', '登录成功', '192.168.48.4', '2023-07-13 13:54:56');
INSERT INTO `log_login` VALUES (55, 'fleet', 'success', '登录成功', '192.168.48.4', '2023-07-13 14:04:24');
INSERT INTO `log_login` VALUES (56, 'carrier', 'success', '登录成功', '192.168.48.4', '2023-07-13 14:16:05');
INSERT INTO `log_login` VALUES (57, 'schedule', 'success', '登录成功', '192.168.48.4', '2023-07-13 14:24:43');
INSERT INTO `log_login` VALUES (58, 'carrier', 'success', '登录成功', '192.168.48.4', '2023-07-13 14:39:44');
INSERT INTO `log_login` VALUES (59, 'cost', 'success', '登录成功', '192.168.48.4', '2023-07-13 14:42:08');
INSERT INTO `log_login` VALUES (60, 'fleet', 'success', '登录成功', '192.168.48.4', '2023-07-13 15:17:37');
INSERT INTO `log_login` VALUES (61, 'carrier', 'success', '登录成功', '192.168.48.4', '2023-07-13 15:22:57');
INSERT INTO `log_login` VALUES (62, 'schedue', 'failed', '用户名或密码错误', '192.168.48.4', '2023-07-13 15:23:28');
INSERT INTO `log_login` VALUES (63, 'carrier', 'success', '登录成功', '192.168.48.4', '2023-07-13 15:30:01');
INSERT INTO `log_login` VALUES (64, 'system', 'success', '登录成功', '192.168.48.4', '2023-07-13 15:36:04');
INSERT INTO `log_login` VALUES (65, 'fleet', 'success', '登录成功', '192.168.48.4', '2023-07-13 15:42:50');
INSERT INTO `log_login` VALUES (66, 'carrier', 'success', '登录成功', '192.168.48.4', '2023-07-13 15:45:05');
INSERT INTO `log_login` VALUES (67, 'schedule', 'success', '登录成功', '192.168.48.4', '2023-07-13 15:50:04');
INSERT INTO `log_login` VALUES (68, 'carrier', 'success', '登录成功', '192.168.48.4', '2023-07-13 15:51:01');
INSERT INTO `log_login` VALUES (69, 'cost', 'success', '登录成功', '192.168.48.4', '2023-07-13 15:51:31');
INSERT INTO `log_login` VALUES (70, 'carrier', 'success', '登录成功', '192.168.48.4', '2023-07-13 16:01:55');
INSERT INTO `log_login` VALUES (71, 'system', 'success', '登录成功', '192.168.48.4', '2023-07-13 16:17:51');
INSERT INTO `log_login` VALUES (72, 'fleet', 'success', '登录成功', '192.168.48.4', '2023-07-13 16:19:53');
INSERT INTO `log_login` VALUES (73, 'carrier', 'success', '登录成功', '192.168.48.4', '2023-07-13 16:21:43');
INSERT INTO `log_login` VALUES (74, 'schedule', 'success', '登录成功', '192.168.48.4', '2023-07-13 16:23:28');
INSERT INTO `log_login` VALUES (75, 'carrier', 'success', '登录成功', '192.168.48.4', '2023-07-13 16:24:31');
INSERT INTO `log_login` VALUES (76, 'schedule', 'success', '登录成功', '192.168.48.4', '2023-07-13 16:24:58');
INSERT INTO `log_login` VALUES (77, 'carrier', 'success', '登录成功', '192.168.48.4', '2023-07-13 16:25:21');
INSERT INTO `log_login` VALUES (78, 'cost', 'success', '登录成功', '192.168.48.4', '2023-07-13 16:25:53');
INSERT INTO `log_login` VALUES (79, 'carrier', 'failed', '验证码错误', '192.168.48.4', '2023-07-13 16:31:48');
INSERT INTO `log_login` VALUES (80, 'carrier', 'success', '登录成功', '192.168.48.4', '2023-07-13 16:32:21');
INSERT INTO `log_login` VALUES (81, 'cost', 'success', '登录成功', '192.168.48.4', '2023-07-13 16:34:27');

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
INSERT INTO `log_operate` VALUES (36, '2023-07-12 22:42:16', 'abc', '127.0.0.1', '批量导入车队', 'IMPORT', 'POST', '/fleet/team/importTeam', 'success', 1462, NULL);
INSERT INTO `log_operate` VALUES (37, '2023-07-12 22:44:08', 'abc', '127.0.0.1', '批量导入车辆', 'IMPORT', 'POST', '/fleet/truck/importTruck', 'success', 72, NULL);
INSERT INTO `log_operate` VALUES (38, '2023-07-12 22:51:57', 'abc', '127.0.0.1', '批量导入司机', 'IMPORT', 'POST', '/fleet/driver/importDriver', 'success', 27, NULL);
INSERT INTO `log_operate` VALUES (39, '2023-07-12 22:52:33', 'abc', '127.0.0.1', '绑定司机和车辆', 'INSERT', 'POST', '/fleet/contact', 'success', 8, NULL);
INSERT INTO `log_operate` VALUES (40, '2023-07-12 22:53:23', 'abc', '127.0.0.1', '录入承运单', 'INSERT', 'POST', '/transport/carrier', 'success', 792, NULL);
INSERT INTO `log_operate` VALUES (41, '2023-07-12 22:53:39', 'abc', '127.0.0.1', '调度承运任务', 'INSERT', 'POST', '/transport/scheduling', 'success', 49, NULL);
INSERT INTO `log_operate` VALUES (42, '2023-07-12 22:54:09', 'abc', '127.0.0.1', '查询本人提交的承运单（运输中）', 'SELECT', 'GET', '/transport/carrier', 'success', 91, NULL);
INSERT INTO `log_operate` VALUES (43, '2023-07-12 23:06:14', 'abc', '127.0.0.1', '查询承运单（待调度）', 'SELECT', 'GET', '/transport/scheduling/getCarriers', 'success', 14, NULL);
INSERT INTO `log_operate` VALUES (44, '2023-07-12 23:06:23', 'abc', '127.0.0.1', '查询承运单（已完成）', 'SELECT', 'GET', '/transport/cost/getCarriers', 'success', 7, NULL);
INSERT INTO `log_operate` VALUES (45, '2023-07-12 23:06:30', 'abc', '127.0.0.1', '查询本人提交的承运单（运输中）', 'SELECT', 'GET', '/transport/carrier', 'success', 22, NULL);
INSERT INTO `log_operate` VALUES (46, '2023-07-12 23:06:37', 'abc', '127.0.0.1', '查询车队列表', 'SELECT', 'GET', '/fleet/team', 'success', 110, NULL);
INSERT INTO `log_operate` VALUES (47, '2023-07-12 23:06:45', 'abc', '127.0.0.1', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 8, NULL);
INSERT INTO `log_operate` VALUES (48, '2023-07-12 23:06:50', 'abc', '127.0.0.1', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 9, NULL);
INSERT INTO `log_operate` VALUES (49, '2023-07-12 23:06:55', 'abc', '127.0.0.1', '查询绑定信息', 'SELECT', 'GET', '/fleet/contact', 'success', 7, NULL);
INSERT INTO `log_operate` VALUES (50, '2023-07-12 23:07:05', 'abc', '127.0.0.1', '查询绑定信息', 'SELECT', 'GET', '/fleet/contact', 'success', 7, NULL);
INSERT INTO `log_operate` VALUES (51, '2023-07-12 23:07:15', 'abc', '127.0.0.1', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 96, NULL);
INSERT INTO `log_operate` VALUES (52, '2023-07-12 23:07:40', 'abc', '127.0.0.1', '查询个人信息', 'SELECT', 'GET', '/system/self/userInfo', 'success', 8, NULL);
INSERT INTO `log_operate` VALUES (53, '2023-07-12 23:35:14', 'pr', '192.168.3.187', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 22, NULL);
INSERT INTO `log_operate` VALUES (54, '2023-07-12 23:36:53', 'pr', '192.168.3.187', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 23, NULL);
INSERT INTO `log_operate` VALUES (55, '2023-07-12 23:37:51', 'pr', '192.168.3.187', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 8, NULL);
INSERT INTO `log_operate` VALUES (56, '2023-07-12 23:41:33', 'pr', '192.168.3.187', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 7, NULL);
INSERT INTO `log_operate` VALUES (57, '2023-07-12 23:41:53', 'pr', '192.168.3.187', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (58, '2023-07-12 23:42:03', 'pr', '192.168.3.187', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 16, NULL);
INSERT INTO `log_operate` VALUES (59, '2023-07-13 07:26:36', 'abc', '127.0.0.1', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'failed', 2121, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'c.account\' ');
INSERT INTO `log_operate` VALUES (60, '2023-07-13 07:27:53', 'abc', '127.0.0.1', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 2018, NULL);
INSERT INTO `log_operate` VALUES (61, '2023-07-13 07:28:48', 'abc', '127.0.0.1', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 81, NULL);
INSERT INTO `log_operate` VALUES (62, '2023-07-13 07:55:04', 'pr', '192.168.3.107', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 205, NULL);
INSERT INTO `log_operate` VALUES (63, '2023-07-13 08:08:02', 'pr', '192.168.3.107', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 147, NULL);
INSERT INTO `log_operate` VALUES (64, '2023-07-13 08:10:14', 'pr', '192.168.3.107', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 61, NULL);
INSERT INTO `log_operate` VALUES (65, '2023-07-13 08:15:14', 'pr', '192.168.3.107', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 10, NULL);
INSERT INTO `log_operate` VALUES (66, '2023-07-13 08:17:48', 'pr', '192.168.3.107', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 1436, NULL);
INSERT INTO `log_operate` VALUES (67, '2023-07-13 08:19:01', 'pr', '192.168.3.107', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 30, NULL);
INSERT INTO `log_operate` VALUES (68, '2023-07-13 08:41:04', 'pr', '127.0.0.1', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 108, NULL);
INSERT INTO `log_operate` VALUES (69, '2023-07-13 08:42:51', 'pr', '127.0.0.1', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 57, NULL);
INSERT INTO `log_operate` VALUES (70, '2023-07-13 08:42:55', 'pr', '127.0.0.1', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 11, NULL);
INSERT INTO `log_operate` VALUES (71, '2023-07-13 08:43:53', 'pr', '127.0.0.1', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 8, NULL);
INSERT INTO `log_operate` VALUES (72, '2023-07-13 08:44:03', 'pr', '127.0.0.1', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 12, NULL);
INSERT INTO `log_operate` VALUES (73, '2023-07-13 08:44:14', 'pr', '127.0.0.1', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 8, NULL);
INSERT INTO `log_operate` VALUES (74, '2023-07-13 08:44:54', 'pr', '127.0.0.1', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 8, NULL);
INSERT INTO `log_operate` VALUES (75, '2023-07-13 08:48:02', 'pr', '127.0.0.1', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 8, NULL);
INSERT INTO `log_operate` VALUES (76, '2023-07-13 08:55:02', 'pr', '127.0.0.1', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (77, '2023-07-13 08:59:14', 'pr', '127.0.0.1', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 9, NULL);
INSERT INTO `log_operate` VALUES (78, '2023-07-13 08:59:23', 'pr', '127.0.0.1', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (79, '2023-07-13 09:00:56', 'pr', '127.0.0.1', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (80, '2023-07-13 09:01:05', 'pr', '127.0.0.1', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (81, '2023-07-13 09:03:30', 'pr', '127.0.0.1', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (82, '2023-07-13 09:03:34', 'pr', '127.0.0.1', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 7, NULL);
INSERT INTO `log_operate` VALUES (83, '2023-07-13 09:06:43', 'pr', '127.0.0.1', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (84, '2023-07-13 09:07:04', 'pr', '127.0.0.1', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (85, '2023-07-13 09:09:14', 'pr', '127.0.0.1', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (86, '2023-07-13 09:13:02', 'abc', '127.0.0.1', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (87, '2023-07-13 09:15:19', 'pr', '127.0.0.1', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (88, '2023-07-13 09:23:01', 'pr', '127.0.0.1', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (89, '2023-07-13 09:24:41', 'pr', '127.0.0.1', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (90, '2023-07-13 09:27:57', 'pr', '127.0.0.1', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (91, '2023-07-13 09:32:00', 'pr', '127.0.0.1', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 7, NULL);
INSERT INTO `log_operate` VALUES (92, '2023-07-13 09:33:42', 'pr', '127.0.0.1', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (93, '2023-07-13 09:34:23', 'pr', '127.0.0.1', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (94, '2023-07-13 09:35:56', 'pr', '127.0.0.1', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (95, '2023-07-13 09:41:03', 'pr', '127.0.0.1', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 7, NULL);
INSERT INTO `log_operate` VALUES (96, '2023-07-13 09:41:17', 'pr', '127.0.0.1', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (97, '2023-07-13 10:00:44', 'pr', '127.0.0.1', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 86, NULL);
INSERT INTO `log_operate` VALUES (98, '2023-07-13 10:00:49', 'pr', '127.0.0.1', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (99, '2023-07-13 10:04:14', 'pr', '127.0.0.1', '批量导入用户', 'IMPORT', 'POST', '/system/user/importUser', 'failed', 24, '');
INSERT INTO `log_operate` VALUES (100, '2023-07-13 10:05:52', 'pr', '127.0.0.1', '批量导入用户', 'IMPORT', 'POST', '/system/user/importUser', 'failed', 23, '');
INSERT INTO `log_operate` VALUES (101, '2023-07-13 10:08:05', 'pr', '127.0.0.1', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 106, NULL);
INSERT INTO `log_operate` VALUES (102, '2023-07-13 10:08:53', 'pr', '127.0.0.1', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 11, NULL);
INSERT INTO `log_operate` VALUES (103, '2023-07-13 10:08:56', 'pr', '127.0.0.1', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 11, NULL);
INSERT INTO `log_operate` VALUES (104, '2023-07-13 10:10:00', 'pr', '127.0.0.1', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 11, NULL);
INSERT INTO `log_operate` VALUES (105, '2023-07-13 10:10:38', 'pr', '127.0.0.1', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 14, NULL);
INSERT INTO `log_operate` VALUES (106, '2023-07-13 10:11:26', 'pr', '127.0.0.1', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (107, '2023-07-13 10:11:29', 'pr', '127.0.0.1', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 17, NULL);
INSERT INTO `log_operate` VALUES (108, '2023-07-13 10:11:44', 'pr', '127.0.0.1', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 11, NULL);
INSERT INTO `log_operate` VALUES (109, '2023-07-13 10:13:04', 'pr', '127.0.0.1', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (110, '2023-07-13 10:13:30', 'pr', '127.0.0.1', '批量导入用户', 'IMPORT', 'POST', '/system/user/importUser', 'failed', 1, '');
INSERT INTO `log_operate` VALUES (111, '2023-07-13 10:16:23', 'pr', '127.0.0.1', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 771, NULL);
INSERT INTO `log_operate` VALUES (112, '2023-07-13 10:35:54', 'pr', '127.0.0.1', '批量导入用户', 'IMPORT', 'POST', '/system/user/importUser', 'failed', 33, '');
INSERT INTO `log_operate` VALUES (113, '2023-07-13 10:44:45', 'pr', '127.0.0.1', '批量导入用户', 'IMPORT', 'POST', '/system/user/importUser', 'success', 823, NULL);
INSERT INTO `log_operate` VALUES (114, '2023-07-13 10:47:56', 'pr', '127.0.0.1', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 91, NULL);
INSERT INTO `log_operate` VALUES (115, '2023-07-13 10:48:10', 'pr', '127.0.0.1', '批量导入用户', 'IMPORT', 'POST', '/system/user/importUser', 'success', 29, NULL);
INSERT INTO `log_operate` VALUES (116, '2023-07-13 11:43:36', 'pr', '192.168.48.33', '导出操作日志', 'EXPORT', 'GET', '/system/log/exportOperateLog', 'success', 930, NULL);
INSERT INTO `log_operate` VALUES (117, '2023-07-13 11:43:55', 'pr', '192.168.48.33', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 11, NULL);
INSERT INTO `log_operate` VALUES (118, '2023-07-13 11:43:59', 'pr', '192.168.48.33', '批量导入用户', 'IMPORT', 'POST', '/system/user/importUser', 'failed', 1, '');
INSERT INTO `log_operate` VALUES (119, '2023-07-13 11:44:36', 'pr', '192.168.48.33', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 10, NULL);
INSERT INTO `log_operate` VALUES (120, '2023-07-13 11:44:57', 'pr', '192.168.48.33', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 10, NULL);
INSERT INTO `log_operate` VALUES (121, '2023-07-13 11:45:08', 'pr', '192.168.48.33', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 20, NULL);
INSERT INTO `log_operate` VALUES (122, '2023-07-13 11:45:11', 'pr', '192.168.48.33', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 0, NULL);
INSERT INTO `log_operate` VALUES (123, '2023-07-13 11:45:15', 'pr', '192.168.48.33', '批量导入用户', 'IMPORT', 'POST', '/system/user/importUser', 'failed', 0, '');
INSERT INTO `log_operate` VALUES (124, '2023-07-13 11:47:44', 'pr', '192.168.48.33', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 13, NULL);
INSERT INTO `log_operate` VALUES (125, '2023-07-13 11:47:49', 'pr', '192.168.48.33', '批量导入用户', 'IMPORT', 'POST', '/system/user/importUser', 'failed', 0, '');
INSERT INTO `log_operate` VALUES (126, '2023-07-13 11:48:13', 'pr', '192.168.48.33', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (127, '2023-07-13 11:48:14', 'pr', '192.168.48.33', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (128, '2023-07-13 11:48:18', 'pr', '192.168.48.33', '批量导入用户', 'IMPORT', 'POST', '/system/user/importUser', 'failed', 0, '');
INSERT INTO `log_operate` VALUES (129, '2023-07-13 11:48:40', 'pr', '192.168.48.33', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (130, '2023-07-13 11:48:47', 'pr', '192.168.48.33', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (131, '2023-07-13 11:49:15', 'pr', '192.168.48.33', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (132, '2023-07-13 11:49:17', 'pr', '192.168.48.33', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (133, '2023-07-13 11:49:31', 'pr', '192.168.48.33', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (134, '2023-07-13 11:49:56', 'pr', '192.168.48.33', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (135, '2023-07-13 11:49:56', 'pr', '192.168.48.33', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (136, '2023-07-13 11:50:00', 'pr', '192.168.48.33', '批量导入用户', 'IMPORT', 'POST', '/system/user/importUser', 'success', 204, NULL);
INSERT INTO `log_operate` VALUES (137, '2023-07-13 11:50:30', 'pr', '192.168.48.33', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (138, '2023-07-13 11:50:31', 'pr', '192.168.48.33', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 7, NULL);
INSERT INTO `log_operate` VALUES (139, '2023-07-13 11:50:35', 'pr', '192.168.48.33', '批量导入用户', 'IMPORT', 'POST', '/system/user/importUser', 'success', 33, NULL);
INSERT INTO `log_operate` VALUES (140, '2023-07-13 11:50:55', 'pr', '192.168.48.33', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (141, '2023-07-13 11:50:55', 'pr', '192.168.48.33', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (142, '2023-07-13 11:50:56', 'pr', '192.168.48.33', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (143, '2023-07-13 11:51:00', 'pr', '192.168.48.33', '批量导入用户', 'IMPORT', 'POST', '/system/user/importUser', 'failed', 0, '');
INSERT INTO `log_operate` VALUES (144, '2023-07-13 11:51:15', 'pr', '192.168.48.33', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (145, '2023-07-13 11:51:18', 'pr', '192.168.48.33', '批量导入用户', 'IMPORT', 'POST', '/system/user/importUser', 'failed', 0, '');
INSERT INTO `log_operate` VALUES (146, '2023-07-13 11:51:44', 'pr', '192.168.48.33', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (147, '2023-07-13 11:51:48', 'pr', '192.168.48.33', '批量导入用户', 'IMPORT', 'POST', '/system/user/importUser', 'failed', 0, '');
INSERT INTO `log_operate` VALUES (148, '2023-07-13 11:51:59', 'pr', '192.168.48.33', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (149, '2023-07-13 11:52:01', 'pr', '192.168.48.33', '批量导入用户', 'IMPORT', 'POST', '/system/user/importUser', 'failed', 0, '');
INSERT INTO `log_operate` VALUES (150, '2023-07-13 11:52:27', 'pr', '192.168.48.33', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (151, '2023-07-13 11:52:45', 'pr', '192.168.48.33', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (152, '2023-07-13 11:52:49', 'pr', '192.168.48.33', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (153, '2023-07-13 11:52:53', 'pr', '192.168.48.33', '批量导入用户', 'IMPORT', 'POST', '/system/user/importUser', 'success', 20, NULL);
INSERT INTO `log_operate` VALUES (154, '2023-07-13 11:53:05', 'pr', '192.168.48.33', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (155, '2023-07-13 11:53:27', 'pr', '192.168.48.33', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 0, NULL);
INSERT INTO `log_operate` VALUES (156, '2023-07-13 11:54:05', 'pr', '192.168.48.33', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (157, '2023-07-13 11:54:19', 'pr', '192.168.48.33', '查询车队列表', 'SELECT', 'GET', '/fleet/team', 'success', 753, NULL);
INSERT INTO `log_operate` VALUES (158, '2023-07-13 11:54:23', 'pr', '192.168.48.33', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 25, NULL);
INSERT INTO `log_operate` VALUES (159, '2023-07-13 11:54:23', 'pr', '192.168.48.33', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 14, NULL);
INSERT INTO `log_operate` VALUES (160, '2023-07-13 11:54:23', 'pr', '192.168.48.33', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 33, NULL);
INSERT INTO `log_operate` VALUES (161, '2023-07-13 11:54:25', 'pr', '192.168.48.33', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 12, NULL);
INSERT INTO `log_operate` VALUES (162, '2023-07-13 11:54:25', 'pr', '192.168.48.33', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 8, NULL);
INSERT INTO `log_operate` VALUES (163, '2023-07-13 11:54:25', 'pr', '192.168.48.33', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 8, NULL);
INSERT INTO `log_operate` VALUES (164, '2023-07-13 11:54:26', 'pr', '192.168.48.33', '查询车队列表', 'SELECT', 'GET', '/fleet/team', 'success', 9, NULL);
INSERT INTO `log_operate` VALUES (165, '2023-07-13 11:54:27', 'pr', '192.168.48.33', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (166, '2023-07-13 11:54:27', 'pr', '192.168.48.33', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 12, NULL);
INSERT INTO `log_operate` VALUES (167, '2023-07-13 11:54:27', 'pr', '192.168.48.33', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 13, NULL);
INSERT INTO `log_operate` VALUES (168, '2023-07-13 11:54:41', 'pr', '192.168.48.33', '查询车队列表', 'SELECT', 'GET', '/fleet/team', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (169, '2023-07-13 11:54:45', 'pr', '192.168.48.33', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 7, NULL);
INSERT INTO `log_operate` VALUES (170, '2023-07-13 11:54:45', 'pr', '192.168.48.33', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (171, '2023-07-13 11:54:45', 'pr', '192.168.48.33', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (172, '2023-07-13 11:54:45', 'pr', '192.168.48.33', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 7, NULL);
INSERT INTO `log_operate` VALUES (173, '2023-07-13 11:54:45', 'pr', '192.168.48.33', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 7, NULL);
INSERT INTO `log_operate` VALUES (174, '2023-07-13 11:54:45', 'pr', '192.168.48.33', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 7, NULL);
INSERT INTO `log_operate` VALUES (175, '2023-07-13 11:54:46', 'pr', '192.168.48.33', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (176, '2023-07-13 11:54:46', 'pr', '192.168.48.33', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (177, '2023-07-13 11:54:46', 'pr', '192.168.48.33', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (178, '2023-07-13 11:54:47', 'pr', '192.168.48.33', '查询车队列表', 'SELECT', 'GET', '/fleet/team', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (179, '2023-07-13 11:55:10', 'pr', '192.168.48.33', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (180, '2023-07-13 11:55:10', 'pr', '192.168.48.33', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (181, '2023-07-13 11:55:10', 'pr', '192.168.48.33', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 7, NULL);
INSERT INTO `log_operate` VALUES (182, '2023-07-13 11:55:11', 'pr', '192.168.48.33', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (183, '2023-07-13 11:55:11', 'pr', '192.168.48.33', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (184, '2023-07-13 11:55:11', 'pr', '192.168.48.33', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (185, '2023-07-13 11:56:25', 'pr', '192.168.48.33', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 12, NULL);
INSERT INTO `log_operate` VALUES (186, '2023-07-13 11:56:25', 'pr', '192.168.48.33', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 19, NULL);
INSERT INTO `log_operate` VALUES (187, '2023-07-13 11:56:25', 'pr', '192.168.48.33', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 13, NULL);
INSERT INTO `log_operate` VALUES (188, '2023-07-13 11:57:39', 'pr', '192.168.48.33', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (189, '2023-07-13 11:57:39', 'pr', '192.168.48.33', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (190, '2023-07-13 11:57:39', 'pr', '192.168.48.33', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (191, '2023-07-13 11:57:47', 'pr', '192.168.48.33', '查询车队列表', 'SELECT', 'GET', '/fleet/team', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (192, '2023-07-13 12:02:39', 'pr', '192.168.48.33', '查询车队列表', 'SELECT', 'GET', '/fleet/team', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (193, '2023-07-13 12:02:41', 'pr', '192.168.48.33', '查询车队列表', 'SELECT', 'GET', '/fleet/team', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (194, '2023-07-13 12:03:05', 'pr', '192.168.48.33', '查询车队列表', 'SELECT', 'GET', '/fleet/team', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (195, '2023-07-13 12:03:41', 'pr', '192.168.48.33', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (196, '2023-07-13 12:03:41', 'pr', '192.168.48.33', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (197, '2023-07-13 12:03:41', 'pr', '192.168.48.33', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (198, '2023-07-13 12:03:42', 'pr', '192.168.48.33', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (199, '2023-07-13 12:03:42', 'pr', '192.168.48.33', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (200, '2023-07-13 12:03:42', 'pr', '192.168.48.33', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (201, '2023-07-13 12:03:43', 'pr', '192.168.48.33', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (202, '2023-07-13 12:03:43', 'pr', '192.168.48.33', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (203, '2023-07-13 12:03:43', 'pr', '192.168.48.33', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (204, '2023-07-13 12:03:44', 'pr', '192.168.48.33', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (205, '2023-07-13 12:03:44', 'pr', '192.168.48.33', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (206, '2023-07-13 12:03:44', 'pr', '192.168.48.33', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (207, '2023-07-13 12:03:45', 'pr', '192.168.48.33', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (208, '2023-07-13 12:03:45', 'pr', '192.168.48.33', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (209, '2023-07-13 12:03:45', 'pr', '192.168.48.33', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (210, '2023-07-13 12:03:46', 'pr', '192.168.48.33', '查询车队列表', 'SELECT', 'GET', '/fleet/team', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (211, '2023-07-13 12:04:49', 'pr', '192.168.48.33', '查询车队列表', 'SELECT', 'GET', '/fleet/team', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (212, '2023-07-13 12:04:49', 'pr', '192.168.48.33', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (213, '2023-07-13 12:04:49', 'pr', '192.168.48.33', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (214, '2023-07-13 12:04:49', 'pr', '192.168.48.33', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (215, '2023-07-13 12:06:20', 'pr', '192.168.48.33', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (216, '2023-07-13 12:06:20', 'pr', '192.168.48.33', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (217, '2023-07-13 12:06:20', 'pr', '192.168.48.33', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (218, '2023-07-13 12:06:20', 'pr', '192.168.48.33', '查询车队列表', 'SELECT', 'GET', '/fleet/team', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (219, '2023-07-13 12:06:30', 'pr', '192.168.48.33', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (220, '2023-07-13 12:06:30', 'pr', '192.168.48.33', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (221, '2023-07-13 12:06:30', 'pr', '192.168.48.33', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (222, '2023-07-13 12:06:42', 'pr', '192.168.48.33', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (223, '2023-07-13 12:06:42', 'pr', '192.168.48.33', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (224, '2023-07-13 12:06:42', 'pr', '192.168.48.33', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (225, '2023-07-13 12:07:03', 'pr', '192.168.48.33', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 3, NULL);
INSERT INTO `log_operate` VALUES (226, '2023-07-13 12:07:03', 'pr', '192.168.48.33', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 3, NULL);
INSERT INTO `log_operate` VALUES (227, '2023-07-13 12:07:03', 'pr', '192.168.48.33', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 3, NULL);
INSERT INTO `log_operate` VALUES (228, '2023-07-13 12:07:04', 'pr', '192.168.48.33', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (229, '2023-07-13 12:07:04', 'pr', '192.168.48.33', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (230, '2023-07-13 12:07:04', 'pr', '192.168.48.33', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (231, '2023-07-13 12:07:13', 'pr', '192.168.48.33', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (232, '2023-07-13 12:07:13', 'pr', '192.168.48.33', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (233, '2023-07-13 12:07:13', 'pr', '192.168.48.33', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (234, '2023-07-13 12:07:14', 'pr', '192.168.48.33', '查询车队列表', 'SELECT', 'GET', '/fleet/team', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (235, '2023-07-13 12:07:22', 'pr', '192.168.48.33', '批量导入车队', 'IMPORT', 'POST', '/fleet/team/importTeam', 'success', 581, NULL);
INSERT INTO `log_operate` VALUES (236, '2023-07-13 12:07:35', 'pr', '192.168.48.33', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (237, '2023-07-13 12:07:35', 'pr', '192.168.48.33', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (238, '2023-07-13 12:07:35', 'pr', '192.168.48.33', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (239, '2023-07-13 12:07:39', 'pr', '192.168.48.33', '批量导入车辆', 'IMPORT', 'POST', '/fleet/truck/importTruck', 'success', 42, NULL);
INSERT INTO `log_operate` VALUES (240, '2023-07-13 12:07:42', 'pr', '192.168.48.33', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (241, '2023-07-13 12:07:42', 'pr', '192.168.48.33', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (242, '2023-07-13 12:07:42', 'pr', '192.168.48.33', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (243, '2023-07-13 12:07:45', 'pr', '192.168.48.33', '批量导入司机', 'IMPORT', 'POST', '/fleet/driver/importDriver', 'success', 20, NULL);
INSERT INTO `log_operate` VALUES (244, '2023-07-13 12:08:38', 'pr', '192.168.48.33', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (245, '2023-07-13 12:08:38', 'pr', '192.168.48.33', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (246, '2023-07-13 12:08:38', 'pr', '192.168.48.33', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (247, '2023-07-13 12:08:40', 'pr', '192.168.48.33', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (248, '2023-07-13 12:08:40', 'pr', '192.168.48.33', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (249, '2023-07-13 12:08:40', 'pr', '192.168.48.33', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (250, '2023-07-13 12:08:45', 'pr', '192.168.48.33', '查询车队列表', 'SELECT', 'GET', '/fleet/team', 'success', 3, NULL);
INSERT INTO `log_operate` VALUES (251, '2023-07-13 12:08:51', 'pr', '192.168.48.33', '批量导入车队', 'IMPORT', 'POST', '/fleet/team/importTeam', 'success', 17, NULL);
INSERT INTO `log_operate` VALUES (252, '2023-07-13 12:09:03', 'pr', '192.168.48.33', '批量导入车队', 'IMPORT', 'POST', '/fleet/team/importTeam', 'success', 26, NULL);
INSERT INTO `log_operate` VALUES (253, '2023-07-13 12:30:48', 'pr', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 1148, NULL);
INSERT INTO `log_operate` VALUES (254, '2023-07-13 12:30:51', 'pr', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (255, '2023-07-13 12:31:00', 'pr', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 12, NULL);
INSERT INTO `log_operate` VALUES (256, '2023-07-13 12:31:07', 'pr', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (257, '2023-07-13 12:31:24', 'pr', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 12, NULL);
INSERT INTO `log_operate` VALUES (258, '2023-07-13 12:32:07', 'pr', '192.168.48.4', '查询承运单（待调度）', 'SELECT', 'GET', '/transport/scheduling/getCarriers', 'success', 14, NULL);
INSERT INTO `log_operate` VALUES (259, '2023-07-13 12:32:19', 'pr', '192.168.48.4', '查询承运单（待调度）', 'SELECT', 'GET', '/transport/scheduling/getCarriers', 'success', 3, NULL);
INSERT INTO `log_operate` VALUES (260, '2023-07-13 12:32:38', 'pr', '192.168.48.4', '查询承运单（待调度）', 'SELECT', 'GET', '/transport/scheduling/getCarriers', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (261, '2023-07-13 12:39:21', 'pr', '192.168.48.4', '运输成本报表', 'SELECT', 'GET', '/transport/cost', 'success', 21, NULL);
INSERT INTO `log_operate` VALUES (262, '2023-07-13 12:43:22', 'pr', '192.168.48.4', '查询承运单（待调度）', 'SELECT', 'GET', '/transport/scheduling/getCarriers', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (263, '2023-07-13 12:43:23', 'pr', '192.168.48.4', '运输成本报表', 'SELECT', 'GET', '/transport/cost', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (264, '2023-07-13 12:43:23', 'pr', '192.168.48.4', '查询承运单（待调度）', 'SELECT', 'GET', '/transport/scheduling/getCarriers', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (265, '2023-07-13 12:43:59', 'pr', '192.168.48.4', '运输成本报表', 'SELECT', 'GET', '/transport/cost', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (266, '2023-07-13 12:44:17', 'pr', '192.168.48.4', '查询承运单（已完成）', 'SELECT', 'GET', '/transport/cost/getCarriers', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (267, '2023-07-13 12:44:19', 'pr', '192.168.48.4', '运输成本报表', 'SELECT', 'GET', '/transport/cost', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (268, '2023-07-13 12:44:21', 'pr', '192.168.48.4', '运输成本报表', 'SELECT', 'GET', '/transport/cost', 'success', 7, NULL);
INSERT INTO `log_operate` VALUES (269, '2023-07-13 12:44:26', 'pr', '192.168.48.4', '运输成本报表', 'SELECT', 'GET', '/transport/cost', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (270, '2023-07-13 12:44:31', 'pr', '192.168.48.4', '运输成本报表', 'SELECT', 'GET', '/transport/cost', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (271, '2023-07-13 12:44:34', 'pr', '192.168.48.4', '运输成本报表', 'SELECT', 'GET', '/transport/cost', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (272, '2023-07-13 12:46:09', 'pr', '192.168.48.4', '运输成本报表', 'SELECT', 'GET', '/transport/cost', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (273, '2023-07-13 12:46:10', 'pr', '192.168.48.4', '查询承运单（已完成）', 'SELECT', 'GET', '/transport/cost/getCarriers', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (274, '2023-07-13 12:46:52', 'pr', '192.168.48.4', '查询车队列表', 'SELECT', 'GET', '/fleet/team', 'success', 35, NULL);
INSERT INTO `log_operate` VALUES (275, '2023-07-13 12:46:53', 'pr', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (276, '2023-07-13 12:46:53', 'pr', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 8, NULL);
INSERT INTO `log_operate` VALUES (277, '2023-07-13 12:46:53', 'pr', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 7, NULL);
INSERT INTO `log_operate` VALUES (278, '2023-07-13 12:47:22', 'pr', '192.168.48.4', '绑定司机和车辆', 'INSERT', 'POST', '/fleet/contact', 'success', 24, NULL);
INSERT INTO `log_operate` VALUES (279, '2023-07-13 12:49:14', 'pr', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 7, NULL);
INSERT INTO `log_operate` VALUES (280, '2023-07-13 12:49:14', 'pr', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (281, '2023-07-13 12:49:25', 'pr', '192.168.48.4', '绑定司机和车辆', 'INSERT', 'POST', '/fleet/contact', 'success', 37, NULL);
INSERT INTO `log_operate` VALUES (282, '2023-07-13 12:49:26', 'abc', '127.0.0.1', '录入承运单', 'INSERT', 'POST', '/transport/carrier', 'failed', 115, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data trunca');
INSERT INTO `log_operate` VALUES (283, '2023-07-13 12:49:40', 'pr', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 9, NULL);
INSERT INTO `log_operate` VALUES (284, '2023-07-13 12:49:40', 'pr', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (285, '2023-07-13 12:49:40', 'pr', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 8, NULL);
INSERT INTO `log_operate` VALUES (286, '2023-07-13 12:50:15', 'abc', '127.0.0.1', '录入承运单', 'INSERT', 'POST', '/transport/carrier', 'failed', 23, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.CommunicationsException: Communi');
INSERT INTO `log_operate` VALUES (287, '2023-07-13 12:51:55', 'abc', '127.0.0.1', '录入承运单', 'INSERT', 'POST', '/transport/carrier', 'failed', 63208, 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database');
INSERT INTO `log_operate` VALUES (288, '2023-07-13 12:54:17', 'pr', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 251811, NULL);
INSERT INTO `log_operate` VALUES (289, '2023-07-13 12:54:17', 'pr', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 251821, NULL);
INSERT INTO `log_operate` VALUES (290, '2023-07-13 12:54:17', 'pr', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 251820, NULL);
INSERT INTO `log_operate` VALUES (291, '2023-07-13 12:54:17', 'pr', '192.168.48.4', '绑定司机和车辆', 'INSERT', 'POST', '/fleet/contact', 'success', 236800, NULL);
INSERT INTO `log_operate` VALUES (292, '2023-07-13 12:54:17', 'pr', '192.168.48.4', '绑定司机和车辆', 'INSERT', 'POST', '/fleet/contact', 'success', 233324, NULL);
INSERT INTO `log_operate` VALUES (293, '2023-07-13 12:54:17', 'pr', '192.168.48.4', '绑定司机和车辆', 'INSERT', 'POST', '/fleet/contact', 'success', 232106, NULL);
INSERT INTO `log_operate` VALUES (294, '2023-07-13 12:54:17', 'pr', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 150511, NULL);
INSERT INTO `log_operate` VALUES (295, '2023-07-13 12:54:17', 'pr', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 150510, NULL);
INSERT INTO `log_operate` VALUES (296, '2023-07-13 12:54:18', 'pr', '127.0.0.1', '录入承运单', 'INSERT', 'POST', '/transport/carrier', 'success', 116467, NULL);
INSERT INTO `log_operate` VALUES (297, '2023-07-13 12:54:27', 'abc', '127.0.0.1', '录入承运单', 'INSERT', 'POST', '/transport/carrier', 'success', 11, NULL);
INSERT INTO `log_operate` VALUES (298, '2023-07-13 12:54:36', 'abc', '127.0.0.1', '录入承运单', 'INSERT', 'POST', '/transport/carrier', 'failed', 62, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data trunca');
INSERT INTO `log_operate` VALUES (299, '2023-07-13 12:54:57', 'abc', '127.0.0.1', '录入承运单', 'INSERT', 'POST', '/transport/carrier', 'success', 31, NULL);
INSERT INTO `log_operate` VALUES (300, '2023-07-13 12:55:07', 'abc', '127.0.0.1', '录入承运单', 'INSERT', 'POST', '/transport/carrier', 'success', 29, NULL);
INSERT INTO `log_operate` VALUES (301, '2023-07-13 12:55:15', 'abc', '127.0.0.1', '录入承运单', 'INSERT', 'POST', '/transport/carrier', 'success', 10, NULL);
INSERT INTO `log_operate` VALUES (302, '2023-07-13 12:55:29', 'abc', '127.0.0.1', '录入承运单', 'INSERT', 'POST', '/transport/carrier', 'success', 23, NULL);
INSERT INTO `log_operate` VALUES (303, '2023-07-13 12:57:11', 'abc', '127.0.0.1', '调度承运任务', 'INSERT', 'POST', '/transport/scheduling', 'success', 47, NULL);
INSERT INTO `log_operate` VALUES (304, '2023-07-13 12:57:21', 'abc', '127.0.0.1', '调度承运任务', 'INSERT', 'POST', '/transport/scheduling', 'success', 14, NULL);
INSERT INTO `log_operate` VALUES (305, '2023-07-13 12:57:36', 'abc', '127.0.0.1', '标记承运单为已完成', 'UPDATE', 'PUT', '/transport/carrier', 'success', 14, NULL);
INSERT INTO `log_operate` VALUES (306, '2023-07-13 12:58:03', 'abc', '127.0.0.1', '录入成本', 'UPDATE', 'PUT', '/transport/cost', 'success', 11, NULL);
INSERT INTO `log_operate` VALUES (307, '2023-07-13 13:03:09', 'pr', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 810, NULL);
INSERT INTO `log_operate` VALUES (308, '2023-07-13 13:03:20', 'pr', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 15, NULL);
INSERT INTO `log_operate` VALUES (309, '2023-07-13 13:03:25', 'pr', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 8, NULL);
INSERT INTO `log_operate` VALUES (310, '2023-07-13 13:03:38', 'pr', '192.168.48.4', '查询承运单（待调度）', 'SELECT', 'GET', '/transport/scheduling/getCarriers', 'success', 15, NULL);
INSERT INTO `log_operate` VALUES (311, '2023-07-13 13:03:39', 'pr', '192.168.48.4', '运输成本报表', 'SELECT', 'GET', '/transport/cost', 'success', 16, NULL);
INSERT INTO `log_operate` VALUES (312, '2023-07-13 13:03:43', 'pr', '192.168.48.4', '查询承运单（待调度）', 'SELECT', 'GET', '/transport/scheduling/getCarriers', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (313, '2023-07-13 13:03:45', 'pr', '192.168.48.4', '查询空闲车辆', 'SELECT', 'GET', '/transport/scheduling/freeTruck', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (314, '2023-07-13 13:03:53', 'pr', '192.168.48.4', '运输成本报表', 'SELECT', 'GET', '/transport/cost', 'success', 11, NULL);
INSERT INTO `log_operate` VALUES (315, '2023-07-13 13:04:12', 'pr', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (316, '2023-07-13 13:04:46', 'pr', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 7, NULL);
INSERT INTO `log_operate` VALUES (317, '2023-07-13 13:04:51', 'pr', '192.168.48.4', '录入承运单', 'INSERT', 'POST', '/transport/carrier', 'failed', 64, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data trunca');
INSERT INTO `log_operate` VALUES (318, '2023-07-13 13:06:43', 'pr', '192.168.48.4', '录入承运单', 'INSERT', 'POST', '/transport/carrier', 'success', 30, NULL);
INSERT INTO `log_operate` VALUES (319, '2023-07-13 13:07:26', 'pr', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (320, '2023-07-13 13:36:24', 'pr', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 29, NULL);
INSERT INTO `log_operate` VALUES (321, '2023-07-13 13:55:02', 'system', '192.168.48.4', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 134, NULL);
INSERT INTO `log_operate` VALUES (322, '2023-07-13 13:55:09', 'system', '192.168.48.4', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 9, NULL);
INSERT INTO `log_operate` VALUES (323, '2023-07-13 13:57:04', 'system', '192.168.48.4', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 7, NULL);
INSERT INTO `log_operate` VALUES (324, '2023-07-13 14:02:07', 'system', '192.168.48.4', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (325, '2023-07-13 14:02:55', 'system', '192.168.48.4', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (326, '2023-07-13 14:03:05', 'system', '192.168.48.4', '修改用户角色', 'UPDATE', 'PUT', '/system/user', 'success', 15, NULL);
INSERT INTO `log_operate` VALUES (327, '2023-07-13 14:03:05', 'system', '192.168.48.4', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (328, '2023-07-13 14:03:11', 'system', '192.168.48.4', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 9, NULL);
INSERT INTO `log_operate` VALUES (329, '2023-07-13 14:03:25', 'system', '192.168.48.4', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 7, NULL);
INSERT INTO `log_operate` VALUES (330, '2023-07-13 14:03:33', 'system', '192.168.48.4', '导出登录日志', 'EXPORT', 'GET', '/system/log/exportLoginLog', 'success', 1266, NULL);
INSERT INTO `log_operate` VALUES (331, '2023-07-13 14:04:11', 'system', '192.168.48.4', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (332, '2023-07-13 14:04:27', 'fleet', '192.168.48.4', '查询车队列表', 'SELECT', 'GET', '/fleet/team', 'success', 1083, NULL);
INSERT INTO `log_operate` VALUES (333, '2023-07-13 14:05:41', 'fleet', '192.168.48.4', '批量导入车队', 'IMPORT', 'POST', '/fleet/team/importTeam', 'failed', 767, '');
INSERT INTO `log_operate` VALUES (334, '2023-07-13 14:05:53', 'fleet', '192.168.48.4', '查询车队列表', 'SELECT', 'GET', '/fleet/team', 'success', 19, NULL);
INSERT INTO `log_operate` VALUES (335, '2023-07-13 14:06:24', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 14, NULL);
INSERT INTO `log_operate` VALUES (336, '2023-07-13 14:06:24', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 16, NULL);
INSERT INTO `log_operate` VALUES (337, '2023-07-13 14:06:24', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 17, NULL);
INSERT INTO `log_operate` VALUES (338, '2023-07-13 14:06:27', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (339, '2023-07-13 14:06:27', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 14, NULL);
INSERT INTO `log_operate` VALUES (340, '2023-07-13 14:06:27', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (341, '2023-07-13 14:06:28', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 11, NULL);
INSERT INTO `log_operate` VALUES (342, '2023-07-13 14:06:28', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 11, NULL);
INSERT INTO `log_operate` VALUES (343, '2023-07-13 14:06:28', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 11, NULL);
INSERT INTO `log_operate` VALUES (344, '2023-07-13 14:06:29', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 9, NULL);
INSERT INTO `log_operate` VALUES (345, '2023-07-13 14:06:29', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 12, NULL);
INSERT INTO `log_operate` VALUES (346, '2023-07-13 14:06:29', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (347, '2023-07-13 14:06:32', 'fleet', '192.168.48.4', '查询车队列表', 'SELECT', 'GET', '/fleet/team', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (348, '2023-07-13 14:07:16', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (349, '2023-07-13 14:07:16', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (350, '2023-07-13 14:07:16', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 8, NULL);
INSERT INTO `log_operate` VALUES (351, '2023-07-13 14:08:17', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (352, '2023-07-13 14:08:17', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (353, '2023-07-13 14:08:17', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 8, NULL);
INSERT INTO `log_operate` VALUES (354, '2023-07-13 14:09:27', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (355, '2023-07-13 14:09:27', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (356, '2023-07-13 14:09:27', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 9, NULL);
INSERT INTO `log_operate` VALUES (357, '2023-07-13 14:09:58', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (358, '2023-07-13 14:09:58', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 11, NULL);
INSERT INTO `log_operate` VALUES (359, '2023-07-13 14:09:58', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (360, '2023-07-13 14:11:33', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (361, '2023-07-13 14:11:33', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 9, NULL);
INSERT INTO `log_operate` VALUES (362, '2023-07-13 14:11:33', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 8, NULL);
INSERT INTO `log_operate` VALUES (363, '2023-07-13 14:11:42', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 3, NULL);
INSERT INTO `log_operate` VALUES (364, '2023-07-13 14:11:42', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 10, NULL);
INSERT INTO `log_operate` VALUES (365, '2023-07-13 14:11:42', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 10, NULL);
INSERT INTO `log_operate` VALUES (366, '2023-07-13 14:12:03', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 7, NULL);
INSERT INTO `log_operate` VALUES (367, '2023-07-13 14:12:03', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 7, NULL);
INSERT INTO `log_operate` VALUES (368, '2023-07-13 14:12:03', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (369, '2023-07-13 14:12:36', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 7, NULL);
INSERT INTO `log_operate` VALUES (370, '2023-07-13 14:12:36', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (371, '2023-07-13 14:12:36', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 8, NULL);
INSERT INTO `log_operate` VALUES (372, '2023-07-13 14:13:04', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 7, NULL);
INSERT INTO `log_operate` VALUES (373, '2023-07-13 14:13:04', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 3, NULL);
INSERT INTO `log_operate` VALUES (374, '2023-07-13 14:13:04', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 7, NULL);
INSERT INTO `log_operate` VALUES (375, '2023-07-13 14:13:09', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (376, '2023-07-13 14:13:09', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (377, '2023-07-13 14:13:09', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (378, '2023-07-13 14:14:33', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (379, '2023-07-13 14:14:33', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 8, NULL);
INSERT INTO `log_operate` VALUES (380, '2023-07-13 14:14:33', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 8, NULL);
INSERT INTO `log_operate` VALUES (381, '2023-07-13 14:14:40', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (382, '2023-07-13 14:14:40', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 8, NULL);
INSERT INTO `log_operate` VALUES (383, '2023-07-13 14:14:40', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 8, NULL);
INSERT INTO `log_operate` VALUES (384, '2023-07-13 14:15:43', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 8, NULL);
INSERT INTO `log_operate` VALUES (385, '2023-07-13 14:15:43', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (386, '2023-07-13 14:15:43', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 8, NULL);
INSERT INTO `log_operate` VALUES (387, '2023-07-13 14:15:45', 'fleet', '192.168.48.4', '删除司机', 'DELETE', 'DELETE', '/fleet/driver', 'success', 15, NULL);
INSERT INTO `log_operate` VALUES (388, '2023-07-13 14:15:45', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (389, '2023-07-13 14:15:45', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (390, '2023-07-13 14:15:45', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (391, '2023-07-13 14:17:52', 'carrier', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 901, NULL);
INSERT INTO `log_operate` VALUES (392, '2023-07-13 14:17:52', 'carrier', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 901, NULL);
INSERT INTO `log_operate` VALUES (393, '2023-07-13 14:17:52', 'carrier', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 902, NULL);
INSERT INTO `log_operate` VALUES (394, '2023-07-13 14:17:52', 'carrier', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 901, NULL);
INSERT INTO `log_operate` VALUES (395, '2023-07-13 14:18:33', 'carrier', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (396, '2023-07-13 14:18:35', 'carrier', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (397, '2023-07-13 14:18:36', 'carrier', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (398, '2023-07-13 14:20:37', 'carrier', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 17, NULL);
INSERT INTO `log_operate` VALUES (399, '2023-07-13 14:22:38', 'carrier', '192.168.48.4', '录入承运单', 'INSERT', 'POST', '/transport/carrier', 'success', 29, NULL);
INSERT INTO `log_operate` VALUES (400, '2023-07-13 14:23:31', 'carrier', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (401, '2023-07-13 14:23:36', 'carrier', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (402, '2023-07-13 14:23:41', 'carrier', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 10, NULL);
INSERT INTO `log_operate` VALUES (403, '2023-07-13 14:24:07', 'carrier', '192.168.48.4', '录入承运单', 'INSERT', 'POST', '/transport/carrier', 'success', 22, NULL);
INSERT INTO `log_operate` VALUES (404, '2023-07-13 14:24:10', 'carrier', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (405, '2023-07-13 14:24:14', 'carrier', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 12, NULL);
INSERT INTO `log_operate` VALUES (406, '2023-07-13 14:24:45', 'schedule', '192.168.48.4', '查询承运单（待调度）', 'SELECT', 'GET', '/transport/scheduling/getCarriers', 'success', 13, NULL);
INSERT INTO `log_operate` VALUES (407, '2023-07-13 14:24:47', 'schedule', '192.168.48.4', '查询承运单（待调度）', 'SELECT', 'GET', '/transport/scheduling/getCarriers', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (408, '2023-07-13 14:24:55', 'schedule', '192.168.48.4', '查询空闲车辆', 'SELECT', 'GET', '/transport/scheduling/freeTruck', 'success', 8, NULL);
INSERT INTO `log_operate` VALUES (409, '2023-07-13 14:29:01', 'schedule', '192.168.48.4', '查询承运单（待调度）', 'SELECT', 'GET', '/transport/scheduling/getCarriers', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (410, '2023-07-13 14:29:35', 'schedule', '192.168.48.4', '查询承运单（待调度）', 'SELECT', 'GET', '/transport/scheduling/getCarriers', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (411, '2023-07-13 14:29:38', 'schedule', '192.168.48.4', '查询空闲车辆', 'SELECT', 'GET', '/transport/scheduling/freeTruck', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (412, '2023-07-13 14:30:05', 'schedule', '192.168.48.4', '查询空闲车辆', 'SELECT', 'GET', '/transport/scheduling/freeTruck', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (413, '2023-07-13 14:32:20', 'schedule', '192.168.48.4', '查询承运单（待调度）', 'SELECT', 'GET', '/transport/scheduling/getCarriers', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (414, '2023-07-13 14:32:24', 'schedule', '192.168.48.4', '查询承运单（待调度）', 'SELECT', 'GET', '/transport/scheduling/getCarriers', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (415, '2023-07-13 14:32:28', 'schedule', '192.168.48.4', '查询空闲车辆', 'SELECT', 'GET', '/transport/scheduling/freeTruck', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (416, '2023-07-13 14:33:04', 'schedule', '192.168.48.4', '查询承运单（待调度）', 'SELECT', 'GET', '/transport/scheduling/getCarriers', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (417, '2023-07-13 14:33:08', 'schedule', '192.168.48.4', '查询承运单（待调度）', 'SELECT', 'GET', '/transport/scheduling/getCarriers', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (418, '2023-07-13 14:33:09', 'schedule', '192.168.48.4', '查询空闲车辆', 'SELECT', 'GET', '/transport/scheduling/freeTruck', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (419, '2023-07-13 14:34:58', 'schedule', '192.168.48.4', '查询承运单（待调度）', 'SELECT', 'GET', '/transport/scheduling/getCarriers', 'success', 7, NULL);
INSERT INTO `log_operate` VALUES (420, '2023-07-13 14:35:17', 'schedule', '192.168.48.4', '查询承运单（待调度）', 'SELECT', 'GET', '/transport/scheduling/getCarriers', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (421, '2023-07-13 14:36:44', 'schedule', '192.168.48.4', '查询空闲车辆', 'SELECT', 'GET', '/transport/scheduling/freeTruck', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (422, '2023-07-13 14:39:00', 'schedule', '192.168.48.4', '查询承运单（待调度）', 'SELECT', 'GET', '/transport/scheduling/getCarriers', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (423, '2023-07-13 14:39:06', 'schedule', '192.168.48.4', '查询承运单（待调度）', 'SELECT', 'GET', '/transport/scheduling/getCarriers', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (424, '2023-07-13 14:39:07', 'schedule', '192.168.48.4', '查询空闲车辆', 'SELECT', 'GET', '/transport/scheduling/freeTruck', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (425, '2023-07-13 14:39:09', 'schedule', '192.168.48.4', '调度承运任务', 'INSERT', 'POST', '/transport/scheduling', 'success', 31, NULL);
INSERT INTO `log_operate` VALUES (426, '2023-07-13 14:39:15', 'schedule', '192.168.48.4', '查询承运单（待调度）', 'SELECT', 'GET', '/transport/scheduling/getCarriers', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (427, '2023-07-13 14:39:16', 'schedule', '192.168.48.4', '查询承运单（待调度）', 'SELECT', 'GET', '/transport/scheduling/getCarriers', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (428, '2023-07-13 14:39:46', 'carrier', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (429, '2023-07-13 14:39:59', 'carrier', '192.168.48.4', '标记承运单为已完成', 'UPDATE', 'PUT', '/transport/carrier', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (430, '2023-07-13 14:41:28', 'carrier', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (431, '2023-07-13 14:42:10', 'cost', '192.168.48.4', '查询承运单（已完成）', 'SELECT', 'GET', '/transport/cost/getCarriers', 'success', 500, NULL);
INSERT INTO `log_operate` VALUES (432, '2023-07-13 14:42:19', 'cost', '192.168.48.4', '查询承运单（已完成）', 'SELECT', 'GET', '/transport/cost/getCarriers', 'success', 9, NULL);
INSERT INTO `log_operate` VALUES (433, '2023-07-13 14:42:22', 'cost', '192.168.48.4', '运输成本报表', 'SELECT', 'GET', '/transport/cost', 'success', 19, NULL);
INSERT INTO `log_operate` VALUES (434, '2023-07-13 14:42:48', 'cost', '192.168.48.4', '查询承运单（已完成）', 'SELECT', 'GET', '/transport/cost/getCarriers', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (435, '2023-07-13 14:43:13', 'cost', '192.168.48.4', '查询承运单（已完成）', 'SELECT', 'GET', '/transport/cost/getCarriers', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (436, '2023-07-13 14:43:17', 'cost', '192.168.48.4', '查询承运单（已完成）', 'SELECT', 'GET', '/transport/cost/getCarriers', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (437, '2023-07-13 14:48:53', 'cost', '192.168.48.4', '查询承运单（已完成）', 'SELECT', 'GET', '/transport/cost/getCarriers', 'success', 8, NULL);
INSERT INTO `log_operate` VALUES (438, '2023-07-13 14:50:39', 'cost', '192.168.48.4', '查询承运单（已完成）', 'SELECT', 'GET', '/transport/cost/getCarriers', 'success', 9, NULL);
INSERT INTO `log_operate` VALUES (439, '2023-07-13 14:51:18', 'cost', '192.168.48.4', '查询承运单（已完成）', 'SELECT', 'GET', '/transport/cost/getCarriers', 'success', 22, NULL);
INSERT INTO `log_operate` VALUES (440, '2023-07-13 14:51:20', 'cost', '192.168.48.4', '查询承运单（已完成）', 'SELECT', 'GET', '/transport/cost/getCarriers', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (441, '2023-07-13 14:52:43', 'cost', '192.168.48.4', '查询承运单（已完成）', 'SELECT', 'GET', '/transport/cost/getCarriers', 'success', 9, NULL);
INSERT INTO `log_operate` VALUES (442, '2023-07-13 14:55:15', 'cost', '192.168.48.4', '查询承运单（已完成）', 'SELECT', 'GET', '/transport/cost/getCarriers', 'success', 11, NULL);
INSERT INTO `log_operate` VALUES (443, '2023-07-13 14:55:20', 'cost', '192.168.48.4', '录入成本', 'UPDATE', 'PUT', '/transport/cost', 'success', 70, NULL);
INSERT INTO `log_operate` VALUES (444, '2023-07-13 14:55:35', 'cost', '192.168.48.4', '查询承运单（已完成）', 'SELECT', 'GET', '/transport/cost/getCarriers', 'success', 3, NULL);
INSERT INTO `log_operate` VALUES (445, '2023-07-13 14:55:54', 'cost', '192.168.48.4', '查询承运单（已完成）', 'SELECT', 'GET', '/transport/cost/getCarriers', 'success', 9, NULL);
INSERT INTO `log_operate` VALUES (446, '2023-07-13 14:55:55', 'cost', '192.168.48.4', '运输成本报表', 'SELECT', 'GET', '/transport/cost', 'success', 8, NULL);
INSERT INTO `log_operate` VALUES (447, '2023-07-13 15:06:00', 'cost', '192.168.48.4', '运输成本报表', 'SELECT', 'GET', '/transport/cost', 'success', 22, NULL);
INSERT INTO `log_operate` VALUES (448, '2023-07-13 15:07:14', 'cost', '192.168.48.4', '运输成本报表', 'SELECT', 'GET', '/transport/cost', 'success', 843, NULL);
INSERT INTO `log_operate` VALUES (449, '2023-07-13 15:09:27', 'cost', '192.168.48.4', '运输成本报表', 'SELECT', 'GET', '/transport/cost', 'success', 29, NULL);
INSERT INTO `log_operate` VALUES (450, '2023-07-13 15:11:36', 'cost', '192.168.48.4', '查询承运单（已完成）', 'SELECT', 'GET', '/transport/cost/getCarriers', 'success', 12, NULL);
INSERT INTO `log_operate` VALUES (451, '2023-07-13 15:12:32', 'cost', '192.168.48.4', '查询承运单（已完成）', 'SELECT', 'GET', '/transport/cost/getCarriers', 'success', 14, NULL);
INSERT INTO `log_operate` VALUES (452, '2023-07-13 15:12:34', 'cost', '192.168.48.4', '运输成本报表', 'SELECT', 'GET', '/transport/cost', 'success', 586, NULL);
INSERT INTO `log_operate` VALUES (453, '2023-07-13 15:12:36', 'cost', '192.168.48.4', '查询承运单（已完成）', 'SELECT', 'GET', '/transport/cost/getCarriers', 'success', 15, NULL);
INSERT INTO `log_operate` VALUES (454, '2023-07-13 15:12:36', 'cost', '192.168.48.4', '运输成本报表', 'SELECT', 'GET', '/transport/cost', 'success', 9, NULL);
INSERT INTO `log_operate` VALUES (455, '2023-07-13 15:12:38', 'cost', '192.168.48.4', '查询承运单（已完成）', 'SELECT', 'GET', '/transport/cost/getCarriers', 'success', 11, NULL);
INSERT INTO `log_operate` VALUES (456, '2023-07-13 15:12:39', 'cost', '192.168.48.4', '运输成本报表', 'SELECT', 'GET', '/transport/cost', 'success', 23, NULL);
INSERT INTO `log_operate` VALUES (457, '2023-07-13 15:12:40', 'cost', '192.168.48.4', '查询承运单（已完成）', 'SELECT', 'GET', '/transport/cost/getCarriers', 'success', 9, NULL);
INSERT INTO `log_operate` VALUES (458, '2023-07-13 15:12:42', 'cost', '192.168.48.4', '查询承运单（已完成）', 'SELECT', 'GET', '/transport/cost/getCarriers', 'success', 15, NULL);
INSERT INTO `log_operate` VALUES (459, '2023-07-13 15:12:43', 'cost', '192.168.48.4', '运输成本报表', 'SELECT', 'GET', '/transport/cost', 'success', 19, NULL);
INSERT INTO `log_operate` VALUES (460, '2023-07-13 15:12:44', 'cost', '192.168.48.4', '查询承运单（已完成）', 'SELECT', 'GET', '/transport/cost/getCarriers', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (461, '2023-07-13 15:12:44', 'cost', '192.168.48.4', '运输成本报表', 'SELECT', 'GET', '/transport/cost', 'success', 16, NULL);
INSERT INTO `log_operate` VALUES (462, '2023-07-13 15:12:46', 'cost', '192.168.48.4', '查询承运单（已完成）', 'SELECT', 'GET', '/transport/cost/getCarriers', 'success', 10, NULL);
INSERT INTO `log_operate` VALUES (463, '2023-07-13 15:12:48', 'cost', '192.168.48.4', '运输成本报表', 'SELECT', 'GET', '/transport/cost', 'success', 8, NULL);
INSERT INTO `log_operate` VALUES (464, '2023-07-13 15:12:48', 'cost', '192.168.48.4', '查询承运单（已完成）', 'SELECT', 'GET', '/transport/cost/getCarriers', 'success', 8, NULL);
INSERT INTO `log_operate` VALUES (465, '2023-07-13 15:12:50', 'cost', '192.168.48.4', '运输成本报表', 'SELECT', 'GET', '/transport/cost', 'success', 18, NULL);
INSERT INTO `log_operate` VALUES (466, '2023-07-13 15:12:50', 'cost', '192.168.48.4', '查询承运单（已完成）', 'SELECT', 'GET', '/transport/cost/getCarriers', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (467, '2023-07-13 15:12:52', 'cost', '192.168.48.4', '运输成本报表', 'SELECT', 'GET', '/transport/cost', 'success', 17, NULL);
INSERT INTO `log_operate` VALUES (468, '2023-07-13 15:12:54', 'cost', '192.168.48.4', '查询承运单（已完成）', 'SELECT', 'GET', '/transport/cost/getCarriers', 'success', 10, NULL);
INSERT INTO `log_operate` VALUES (469, '2023-07-13 15:17:39', 'fleet', '192.168.48.4', '查询车队列表', 'SELECT', 'GET', '/fleet/team', 'success', 565, NULL);
INSERT INTO `log_operate` VALUES (470, '2023-07-13 15:17:44', 'fleet', '192.168.48.4', '查询车队列表', 'SELECT', 'GET', '/fleet/team', 'success', 808, NULL);
INSERT INTO `log_operate` VALUES (471, '2023-07-13 15:17:48', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 19, NULL);
INSERT INTO `log_operate` VALUES (472, '2023-07-13 15:17:49', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 13, NULL);
INSERT INTO `log_operate` VALUES (473, '2023-07-13 15:17:50', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 475, NULL);
INSERT INTO `log_operate` VALUES (474, '2023-07-13 15:17:50', 'fleet', '192.168.48.4', '查询车队列表', 'SELECT', 'GET', '/fleet/team', 'success', 21, NULL);
INSERT INTO `log_operate` VALUES (475, '2023-07-13 15:17:54', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 13, NULL);
INSERT INTO `log_operate` VALUES (476, '2023-07-13 15:17:54', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 17, NULL);
INSERT INTO `log_operate` VALUES (477, '2023-07-13 15:17:54', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 23, NULL);
INSERT INTO `log_operate` VALUES (478, '2023-07-13 15:17:56', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (479, '2023-07-13 15:17:56', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 16, NULL);
INSERT INTO `log_operate` VALUES (480, '2023-07-13 15:17:56', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 20, NULL);
INSERT INTO `log_operate` VALUES (481, '2023-07-13 15:18:35', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 7, NULL);
INSERT INTO `log_operate` VALUES (482, '2023-07-13 15:18:34', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 16, NULL);
INSERT INTO `log_operate` VALUES (483, '2023-07-13 15:18:35', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 17, NULL);
INSERT INTO `log_operate` VALUES (484, '2023-07-13 15:18:45', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 8, NULL);
INSERT INTO `log_operate` VALUES (485, '2023-07-13 15:18:44', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 20, NULL);
INSERT INTO `log_operate` VALUES (486, '2023-07-13 15:18:45', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 28, NULL);
INSERT INTO `log_operate` VALUES (487, '2023-07-13 15:18:48', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (488, '2023-07-13 15:18:48', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 19, NULL);
INSERT INTO `log_operate` VALUES (489, '2023-07-13 15:18:47', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 20, NULL);
INSERT INTO `log_operate` VALUES (490, '2023-07-13 15:18:49', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 7, NULL);
INSERT INTO `log_operate` VALUES (491, '2023-07-13 15:18:49', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 22, NULL);
INSERT INTO `log_operate` VALUES (492, '2023-07-13 15:18:50', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 20, NULL);
INSERT INTO `log_operate` VALUES (493, '2023-07-13 15:18:52', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 10, NULL);
INSERT INTO `log_operate` VALUES (494, '2023-07-13 15:18:52', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 17, NULL);
INSERT INTO `log_operate` VALUES (495, '2023-07-13 15:18:53', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 28, NULL);
INSERT INTO `log_operate` VALUES (496, '2023-07-13 15:19:27', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (497, '2023-07-13 15:19:26', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 19, NULL);
INSERT INTO `log_operate` VALUES (498, '2023-07-13 15:19:27', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 21, NULL);
INSERT INTO `log_operate` VALUES (499, '2023-07-13 15:19:41', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (500, '2023-07-13 15:19:40', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 18, NULL);
INSERT INTO `log_operate` VALUES (501, '2023-07-13 15:19:41', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 19, NULL);
INSERT INTO `log_operate` VALUES (502, '2023-07-13 15:20:31', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (503, '2023-07-13 15:20:31', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 26, NULL);
INSERT INTO `log_operate` VALUES (504, '2023-07-13 15:20:31', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 29, NULL);
INSERT INTO `log_operate` VALUES (505, '2023-07-13 15:20:42', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 10, NULL);
INSERT INTO `log_operate` VALUES (506, '2023-07-13 15:20:43', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 18, NULL);
INSERT INTO `log_operate` VALUES (507, '2023-07-13 15:20:42', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 17, NULL);
INSERT INTO `log_operate` VALUES (508, '2023-07-13 15:21:24', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (509, '2023-07-13 15:21:24', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 16, NULL);
INSERT INTO `log_operate` VALUES (510, '2023-07-13 15:21:26', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 7, NULL);
INSERT INTO `log_operate` VALUES (511, '2023-07-13 15:21:38', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 14, NULL);
INSERT INTO `log_operate` VALUES (512, '2023-07-13 15:22:22', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (513, '2023-07-13 15:22:22', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 18, NULL);
INSERT INTO `log_operate` VALUES (514, '2023-07-13 15:22:23', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (515, '2023-07-13 15:22:24', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 18, NULL);
INSERT INTO `log_operate` VALUES (516, '2023-07-13 15:22:59', 'fleet', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 14, NULL);
INSERT INTO `log_operate` VALUES (517, '2023-07-13 15:23:03', 'carrier', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 34, NULL);
INSERT INTO `log_operate` VALUES (518, '2023-07-13 15:23:06', 'carrier', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (519, '2023-07-13 15:23:49', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 98, NULL);
INSERT INTO `log_operate` VALUES (520, '2023-07-13 15:30:04', 'carrier', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 547, NULL);
INSERT INTO `log_operate` VALUES (521, '2023-07-13 15:30:07', 'carrier', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 24, NULL);
INSERT INTO `log_operate` VALUES (522, '2023-07-13 15:30:10', 'carrier', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 15, NULL);
INSERT INTO `log_operate` VALUES (523, '2023-07-13 15:36:13', 'system', '192.168.48.4', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 102, NULL);
INSERT INTO `log_operate` VALUES (524, '2023-07-13 15:36:26', 'system', '192.168.48.4', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 9, NULL);
INSERT INTO `log_operate` VALUES (525, '2023-07-13 15:37:18', 'system', '192.168.48.4', '批量导入用户', 'IMPORT', 'POST', '/system/user/importUser', 'success', 966, NULL);
INSERT INTO `log_operate` VALUES (526, '2023-07-13 15:37:28', 'system', '192.168.48.4', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (527, '2023-07-13 15:37:59', 'system', '192.168.48.4', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (528, '2023-07-13 15:38:31', 'system', '192.168.48.4', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (529, '2023-07-13 15:38:34', 'system', '192.168.48.4', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (530, '2023-07-13 15:39:07', 'system', '192.168.48.4', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 7, NULL);
INSERT INTO `log_operate` VALUES (531, '2023-07-13 15:39:52', 'system', '192.168.48.4', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (532, '2023-07-13 15:39:54', 'system', '192.168.48.4', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 7, NULL);
INSERT INTO `log_operate` VALUES (533, '2023-07-13 15:40:13', 'system', '192.168.48.4', '修改用户角色', 'UPDATE', 'PUT', '/system/user', 'success', 38, NULL);
INSERT INTO `log_operate` VALUES (534, '2023-07-13 15:40:13', 'system', '192.168.48.4', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (535, '2023-07-13 15:40:33', 'system', '192.168.48.4', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (536, '2023-07-13 15:40:35', 'system', '192.168.48.4', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 7, NULL);
INSERT INTO `log_operate` VALUES (537, '2023-07-13 15:40:40', 'system', '192.168.48.4', '删除用户信息', 'DELETE', 'DELETE', '/system/user', 'success', 40, NULL);
INSERT INTO `log_operate` VALUES (538, '2023-07-13 15:40:40', 'system', '192.168.48.4', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 8, NULL);
INSERT INTO `log_operate` VALUES (539, '2023-07-13 15:40:55', 'system', '192.168.48.4', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 5, NULL);
INSERT INTO `log_operate` VALUES (540, '2023-07-13 15:40:57', 'system', '192.168.48.4', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 6, NULL);
INSERT INTO `log_operate` VALUES (541, '2023-07-13 15:41:39', 'system', '192.168.48.4', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 7, NULL);
INSERT INTO `log_operate` VALUES (542, '2023-07-13 15:41:47', 'system', '192.168.48.4', '删除用户信息', 'DELETE', 'DELETE', '/system/user', 'success', 36, NULL);
INSERT INTO `log_operate` VALUES (543, '2023-07-13 15:41:47', 'system', '192.168.48.4', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 4, NULL);
INSERT INTO `log_operate` VALUES (544, '2023-07-13 15:41:57', 'system', '192.168.48.4', '导出操作日志', 'EXPORT', 'GET', '/system/log/exportOperateLog', 'success', 568, NULL);
INSERT INTO `log_operate` VALUES (545, '2023-07-13 15:42:54', 'fleet', '192.168.48.4', '查询车队列表', 'SELECT', 'GET', '/fleet/team', 'success', 547, NULL);
INSERT INTO `log_operate` VALUES (546, '2023-07-13 15:43:27', 'fleet', '192.168.48.4', '查询车队列表', 'SELECT', 'GET', '/fleet/team', 'success', 536, NULL);
INSERT INTO `log_operate` VALUES (547, '2023-07-13 15:43:43', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 20, NULL);
INSERT INTO `log_operate` VALUES (548, '2023-07-13 15:43:43', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 19, NULL);
INSERT INTO `log_operate` VALUES (549, '2023-07-13 15:43:44', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 456, NULL);
INSERT INTO `log_operate` VALUES (550, '2023-07-13 15:43:51', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 18, NULL);
INSERT INTO `log_operate` VALUES (551, '2023-07-13 15:43:50', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 17, NULL);
INSERT INTO `log_operate` VALUES (552, '2023-07-13 15:43:51', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 22, NULL);
INSERT INTO `log_operate` VALUES (553, '2023-07-13 15:43:52', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 22, NULL);
INSERT INTO `log_operate` VALUES (554, '2023-07-13 15:43:52', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 18, NULL);
INSERT INTO `log_operate` VALUES (555, '2023-07-13 15:43:53', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 21, NULL);
INSERT INTO `log_operate` VALUES (556, '2023-07-13 15:43:58', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 15, NULL);
INSERT INTO `log_operate` VALUES (557, '2023-07-13 15:43:58', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 15, NULL);
INSERT INTO `log_operate` VALUES (558, '2023-07-13 15:43:59', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 25, NULL);
INSERT INTO `log_operate` VALUES (559, '2023-07-13 15:44:21', 'fleet', '192.168.48.4', '绑定司机和车辆', 'INSERT', 'POST', '/fleet/contact', 'success', 19, NULL);
INSERT INTO `log_operate` VALUES (560, '2023-07-13 15:44:22', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 22, NULL);
INSERT INTO `log_operate` VALUES (561, '2023-07-13 15:44:21', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 14, NULL);
INSERT INTO `log_operate` VALUES (562, '2023-07-13 15:44:22', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 21, NULL);
INSERT INTO `log_operate` VALUES (563, '2023-07-13 15:44:41', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 18, NULL);
INSERT INTO `log_operate` VALUES (564, '2023-07-13 15:44:41', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 19, NULL);
INSERT INTO `log_operate` VALUES (565, '2023-07-13 15:44:41', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 21, NULL);
INSERT INTO `log_operate` VALUES (566, '2023-07-13 15:44:44', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 16, NULL);
INSERT INTO `log_operate` VALUES (567, '2023-07-13 15:44:43', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 26, NULL);
INSERT INTO `log_operate` VALUES (568, '2023-07-13 15:44:44', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 15, NULL);
INSERT INTO `log_operate` VALUES (569, '2023-07-13 15:44:45', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 18, NULL);
INSERT INTO `log_operate` VALUES (570, '2023-07-13 15:44:44', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 15, NULL);
INSERT INTO `log_operate` VALUES (571, '2023-07-13 15:44:45', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 17, NULL);
INSERT INTO `log_operate` VALUES (572, '2023-07-13 15:44:46', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 14, NULL);
INSERT INTO `log_operate` VALUES (573, '2023-07-13 15:44:46', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 24, NULL);
INSERT INTO `log_operate` VALUES (574, '2023-07-13 15:44:46', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 29, NULL);
INSERT INTO `log_operate` VALUES (575, '2023-07-13 15:45:31', 'carrier', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 507, NULL);
INSERT INTO `log_operate` VALUES (576, '2023-07-13 15:45:31', 'carrier', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 324, NULL);
INSERT INTO `log_operate` VALUES (577, '2023-07-13 15:49:18', 'carrier', '192.168.48.4', '录入承运单', 'INSERT', 'POST', '/transport/carrier', 'success', 108, NULL);
INSERT INTO `log_operate` VALUES (578, '2023-07-13 15:49:24', 'carrier', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 42, NULL);
INSERT INTO `log_operate` VALUES (579, '2023-07-13 15:49:39', 'carrier', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 39, NULL);
INSERT INTO `log_operate` VALUES (580, '2023-07-13 15:49:46', 'carrier', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 17, NULL);
INSERT INTO `log_operate` VALUES (581, '2023-07-13 15:50:08', 'schedule', '192.168.48.4', '查询承运单（待调度）', 'SELECT', 'GET', '/transport/scheduling/getCarriers', 'success', 24, NULL);
INSERT INTO `log_operate` VALUES (582, '2023-07-13 15:50:09', 'schedule', '192.168.48.4', '查询承运单（待调度）', 'SELECT', 'GET', '/transport/scheduling/getCarriers', 'success', 20, NULL);
INSERT INTO `log_operate` VALUES (583, '2023-07-13 15:50:21', 'schedule', '192.168.48.4', '查询空闲车辆', 'SELECT', 'GET', '/transport/scheduling/freeTruck', 'success', 29, NULL);
INSERT INTO `log_operate` VALUES (584, '2023-07-13 15:50:47', 'schedule', '192.168.48.4', '调度承运任务', 'INSERT', 'POST', '/transport/scheduling', 'success', 142, NULL);
INSERT INTO `log_operate` VALUES (585, '2023-07-13 15:50:49', 'schedule', '192.168.48.4', '查询承运单（待调度）', 'SELECT', 'GET', '/transport/scheduling/getCarriers', 'success', 17, NULL);
INSERT INTO `log_operate` VALUES (586, '2023-07-13 15:51:02', 'carrier', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 15, NULL);
INSERT INTO `log_operate` VALUES (587, '2023-07-13 15:51:19', 'carrier', '192.168.48.4', '标记承运单为已完成', 'UPDATE', 'PUT', '/transport/carrier', 'success', 52, NULL);
INSERT INTO `log_operate` VALUES (588, '2023-07-13 15:51:19', 'carrier', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 21, NULL);
INSERT INTO `log_operate` VALUES (589, '2023-07-13 15:51:33', 'cost', '192.168.48.4', '查询承运单（已完成）', 'SELECT', 'GET', '/transport/cost/getCarriers', 'success', 24, NULL);
INSERT INTO `log_operate` VALUES (590, '2023-07-13 15:51:50', 'cost', '192.168.48.4', '录入成本', 'UPDATE', 'PUT', '/transport/cost', 'success', 65, NULL);
INSERT INTO `log_operate` VALUES (591, '2023-07-13 15:51:51', 'cost', '192.168.48.4', '查询承运单（已完成）', 'SELECT', 'GET', '/transport/cost/getCarriers', 'success', 15, NULL);
INSERT INTO `log_operate` VALUES (592, '2023-07-13 15:51:53', 'cost', '192.168.48.4', '运输成本报表', 'SELECT', 'GET', '/transport/cost', 'success', 18, NULL);
INSERT INTO `log_operate` VALUES (593, '2023-07-13 15:52:51', 'cost', '192.168.48.4', '运输成本报表', 'SELECT', 'GET', '/transport/cost', 'success', 26, NULL);
INSERT INTO `log_operate` VALUES (594, '2023-07-13 16:17:59', 'system', '192.168.48.4', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 107, NULL);
INSERT INTO `log_operate` VALUES (595, '2023-07-13 16:18:00', 'system', '192.168.48.4', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 9, NULL);
INSERT INTO `log_operate` VALUES (596, '2023-07-13 16:18:20', 'system', '192.168.48.4', '修改用户角色', 'UPDATE', 'PUT', '/system/user', 'success', 41, NULL);
INSERT INTO `log_operate` VALUES (597, '2023-07-13 16:18:20', 'system', '192.168.48.4', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 7, NULL);
INSERT INTO `log_operate` VALUES (598, '2023-07-13 16:18:59', 'system', '192.168.48.4', '查询用户信息', 'SELECT', 'GET', '/system/user', 'success', 7, NULL);
INSERT INTO `log_operate` VALUES (599, '2023-07-13 16:19:17', 'system', '192.168.48.4', '导出登录日志', 'EXPORT', 'GET', '/system/log/exportLoginLog', 'success', 943, NULL);
INSERT INTO `log_operate` VALUES (600, '2023-07-13 16:20:03', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 336, NULL);
INSERT INTO `log_operate` VALUES (601, '2023-07-13 16:20:04', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 469, NULL);
INSERT INTO `log_operate` VALUES (602, '2023-07-13 16:20:03', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 568, NULL);
INSERT INTO `log_operate` VALUES (603, '2023-07-13 16:20:05', 'fleet', '192.168.48.4', '查询车队列表', 'SELECT', 'GET', '/fleet/team', 'success', 30, NULL);
INSERT INTO `log_operate` VALUES (604, '2023-07-13 16:20:20', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 18, NULL);
INSERT INTO `log_operate` VALUES (605, '2023-07-13 16:20:20', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 23, NULL);
INSERT INTO `log_operate` VALUES (606, '2023-07-13 16:20:20', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 48, NULL);
INSERT INTO `log_operate` VALUES (607, '2023-07-13 16:20:20', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 22, NULL);
INSERT INTO `log_operate` VALUES (608, '2023-07-13 16:20:20', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 15, NULL);
INSERT INTO `log_operate` VALUES (609, '2023-07-13 16:20:21', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 17, NULL);
INSERT INTO `log_operate` VALUES (610, '2023-07-13 16:20:21', 'fleet', '192.168.48.4', '查询车队列表', 'SELECT', 'GET', '/fleet/team', 'success', 23, NULL);
INSERT INTO `log_operate` VALUES (611, '2023-07-13 16:20:25', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 35, NULL);
INSERT INTO `log_operate` VALUES (612, '2023-07-13 16:20:25', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 33, NULL);
INSERT INTO `log_operate` VALUES (613, '2023-07-13 16:20:26', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 35, NULL);
INSERT INTO `log_operate` VALUES (614, '2023-07-13 16:20:28', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 17, NULL);
INSERT INTO `log_operate` VALUES (615, '2023-07-13 16:20:28', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 16, NULL);
INSERT INTO `log_operate` VALUES (616, '2023-07-13 16:20:28', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 23, NULL);
INSERT INTO `log_operate` VALUES (617, '2023-07-13 16:20:30', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 19, NULL);
INSERT INTO `log_operate` VALUES (618, '2023-07-13 16:20:30', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 24, NULL);
INSERT INTO `log_operate` VALUES (619, '2023-07-13 16:20:30', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 21, NULL);
INSERT INTO `log_operate` VALUES (620, '2023-07-13 16:20:33', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 19, NULL);
INSERT INTO `log_operate` VALUES (621, '2023-07-13 16:20:33', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 23, NULL);
INSERT INTO `log_operate` VALUES (622, '2023-07-13 16:20:52', 'fleet', '192.168.48.4', '绑定司机和车辆', 'INSERT', 'POST', '/fleet/contact', 'success', 68, NULL);
INSERT INTO `log_operate` VALUES (623, '2023-07-13 16:20:53', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 20, NULL);
INSERT INTO `log_operate` VALUES (624, '2023-07-13 16:20:54', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 22, NULL);
INSERT INTO `log_operate` VALUES (625, '2023-07-13 16:20:53', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 23, NULL);
INSERT INTO `log_operate` VALUES (626, '2023-07-13 16:21:01', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 17, NULL);
INSERT INTO `log_operate` VALUES (627, '2023-07-13 16:21:00', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 17, NULL);
INSERT INTO `log_operate` VALUES (628, '2023-07-13 16:21:01', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 19, NULL);
INSERT INTO `log_operate` VALUES (629, '2023-07-13 16:21:08', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 16, NULL);
INSERT INTO `log_operate` VALUES (630, '2023-07-13 16:21:08', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 27, NULL);
INSERT INTO `log_operate` VALUES (631, '2023-07-13 16:21:07', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 37, NULL);
INSERT INTO `log_operate` VALUES (632, '2023-07-13 16:21:09', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 15, NULL);
INSERT INTO `log_operate` VALUES (633, '2023-07-13 16:21:09', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 15, NULL);
INSERT INTO `log_operate` VALUES (634, '2023-07-13 16:21:09', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 22, NULL);
INSERT INTO `log_operate` VALUES (635, '2023-07-13 16:21:10', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 30, NULL);
INSERT INTO `log_operate` VALUES (636, '2023-07-13 16:21:10', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 26, NULL);
INSERT INTO `log_operate` VALUES (637, '2023-07-13 16:21:09', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 34, NULL);
INSERT INTO `log_operate` VALUES (638, '2023-07-13 16:21:17', 'fleet', '192.168.48.4', '绑定司机和车辆', 'INSERT', 'POST', '/fleet/contact', 'success', 53, NULL);
INSERT INTO `log_operate` VALUES (639, '2023-07-13 16:21:20', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 15, NULL);
INSERT INTO `log_operate` VALUES (640, '2023-07-13 16:21:20', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 16, NULL);
INSERT INTO `log_operate` VALUES (641, '2023-07-13 16:21:21', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 22, NULL);
INSERT INTO `log_operate` VALUES (642, '2023-07-13 16:21:25', 'fleet', '192.168.48.4', '绑定司机和车辆', 'INSERT', 'POST', '/fleet/contact', 'success', 52, NULL);
INSERT INTO `log_operate` VALUES (643, '2023-07-13 16:21:26', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 20, NULL);
INSERT INTO `log_operate` VALUES (644, '2023-07-13 16:21:25', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 22, NULL);
INSERT INTO `log_operate` VALUES (645, '2023-07-13 16:21:26', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 28, NULL);
INSERT INTO `log_operate` VALUES (646, '2023-07-13 16:21:27', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 21, NULL);
INSERT INTO `log_operate` VALUES (647, '2023-07-13 16:21:27', 'fleet', '192.168.48.4', '查询司机列表', 'SELECT', 'GET', '/fleet/driver', 'success', 22, NULL);
INSERT INTO `log_operate` VALUES (648, '2023-07-13 16:21:28', 'fleet', '192.168.48.4', '查询车辆列表', 'SELECT', 'GET', '/fleet/truck', 'success', 28, NULL);
INSERT INTO `log_operate` VALUES (649, '2023-07-13 16:21:48', 'carrier', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 305, NULL);
INSERT INTO `log_operate` VALUES (650, '2023-07-13 16:21:57', 'carrier', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 531, NULL);
INSERT INTO `log_operate` VALUES (651, '2023-07-13 16:22:01', 'carrier', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 537, NULL);
INSERT INTO `log_operate` VALUES (652, '2023-07-13 16:22:47', 'carrier', '192.168.48.4', '录入承运单', 'INSERT', 'POST', '/transport/carrier', 'success', 51, NULL);
INSERT INTO `log_operate` VALUES (653, '2023-07-13 16:22:51', 'carrier', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 19, NULL);
INSERT INTO `log_operate` VALUES (654, '2023-07-13 16:23:13', 'carrier', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 47, NULL);
INSERT INTO `log_operate` VALUES (655, '2023-07-13 16:23:14', 'carrier', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 24, NULL);
INSERT INTO `log_operate` VALUES (656, '2023-07-13 16:23:32', 'schedule', '192.168.48.4', '查询承运单（待调度）', 'SELECT', 'GET', '/transport/scheduling/getCarriers', 'success', 23, NULL);
INSERT INTO `log_operate` VALUES (657, '2023-07-13 16:23:34', 'schedule', '192.168.48.4', '查询承运单（待调度）', 'SELECT', 'GET', '/transport/scheduling/getCarriers', 'success', 28, NULL);
INSERT INTO `log_operate` VALUES (658, '2023-07-13 16:23:46', 'schedule', '192.168.48.4', '查询承运单（待调度）', 'SELECT', 'GET', '/transport/scheduling/getCarriers', 'success', 16, NULL);
INSERT INTO `log_operate` VALUES (659, '2023-07-13 16:23:48', 'schedule', '192.168.48.4', '查询承运单（待调度）', 'SELECT', 'GET', '/transport/scheduling/getCarriers', 'success', 26, NULL);
INSERT INTO `log_operate` VALUES (660, '2023-07-13 16:24:01', 'schedule', '192.168.48.4', '查询空闲车辆', 'SELECT', 'GET', '/transport/scheduling/freeTruck', 'success', 33, NULL);
INSERT INTO `log_operate` VALUES (661, '2023-07-13 16:24:13', 'schedule', '192.168.48.4', '调度承运任务', 'INSERT', 'POST', '/transport/scheduling', 'success', 123, NULL);
INSERT INTO `log_operate` VALUES (662, '2023-07-13 16:24:15', 'schedule', '192.168.48.4', '查询承运单（待调度）', 'SELECT', 'GET', '/transport/scheduling/getCarriers', 'success', 19, NULL);
INSERT INTO `log_operate` VALUES (663, '2023-07-13 16:24:19', 'schedule', '192.168.48.4', '查询承运单（待调度）', 'SELECT', 'GET', '/transport/scheduling/getCarriers', 'success', 13, NULL);
INSERT INTO `log_operate` VALUES (664, '2023-07-13 16:24:35', 'carrier', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 16, NULL);
INSERT INTO `log_operate` VALUES (665, '2023-07-13 16:24:39', 'carrier', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 23, NULL);
INSERT INTO `log_operate` VALUES (666, '2023-07-13 16:24:40', 'carrier', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 34, NULL);
INSERT INTO `log_operate` VALUES (667, '2023-07-13 16:24:41', 'carrier', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 21, NULL);
INSERT INTO `log_operate` VALUES (668, '2023-07-13 16:24:42', 'carrier', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 24, NULL);
INSERT INTO `log_operate` VALUES (669, '2023-07-13 16:24:43', 'carrier', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 27, NULL);
INSERT INTO `log_operate` VALUES (670, '2023-07-13 16:24:44', 'carrier', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 32, NULL);
INSERT INTO `log_operate` VALUES (671, '2023-07-13 16:24:46', 'carrier', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 17, NULL);
INSERT INTO `log_operate` VALUES (672, '2023-07-13 16:25:00', 'schedule', '192.168.48.4', '查询承运单（待调度）', 'SELECT', 'GET', '/transport/scheduling/getCarriers', 'success', 27, NULL);
INSERT INTO `log_operate` VALUES (673, '2023-07-13 16:25:01', 'schedule', '192.168.48.4', '查询承运单（待调度）', 'SELECT', 'GET', '/transport/scheduling/getCarriers', 'success', 17, NULL);
INSERT INTO `log_operate` VALUES (674, '2023-07-13 16:25:03', 'schedule', '192.168.48.4', '查询空闲车辆', 'SELECT', 'GET', '/transport/scheduling/freeTruck', 'success', 21, NULL);
INSERT INTO `log_operate` VALUES (675, '2023-07-13 16:25:05', 'schedule', '192.168.48.4', '调度承运任务', 'INSERT', 'POST', '/transport/scheduling', 'success', 120, NULL);
INSERT INTO `log_operate` VALUES (676, '2023-07-13 16:25:06', 'schedule', '192.168.48.4', '查询承运单（待调度）', 'SELECT', 'GET', '/transport/scheduling/getCarriers', 'success', 23, NULL);
INSERT INTO `log_operate` VALUES (677, '2023-07-13 16:25:09', 'schedule', '192.168.48.4', '查询承运单（待调度）', 'SELECT', 'GET', '/transport/scheduling/getCarriers', 'success', 21, NULL);
INSERT INTO `log_operate` VALUES (678, '2023-07-13 16:25:10', 'schedule', '192.168.48.4', '查询承运单（待调度）', 'SELECT', 'GET', '/transport/scheduling/getCarriers', 'success', 14, NULL);
INSERT INTO `log_operate` VALUES (679, '2023-07-13 16:25:22', 'carrier', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 18, NULL);
INSERT INTO `log_operate` VALUES (680, '2023-07-13 16:25:35', 'carrier', '192.168.48.4', '标记承运单为已完成', 'UPDATE', 'PUT', '/transport/carrier', 'success', 51, NULL);
INSERT INTO `log_operate` VALUES (681, '2023-07-13 16:25:36', 'carrier', '192.168.48.4', '查询本人提交的承运单', 'SELECT', 'GET', '/transport/carrier', 'success', 17, NULL);
INSERT INTO `log_operate` VALUES (682, '2023-07-13 16:25:55', 'cost', '192.168.48.4', '查询承运单（已完成）', 'SELECT', 'GET', '/transport/cost/getCarriers', 'success', 19, NULL);
INSERT INTO `log_operate` VALUES (683, '2023-07-13 16:25:57', 'cost', '192.168.48.4', '运输成本报表', 'SELECT', 'GET', '/transport/cost', 'success', 20, NULL);
INSERT INTO `log_operate` VALUES (684, '2023-07-13 16:25:57', 'cost', '192.168.48.4', '查询承运单（已完成）', 'SELECT', 'GET', '/transport/cost/getCarriers', 'success', 29, NULL);
INSERT INTO `log_operate` VALUES (685, '2023-07-13 16:26:12', 'cost', '192.168.48.4', '录入成本', 'UPDATE', 'PUT', '/transport/cost', 'success', 66, NULL);
INSERT INTO `log_operate` VALUES (686, '2023-07-13 16:26:14', 'cost', '192.168.48.4', '查询承运单（已完成）', 'SELECT', 'GET', '/transport/cost/getCarriers', 'success', 10, NULL);
INSERT INTO `log_operate` VALUES (687, '2023-07-13 16:26:15', 'cost', '192.168.48.4', '运输成本报表', 'SELECT', 'GET', '/transport/cost', 'success', 25, NULL);
INSERT INTO `log_operate` VALUES (688, '2023-07-13 16:34:28', 'cost', '192.168.48.4', '运输成本报表', 'SELECT', 'GET', '/transport/cost', 'success', 34, NULL);
INSERT INTO `log_operate` VALUES (689, '2023-07-13 16:34:46', 'cost', '192.168.48.4', '查询承运单（已完成）', 'SELECT', 'GET', '/transport/cost/getCarriers', 'success', 15, NULL);
INSERT INTO `log_operate` VALUES (690, '2023-07-13 16:34:47', 'cost', '192.168.48.4', '查询承运单（已完成）', 'SELECT', 'GET', '/transport/cost/getCarriers', 'success', 21, NULL);
INSERT INTO `log_operate` VALUES (691, '2023-07-13 16:34:55', 'cost', '192.168.48.4', '运输成本报表', 'SELECT', 'GET', '/transport/cost', 'success', 864, NULL);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` int NOT NULL AUTO_INCREMENT COMMENT '角色编号（字段自动编号）',
  `role_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `role_purview` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色权限，多个权限用 / 区分',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统角色表用于存放系统权限数据，管理用户权限' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '系统管理员', 'system');
INSERT INTO `role` VALUES (2, '运输管理员', 'fleet');
INSERT INTO `role` VALUES (3, '承运业务员', 'carrier');
INSERT INTO `role` VALUES (4, '调度员', 'scheduling/cost');
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
INSERT INTO `scheduling` VALUES (1, '2023-07-12 22:53:39', 1, 1, NULL, NULL, NULL, NULL, NULL, 'abc', '2023-07-12 22:53:39', '2023-07-12 22:53:39');
INSERT INTO `scheduling` VALUES (2, '2023-07-13 12:57:11', 2, 2, 100.01, 100.01, 100.01, 100.01, 400.04, 'abc', '2023-07-13 12:57:11', '2023-07-13 12:57:11');
INSERT INTO `scheduling` VALUES (3, '2023-07-13 12:57:22', 3, 3, NULL, NULL, NULL, NULL, NULL, 'abc', '2023-07-13 12:57:22', '2023-07-13 12:57:22');
INSERT INTO `scheduling` VALUES (4, '2023-07-13 14:39:09', 9, 4, 100.01, 100.01, 100.01, 100.01, 400.04, 'schedule', '2023-07-13 14:39:09', '2023-07-13 14:39:09');
INSERT INTO `scheduling` VALUES (5, '2023-07-13 15:50:48', 11, 7, 900.01, 900.01, 900.01, 900.01, 3600.04, 'schedule', '2023-07-13 15:50:48', '2023-07-13 15:50:48');
INSERT INTO `scheduling` VALUES (6, '2023-07-13 16:24:13', 4, 8, NULL, NULL, NULL, NULL, NULL, 'schedule', '2023-07-13 16:24:13', '2023-07-13 16:24:13');
INSERT INTO `scheduling` VALUES (7, '2023-07-13 16:25:06', 12, 5, 900.01, 900.01, 900.01, 900.01, 3600.04, 'schedule', '2023-07-13 16:25:06', '2023-07-13 16:25:06');

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
INSERT INTO `truck` VALUES (1, '湘A12345', '2022-10-01', '大货车', 20, 1, 'Working', '无', '2023-07-12 22:44:08', '2023-07-12 22:44:08');
INSERT INTO `truck` VALUES (2, '湘A67890', '2022-10-01', '小货车', 5, 1, 'Working', '无', '2023-07-12 22:44:08', '2023-07-12 22:44:08');
INSERT INTO `truck` VALUES (3, '湘A12345', '2022-10-01', '大货车', 20, 1, 'Working', '无', '2023-07-13 12:07:40', '2023-07-13 12:07:40');
INSERT INTO `truck` VALUES (4, '湘A67890', '2022-10-01', '小货车', 5, 1, 'Working', '无', '2023-07-13 12:07:40', '2023-07-13 12:07:40');
INSERT INTO `truck` VALUES (5, '湘A67891', '2022-10-01', '小货车', 5, 1, 'Working', '无', '2023-07-13 12:07:40', '2023-07-13 12:07:40');
INSERT INTO `truck` VALUES (6, '湘A67892', '2022-10-01', '小货车', 5, 1, 'Free', '无', '2023-07-13 12:07:40', '2023-07-13 12:07:40');
INSERT INTO `truck` VALUES (7, '湘A67893', '2022-10-01', '小货车', 5, 1, 'Working', '无', '2023-07-13 12:07:40', '2023-07-13 12:07:40');
INSERT INTO `truck` VALUES (8, '湘A67894', '2022-10-01', '小货车', 5, 1, 'Working', '无', '2023-07-13 12:07:40', '2023-07-13 12:07:40');
INSERT INTO `truck` VALUES (9, '湘A67895', '2022-10-01', '小货车', 5, 1, 'Free', '无', '2023-07-13 12:07:40', '2023-07-13 12:07:40');
INSERT INTO `truck` VALUES (10, '湘A67896', '2022-10-01', '小货车', 5, 1, 'Free', '无', '2023-07-13 12:07:40', '2023-07-13 12:07:40');
INSERT INTO `truck` VALUES (11, '湘A67897', '2022-10-01', '小货车', 5, 1, 'Free', '无', '2023-07-13 12:07:40', '2023-07-13 12:07:40');

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
INSERT INTO `truck_team` VALUES (1, 'aaa', '张三', '无', '2023-07-12 22:42:16', '2023-07-12 22:42:16');
INSERT INTO `truck_team` VALUES (2, 'bbb', '李四', '无', '2023-07-12 22:42:16', '2023-07-12 22:42:16');
INSERT INTO `truck_team` VALUES (6, 'aaa', '张三', '无', '2023-07-13 12:07:22', '2023-07-13 12:07:22');
INSERT INTO `truck_team` VALUES (7, 'bbb', '李四', '无', '2023-07-13 12:07:22', '2023-07-13 12:07:22');
INSERT INTO `truck_team` VALUES (8, 'aaa', '张三', '无', '2023-07-13 12:08:51', '2023-07-13 12:08:51');
INSERT INTO `truck_team` VALUES (9, 'bbb', '李四', '无', '2023-07-13 12:08:51', '2023-07-13 12:08:51');
INSERT INTO `truck_team` VALUES (10, 'aaa', '张三', '无', '2023-07-13 12:09:04', '2023-07-13 12:09:04');
INSERT INTO `truck_team` VALUES (11, 'bbb', '李四', '无', '2023-07-13 12:09:04', '2023-07-13 12:09:04');

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
INSERT INTO `user` VALUES (1, 3, 'abc', '123', 'hahah', '男', '15813482972', '12345@test.com', '2023-07-06 11:13:01', '2023-07-11 13:10:38');
INSERT INTO `user` VALUES (2, 2, 'pr', '123', 'pengrui', '男', '98765432100', '9876543210@csu.edu.com', '2023-07-11 09:49:05', '2023-07-11 09:49:05');
INSERT INTO `user` VALUES (5, 1, 'system', '123', '系统管理员', '男', '12345678900', '1234567890@csu.edu.cn', '2023-07-13 10:44:45', '2023-07-13 10:44:45');
INSERT INTO `user` VALUES (6, 2, 'fleet', '123', '运输管理员', '男', '98765432100', '9876543210@csu.edu.cn', '2023-07-13 10:44:45', '2023-07-13 10:44:45');
INSERT INTO `user` VALUES (7, 3, 'carrier', '123', '承运业务员', '男', '12345678900', '1234567890@csu.edu.cn', '2023-07-13 10:48:10', '2023-07-13 10:48:10');
INSERT INTO `user` VALUES (8, 4, 'schedule', '123', '调度员', '男', '98765432100', '9876543210@csu.edu.cn', '2023-07-13 10:48:10', '2023-07-13 10:48:10');
INSERT INTO `user` VALUES (9, 5, 'cost', '123', '财务人员', '男', '12345678900', '1234567890@csu.edu.cn', '2023-07-13 11:50:00', '2023-07-13 11:50:00');
INSERT INTO `user` VALUES (10, 1, 'edp81', '8OJrNbHk', '李四', '男', '87654323100', '9876543210@csu.edu.cn', '2023-07-13 11:50:00', '2023-07-13 11:50:00');
INSERT INTO `user` VALUES (13, 1, 'zkd46', 'Ohr4170V', '张三', '男', '12345678900', '1234567890@csu.edu.cn', '2023-07-13 11:52:53', '2023-07-13 11:52:53');
INSERT INTO `user` VALUES (14, 1, 'dee95', 'SNv33Srj', '李四', '男', '87654323100', '9876543210@csu.edu.cn', '2023-07-13 11:52:53', '2023-07-13 11:52:53');
INSERT INTO `user` VALUES (15, 1, 'odo14', 'XgrvEg0g', '张三', '男', '12345678900', '1234567890@csu.edu.cn', '2023-07-13 15:37:18', '2023-07-13 15:37:18');
INSERT INTO `user` VALUES (16, 1, 'ntl79', 'JXt8SaVz', '李四', '男', '98765432100', '9876543210@csu.edu.cn', '2023-07-13 15:37:18', '2023-07-13 15:37:18');

SET FOREIGN_KEY_CHECKS = 1;
