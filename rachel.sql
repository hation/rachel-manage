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

 Date: 20/03/2019 23:08:49
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
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rachel_banners
-- ----------------------------
INSERT INTO `rachel_banners` VALUES (1, 'https://gss3.bdstatic.com/-Po3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike180%2C5%2C5%2C180%2C60/sign=c3299fd84c34970a537e187df4a3baad/dcc451da81cb39dbdd0730a1dd160924aa183005.jpg', '2019-03-20 22:03:18');
INSERT INTO `rachel_banners` VALUES (2, 'https://gss3.bdstatic.com/7Po3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike116%2C5%2C5%2C116%2C38/sign=113efc83dc09b3deffb2ec3aadd607e4/71cf3bc79f3df8dc9670d47ac011728b4610288f.jpg', '2019-03-15 00:02:38');
INSERT INTO `rachel_banners` VALUES (3, 'https://gss0.bdstatic.com/94o3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike150%2C5%2C5%2C150%2C50/sign=86da1d0f26381f308a1485fbc868276d/91529822720e0cf3cf3f61cc0446f21fbe09aa38.jpg', '2019-03-15 00:10:01');
INSERT INTO `rachel_banners` VALUES (4, 'https://gss3.bdstatic.com/-Po3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike80%2C5%2C5%2C80%2C26/sign=5c071f4e0755b31988f48a2722c0e943/faf2b2119313b07e3944034701d7912396dd8c80.jpg', NULL);

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
) ENGINE = MyISAM AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rachel_cinemas
-- ----------------------------
INSERT INTO `rachel_cinemas` VALUES (8, '中环影城', '涪城区高新区虹苑路阳光西雅图', '2019-03-19 12:44:36');
INSERT INTO `rachel_cinemas` VALUES (9, '安州影院城', '安州区文化广场工人文化宫', '2019-03-19 12:44:59');
INSERT INTO `rachel_cinemas` VALUES (10, '大地影院', '涪城区绵兴东路55号中元广场5楼', '2019-03-19 12:45:17');
INSERT INTO `rachel_cinemas` VALUES (11, '万达影城', '涪城区花园路9号万达广场4楼', '2019-03-19 12:45:37');
INSERT INTO `rachel_cinemas` VALUES (12, '博纳国际影城', '涪城区临园路东段74号凯德广场2期6楼', '2019-03-19 12:45:52');
INSERT INTO `rachel_cinemas` VALUES (13, '太平洋影城', '涪城区九洲跃进路1958二期', '2019-03-19 12:46:10');
INSERT INTO `rachel_cinemas` VALUES (14, '保利万和国际影城', '涪城区公园路新兴旺百货3楼', '2019-03-19 12:47:55');
INSERT INTO `rachel_cinemas` VALUES (15, '中影国际影城', '游仙区一环路东段288号', '2019-03-19 12:48:06');
INSERT INTO `rachel_cinemas` VALUES (16, '飞天影城', '金堂县三星镇文达路易山国际壹号街区4栋4楼（成都）', '2019-03-19 12:48:26');
INSERT INTO `rachel_cinemas` VALUES (17, '星空国际影城', '青白江区华金大道二段551号（成都）', '2019-03-19 12:48:39');

