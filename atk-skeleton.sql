/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50713
 Source Host           : localhost
 Source Database       : atk-skeleton

 Target Server Type    : MySQL
 Target Server Version : 50713
 File Encoding         : utf-8

 Date: 02/09/2017 15:31:21 PM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `app_testNode`
-- ----------------------------
DROP TABLE IF EXISTS `app_testNode`;
CREATE TABLE `app_testNode` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `auth_accessRights`
-- ----------------------------
DROP TABLE IF EXISTS `auth_accessRights`;
CREATE TABLE `auth_accessRights` (
  `node` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `group_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`node`,`action`,`group_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `group` FOREIGN KEY (`group_id`) REFERENCES `Groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `auth_api`
-- ----------------------------
DROP TABLE IF EXISTS `auth_api`;
CREATE TABLE `auth_api` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `selector` char(12) NOT NULL,
  `token` char(64) NOT NULL,
  `username` varchar(30) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `selector` (`selector`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `auth_groups`
-- ----------------------------
DROP TABLE IF EXISTS `auth_groups`;
CREATE TABLE `auth_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `auth_rememberMe`
-- ----------------------------
DROP TABLE IF EXISTS `auth_rememberMe`;
CREATE TABLE `auth_rememberMe` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `selector` char(12) NOT NULL,
  `token` char(64) NOT NULL,
  `username` varchar(30) NOT NULL,
  `expires` datetime NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `selector` (`selector`),
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `auth_u2f`
-- ----------------------------
DROP TABLE IF EXISTS `auth_u2f`;
CREATE TABLE `auth_u2f` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `keyHandle` varchar(255) NOT NULL,
  `publicKey` varchar(255) NOT NULL,
  `certificate` text NOT NULL,
  `counter` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `auth_users`
-- ----------------------------
DROP TABLE IF EXISTS `auth_users`;
CREATE TABLE `auth_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `passwd` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL DEFAULT '',
  `lastname` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `isDisabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isAdmin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isU2FEnabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `auth_users_groups`
-- ----------------------------
DROP TABLE IF EXISTS `auth_users_groups`;
CREATE TABLE `auth_users_groups` (
  `user_id` int(11) unsigned NOT NULL,
  `group_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

SET FOREIGN_KEY_CHECKS = 1;
