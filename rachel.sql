/*
 Navicat Premium Data Transfer

 Source Server         : ganxin
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : rachel

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 07/03/2019 22:23:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for rachel_admins
-- ----------------------------
DROP TABLE IF EXISTS `rachel_admins`;
CREATE TABLE `rachel_admins`  (
  `aid` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `portrait` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`aid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rachel_admins
-- ----------------------------
INSERT INTO `rachel_admins` VALUES (1, 'zmx', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL);

-- ----------------------------
-- Table structure for rachel_banners
-- ----------------------------
DROP TABLE IF EXISTS `rachel_banners`;
CREATE TABLE `rachel_banners`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '轮播图id',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片url',
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rachel_cinema_movies_relation
-- ----------------------------
DROP TABLE IF EXISTS `rachel_cinema_movies_relation`;
CREATE TABLE `rachel_cinema_movies_relation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '电影影院关系id',
  `cid` int(11) NOT NULL COMMENT '影院id',
  `mid` int(11) NOT NULL COMMENT '电影id',
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for rachel_cinemas
-- ----------------------------
DROP TABLE IF EXISTS `rachel_cinemas`;
CREATE TABLE `rachel_cinemas`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '影院id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '影院名',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '影院地址',
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rachel_cinemas
-- ----------------------------
INSERT INTO `rachel_cinemas` VALUES (7, '2', '四川', '2019-03-07 22:20:59');
INSERT INTO `rachel_cinemas` VALUES (2, '环球', '北京', '2019-03-05 00:05:11');
INSERT INTO `rachel_cinemas` VALUES (6, 'aaaaee', 'aaa', '2019-03-07 22:21:07');

-- ----------------------------
-- Table structure for rachel_comments
-- ----------------------------
DROP TABLE IF EXISTS `rachel_comments`;
CREATE TABLE `rachel_comments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `movie_id` int(11) NOT NULL COMMENT '电影id',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rachel_movie_halls
-- ----------------------------
DROP TABLE IF EXISTS `rachel_movie_halls`;
CREATE TABLE `rachel_movie_halls`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '影厅id',
  `hall` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '影厅名',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `cinema_id` int(11) NOT NULL COMMENT '影院id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rachel_movie_halls
-- ----------------------------
INSERT INTO `rachel_movie_halls` VALUES (1, '国语3D', '2019-03-05 23:04:38', 1);
INSERT INTO `rachel_movie_halls` VALUES (2, '英语2D', '2019-03-05 23:20:20', 2);
INSERT INTO `rachel_movie_halls` VALUES (5, 'cc', '2019-03-07 22:21:28', 7);

-- ----------------------------
-- Table structure for rachel_movies
-- ----------------------------
DROP TABLE IF EXISTS `rachel_movies`;
CREATE TABLE `rachel_movies`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '热门影片id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '影片名',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '影片图片地址',
  `is_hot` int(2) NOT NULL DEFAULT 0 COMMENT '热门电影（1->热门 0->非热门）',
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电影简介',
  `release_time` datetime(0) NULL DEFAULT NULL COMMENT '上映时间',
  `play_time` int(255) NULL DEFAULT NULL COMMENT '播放时间',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rachel_movies
-- ----------------------------
INSERT INTO `rachel_movies` VALUES (1, '阿丽塔', 'sample.jpg', 1, 'sa', '2019-03-06 20:55:12', 100, '2019-03-28 20:55:19');
INSERT INTO `rachel_movies` VALUES (6, '是ss是谁', '2019-03-06/5c7fda341aa1f.png', 1, '是是是', '2019-03-21 00:00:00', 15, '2019-03-06 22:33:24');

-- ----------------------------
-- Table structure for rachel_orders
-- ----------------------------
DROP TABLE IF EXISTS `rachel_orders`;
CREATE TABLE `rachel_orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `pay_status` int(11) NOT NULL COMMENT '支付状态(0->未支付 1->支付成功 2->支付失败)',
  `cdkey` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '兑换码',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `pay_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rachel_seats
-- ----------------------------
DROP TABLE IF EXISTS `rachel_seats`;
CREATE TABLE `rachel_seats`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '影厅座位id',
  `movie_hall_id` int(11) NOT NULL COMMENT '影厅id',
  `x_count` int(11) NOT NULL COMMENT '一共多少排',
  `y_count` int(11) NOT NULL COMMENT '一共多少行',
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for rachel_selected_seats
-- ----------------------------
DROP TABLE IF EXISTS `rachel_selected_seats`;
CREATE TABLE `rachel_selected_seats`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '座位id',
  `order_id` int(255) NULL DEFAULT NULL COMMENT '订单id',
  `time_table_id` int(11) NOT NULL COMMENT '电影播放时间表id',
  `x` int(11) NOT NULL COMMENT '第几排',
  `y` int(11) NOT NULL COMMENT '第几行',
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for rachel_timetable
-- ----------------------------
DROP TABLE IF EXISTS `rachel_timetable`;
CREATE TABLE `rachel_timetable`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '时间id',
  `show_time` datetime(0) NULL DEFAULT NULL COMMENT '播放时间',
  `movie_hall_id` int(11) NOT NULL COMMENT '播放影厅id',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `movie_id` int(11) NOT NULL COMMENT '电影id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for rachel_users
-- ----------------------------
DROP TABLE IF EXISTS `rachel_users`;
CREATE TABLE `rachel_users`  (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `portrait` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `gender` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '性别(0->女，1->男)',
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人简介',
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
