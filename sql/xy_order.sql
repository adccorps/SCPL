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

 Date: 13/06/2019 20:54:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for xy_order
-- ----------------------------
DROP TABLE IF EXISTS `xy_order`;
CREATE TABLE `xy_order`  (
  `order_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单唯一标识符',
  `seller_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '卖家唯一标识符',
  `buyer_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '买家唯一标识符',
  `goods_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xy_order
-- ----------------------------
INSERT INTO `xy_order` VALUES ('0bf6d7fc8a734b50b6f82515a5c2f4e4', 'cf88ea590fa54d7cbc53a7859cb332df', 'b3a4ffce7738477fad8cd9d7ae3d99da', '9f0db692c23e4a7c9ccad9add423c4af');
INSERT INTO `xy_order` VALUES ('350eb609b3744ecf9f8160c6784d32d2', 'cf88ea590fa54d7cbc53a7859cb332df', 'b3a4ffce7738477fad8cd9d7ae3d99da', '7728ac2c549643ccaa21e75ed3fcdec9');
INSERT INTO `xy_order` VALUES ('571a13af72a64d40a2154aa3cd364de6', 'b3a4ffce7738477fad8cd9d7ae3d99da', 'cf88ea590fa54d7cbc53a7859cb332df', 'ce93d07f5ed04cbfa21acb2f5be89f12');
INSERT INTO `xy_order` VALUES ('5c7ad7a424ca4e2ea1a17ae7dacb2675', 'cf88ea590fa54d7cbc53a7859cb332df', 'b3a4ffce7738477fad8cd9d7ae3d99da', '0db1578f55bf440991e668a9a3da6828');
INSERT INTO `xy_order` VALUES ('795d0335d56b46a59ef445cbce4a23c7', 'cf88ea590fa54d7cbc53a7859cb332df', 'b3a4ffce7738477fad8cd9d7ae3d99da', '2840b5c5eecd4aa0b75c905c8fcf2e79');

SET FOREIGN_KEY_CHECKS = 1;
