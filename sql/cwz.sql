/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.6.40 : Database - xy
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`xy` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `xy`;

/*Table structure for table `xy_find_goods` */

DROP TABLE IF EXISTS `xy_find_goods`;

CREATE TABLE `xy_find_goods` (
  `find_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `find_status` int(11) NOT NULL DEFAULT '999' COMMENT '0代表失物，1代表招领，2代表公示，3代表已完成',
  `find_title` varchar(35) NOT NULL,
  `find_type` varchar(20) NOT NULL,
  `find_date` varchar(20) NOT NULL,
  `find_adder` varchar(50) NOT NULL,
  `find_mobile` varchar(20) NOT NULL,
  `find_name` varchar(20) NOT NULL,
  `find_desc` varchar(255) DEFAULT NULL,
  `find_picUrl` varchar(255) DEFAULT '',
  `find_up_userId` varchar(32) DEFAULT NULL,
  `find_op_userId` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`find_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4;

/*Data for the table `xy_find_goods` */

insert  into `xy_find_goods`(`find_id`,`find_status`,`find_title`,`find_type`,`find_date`,`find_adder`,`find_mobile`,`find_name`,`find_desc`,`find_picUrl`,`find_up_userId`,`find_op_userId`) values (54,2,'寻找身份证','学生证/证件','2019-10-2','松田','1111111111','小明','在松田丢失了一张名为“小明”的身份证！',NULL,'92aa2e75ba6f413888bebf0392baab17',NULL),(55,2,'捡到一个热水壶','其他','2019-06-05','松田食堂二楼','1111111111','小明','在食堂沙发旁捡到的黑灰色保温壶','http://10.2.16.131/images/dcd47cb0a7c1a7eda9d7b7ae6ce69559.jpg,','92aa2e75ba6f413888bebf0392baab17',NULL),(58,3,'1','钱包/钥匙','2019-03-02','1','1','1','1','http://10.2.16.131/images/c33986d2c9a832003c12b066536c9d5a.jpg,http://10.2.16.131/images/6ac5d027c60bc06d537b1386cf0ec895.jpg,','','92aa2e75ba6f413888bebf0392baab17'),(59,0,'1','钱包/钥匙','2019-03-02','1','1','1','11','http://10.2.16.131/images/5f1ac740fb7f3f778502d77063eab538.jpg,http://10.2.16.131/images/8e2c028f1876586238d6dea528b3d77d.jpg,http://10.2.16.131/images/c33986d2c9a832003c12b066536c9d5a.jpg,http://10.2.16.131/images/6ac5d027c60bc06d537b1386cf0ec895.jpg,','92aa2e75ba6f413888bebf0392baab17',NULL),(60,3,'测试','钱包/钥匙','2019-03-02','123','123','123','123',NULL,'92aa2e75ba6f413888bebf0392baab17',NULL),(61,2,'测试','钱包/钥匙','2019-03-02','123','123','132','123','http://10.2.16.131/images/c33986d2c9a832003c12b066536c9d5a.jpg,http://10.2.16.131/images/6ac5d027c60bc06d537b1386cf0ec895.jpg,','92aa2e75ba6f413888bebf0392baab17','be1501dccfde4023944d269a9287a648'),(62,1,'123','钱包/钥匙','2019-03-02','123','1321','32132','32132',NULL,'92aa2e75ba6f413888bebf0392baab17',NULL),(63,0,'123','钱包/钥匙','2019-03-02','123','123','123','','http://10.2.16.131/images/8e2c028f1876586238d6dea528b3d77d.jpg,http://10.2.16.131/images/c33986d2c9a832003c12b066536c9d5a.jpg,http://10.2.16.131/images/6ac5d027c60bc06d537b1386cf0ec895.jpg,','be1501dccfde4023944d269a9287a648',NULL),(64,0,'987','钱包/钥匙','2019-10-02','32165641651','65165165','65','',NULL,'be1501dccfde4023944d269a9287a648',NULL),(65,3,'6654','首饰/挂饰','2019-03-02','654','1231231231','123123','123123123',NULL,'be1501dccfde4023944d269a9287a648','92aa2e75ba6f413888bebf0392baab17'),(66,1,'123123','其他','2019-03-02','654','3213','213213','123123124',NULL,'be1501dccfde4023944d269a9287a648',NULL),(67,1,'987','钱包/钥匙','2019-03-02','3162','132','132','123123',NULL,'be1501dccfde4023944d269a9287a648',NULL),(68,0,'12342314','钱包/钥匙','2019-03-02','123','123','123','',NULL,'be1501dccfde4023944d269a9287a648',NULL),(69,0,'123','钱包/钥匙','2019-03-02','123','123','213','123','',NULL,'92aa2e75ba6f413888bebf0392baab17'),(70,1,'123123','钱包/钥匙','123123','1231','12312','123','123',NULL,'be1501dccfde4023944d269a9287a648',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
