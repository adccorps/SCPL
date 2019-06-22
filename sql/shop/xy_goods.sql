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

/*Table structure for table `xy_goods` */

DROP TABLE IF EXISTS `xy_goods`;

CREATE TABLE `xy_goods` (
  `goods_id` varchar(32) NOT NULL COMMENT '商品唯一标识',
  `goods_name` varchar(30) NOT NULL COMMENT '卖出商品名称',
  `goods_pic` varchar(255) NOT NULL COMMENT '商品图片',
  `goods_price` decimal(10,0) NOT NULL COMMENT '商品价格',
  `goods_desc` varchar(230) DEFAULT NULL COMMENT '商品描述',
  `goods_type` varchar(15) NOT NULL,
  `seller_id` varchar(32) NOT NULL,
  `goods_status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `xy_goods` */

insert  into `xy_goods`(`goods_id`,`goods_name`,`goods_pic`,`goods_price`,`goods_desc`,`goods_type`,`seller_id`,`goods_status`) values 
('10d0d49e13c64e109902162c3a14fc2e','这是修改后','http://10.2.16.131/images/f9bd1ed4f29f3fed6805179afdb0120b.jpg,http://10.2.16.131/images/bace93774ba45bae8db39a313bf3f457.jpg,',999,'-------','电子数码','b3a4ffce7738477fad8cd9d7ae3d99da',0),
('29712f7a69fa48d896d6e97e6b3b6541','态极','http://10.2.16.131/images/2b80bb9b0dfa2ef764dde0727ef00913.jpg,http://10.2.16.131/images/f9bd1ed4f29f3fed6805179afdb0120b.jpg,',500,'--------','二手衣物','cf88ea590fa54d7cbc53a7859cb332df',0),
('2c9f5922c7d44c5eb6b0c01448e94665','adidas跑鞋','http://10.2.16.131/images/fddeecfbb657f7232ccf37d8a734c3cb.jpeg,',500,'------------','二手衣物','cf88ea590fa54d7cbc53a7859cb332df',1),
('4c3de2a128c84e6e8190bcf00eb762c9','vans','http://10.2.16.131/images/01c0d3767734beeaf04dee2b0f251c8c.jpeg,',600,'------------','二手衣物','cf88ea590fa54d7cbc53a7859cb332df',0),
('51e696010c3548c2857992ded85844fb','converse1970s','http://10.2.16.131/images/51f5bc8f17f57c465c519546868d530f.jpeg,',500,'---','二手衣物','cf88ea590fa54d7cbc53a7859cb332df',0),
('5f729e7e459447499e430f6bd9c5896d','aj1','http://10.2.16.131/images/d8376a3e61302b7ee8844a63e5284287.jpg,',2000,'','二手衣物','cf88ea590fa54d7cbc53a7859cb332df',2),
('63e250b307ea4f97879aefa7249eca62','yeezy350','http://10.2.16.131/images/0a95c217f8d7415f2c7ac6e1c62baa8e.jpg,',2300,'------------','二手衣物','cf88ea590fa54d7cbc53a7859cb332df',0),
('643ef1e040784bce9bbcbf2673393f7e','态极-黑','http://10.2.16.131/images/503e51517a75482b218faca4e7fc373c.jpg,',500,'','二手衣物','cf88ea590fa54d7cbc53a7859cb332df',1),
('6cac2ab75e0749d493631f656f98c48e','123','http://10.2.16.131/images/8cdadcec566b43a6a944ecba2bd267ad.jpg,',213,'----','电子数码','b3a4ffce7738477fad8cd9d7ae3d99da',0),
('6ea297b1a9224f4f8b57f27691e00e62','nike-kobe篮球鞋','http://10.2.16.131/images/64846b99f63fa8ba305117f666d11fa9.jpg,',600,'--------------','其他闲置','cf88ea590fa54d7cbc53a7859cb332df',2),
('76c2652511c04d288817b8d851d0a2c9','nike板鞋','http://10.2.16.131/images/2d3bb8cdd706828b9fd65014874eda76.jpg,',1800,'--------','其他闲置','cf88ea590fa54d7cbc53a7859cb332df',0),
('7d3b6fdf85a94ad5831c6bc585b27671','213','http://10.2.16.131/images/8cdadcec566b43a6a944ecba2bd267ad.jpg,http://10.2.16.131/images/8cdadcec566b43a6a944ecba2bd267ad.jpg,',213,'*---','电子数码','b3a4ffce7738477fad8cd9d7ae3d99da',0),
('a6d3dd65c5a8431eb3bc94306a260d0f','AJ13-白','http://10.2.16.131/images/6fcd9756c174c8edfe47452214a16434.jpg,',2000,'--------------','其他闲置','cf88ea590fa54d7cbc53a7859cb332df',1),
('b753c2353bac4524b4834d339c13ab72','aj32-大红','http://10.2.16.131/images/af02cf1301ce02649b4ecc838288979a.jpeg,',1200,'--------------','其他闲置','cf88ea590fa54d7cbc53a7859cb332df',0),
('c0b480e8f2624d56b41d9862e87f7c53','nike-AirFoamposite','http://10.2.16.131/images/c5791cd413954e008eae355dc8ffd2e9.png,',1500,'-------------','其他闲置','cf88ea590fa54d7cbc53a7859cb332df',0),
('c3dfb38b0f3c458b8371b521ef1169b2','2','http://10.2.16.131/images/f9bd1ed4f29f3fed6805179afdb0120b.jpg,',13,'1','电子数码','b3a4ffce7738477fad8cd9d7ae3d99da',0),
('d06fe8a344bc484c8211461c06f1e850','kt4','http://10.2.16.131/images/a6a2b279a4f419503e4564470f106d1d.jpg,http://10.2.16.131/images/f123a126ff7e22c748e2c218918d801f.jpg,',780,'','其他闲置','cf88ea590fa54d7cbc53a7859cb332df',1),
('d668773c510e4c06a533cf64229ebfa9','这是一个商品样例试13','http://10.2.16.131/images/bace93774ba45bae8db39a313bf3f457.jpg,http://10.2.16.131/images/8cdadcec566b43a6a944ecba2bd267ad.jpg,http://10.2.16.131/images/d8376a3e61302b7ee8844a63e5284287.jpg,',1232,'213213','运动健身','b3a4ffce7738477fad8cd9d7ae3d99da',0),
('dd10dc0fd46e4add8fa7f656099b7363','vans ski8','http://10.2.16.131/images/abc138bea346a10a1b05fb5709cdb306.jpg,',800,'-----------','运动健身','cf88ea590fa54d7cbc53a7859cb332df',0),
('ddecdf9a725e496d8d560071ca61c4d7','aj13','http://10.2.16.131/images/9bf12f8e12c1f5871b1733ef373ad69f.jpg,',4000,'---------','运动健身','cf88ea590fa54d7cbc53a7859cb332df',2),
('e8e1b9113373467680810bf76bd69392','nike -ow联名','http://10.2.16.131/images/e6a8a6ef79ca2f813149d9ebf75ba596.jpg,',6000,'-------------','运动健身','cf88ea590fa54d7cbc53a7859cb332df',0),
('fc65c66ac1854ec0a35d0c313287f1a1','curry篮球鞋','http://10.2.16.131/images/f5dcff9ac698c364a926db3bdf1e4767.jpg,http://10.2.16.131/images/5d727e8077368220f2e67f542a888414.jpg,',1200,'------','运动健身','cf88ea590fa54d7cbc53a7859cb332df',0),
('fdc3bf5996ae47c599ba202c76707091','lining 音速7','http://10.2.16.131/images/cf9bdb9f26ab6753f7dd6006adc60477.jpg,',500,'----------','书籍教材','cf88ea590fa54d7cbc53a7859cb332df',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