-- ----------------------------
-- Table structure for rachel_comments
-- ----------------------------
DROP TABLE IF EXISTS `rachel_comments`;
CREATE TABLE `rachel_comments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `users_id` int(11) NOT NULL COMMENT '用户id',
  `movies_id` int(11) NOT NULL COMMENT '电影id',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rachel_comments
-- ----------------------------
INSERT INTO `rachel_comments` VALUES (1, 1, 7, 'wdqwe', '2019-03-20 22:55:53');
INSERT INTO `rachel_comments` VALUES (2, 1, 7, 'sfdasfasf', '2019-03-20 22:59:06');
INSERT INTO `rachel_comments` VALUES (3, 1, 7, 'sajkdnjsaksdajsdoijasodi', '2019-03-20 23:08:03');

-- ----------------------------
-- Table structure for rachel_movie_halls
-- ----------------------------
DROP TABLE IF EXISTS `rachel_movie_halls`;
CREATE TABLE `rachel_movie_halls`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '影厅id',
  `hall` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '影厅名',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `cinemas_id` int(11) NOT NULL COMMENT '影院id',
  `x_count` int(11) NULL DEFAULT NULL COMMENT '行数',
  `y_count` int(11) NULL DEFAULT NULL COMMENT '列数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rachel_movie_halls
-- ----------------------------
INSERT INTO `rachel_movie_halls` VALUES (6, '国语2D', '2019-03-19 13:10:26', 8, 10, 10);
INSERT INTO `rachel_movie_halls` VALUES (7, '国语3D', '2019-03-19 13:10:48', 8, 10, 10);
INSERT INTO `rachel_movie_halls` VALUES (8, '英语2D', '2019-03-19 13:11:03', 8, 10, 10);
INSERT INTO `rachel_movie_halls` VALUES (9, '英语3D', '2019-03-19 13:11:13', 8, 10, 10);
INSERT INTO `rachel_movie_halls` VALUES (10, '国语2D', '2019-03-19 13:11:21', 9, 10, 10);
INSERT INTO `rachel_movie_halls` VALUES (11, '国语4D', '2019-03-19 13:11:41', 8, 10, 10);
INSERT INTO `rachel_movie_halls` VALUES (12, '国语3D', '2019-03-19 13:11:49', 9, 10, 10);
INSERT INTO `rachel_movie_halls` VALUES (13, '英语3D', '2019-03-19 13:11:59', 9, 10, 10);
INSERT INTO `rachel_movie_halls` VALUES (14, '英语2D', '2019-03-19 13:12:07', 9, 10, 10);
INSERT INTO `rachel_movie_halls` VALUES (15, '国语2D', '2019-03-19 13:12:15', 10, 10, 10);
INSERT INTO `rachel_movie_halls` VALUES (16, '国语3D', '2019-03-19 13:12:23', 10, 10, 10);
INSERT INTO `rachel_movie_halls` VALUES (17, '英语2D', '2019-03-19 13:12:31', 10, 10, 10);
INSERT INTO `rachel_movie_halls` VALUES (18, '英语3D', '2019-03-19 13:12:39', 10, 10, 10);
INSERT INTO `rachel_movie_halls` VALUES (19, '国语2D', '2019-03-19 13:12:45', 11, 10, 10);
INSERT INTO `rachel_movie_halls` VALUES (20, '国语3D', '2019-03-19 13:12:52', 11, 10, 10);
INSERT INTO `rachel_movie_halls` VALUES (21, '英语2D', '2019-03-19 13:12:58', 11, 10, 10);
INSERT INTO `rachel_movie_halls` VALUES (22, '英语3D', '2019-03-19 13:13:04', 11, 10, 10);
INSERT INTO `rachel_movie_halls` VALUES (23, '国语2D', '2019-03-19 13:13:13', 12, 10, 10);
INSERT INTO `rachel_movie_halls` VALUES (24, '国语3D', '2019-03-19 13:13:21', 12, 10, 10);
INSERT INTO `rachel_movie_halls` VALUES (25, '英语2D', '2019-03-19 13:13:26', 12, 10, 10);
INSERT INTO `rachel_movie_halls` VALUES (26, '英语3D', '2019-03-19 13:13:32', 12, 10, 10);
INSERT INTO `rachel_movie_halls` VALUES (27, '国语2D', '2019-03-19 13:13:38', 13, 10, 10);
INSERT INTO `rachel_movie_halls` VALUES (28, '国语3D', '2019-03-19 13:13:59', 13, 10, 10);
INSERT INTO `rachel_movie_halls` VALUES (29, '英语2D', '2019-03-19 13:14:05', 13, 10, 10);
INSERT INTO `rachel_movie_halls` VALUES (30, '英语3D', '2019-03-19 13:14:16', 13, 10, 10);
INSERT INTO `rachel_movie_halls` VALUES (31, '国语2D', '2019-03-19 13:14:32', 14, 10, 10);
INSERT INTO `rachel_movie_halls` VALUES (32, '国语3D', '2019-03-19 13:14:37', 14, 10, 10);
INSERT INTO `rachel_movie_halls` VALUES (33, '英语2D', '2019-03-19 13:14:43', 14, 10, 10);
INSERT INTO `rachel_movie_halls` VALUES (34, '英语3D', '2019-03-19 13:14:50', 14, 10, 10);
INSERT INTO `rachel_movie_halls` VALUES (35, '国语2D', '2019-03-19 13:14:56', 15, 10, 10);
INSERT INTO `rachel_movie_halls` VALUES (36, '国语3D', '2019-03-19 13:15:02', 15, 10, 10);
INSERT INTO `rachel_movie_halls` VALUES (37, '英语2D', '2019-03-19 13:15:08', 15, 10, 10);
INSERT INTO `rachel_movie_halls` VALUES (38, '英语3D', '2019-03-19 13:15:16', 15, 10, 10);
INSERT INTO `rachel_movie_halls` VALUES (39, '国语2D', '2019-03-19 13:15:21', 16, 10, 10);
INSERT INTO `rachel_movie_halls` VALUES (40, '国语3D', '2019-03-19 13:15:38', 16, 10, 10);
INSERT INTO `rachel_movie_halls` VALUES (41, '英语2D', '2019-03-19 13:15:45', 16, 10, 10);
INSERT INTO `rachel_movie_halls` VALUES (42, '英语3D', '2019-03-19 13:15:50', 16, 10, 10);
INSERT INTO `rachel_movie_halls` VALUES (43, '国语2D', '2019-03-19 13:15:57', 17, 10, 10);
INSERT INTO `rachel_movie_halls` VALUES (44, '国语3D', '2019-03-19 13:16:02', 17, 10, 10);
INSERT INTO `rachel_movie_halls` VALUES (45, '英语2D', '2019-03-19 13:16:09', 17, 10, 10);
INSERT INTO `rachel_movie_halls` VALUES (46, '英语3D', '2019-03-19 13:16:14', 17, 10, 10);

-- ----------------------------
-- Table structure for rachel_movies
-- ----------------------------
DROP TABLE IF EXISTS `rachel_movies`;
CREATE TABLE `rachel_movies`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '热门影片id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '影片名',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '影片图片地址',
  `is_hot` int(2) NOT NULL DEFAULT 0 COMMENT '热门电影（1->热门 0->非热门）',
  `info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '电影简介',
  `release_time` datetime(0) NULL DEFAULT NULL COMMENT '上映时间',
  `play_time` int(255) NULL DEFAULT NULL COMMENT '播放时间',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rachel_movies
