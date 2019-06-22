/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 5.7.23 : Database - xy
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`xy` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

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

insert  into `xy_user`(`user_id`,`user_name`,`user_pass`,`user_avatar`,`user_address`,`user_phone`) values 
('b3a4ffce7738477fad8cd9d7ae3d99da','123','123456','http://10.2.16.131/images/9bf12f8e12c1f5871b1733ef373ad69f.jpg,','广东省广州市增城区广州大学松田学院','18138737001'),
('cf88ea590fa54d7cbc53a7859cb332df','123','123456','http://10.2.16.131/images/6fcd9756c174c8edfe47452214a16434.jpg,','','15811912936');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
