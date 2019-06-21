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
CREATE DATABASE /*!32312 IF NOT EXISTS*/`xy` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `xy`;

/*Table structure for table `xy_likes` */

DROP TABLE IF EXISTS `xy_likes`;

CREATE TABLE `xy_likes` (
  `user_id` varchar(32) NOT NULL,
  `dynamic_id` int(11) NOT NULL,
  `addlike_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `state` char(5) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `xy_likes` */

insert  into `xy_likes`(`user_id`,`dynamic_id`,`addlike_date`,`state`) values ('01',66,'2019-06-20 00:11:11','1'),('01',64,'2019-06-19 20:53:01','1'),('f5e374821d584ab6abd09eddd704444e',66,'2019-06-19 23:43:05','1'),('02',64,'2019-06-19 17:08:50','1'),('03',64,'2019-06-19 20:14:57','1'),('03',62,'2019-06-19 20:15:16','0'),('01',55,'2019-06-19 22:07:37','1'),('01',51,'2019-06-20 00:08:16','1'),('01',50,'2019-06-19 22:24:18','1'),('03',49,'2019-06-19 22:25:06','1'),('03',57,'2019-06-19 22:26:06','1'),('03',55,'2019-06-19 22:28:27','1'),('f5e374821d584ab6abd09eddd704444e',55,'2019-06-19 23:42:36','1'),('f5e374821d584ab6abd09eddd704444e',64,'2019-06-19 23:55:25','0'),('f5e374821d584ab6abd09eddd704444e',62,'2019-06-19 23:53:05','1'),('f5e374821d584ab6abd09eddd704444e',50,'2019-06-19 23:55:20','1'),('f5e374821d584ab6abd09eddd704444e',54,'2019-06-20 00:05:25','1'),('01',47,'2019-06-20 00:08:23','1'),('01',48,'2019-06-20 00:11:09','1'),('01',68,'2019-06-20 00:31:55','0'),('01',57,'2019-06-20 00:17:44','1'),('01',70,'2019-06-20 22:36:57','1');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