-- ----------------------------
INSERT INTO `rachel_movies` VALUES (7, '流浪地球', 'https://gss3.bdstatic.com/-Po3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike180%2C5%2C5%2C180%2C60/sign=c3299fd84c34970a537e187df4a3baad/dcc451da81cb39dbdd0730a1dd160924aa183005.jpg', 1, '太阳即将毁灭，人类在地球表面建造出巨大的推进器，寻找新家园。然而宇宙之路危机四伏，为了拯救地球，为了人类能在漫长的2500年后抵达新的家园，流浪地球时代的年轻人挺身而出，展开争分夺秒的生死之战。', '2019-01-05 00:00:00', 128, '2019-03-19 12:57:09');
INSERT INTO `rachel_movies` VALUES (8, '疯狂的外星人', 'https://gss3.bdstatic.com/7Po3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike180%2C5%2C5%2C180%2C60/sign=36b2ee94a7014c080d3620f76b12696d/0df3d7ca7bcb0a462d89e8046563f6246b60af60.jpg', 1, '号称银河系最先进的外星文明试图和地球建交，谁知一连串的误会导致意外发生。外星使者的飞船坠入大气层，最终摔在了中国某市的世界公园中。靠耍猴戏为生的耿浩（黄渤 饰）和酒贩子好友大飞（沈腾 饰）把受伤的外星人错认为来自南美洲的猴子，在自家猴子受伤的情况下，耿浩开始训练起这个他口中的“刚果骚骚猴”来了。由于失去了超能力加成设备，外星人的本事无法施展，只能任由这两个傻乎乎的地球人打骂操练。尽管如此，他仍试图夺回自己的装备。另一方面，之前与外星人交流失败的超级大国根据外星人留下的信息，穿梭世界各地寻找外星使者。地球的命运朝着不可预测的方向发展……', '2019-02-05 00:00:00', 116, '2019-03-19 12:59:45');
INSERT INTO `rachel_movies` VALUES (9, '新喜剧之王', 'https://gss2.bdstatic.com/-fo3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike180%2C5%2C5%2C180%2C60/sign=85c71f624da98226accc2375ebebd264/0b7b02087bf40ad10cda5af4592c11dfa9ecceef.jpg', 1, '大型影视基地，胸怀明星梦的女子如梦（鄂靖文 饰）已经在影视圈摸爬滚打了十多年，却依旧还是籍籍无名的龙套演员。平日里，在片场饱受剧组和其他演员的欺凌嘲笑，回到家则被恨铁不成钢的老爹指责，甚至扬言断绝父女关系。然而如梦一律微笑面对，天大的委屈也藏在心中，死皮赖脸地抓住每一个希望渺茫的机会。在此期间，她结识了热衷于跑龙套的李洋，早已过气却自视甚高的童星马可（王宝强 饰），更彻彻底底看清了自己以及爱情的真相。 \r\n　　她是过于平凡的小人物，是一个不该有梦的女孩，是一个直到宇宙灭亡也永远不会得到演戏机会的可悲龙套……', '2019-02-05 00:00:00', 91, '2019-03-19 13:01:44');
INSERT INTO `rachel_movies` VALUES (10, '阿丽塔：战斗天使', 'https://gss0.bdstatic.com/94o3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike150%2C5%2C5%2C150%2C50/sign=86da1d0f26381f308a1485fbc868276d/91529822720e0cf3cf3f61cc0446f21fbe09aa38.jpg', 1, '故事发生在遥远的26世纪，外科医生依德（克里斯托弗·瓦尔兹 Christoph Waltz 饰）在垃圾场里捡到了只剩下头部的机械少女将她带回家中，给她装上了本来为自己已故的女儿所准备的义体，并取名阿丽塔（罗莎·萨拉扎尔 Rosa Salazar 饰）。苏醒后的阿丽塔对这个五彩斑斓但却暴力而又残酷的世界产生了浓厚的兴趣，在结识了青年雨果（基恩·约翰逊 Keean Johnson 饰）后，阿丽塔开始接触名为机动球的运动，并在比赛中展现出了惊人的格斗天赋。 ', '2019-02-22 00:00:00', 122, '2019-03-19 13:03:33');
INSERT INTO `rachel_movies` VALUES (11, '惊奇队长', 'https://gss3.bdstatic.com/7Po3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike116%2C5%2C5%2C116%2C38/sign=113efc83dc09b3deffb2ec3aadd607e4/71cf3bc79f3df8dc9670d47ac011728b4610288f.jpg', 1, '卡罗尔·丹弗斯（布丽·拉尔森 饰）是克里人的精英部队一员，但她挣扎着回忆过去，对于怎么获得超能力、以及之前的人生等超能力之前的人生，她只在梦中有片段不成章的记忆，这层困扰引起的情绪波动也进而影响她对超能力的掌控。所幸，在星际战队指挥官（裘德·洛 饰）的调教之下，卡罗尔·丹弗斯学会如何控制自己的超能力', '2019-03-08 00:00:00', 124, '2019-03-19 13:05:04');
INSERT INTO `rachel_movies` VALUES (12, '比悲伤更悲伤的故事', 'https://gss2.bdstatic.com/-fo3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike180%2C5%2C5%2C180%2C60/sign=6215c6c9d488d43fe4a499a01c77b97e/a50f4bfbfbedab649d592c7cf536afc379311e66.jpg', 1, '唱片制作人张哲凯（刘以豪 饰）和王牌作词人宋媛媛（陈意涵 饰）相依为命，两人自幼身世坎坷只有彼此为伴，他们是亲人、是朋友，也彷佛是命中注定的另一半。父亲罹患遗传重症而被母亲抛弃的哲凯，深怕自己随时会发病不久人世，始终没有跨出友谊的界线对媛媛展露爱意。眼见哲凯的病情加重，他暗自决定用剩余的生命完成他们之间的终曲，再为媛媛找个可以托付一生的好男人', '2019-03-01 00:00:00', 130, '2019-03-19 13:06:37');
INSERT INTO `rachel_movies` VALUES (13, '绿皮书', 'https://gss3.bdstatic.com/-Po3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike80%2C5%2C5%2C80%2C26/sign=5c071f4e0755b31988f48a2722c0e943/faf2b2119313b07e3944034701d7912396dd8c80.jpg', 1, '一名黑人钢琴家，为前往种族歧视严重的南方巡演，找了一个粗暴的白人混混做司机。在一路开车南下的过程里，截然不同的两人矛盾不断，引发了不少争吵和笑料。但又在彼此最需要的时候，一起共渡难关。行程临近结束，两人也慢慢放下了偏见...... 绿皮书，是一本专为黑人而设的旅行指南，标注了各城市中允许黑人进入的旅店、餐馆。电影由真实故事改编。', '2019-03-14 00:00:00', 107, '2019-03-19 13:08:18');

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
-- Table structure for rachel_publish
-- ----------------------------
DROP TABLE IF EXISTS `rachel_publish`;
CREATE TABLE `rachel_publish`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '电影影院关系id',
  `movie_halls_id` int(11) NOT NULL COMMENT '影厅id',
  `movies_id` int(11) NOT NULL COMMENT '电影id',
  `cinemas_id` int(11) NOT NULL COMMENT '影院id',
  `price` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单价',
  `show_time` datetime(0) NULL DEFAULT NULL COMMENT '放映时间',
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rachel_publish
-- ----------------------------
INSERT INTO `rachel_publish` VALUES (5, 6, 7, 8, '80', '2019-03-19 13:59:00', '2019-03-19 13:16:47');
INSERT INTO `rachel_publish` VALUES (6, 8, 8, 8, '80', '2019-02-12 13:59:00', '2019-03-19 13:17:21');
INSERT INTO `rachel_publish` VALUES (7, 11, 10, 8, '80', '2019-03-14 12:59:00', '2019-03-19 13:17:48');
INSERT INTO `rachel_publish` VALUES (8, 7, 7, 8, '100', '2019-03-12 13:59:00', '2019-03-19 13:18:59');
INSERT INTO `rachel_publish` VALUES (9, 10, 7, 9, '10', '2019-03-12 01:00:00', '2019-03-19 13:19:42');
INSERT INTO `rachel_publish` VALUES (10, 16, 7, 10, '12', '2019-03-13 01:02:00', '2019-03-19 13:20:04');
INSERT INTO `rachel_publish` VALUES (11, 13, 10, 9, '33', '2019-02-27 01:11:00', '2019-03-19 13:20:26');
INSERT INTO `rachel_publish` VALUES (12, 22, 11, 11, '22', '2019-03-19 01:01:00', '2019-03-19 13:20:50');
INSERT INTO `rachel_publish` VALUES (13, 6, 12, 8, '12', '2019-03-18 11:01:00', '2019-03-19 13:21:10');
INSERT INTO `rachel_publish` VALUES (14, 9, 7, 8, '222', '2019-03-21 14:11:00', '2019-03-19 13:22:04');
INSERT INTO `rachel_publish` VALUES (15, 22, 7, 11, '22', '2019-03-12 13:01:00', '2019-03-19 13:22:38');
INSERT INTO `rachel_publish` VALUES (16, 23, 7, 12, '11', '2019-03-11 14:22:00', '2019-03-19 13:22:53');
INSERT INTO `rachel_publish` VALUES (17, 29, 7, 13, '22', '2019-03-11 11:11:00', '2019-03-19 13:23:11');
INSERT INTO `rachel_publish` VALUES (18, 32, 7, 14, '33', '2019-03-15 11:11:00', '2019-03-19 13:23:30');
INSERT INTO `rachel_publish` VALUES (19, 39, 7, 16, '22', '2019-03-17 14:22:00', '2019-03-19 13:23:49');
INSERT INTO `rachel_publish` VALUES (20, 43, 7, 17, '33', '2019-03-11 11:11:00', '2019-03-19 13:24:02');

-- ----------------------------
-- Table structure for rachel_selected_seats
-- ----------------------------
DROP TABLE IF EXISTS `rachel_selected_seats`;
CREATE TABLE `rachel_selected_seats`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '座位id',
  `order_id` int(255) NULL DEFAULT NULL COMMENT '订单id',
  `publish_id` int(11) NOT NULL COMMENT '发布电影id',
  `x` int(11) NOT NULL COMMENT '第几排',
  `y` int(11) NOT NULL COMMENT '第几行',
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for rachel_users
-- ----------------------------
DROP TABLE IF EXISTS `rachel_users`;
CREATE TABLE `rachel_users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `portrait` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `gender` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '性别(0->女，1->男)',
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人简介',
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rachel_users
-- ----------------------------
INSERT INTO `rachel_users` VALUES (1, 'wqweqw', '11', '11', '11', '0', '11', '2019-03-20 22:55:02');

SET FOREIGN_KEY_CHECKS = 1;
