/*
 Navicat Premium Data Transfer

 Source Server         : sql
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : xy

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 13/06/2019 20:54:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for xy_goods
-- ----------------------------
DROP TABLE IF EXISTS `xy_goods`;
CREATE TABLE `xy_goods`  (
  `goods_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品唯一标识',
  `goods_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '卖出商品名称',
  `goods_pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品图片',
  `goods_price` decimal(10, 0) NOT NULL COMMENT '商品价格',
  `goods_desc` varchar(230) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品描述',
  `goods_type` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `seller_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `goods_status` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`goods_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xy_goods
-- ----------------------------
INSERT INTO `xy_goods` VALUES ('0db1578f55bf440991e668a9a3da6828', '15877', 'http://10.2.16.131/images/bace93774ba45bae8db39a313bf3f457.jpg,http://10.2.16.131/images/30d1d34c8394d4be38d65f9f245544e9.jpg,http://10.2.16.131/images/ea4bef2baaa01ace9d12502a3a633c0e.jpg,http://10.2.16.131/images/2e5dd8ff7ca784d8e920581f3eee3d94.gif,', 83, '+++', 'Nike', 'cf88ea590fa54d7cbc53a7859cb332df', 0);
INSERT INTO `xy_goods` VALUES ('15872e78f97c4beca9ce5bbbaca6da58', '11111', 'http://10.2.16.131/images/8cdadcec566b43a6a944ecba2bd267ad.jpg,', 11, '11', 'Adidas', 'cf88ea590fa54d7cbc53a7859cb332df', 0);
INSERT INTO `xy_goods` VALUES ('2840b5c5eecd4aa0b75c905c8fcf2e79', '检测', 'http://10.2.16.131/images/2e5dd8ff7ca784d8e920581f3eee3d94.gif,', 1, '检测检测', 'Jorden', 'cf88ea590fa54d7cbc53a7859cb332df', 2);
INSERT INTO `xy_goods` VALUES ('334b9adcef38486a9bcdda0fefeb136e', 'tiaozhuance', 'http://10.2.16.131/images/f9bd1ed4f29f3fed6805179afdb0120b.jpg,', 889, 'dddd', 'Vans', 'cf88ea590fa54d7cbc53a7859cb332df', 0);
INSERT INTO `xy_goods` VALUES ('759330142aaa48759dc0745485b2b958', 'tiaozhuanceshi', 'http://10.2.16.131/images/30d1d34c8394d4be38d65f9f245544e9.jpg,http://10.2.16.131/images/4afea2f4b59a8ca05b2a10f6ec584263.jpg,http://10.2.16.131/images/16488ea3889dd714a0e1edc9791f2eda.jpg,', 889, '1111112231', 'Nike', 'cf88ea590fa54d7cbc53a7859cb332df', 0);
INSERT INTO `xy_goods` VALUES ('7728ac2c549643ccaa21e75ed3fcdec9', '158ceshi', 'http://10.2.16.131/images/bace93774ba45bae8db39a313bf3f457.jpg,http://10.2.16.131/images/2e5dd8ff7ca784d8e920581f3eee3d94.gif,', 111, '111111', 'Nike', 'cf88ea590fa54d7cbc53a7859cb332df', 0);
INSERT INTO `xy_goods` VALUES ('778020b9a0f449208e767effbaab401e', 'tiaozhuanceshi22', 'http://10.2.16.131/images/16488ea3889dd714a0e1edc9791f2eda.jpg,', 889, '', 'Nike', 'cf88ea590fa54d7cbc53a7859cb332df', 0);
INSERT INTO `xy_goods` VALUES ('881541636c9643f2a38f203f26f54660', '158ceshi3123', 'http://10.2.16.131/images/bace93774ba45bae8db39a313bf3f457.jpg,http://10.2.16.131/images/2e5dd8ff7ca784d8e920581f3eee3d94.gif,http://10.2.16.131/images/bace93774ba45bae8db39a313bf3f457.jpg,http://10.2.16.131/images/2e5dd8ff7ca784d8e920581f3eee3d94.gif,', 111, '1111112231', 'Nike', 'cf88ea590fa54d7cbc53a7859cb332df', 0);
INSERT INTO `xy_goods` VALUES ('996406fcd4e241faba9fc8ba41e0d986', '111', 'http://10.2.16.131/images/bace93774ba45bae8db39a313bf3f457.jpg,', 11, '11', 'Nike', 'cf88ea590fa54d7cbc53a7859cb332df', 0);
INSERT INTO `xy_goods` VALUES ('9f0db692c23e4a7c9ccad9add423c4af', 'tiaozhuanceshi22', 'http://10.2.16.131/images/30d1d34c8394d4be38d65f9f245544e9.jpg,', 889, 'dddd', 'Nike', 'cf88ea590fa54d7cbc53a7859cb332df', 0);
INSERT INTO `xy_goods` VALUES ('a0dc3eaf0c0046fbbf12786649917764', '181测试', 'http://10.2.16.131/images/16488ea3889dd714a0e1edc9791f2eda.jpg,', 222, '123', 'Converse', 'b3a4ffce7738477fad8cd9d7ae3d99da', 0);
INSERT INTO `xy_goods` VALUES ('c3734ba6157043c4b628b972795175cb', 'picpiceee', 'http://10.2.16.131/images/afc868e5c8ea90e1c8b260a865a6a7fb.jpg,', 213, '12312321', 'Nike', 'cf88ea590fa54d7cbc53a7859cb332df', 0);
INSERT INTO `xy_goods` VALUES ('cb31d179b5e9469a9102a2fef23bfc7a', 'tiaozhuanceshi22', 'http://10.2.16.131/images/30d1d34c8394d4be38d65f9f245544e9.jpg,', 889, 'dddd', 'Nike', 'cf88ea590fa54d7cbc53a7859cb332df', 0);
INSERT INTO `xy_goods` VALUES ('cca85c47b5f54a9fa4f339f5fd001bb2', '11', 'http://10.2.16.131/images/ea4bef2baaa01ace9d12502a3a633c0e.jpg,', 2312, '213', 'Nike', 'cf88ea590fa54d7cbc53a7859cb332df', 0);
INSERT INTO `xy_goods` VALUES ('ce93d07f5ed04cbfa21acb2f5be89f12', '11', 'http://10.2.16.131/images/4afea2f4b59a8ca05b2a10f6ec584263.jpg,http://10.2.16.131/images/afc868e5c8ea90e1c8b260a865a6a7fb.jpg,http://10.2.16.131/images/fc1f3838ddfdba1c5c93a9e76650e143.jpg,', 123, '123132123', 'Nike', 'b3a4ffce7738477fad8cd9d7ae3d99da', 0);
INSERT INTO `xy_goods` VALUES ('d204c04c821c48809c255fc05f657e62', '111', 'http://10.2.16.131/images/2e5dd8ff7ca784d8e920581f3eee3d94.gif,', 1, '12', 'Nike', 'cf88ea590fa54d7cbc53a7859cb332df', 0);
INSERT INTO `xy_goods` VALUES ('d564b199b50249089034d98f154bf37b', '1111', 'http://10.2.16.131/images/afc868e5c8ea90e1c8b260a865a6a7fb.jpg,', 11, '11', 'Nike', 'cf88ea590fa54d7cbc53a7859cb332df', 0);
INSERT INTO `xy_goods` VALUES ('dc5e60f9483646a1a11d7e5d04934776', 'test11', 'http://10.2.16.131/images/8cdadcec566b43a6a944ecba2bd267ad.jpg,http://10.2.16.131/images/f9bd1ed4f29f3fed6805179afdb0120b.jpg,', 123, '123132123', 'Nike', 'b3a4ffce7738477fad8cd9d7ae3d99da', 0);
