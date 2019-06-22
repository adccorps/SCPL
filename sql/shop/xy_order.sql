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

/*Table structure for table `xy_order` */

DROP TABLE IF EXISTS `xy_order`;

CREATE TABLE `xy_order` (
  `order_id` varchar(32) NOT NULL COMMENT '订单唯一标识符',
  `seller_id` varchar(32) NOT NULL COMMENT '卖家唯一标识符',
  `buyer_id` varchar(32) NOT NULL COMMENT '买家唯一标识符',
  `goods_id` varchar(32) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `xy_order` */

insert  into `xy_order`(`order_id`,`seller_id`,`buyer_id`,`goods_id`) values 
('1bd06fc72ae94101ac26bed4068d33ef','cf88ea590fa54d7cbc53a7859cb332df','b3a4ffce7738477fad8cd9d7ae3d99da','6ea297b1a9224f4f8b57f27691e00e62'),
('2163a65a90b24117b7eaff36d6ff81ff','cf88ea590fa54d7cbc53a7859cb332df','b3a4ffce7738477fad8cd9d7ae3d99da','76c2652511c04d288817b8d851d0a2c9'),
('26022a56332d4b95a0d6b4868d134b0e','cf88ea590fa54d7cbc53a7859cb332df','b3a4ffce7738477fad8cd9d7ae3d99da','4c3de2a128c84e6e8190bcf00eb762c9'),
('3d0f2b5fcf044da8ae4ae6cfe27806e0','cf88ea590fa54d7cbc53a7859cb332df','b3a4ffce7738477fad8cd9d7ae3d99da','63e250b307ea4f97879aefa7249eca62'),
('3f7be6694bf74681b8ab899234f8b416','cf88ea590fa54d7cbc53a7859cb332df','b3a4ffce7738477fad8cd9d7ae3d99da','63e250b307ea4f97879aefa7249eca62'),
('406d2db01a284fa88b5b0f82540a8a67','cf88ea590fa54d7cbc53a7859cb332df','b3a4ffce7738477fad8cd9d7ae3d99da','63e250b307ea4f97879aefa7249eca62'),
('4e2f175206ea4d68b3f1322e87f1de64','cf88ea590fa54d7cbc53a7859cb332df','b3a4ffce7738477fad8cd9d7ae3d99da','5f729e7e459447499e430f6bd9c5896d'),
('566e4a440fbb44cfb82ee20020cbe32f','cf88ea590fa54d7cbc53a7859cb332df','b3a4ffce7738477fad8cd9d7ae3d99da','29712f7a69fa48d896d6e97e6b3b6541'),
('679fd4795908424a9b7a51650cca6476','cf88ea590fa54d7cbc53a7859cb332df','b3a4ffce7738477fad8cd9d7ae3d99da','ddecdf9a725e496d8d560071ca61c4d7'),
('959a7f555b1f471f823482c233cbe6bb','cf88ea590fa54d7cbc53a7859cb332df','b3a4ffce7738477fad8cd9d7ae3d99da','643ef1e040784bce9bbcbf2673393f7e'),
('dae2fcd95b6d4d0c8c091c7a18c872c4','cf88ea590fa54d7cbc53a7859cb332df','b3a4ffce7738477fad8cd9d7ae3d99da','2c9f5922c7d44c5eb6b0c01448e94665'),
('e0bec6af980b4a858954117d55af6b62','cf88ea590fa54d7cbc53a7859cb332df','b3a4ffce7738477fad8cd9d7ae3d99da','d06fe8a344bc484c8211461c06f1e850'),
('e60287af52f646e486f5b28e5b5974df','cf88ea590fa54d7cbc53a7859cb332df','b3a4ffce7738477fad8cd9d7ae3d99da','a6d3dd65c5a8431eb3bc94306a260d0f'),
('f72b158b4398428f8ed6405a13cb1982','cf88ea590fa54d7cbc53a7859cb332df','b3a4ffce7738477fad8cd9d7ae3d99da','63e250b307ea4f97879aefa7249eca62');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
