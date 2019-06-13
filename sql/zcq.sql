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

/*Table structure for table `xy_collection` */

DROP TABLE IF EXISTS `xy_collection`;

CREATE TABLE `xy_collection` (
  `collection_id` int(255) NOT NULL AUTO_INCREMENT,
  `collection_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` varchar(32) NOT NULL,
  `dynamic_id` int(11) NOT NULL,
  `state` char(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`collection_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

/*Data for the table `xy_collection` */

insert  into `xy_collection`(`collection_id`,`collection_date`,`user_id`,`dynamic_id`,`state`) values (16,'2019-06-07 21:47:02','01',29,'0'),(17,'2019-06-07 21:21:17','01',39,'1'),(18,'2019-06-07 21:50:56','01',35,'0'),(19,'2019-06-07 21:50:56','01',35,'0');

/*Table structure for table `xy_comment` */

DROP TABLE IF EXISTS `xy_comment`;

CREATE TABLE `xy_comment` (
  `comment_id` int(32) NOT NULL AUTO_INCREMENT,
  `dynamic_id` varchar(32) NOT NULL,
  `comment_date` varchar(20) NOT NULL,
  `comment_content` varchar(255) NOT NULL,
  `user_id` varchar(32) NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `dynamic_id` (`dynamic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

/*Data for the table `xy_comment` */

insert  into `xy_comment`(`comment_id`,`dynamic_id`,`comment_date`,`comment_content`,`user_id`) values (13,'27','5-6 21:18','上传评论测试','01'),(14,'28','5-6 21:20','评论测试','01'),(15,'28','5-6 21:21','这么好看不会使松田吧','01'),(16,'29','5-6 21:35','测试','01'),(17,'29','5-6 21:35','测试二','01'),(18,'25','5-6 22:50','测试','01'),(19,'28','5-6 23:0','还是测试','02'),(20,'38','5-7 1:16','欢迎大家来评论','01'),(21,'38','5-7 1:16','哈哈哈','01'),(22,'39','5-7 1:27','娃哈哈','01'),(23,'37','5-7 9:58','外网','01'),(24,'37','5-7 9:58','测试','01'),(25,'27','5-7 21:50','哈哈','01');

/*Table structure for table `xy_dynamic` */

DROP TABLE IF EXISTS `xy_dynamic`;

CREATE TABLE `xy_dynamic` (
  `dynamic_id` int(32) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(32) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pic_count` int(10) unsigned NOT NULL DEFAULT '0',
  `pics_address` varchar(350) DEFAULT '',
  `comment_count` int(10) unsigned NOT NULL DEFAULT '0',
  `likes` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  `content` varchar(255) DEFAULT NULL,
  `state` char(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`dynamic_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `xy_dynamic_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `xy_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;

/*Data for the table `xy_dynamic` */

insert  into `xy_dynamic`(`dynamic_id`,`user_id`,`date`,`pic_count`,`pics_address`,`comment_count`,`likes`,`content`,`state`) values (22,'02','2019-06-03 21:38:27',9,'b8db72031769f53334e099bbc73cb139.jpg,81b8bcdc66fe31c07bf2e38d3d0a82e1.jpg,a79466cfd16df6baa96368a6c9f522e5.jpg,47437b7347352424f1c5d8ebdfd29c74.jpg,6bb8d1de0e9a47520bea0579701a941d.jpg,810403a8dfab1282ada567c64a8e7ce8.jpg,85ae3e9195eeb62035261873e9a844b0.jpg,dc4fc4125c0a5f2ad4d8c95fb0243a6f.jpg,acb1e98c13231b6532d555c32ce1df81.jpg',0,0000000000,'世界很大我想去看看...','0'),(24,'01','2019-06-03 22:56:14',0,'',0,0000000000,'测试动态，无图片..','1'),(25,'01','2019-06-03 22:57:01',1,'afc868e5c8ea90e1c8b260a865a6a7fb.jpg',0,0000000000,'派大星。。。\n测试','1'),(26,'01','2019-06-06 22:32:53',0,'',0,0000000000,'测试三，时间精确到...秒','0'),(27,'02','2019-06-04 15:32:47',0,'',0,0000000000,'6月4号，今天下好大雨啊','1'),(28,'02','2019-06-04 15:55:10',1,'acb1e98c13231b6532d555c32ce1df81.jpg',0,0000000000,'测试时间','1'),(29,'02','2019-06-05 21:20:31',0,'',0,0000000000,'今天周四','1'),(30,'01','2019-06-06 22:33:01',0,'',0,0000000000,'新用户报道0.0','0'),(31,'01','2019-06-07 00:43:14',1,'47437b7347352424f1c5d8ebdfd29c74.jpg',0,0000000000,'深夜改代码','1'),(32,'01','2019-06-07 00:44:42',0,'',0,0000000000,'再来一次深夜改代码','1'),(33,'01','2019-06-07 00:49:43',0,'',0,0000000000,'测试','1'),(34,'01','2019-06-07 00:50:59',0,'',0,0000000000,'测试00','1'),(35,'01','2019-06-07 01:03:09',1,'acb1e98c13231b6532d555c32ce1df81.jpg',0,0000000000,'测试','1'),(36,'01','2019-06-07 21:51:09',0,'',0,0000000000,'测试','0'),(37,'01','2019-06-07 01:04:00',0,'',0,0000000000,'测试','1'),(38,'01','2019-06-07 01:25:38',0,'',0,0000000000,'测试','0'),(39,'01','2019-06-07 21:21:41',0,'',0,0000000000,'测试费大幅度发','0'),(40,'02','2019-06-08 13:33:34',9,'b8db72031769f53334e099bbc73cb139.jpg,81b8bcdc66fe31c07bf2e38d3d0a82e1.jpg,a79466cfd16df6baa96368a6c9f522e5.jpg,47437b7347352424f1c5d8ebdfd29c74.jpg,6bb8d1de0e9a47520bea0579701a941d.jpg,810403a8dfab1282ada567c64a8e7ce8.jpg,85ae3e9195eeb62035261873e9a844b0.jpg,dc4fc4125c0a5f2ad4d8c95fb0243a6f.jpg,acb1e98c13231b6532d555c32ce1df81.jpg',0,0000000000,'世界很大我想去看看','1');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
