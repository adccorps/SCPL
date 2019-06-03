/*
SQLyog Enterprise v12.08 (32 bit)
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

/*Table structure for table `xy_task` */

DROP TABLE IF EXISTS `xy_task`;

CREATE TABLE `xy_task` (
  `task_id` varchar(32) NOT NULL,
  `task_type` varchar(1) NOT NULL,
  `task_company` varchar(255) NOT NULL,
  `task_quantity` varchar(255) NOT NULL,
  `task_size` varchar(255) DEFAULT NULL,
  `task_money` int(11) NOT NULL,
  `task_message` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) NOT NULL,
  `task_status` int(1) NOT NULL DEFAULT '0',
  `task_recipient` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `xy_task` */

insert  into `xy_task`(`task_id`,`task_type`,`task_company`,`task_quantity`,`task_size`,`task_money`,`task_message`,`user_id`,`task_status`,`task_recipient`) values ('00ab7511188c48d8a006ea8d4101c9d9','0','11111','1','小',1,'','92aa2e75ba6f413888bebf0392baab17',2,''),('4442d0a3851e45479b4ec68050ce91bb','0','11','1','小',11,'11','92aa2e75ba6f413888bebf0392baab17',2,''),('5489ff8654c0403982b03168a02b5d76','0','1','1','小',11111,'','92aa2e75ba6f413888bebf0392baab17',1,''),('98876375844b493ea4ee6002632c5299','0','22','1','小',2,'22','92aa2e75ba6f413888bebf0392baab17',0,NULL),('9df30250a86a43d4a4b79b171eb1084e','0','asdasd','1','小',123123,'dasdasd','bd2e9ce03ef74cc1ab0419a83f174ffe',-1,'92aa2e75ba6f413888bebf0392baab17'),('a2b2d1cd00b54782b9d41ce55125d40e','0','1111111','1','小',11,'11','92aa2e75ba6f413888bebf0392baab17',0,NULL),('a3bff75356554f0584c191371b0b35ff','0','123','1','小',123,'123','bd2e9ce03ef74cc1ab0419a83f174ffe',0,NULL),('ae3aa9745f0649149db96b2529bc71a9','0','123','1','小',123,'123','92aa2e75ba6f413888bebf0392baab17',0,NULL),('b3c2762874f24841b4191dc2d216cf45','0','11','1','小',11,'11','92aa2e75ba6f413888bebf0392baab17',0,NULL),('c8d27e36d2ce4972b8842af53920e9e2','0','123123','1','小',12312,'312312','bd2e9ce03ef74cc1ab0419a83f174ffe',-1,'92aa2e75ba6f413888bebf0392baab17'),('d13e4025004a41d1a55ea567313ef4fb','0','1','1','小',1,'1','bd2e9ce03ef74cc1ab0419a83f174ffe',-1,'92aa2e75ba6f413888bebf0392baab17'),('f78e1c2782f64c87baba42eee40937b9','0','11111','1','小',111,'','92aa2e75ba6f413888bebf0392baab17',0,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
