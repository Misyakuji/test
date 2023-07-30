/*
 Navicat Premium Data Transfer

 Source Server         : localhost-mysql
 Source Server Type    : MySQL
 Source Server Version : 80033
 Source Host           : 127.0.0.1:3306
 Source Schema         : simbot

 Target Server Type    : MySQL
 Target Server Version : 80033
 File Encoding         : 65001

 Date: 26/06/2023 00:35:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bot_task
-- ----------------------------
DROP TABLE IF EXISTS `bot_task`;
CREATE TABLE `bot_task`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `timer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '定时任务表达式',
  `contents` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '消息内容',
  `targets` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '发送目标（复数号码）',
  `types` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '发送类型：0-指定群组，1-指定好友',
  `active` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '0-不可用，1-可用',
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bot_task
-- ----------------------------
INSERT INTO `bot_task` VALUES (1, '0 0 0/1 * * ?', '遇见你之前，我没想过结婚，遇见你之后，结婚我没想过别人。', '67252271', '1', '1', '2023-06-22 16:26:45', '2023-06-23 00:25:44');
INSERT INTO `bot_task` VALUES (2, '0 0 0/1 * * ?', '你走向我，我觉得一日不见如隔三秋，你朝我笑，我又觉得三秋未见不过一日。', '67252271', '1', '0', '2023-06-22 16:25:55', '2023-06-26 00:34:10');
INSERT INTO `bot_task` VALUES (3, '0 0 0/1 * * ?', '如果可以和你在一起，我宁愿让天空所有的星光全部损落，因为你的眼睛，是我生命里最亮的光芒。', '67252271', '1', '0', '2023-06-22 16:25:56', '2023-06-26 00:34:12');
INSERT INTO `bot_task` VALUES (4, '0 0 0/1 * * ?', '我一直喜欢温暖的东西，而世界上最温暖的，无非阳光和你。', '67252271', '1', '0', '2023-06-22 16:25:57', '2023-06-26 00:34:19');
INSERT INTO `bot_task` VALUES (5, '0 0 0/1 * * ?', '我不要短暂的温存，只要你一世的陪伴。', '67252271', '1', '0', '2023-06-22 16:25:58', '2023-06-26 00:34:22');
INSERT INTO `bot_task` VALUES (6, '0 0 0/1 * * ?', '我没有特别喜欢的零食，没有特别喜欢的电影，没有特别喜欢听的歌，但我就是特别喜欢你。', '67252271', '1', '0', '2023-06-22 16:26:00', '2023-06-26 00:34:24');
INSERT INTO `bot_task` VALUES (7, '0 0 0/1 * * ?', '一年四季想陪你度过，世间琐事都想与你做，此生也只想同你尝尽烟火。', '67252271', '1', '0', '2023-06-23 00:25:46', '2023-06-26 00:34:26');
INSERT INTO `bot_task` VALUES (8, '0 0 0/1 * * ?', '我还是很喜欢你，像七月的风和八月的雨，毫无交集。', '67252271', '1', '0', '2023-06-23 00:25:46', '2023-06-26 00:34:27');
INSERT INTO `bot_task` VALUES (9, '0 0 0/1 * * ?', '你在我身边也好，在天边也罢，想到世界的角落有一个你，觉得整个世界也变得温柔安定了。', '67252271', '1', '0', '2023-06-23 00:25:46', '2023-06-26 00:34:29');
INSERT INTO `bot_task` VALUES (10, '0 0 0/1 * * ?', '你在我身边也好，在天边也罢，想到世界的角落有一个你，觉得整个世界也变得温柔安定了。', '67252271', '1', '0', '2023-06-23 00:25:46', '2023-06-26 00:34:31');
INSERT INTO `bot_task` VALUES (11, '0 0 0/1 * * ?', '我的人生理念是活十成，一成不变的是爱你，剩下九成是加倍爱你。', '67252271', '1', '0', '2023-06-23 00:25:46', '2023-06-26 00:34:35');

-- ----------------------------
-- Triggers structure for table bot_task
-- ----------------------------
DROP TRIGGER IF EXISTS `create`;
delimiter ;;
CREATE TRIGGER `create` BEFORE INSERT ON `bot_task` FOR EACH ROW SET NEW.create_time = NOW()
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
