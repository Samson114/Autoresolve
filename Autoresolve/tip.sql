/*
Navicat MySQL Data Transfer

Source Server         : 172.18.85.77_3306
Source Server Version : 50045
Source Host           : 172.18.85.77:3306
Source Database       : tip

Target Server Type    : MYSQL
Target Server Version : 50045
File Encoding         : 65001

Date: 2013-06-19 17:20:34
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `info`
-- ----------------------------
DROP TABLE IF EXISTS `info`;
CREATE TABLE `info` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of info
-- ----------------------------
INSERT INTO `info` VALUES ('1', 'zyp');
INSERT INTO `info` VALUES ('2', 'zyr');
INSERT INTO `info` VALUES ('3', 'lpn');
