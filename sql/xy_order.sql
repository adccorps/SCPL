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

