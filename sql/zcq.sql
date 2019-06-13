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

/*Table structure for table `xy_collection` */

DROP TABLE IF EXISTS `xy_collection`;

CREATE TABLE `xy_collection` (
  `collection_id` int(255) NOT NULL AUTO_INCREMENT,
  `collection_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` varchar(32) NOT NULL,
  `dynamic_id` int(11) NOT NULL,
  `state` char(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`collection_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `xy_collection` */

insert  into `xy_collection`(`collection_id`,`collection_date`,`user_id`,`dynamic_id`,`state`) values (1,'2019-06-13 14:04:01','92aa2e75ba6f413888bebf0392baab17',9,'1');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `xy_comment` */

insert  into `xy_comment`(`comment_id`,`dynamic_id`,`comment_date`,`comment_content`,`user_id`) values (1,'9','5-13 14:2','你这样过分了','4253d1f441f74d538a0f8145f5927ba9'),(2,'10','5-13 14:2','不敢想，不敢想','4253d1f441f74d538a0f8145f5927ba9'),(3,'11','5-13 14:4','求大家共同监督！','24cc2350258f48af875195f16bd481bd'),(4,'11','5-13 14:6','zc','92aa2e75ba6f413888bebf0392baab17');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

/*Data for the table `xy_dynamic` */

insert  into `xy_dynamic`(`dynamic_id`,`user_id`,`date`,`pic_count`,`pics_address`,`comment_count`,`likes`,`content`,`state`) values (2,'eaa711944f19440f95832859d5794b2a','2019-06-13 13:56:36',0,'',0,0000000000,'今天松田好大雨啊','1'),(3,'eaa711944f19440f95832859d5794b2a','2019-06-13 13:57:02',1,'22fdcae946ef77ad302d49d2c77df706.gif',0,0000000000,'起床上课...','1'),(4,'a7d0dbfa79a443d99ae0611483409237','2019-06-13 13:57:57',6,'659081b4d80e47e2231743f79f153130.jpg,282071f494836c20d8a49b4f45008a9c.jpg,32671c8daadb81def8cfbe162f845471.jpg,8e2c028f1876586238d6dea528b3d77d.jpg,c33986d2c9a832003c12b066536c9d5a.jpg,6ac5d027c60bc06d537b1386cf0ec895.jpg',0,0000000000,'小仙女最好看~','1'),(5,'eaa711944f19440f95832859d5794b2a','2019-06-13 13:58:18',0,'',0,0000000000,'哇哈哈哈哈哈哈........','1'),(6,'eaa711944f19440f95832859d5794b2a','2019-06-13 13:58:55',1,'acd3f988d8bbb842e323cfc7659bd344.jpg',0,0000000000,'压力山大啊，最近','1'),(7,'b5fb641bcbbd46d0b95598cf8abb2fad','2019-06-13 13:59:41',0,'',0,0000000000,'生活无趣~~~','1'),(8,'4253d1f441f74d538a0f8145f5927ba9','2019-06-13 14:01:19',1,'952b84a84bdaefec1224364c95ebb53a.jpg',0,0000000000,'有没有一起养狗的小哥哥~~','1'),(9,'013626b0405c44ff9aa19121fbefae46','2019-06-13 14:01:23',1,'a2df5ab7143b7aa562e0b46f5af506ba.jpg',0,0000000000,'','1'),(10,'013626b0405c44ff9aa19121fbefae46','2019-06-13 14:02:42',5,'947d187294e970272ba85aada8a6da39.jpg,859414d73c461fc6d5cf93886cdd05f4.jpg,bb549c00907b1d992a90427e49fd3fed.jpg,fb66384862bb005dbdabc8bcfca8c295.jpg,05ed9e28ad7b6c0699264215edd58ffe.jpg',0,0000000000,'感想','0'),(11,'24cc2350258f48af875195f16bd481bd','2019-06-13 14:04:40',0,'',0,0000000000,'从今天开始，我一定要好好学习~','1');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
