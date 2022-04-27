/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : blogger

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2022-04-27 20:36:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `category_id` bigint(20) NOT NULL,
  `content` longtext NOT NULL,
  `title` varchar(128) NOT NULL,
  `view_count` int(255) NOT NULL,
  `username` varchar(128) NOT NULL,
  `status` int(10) NOT NULL DEFAULT '1',
  `summary` varchar(256) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  `comment_count` int(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`) USING BTREE,
  KEY `category_id` (`category_id`),
  CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '1', 'go语言学习路线细节', 'Go学习路线', '1', 'XM', '1', 'go相关学习路线', '2022-04-27 20:17:11', null, '1');
INSERT INTO `article` VALUES ('2', '1', 'abc fdlksafjdlajflk fdjlasjfdkljwa', '5qi go', '1', 'sun', '1', 'abc fd', '2022-04-26 13:04:42', null, '0');
INSERT INTO `article` VALUES ('3', '2', 'C++', 'C++', '1', 'S', '1', 'C++', '2022-04-26 13:58:13', null, '0');
INSERT INTO `article` VALUES ('4', '5', 'LINUX', 'LINUX', '1', 'LINUX', '1', 'LINUX', '2022-04-26 13:58:43', null, '0');
INSERT INTO `article` VALUES ('5', '3', 'HTML+CSS', 'HTML+CSS', '1', 'HS', '1', 'HTML+CSS', '2022-04-26 13:59:30', null, '0');
INSERT INTO `article` VALUES ('6', '4', 'css进阶', 'css进阶', '1', 'cs', '1', 'css进阶', '2022-04-26 14:00:30', null, '0');
INSERT INTO `article` VALUES ('7', '2', '<p>好一个c++</p>', 'c++冲刺', '0', '李哥', '1', '<p>好一个c++</p>', '2022-04-27 20:17:59', null, '0');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `category_name` varchar(255) NOT NULL,
  `category_no` int(10) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_name` (`category_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', 'Go语言', '1', '2022-04-21 10:53:57', '2022-04-26 10:54:16');
INSERT INTO `category` VALUES ('2', '后端开发', '2', '2022-04-26 10:54:44', '2022-04-23 10:54:40');
INSERT INTO `category` VALUES ('3', '前端开发', '3', '2022-04-16 10:57:26', '2022-04-18 10:57:32');
INSERT INTO `category` VALUES ('4', 'css', '4', '2022-04-17 10:57:49', '2022-04-18 10:57:52');
INSERT INTO `category` VALUES ('5', '运维', '4', '2022-04-26 12:27:21', null);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `username` varchar(64) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(64) NOT NULL DEFAULT '1',
  `article_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article_id` (`article_id`),
  CONSTRAINT `article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '好文', '李哥', '2022-04-27 20:15:12', '1', '2');
INSERT INTO `comment` VALUES ('2', '方法', '分发', '2022-04-27 20:15:25', '1', '1');
INSERT INTO `comment` VALUES ('3', '123', '123', '2022-04-27 20:17:11', '1', '1');

-- ----------------------------
-- Table structure for leave
-- ----------------------------
DROP TABLE IF EXISTS `leave`;
CREATE TABLE `leave` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of leave
-- ----------------------------
INSERT INTO `leave` VALUES ('1', '李哥', '1017302290@qq.com', 'woshi', '2022-04-27 20:15:55', null);
