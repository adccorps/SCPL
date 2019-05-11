/*
SQLyog Enterprise v12.08 (32 bit)
MySQL - 5.6.41 : Database - xy
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE IF NOT EXISTS `xy` DEFAULT CHARACTER SET utf8mb4;

USE `xy`;

/*Table structure for table `xy_user` */

DROP TABLE IF EXISTS `xy_user`;

CREATE TABLE `xy_user` (
  `user_id` varchar(32) NOT NULL COMMENT '用户唯一标识符',
  `user_name` varchar(15) NOT NULL COMMENT '用户名',
  `user_pass` varchar(20) NOT NULL COMMENT '用户密码',
  `user_avatar` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `user_address` varchar(255) DEFAULT '' COMMENT '用户地址',
  `user_phone` varchar(11) NOT NULL COMMENT '用户手机号',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `xy_user_user_phone_uindex` (`user_phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `xy_user` */

insert  into `xy_user`(`user_id`,`user_name`,`user_pass`,`user_avatar`,`user_address`,`user_phone`) values ('92aa2e75ba6f413888bebf0392baab17','admin','456789',NULL,'','18632068795'),('bd2e9ce03ef74cc1ab0419a83f174ffe','123','pingsha',NULL,'sontan','18369456123');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
