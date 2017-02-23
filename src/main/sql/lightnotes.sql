/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : lightnotes

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-02-23 09:49:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `commentID` int(11) NOT NULL,
  `content` char(255) NOT NULL,
  `creatorID` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `type` int(255) NOT NULL,
  `belongID` int(11) NOT NULL,
  PRIMARY KEY (`commentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for label
-- ----------------------------
DROP TABLE IF EXISTS `label`;
CREATE TABLE `label` (
  `labelID` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(255) NOT NULL,
  `level` int(11) NOT NULL,
  `creatorID` int(11) NOT NULL,
  `previousID` int(11) DEFAULT NULL,
  PRIMARY KEY (`labelID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of label
-- ----------------------------
INSERT INTO `label` VALUES ('1', 'study', '1', '5', '-1');
INSERT INTO `label` VALUES ('2', 'play', '1', '5', '-1');
INSERT INTO `label` VALUES ('3', 'eat', '1', '5', '-1');
INSERT INTO `label` VALUES ('4', 'math', '2', '5', '1');
INSERT INTO `label` VALUES ('5', 'rich', '2', '5', '3');
INSERT INTO `label` VALUES ('6', 'video', '1', '6', '-1');

-- ----------------------------
-- Table structure for note
-- ----------------------------
DROP TABLE IF EXISTS `note`;
CREATE TABLE `note` (
  `noteID` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(255) NOT NULL,
  `theme` char(255) NOT NULL,
  `content` char(255) DEFAULT NULL,
  `editorID` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `creatorID` int(11) NOT NULL,
  `labelID` int(11) DEFAULT NULL,
  PRIMARY KEY (`noteID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of note
-- ----------------------------
INSERT INTO `note` VALUES ('1', '1', '米饭怎么做好吃', '加适量的水，不能煮太久', '5', '2017-02-21 18:56:45', '6', '3');
INSERT INTO `note` VALUES ('2', '1', '轻笔记', '欢迎使用轻笔记', '6', '2017-02-21 18:58:01', '5', '-1');

-- ----------------------------
-- Table structure for organization
-- ----------------------------
DROP TABLE IF EXISTS `organization`;
CREATE TABLE `organization` (
  `userID` int(11) NOT NULL,
  `teamID` int(11) NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`userID`,`teamID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization
-- ----------------------------

-- ----------------------------
-- Table structure for share
-- ----------------------------
DROP TABLE IF EXISTS `share`;
CREATE TABLE `share` (
  `noteID` int(11) NOT NULL,
  `teamID` int(11) NOT NULL,
  `topicID` int(11) NOT NULL,
  `creatorID` int(11) NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`noteID`,`teamID`,`topicID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of share
-- ----------------------------

-- ----------------------------
-- Table structure for team
-- ----------------------------
DROP TABLE IF EXISTS `team`;
CREATE TABLE `team` (
  `teamID` int(11) NOT NULL,
  `name` char(255) NOT NULL,
  `description` char(255) NOT NULL,
  `time` datetime NOT NULL,
  `creatorID` int(11) NOT NULL,
  PRIMARY KEY (`teamID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of team
-- ----------------------------

-- ----------------------------
-- Table structure for topic
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `topicID` int(11) NOT NULL,
  `theme` char(255) NOT NULL,
  `description` char(255) NOT NULL,
  `creatorID` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `teamID` int(11) NOT NULL,
  PRIMARY KEY (`topicID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of topic
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userID` int(255) NOT NULL AUTO_INCREMENT,
  `userMail` char(255) NOT NULL,
  `password` char(255) NOT NULL,
  `type` int(255) NOT NULL,
  `name` char(255) NOT NULL,
  `gender` char(255) DEFAULT NULL,
  `age` int(255) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('5', 'Bill@qq.com', '123456', '2', '陈宜伟', 'man', '99');
INSERT INTO `user` VALUES ('6', 'Viver@qq.com', '654321', '2', 'Viver', 'woman', '22');