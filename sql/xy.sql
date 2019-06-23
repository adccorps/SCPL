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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `xy_collection` */

insert  into `xy_collection`(`collection_id`,`collection_date`,`user_id`,`dynamic_id`,`state`) values (1,'2019-06-23 16:35:37','1a634c5d4d6a4c4ab6f402195eedbab5',91,'1'),(2,'2019-06-23 16:53:12','5f84b41c164c4779a7223cfbf247e251',95,'1'),(3,'2019-06-23 16:53:53','5f84b41c164c4779a7223cfbf247e251',92,'1'),(4,'2019-06-23 16:54:39','d42b14c4a5ba48faacf71ebb0cfef487',95,'1'),(5,'2019-06-23 17:09:20','1a634c5d4d6a4c4ab6f402195eedbab5',99,'1'),(6,'2019-06-23 17:50:58','5f84b41c164c4779a7223cfbf247e251',99,'1');

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
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4;

/*Data for the table `xy_comment` */

insert  into `xy_comment`(`comment_id`,`dynamic_id`,`comment_date`,`comment_content`,`user_id`) values (51,'91','5-23 15:51','左边第三个是师兄，哈哈哈','5f84b41c164c4779a7223cfbf247e251'),(52,'95','5-23 16:33','看上的说一声，飙血出售','1a634c5d4d6a4c4ab6f402195eedbab5'),(53,'92','5-23 16:34','浪里个浪，浪浪浪。。。','1a634c5d4d6a4c4ab6f402195eedbab5'),(54,'95','5-23 16:36','捞出血啊你','d42b14c4a5ba48faacf71ebb0cfef487'),(55,'94','5-23 16:37','吃饭咯，真香','d42b14c4a5ba48faacf71ebb0cfef487'),(56,'92','5-23 16:37','大浪','d42b14c4a5ba48faacf71ebb0cfef487'),(57,'95','5-23 16:53','那是个船新的版本吗','5f84b41c164c4779a7223cfbf247e251'),(58,'95','5-23 16:53','哈哈哈','5f84b41c164c4779a7223cfbf247e251'),(59,'96','5-23 16:58','是烤着吃还是清蒸好吃呢，在线等，急急急','5f84b41c164c4779a7223cfbf247e251'),(60,'95','5-23 17:0','你是狗吧','d42b14c4a5ba48faacf71ebb0cfef487'),(61,'95','5-23 17:0','话说多少钱，这套东西','d42b14c4a5ba48faacf71ebb0cfef487'),(62,'97','5-23 17:3','早说啊','d42b14c4a5ba48faacf71ebb0cfef487'),(63,'97','5-23 17:3','手慢一步，拍大腿啊~~~','ba33f06b40094df59248265576bc0759'),(64,'97','5-23 17:7','捞','265dd97b8d1f48efbf0806af4c594066'),(65,'98','5-23 17:9','。。。我好怕啊','1a634c5d4d6a4c4ab6f402195eedbab5'),(66,'98','5-23 17:9','','0d87226820ea46f7886ffe5967a6e1cc'),(67,'99','5-23 17:14','认真打代码吧','1a634c5d4d6a4c4ab6f402195eedbab5'),(68,'98','5-23 17:32','放学别走，。。。。。。。一起去二楼。。。。。吃个饭','5f84b41c164c4779a7223cfbf247e251'),(69,'100','5-23 18:5','是卖东西，哈哈哈','227ecfbde83d45d9bcf8fa3b35539667'),(70,'100','5-23 18:12','都有啥呢？','5f84b41c164c4779a7223cfbf247e251'),(71,'100','5-23 18:16','应有尽有的哈','227ecfbde83d45d9bcf8fa3b35539667'),(72,'100','5-23 18:19','鞋子需要吗','227ecfbde83d45d9bcf8fa3b35539667'),(73,'92','5-23 20:17','浪里小白龙','5f84b41c164c4779a7223cfbf247e251');

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
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4;

/*Data for the table `xy_dynamic` */

insert  into `xy_dynamic`(`dynamic_id`,`user_id`,`date`,`pic_count`,`pics_address`,`comment_count`,`likes`,`content`,`state`) values (91,'5f84b41c164c4779a7223cfbf247e251','2019-06-23 15:29:44',1,'50ebaffcbcb3d27d3d8699d2874f09bc.jpg',0,0000000000,'恭喜师兄毕业了','1'),(92,'5f84b41c164c4779a7223cfbf247e251','2019-06-23 15:31:37',9,'6e1fcc6f9d766c95affaa0b9487696f7.jpg,e7f7d4c10d875e5e6efb63d6f5cd323e.jpg,0ce682839d4d1bd3abbc37a7bc41c16e.jpg,3650bee40d067a8d0313011bbadbceaa.jpg,21b1e6a88cca790ee5d7c9f41a0b4900.jpg,e0705be26f9a8a0dbf0b5cd2043e1d1b.jpg,eba0fdb44155cabe9dc7d7b7e282dcfb.jpg,860277e999bc64f44b744d3d349d927f.jpg,fa69155c59697259dc500db66f05fd1e.jpg',0,0000000000,'海边旅游','1'),(93,'d42b14c4a5ba48faacf71ebb0cfef487','2019-06-23 16:25:33',1,'9acc35326e4eec87a7e1a078b2402521.jpg',0,0000000000,'好饿啊，好饿啊，饿啊，饿，...','0'),(94,'d42b14c4a5ba48faacf71ebb0cfef487','2019-06-23 16:09:35',2,'9acc35326e4eec87a7e1a078b2402521.jpg,9acc35326e4eec87a7e1a078b2402521.jpg',0,0000000000,'好饿啊，好饿啊，饿啊，饿，...','1'),(95,'1a634c5d4d6a4c4ab6f402195eedbab5','2019-06-23 16:28:15',1,'1ccd9b56abc7235c4abfb3cd1b2e8a3d.png',0,0000000000,'在线卖装备啦','1'),(96,'5f84b41c164c4779a7223cfbf247e251','2019-06-23 16:55:47',9,'115b63f55deaa05bded7893e0327c1f7.jpg,024693cdbb9ad91c2e6aa2049b6b5118.jpg,ac40f8aed5bd35d41e24c7c9d1d55d9f.jpg,ca16df33f6cba595bbaf94839741001f.jpg,862477ad142764841dd7a225d9e61d10.jpg,721db2a8e7894050ae35d7ec1738a3f5.jpg,005147e8cc4aafba14322feefab3cc5c.jpg,570efac630da596c6c6d96378640e9be.jpg,fddeccef25a8cd753017c10a42ab1460.jpg',0,0000000000,'鹅鹅鹅，饿饿饿','1'),(97,'1a634c5d4d6a4c4ab6f402195eedbab5','2019-06-23 17:03:00',0,'',0,0000000000,'不好意思各位，上一条动态的装备已经卖出去了，下次请早','1'),(98,'ba33f06b40094df59248265576bc0759','2019-06-23 17:04:59',0,'',0,0000000000,'卖号那个。饭堂二楼等你','1'),(99,'265dd97b8d1f48efbf0806af4c594066','2019-06-23 17:08:01',1,'9bf9b368dbe5c41007843ad850d2bd3d.jpg',0,0000000000,'不好好读书，就要回家耕田啦','1'),(100,'227ecfbde83d45d9bcf8fa3b35539667','2019-06-23 18:05:27',1,'0228848c03b6eadb1b1b931722f11d09.jpg',0,0000000000,'来这里打个广告，希望大家不要介意哈，我是买东西的，需要的到二手市场找我呢','1'),(101,'5f84b41c164c4779a7223cfbf247e251','2019-06-23 20:15:56',1,'df32755fcfaf504b2cb0d93639c5853b.jpg',0,0000000000,'今晚早点睡觉，哈哈哈','1');

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
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4;

/*Data for the table `xy_find_goods` */

insert  into `xy_find_goods`(`find_id`,`find_status`,`find_title`,`find_type`,`find_date`,`find_adder`,`find_mobile`,`find_name`,`find_desc`,`find_picUrl`,`find_up_userId`,`find_op_userId`) values (71,3,'1','钱包/钥匙','1','1','1','1','1',NULL,'265dd97b8d1f48efbf0806af4c594066',NULL),(72,0,'2','钱包/钥匙','2','2','2','2','2','http://10.2.16.131/images/d437c73318c762bbeda93a8ede0f49fc.jpg,http://10.2.16.131/images/32169f2f379ff05cccc0ba345bbe493c.jpg,http://10.2.16.131/images/2f34a51ccc23e83e895ffb14b76597d5.jpg,','265dd97b8d1f48efbf0806af4c594066',NULL),(73,2,'3','钱包/钥匙','3','3','3','3','3',NULL,'265dd97b8d1f48efbf0806af4c594066','227ecfbde83d45d9bcf8fa3b35539667'),(74,2,'寻找身份证','学生证/证件','2019-10-09','松田操场','13719511872','帅臻','在松田操场中丢失一张名为“小明”的身份证',NULL,'1a634c5d4d6a4c4ab6f402195eedbab5','ba33f06b40094df59248265576bc0759'),(75,1,'红色行李箱','其他','2019-08-09','松田停机坪','13719518888','帅','在学校停机坪里面捡到一个红色行李箱，如同所示！','http://10.2.16.131/images/c33986d2c9a832003c12b066536c9d5a.jpg,','1a634c5d4d6a4c4ab6f402195eedbab5',NULL),(76,1,'黑白保温壶','钱包/钥匙','2019-08-06','一栋教学楼','13719518888','帅','在502教室第一排的空位上捡到的一个保温瓶！','http://10.2.16.131/images/d678b39934289271add96cc77a88a9ee.jpg,','227ecfbde83d45d9bcf8fa3b35539667',NULL),(77,3,'寻找p30手机','手机/电脑','2019-12-31','松田','13719517777','蔡委臻','昨天刚买的，刚到手就掉了，希望捡到的同学提早归还，谢谢','http://10.2.16.131/images/44ab54614552a46d5d01b58891e9194d.jpg,http://10.2.16.131/images/1bff09c8c9134fbe4eb441eb3d1600d7.jpg,','227ecfbde83d45d9bcf8fa3b35539667',NULL),(78,2,'丢失','钱包/钥匙','钥匙串','图书馆','12345678901','lin','',NULL,'227ecfbde83d45d9bcf8fa3b35539667','ba33f06b40094df59248265576bc0759'),(79,1,'捡到一本高等数学上册','书本/文件','2019-01-02','图书馆','13715764487','cool','',NULL,'227ecfbde83d45d9bcf8fa3b35539667',NULL),(80,0,'珍藏紫砂壶不见了','其他','2019-02-02','松田茶馆','1301111112','tomy','','http://10.2.16.131/images/01d405a12903fe4eadd9e85ab9a1bafe.jpg,','1a634c5d4d6a4c4ab6f402195eedbab5',NULL),(81,1,'捡到一张学生证','学生证/证件','2019-02-03','松田教室楼','15219878426','小明','捡到一张名字为“青山”的松田学生证',NULL,'1a634c5d4d6a4c4ab6f402195eedbab5',NULL),(82,1,'捡到名字为小明的快递','行李/快递','2019-08-06','松田后门','13078948572','伟大领袖','',NULL,'1a634c5d4d6a4c4ab6f402195eedbab5',NULL),(83,0,'寻找艾斯手办','其他','2019-05-06','710宿舍','13975484569','阿青','','http://10.2.16.131/images/68b9ad4bc6e572d2ed12ebfa5c92b95f.jpg,','ba33f06b40094df59248265576bc0759',NULL),(84,1,'捡到一本离散数学','书本/文件','2018-06-02','2栋教学楼','14786953458','小林','',NULL,'ba33f06b40094df59248265576bc0759',NULL),(85,0,'小学英语教程','书本/文件','2016-05-06','松田操场','13598747481','李华','一套名为“小学英文教程”的书籍，封面如图','http://10.2.16.131/images/a935e1e7e54de119a240c0b4e4af20e8.jpg,','ba33f06b40094df59248265576bc0759',NULL);

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

insert  into `xy_goods`(`goods_id`,`goods_name`,`goods_pic`,`goods_price`,`goods_desc`,`goods_type`,`seller_id`,`goods_status`) values ('0f8f0ef14194409ea4864eb96c7922a0','蓝色vans 小折痕','http://10.2.16.131/images/01c0d3767734beeaf04dee2b0f251c8c.jpeg,','500','-','其他闲置','227ecfbde83d45d9bcf8fa3b35539667',0),('24c5f22551f14581a0d4a53b53553508','青爷的画','http://10.2.16.131/images/024693cdbb9ad91c2e6aa2049b6b5118.jpg,http://10.2.16.131/images/ac40f8aed5bd35d41e24c7c9d1d55d9f.jpg,http://10.2.16.131/images/ca16df33f6cba595bbaf94839741001f.jpg,','10000','青爷的鹤','其他闲置','5f84b41c164c4779a7223cfbf247e251',0),('272e31f03f87433a8174afda24ad5c99','闲置书','http://10.2.16.131/images/303d780bee2e09b2bc02fbd93499e831.jpg,','20','-','书籍教材','227ecfbde83d45d9bcf8fa3b35539667',0),('2bb71b53b99545e787f68b228bd37a8c','aj','http://10.2.16.131/images/6fcd9756c174c8edfe47452214a16434.jpg,','2000','------','运动健身','265dd97b8d1f48efbf0806af4c594066',0),('3b5c0873a0ea4296ab133bfd6cb06121','converse1970s','http://10.2.16.131/images/bd8582157eafcb53279c9c2d9fdf86ce.jpg,','560','-','其他闲置','227ecfbde83d45d9bcf8fa3b35539667',0),('3ba1b58962b9417da2bff6cd03850321','匹克态极全新现货,秒发','http://10.2.16.131/images/2b80bb9b0dfa2ef764dde0727ef00913.jpg,http://10.2.16.131/images/503e51517a75482b218faca4e7fc373c.jpg,','499','--','运动健身','227ecfbde83d45d9bcf8fa3b35539667',0),('40cf867930544e8a906bd4d7f2c5e42f','高数全套','http://10.2.16.131/images/15faf08d8db461185e74af9fead86e4a.jpg,','50','--','书籍教材','227ecfbde83d45d9bcf8fa3b35539667',0),('64c768bb59f04da99bf672ec43e8c5ca','小学语文英语教材全套','http://10.2.16.131/images/05cb49cf715d54a31b7c2e5ebb48a520.jpg,http://10.2.16.131/images/30c7eae772873468046c4147efa61100.jpg,','100','可以买来好好复习','书籍教材','227ecfbde83d45d9bcf8fa3b35539667',0),('68dbc368b5df4ea7b950677fa0390697','1001','http://10.2.16.131/images/dbc9d6c319dc8ddddde48ff05c32a9bf.jpg,','999','测试数据','书籍教材','265dd97b8d1f48efbf0806af4c594066',0),('6db0017aae224508988ee0c33c314257','iphone100工厂机','http://10.2.16.131/images/eaad5c14a35742a91ddfca1110116b1e.jpg,','8888','只要8888','电子数码','227ecfbde83d45d9bcf8fa3b35539667',0),('7c3e8e4a2f634c40b6c3496d88900f43','5kg杠铃','http://10.2.16.131/images/73e7a6c21fb098a55e0726cc685764a3.jpg,','80','9成新','运动健身','227ecfbde83d45d9bcf8fa3b35539667',2),('8fe1155fc44949e295508f9a29b014c9','lux沐浴四件全新','http://10.2.16.131/images/98d3c71a1c5ba7e4c9f191e4d43da9b2.jpg,','100','-','电子数码','227ecfbde83d45d9bcf8fa3b35539667',0),('94cbd5538ae141af9f31492bf5498955','二手校服','http://10.2.16.131/images/50ebaffcbcb3d27d3d8699d2874f09bc.jpg,','120','--','二手衣物','d42b14c4a5ba48faacf71ebb0cfef487',0),('95d53872089946e1b1d4f258fcb9fcc9','98新ipoone','http://10.2.16.131/images/2f5fa89cab975798fe7365fda889e76f.jpg,','3000','--','电子数码','227ecfbde83d45d9bcf8fa3b35539667',0),('a0fe7f0f2d4545cd9cf2f036af760ce1','阿迪红边经典长裤','http://10.2.16.131/images/fddeecfbb657f7232ccf37d8a734c3cb.jpeg,','250','-','二手衣物','227ecfbde83d45d9bcf8fa3b35539667',0),('a7427affbe7043d49175b9e05a46fbe4','0002','http://10.2.16.131/images/d07709068f7ba385fae814ff2ca5894a.jpg,','101','测试数据','电子数码','265dd97b8d1f48efbf0806af4c594066',0),('a8a0ac970e064b65a807414e6b9b2dcd','新鲜猪仔肉','http://10.2.16.131/images/ca977d20879b8ac591c0924be9b149fb.jpg,http://10.2.16.131/images/f390a77bcb36dfcfb030544afc3a7356.jpg,','200','新鲜猪肉','日常用品','d42b14c4a5ba48faacf71ebb0cfef487',0),('ac881b43a9244d40a5177d80f4088640','蓝月亮洗衣液','http://10.2.16.131/images/a6d325dd7ec925ac0631a0531323f541.jpg,','24','-','日常用品','227ecfbde83d45d9bcf8fa3b35539667',0),('ad9cddbbd9b9418f8b9776035d32cbd5','0000','http://10.2.16.131/images/a6a2b279a4f419503e4564470f106d1d.jpg,http://10.2.16.131/images/f123a126ff7e22c748e2c218918d801f.jpg,','100','测试数据','其他闲置','265dd97b8d1f48efbf0806af4c594066',0),('ae506e39ba2c453685ed3f37abba8bc2','二手汉服','http://10.2.16.131/images/98d81768b31fe2a9b76d2e38b335bc81.jpg,','500','青爷的','二手衣物','5f84b41c164c4779a7223cfbf247e251',0),('b19a500f9c0b4858838495657ea420d1','挖掘机玩具','http://10.2.16.131/images/609da16974cad8a475a8b33a44eb8d8f.jpg,','30','蓝翔入学必备','电子数码','227ecfbde83d45d9bcf8fa3b35539667',0),('b31a952528f1407894ed713e9fb8374c','舒肤佳三件套','http://10.2.16.131/images/7054466c7f7d7a85b9c172e14c8d6df3.jpg,http://10.2.16.131/images/8319a5e16230ce41b0bf8cdbfd70ff26.jpg,','100','--','日常用品','227ecfbde83d45d9bcf8fa3b35539667',0),('ba3ae0aacf424167bee3c9d2c527a59b','iphone大宝剑','http://10.2.16.131/images/b0ce0e81d04bd9773c582daf29753956.jpg,','99998','不要99999只用99998','电子数码','227ecfbde83d45d9bcf8fa3b35539667',0),('be4547524ca94aa09cc7f113e894d326','青爷的红衣服','http://10.2.16.131/images/d128ccadef3948c97baac96b3f4574bb.jpg,','500','------','二手衣物','5f84b41c164c4779a7223cfbf247e251',0),('c091a55afca34dc5bce2afe8681a84a8','1tb表情包','http://10.2.16.131/images/0ef1026f988fae203118708106448e24.jpg,','1','--','电子数码','d42b14c4a5ba48faacf71ebb0cfef487',0),('c316e3dbef954d2d9ad87fd703e60bb8','杨某的女装','http://10.2.16.131/images/fdbc860f4d5751496a5b186b59eb0422.jpg,','200','晓泉的女装','二手衣物','d42b14c4a5ba48faacf71ebb0cfef487',0),('c43b70f6e7194cedbc2ece4fc17972da','二手小说','http://10.2.16.131/images/8e76c491afe49258817e3d5f876fb89d.jpg,','20','--','书籍教材','227ecfbde83d45d9bcf8fa3b35539667',0),('da4b537b72c140ee8321db950150f2de','雕牌肥皂','http://10.2.16.131/images/94ba960d51d629b83bb91294690dadfe.jpg,','10','--','日常用品','227ecfbde83d45d9bcf8fa3b35539667',0),('dcc92128f28b423fa841b6a2db1d4a24','青爷的猫仔','http://10.2.16.131/images/250fc69bb243c1ace8b9171306cd1026.jpg,','2','青爷的猫仔','其他闲置','5f84b41c164c4779a7223cfbf247e251',0),('eb79ddd3a67348c0ada045bc63ee56f6','测试数据','http://10.2.16.131/images/9f5eb1c6ef226eabe5234da1cb2483da.gif,','111','11','电子数码','d42b14c4a5ba48faacf71ebb0cfef487',3),('f1120ff1fc384846bb37837bc8070648','板砖','http://10.2.16.131/images/3b84e3b599130a0e67458619cb38d697.jpg,','10','健身必备','运动健身','d42b14c4a5ba48faacf71ebb0cfef487',0);

/*Table structure for table `xy_likes` */

DROP TABLE IF EXISTS `xy_likes`;

CREATE TABLE `xy_likes` (
  `user_id` varchar(32) NOT NULL,
  `dynamic_id` int(11) NOT NULL,
  `addlike_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `state` char(5) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `xy_likes` */

insert  into `xy_likes`(`user_id`,`dynamic_id`,`addlike_date`,`state`) values ('5f84b41c164c4779a7223cfbf247e251',92,'2019-06-23 15:50:56','1'),('5f84b41c164c4779a7223cfbf247e251',91,'2019-06-23 15:50:58','1'),('ba33f06b40094df59248265576bc0759',92,'2019-06-23 15:57:02','1'),('ba33f06b40094df59248265576bc0759',91,'2019-06-23 15:57:04','1'),('1a634c5d4d6a4c4ab6f402195eedbab5',95,'2019-06-23 16:33:33','1'),('1a634c5d4d6a4c4ab6f402195eedbab5',94,'2019-06-23 16:35:41','1'),('d42b14c4a5ba48faacf71ebb0cfef487',91,'2019-06-23 16:35:59','1'),('d42b14c4a5ba48faacf71ebb0cfef487',95,'2019-06-23 17:00:11','1'),('d42b14c4a5ba48faacf71ebb0cfef487',94,'2019-06-23 17:02:33','1'),('5f84b41c164c4779a7223cfbf247e251',95,'2019-06-23 16:53:47','1'),('5f84b41c164c4779a7223cfbf247e251',94,'2019-06-23 16:53:51','1'),('d42b14c4a5ba48faacf71ebb0cfef487',92,'2019-06-23 16:54:48','1'),('5f84b41c164c4779a7223cfbf247e251',96,'2019-06-23 16:56:03','0'),('265dd97b8d1f48efbf0806af4c594066',97,'2019-06-23 17:06:51','1'),('265dd97b8d1f48efbf0806af4c594066',98,'2019-06-23 17:08:11','1'),('ba33f06b40094df59248265576bc0759',99,'2019-06-23 17:08:14','1'),('1a634c5d4d6a4c4ab6f402195eedbab5',98,'2019-06-23 17:09:18','1'),('1a634c5d4d6a4c4ab6f402195eedbab5',96,'2019-06-23 17:09:24','1'),('5f84b41c164c4779a7223cfbf247e251',98,'2019-06-23 20:16:57','0'),('227ecfbde83d45d9bcf8fa3b35539667',100,'2019-06-23 18:06:05','1'),('5f84b41c164c4779a7223cfbf247e251',100,'2019-06-23 18:11:50','1'),('5f84b41c164c4779a7223cfbf247e251',99,'2019-06-23 18:57:47','1'),('5f84b41c164c4779a7223cfbf247e251',101,'2019-06-23 20:16:52','1');

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

insert  into `xy_order`(`order_id`,`seller_id`,`buyer_id`,`goods_id`) values ('9d8d7b996d074693ad3e993c44488cf2','227ecfbde83d45d9bcf8fa3b35539667','ba33f06b40094df59248265576bc0759','7c3e8e4a2f634c40b6c3496d88900f43');

/*Table structure for table `xy_post` */

DROP TABLE IF EXISTS `xy_post`;

CREATE TABLE `xy_post` (
  `post_id` varchar(32) NOT NULL COMMENT '贴子唯一标识符',
  `user_id` varchar(32) NOT NULL COMMENT '用户唯一标识符',
  `post_type` int(3) NOT NULL DEFAULT '123' COMMENT '贴子类型',
  `post_title` varchar(50) NOT NULL COMMENT '贴子标题',
  `post_content` longtext NOT NULL COMMENT '贴子内容',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `post_status` int(1) NOT NULL DEFAULT '0' COMMENT '贴子状态(0:发表,1:修改,2:删除)',
  PRIMARY KEY (`post_id`),
  KEY `xy_post_create_time_pindex` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='贴子';

/*Data for the table `xy_post` */

insert  into `xy_post`(`post_id`,`user_id`,`post_type`,`post_title`,`post_content`,`create_time`,`post_status`) values ('22882a2b1e1e4bdf843e312319b55cfd','7ec7e31cefe640d288c9c6b7a75fa9a7',123,'emoji测试','<p>这是emoji测试123123123123123123<span style=\"font-size: 1rem;\">?</span></p>','2019-06-23 16:33:31',0),('4f552b6ac98148cc977d670dc74d8314','7ec7e31cefe640d288c9c6b7a75fa9a7',123,'转载测试','<p>emoji测试?</p><blockquote><p>引用测试</p></blockquote><h1>H1标题测试&nbsp; &nbsp; &nbsp;空格测试</h1><div>正常测试</div><h1><hr></h1><h1><span style=\"font-size: 2.5rem;\">H1标题测试</span></h1><div><br></div><div><br></div><div><br></div><div><a href=\"http://www.baidu.com/\" target=\"_blank\">百度</a>&nbsp;超链接测试<br></div><div><br></div><ol><li>有序列表测试1</li><li>有序列表测试2</li></ol><div><br></div><ul><li>无序列表测试</li><li>无序列表测试</li><li>无序列表测试</li></ul><div><br></div><div>正常测试</div><div><br></div><div>正常测试</div><div><br></div><div><br></div><div>?emoji测试<br></div><div><div><div style=\"text-align: left;\"><img src=\"http://10.2.16.131/images/efde815bf466099e4173bcaddf192f7e.png\" title=\"图片\" style=\"font-size: 1rem;\"></div><div style=\"text-align: left;\">图片测试</div></div><div><img src=\"http://10.2.16.131/images/dc35e11608d6221ae7b9f22720810965.png\" title=\"图片\"><div>图片测试</div></div><div><img src=\"http://10.2.16.131/images/73921acd21677fabab69793a86dd0f9d.png\" title=\"图片\"><div>图片测试</div></div></div><div><br></div><div><table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><th>表格测试</th><th>&nbsp;asdas</th><th>asdad&nbsp;</th><th>&nbsp;asd</th><th>sadasdad</th></tr><tr><td>&nbsp;asd</td><td>&nbsp;sd</td><td>&nbsp;sd</td><td>&nbsp;asd</td><td>&nbsp;asdas</td></tr><tr><td>&nbsp;asd</td><td>&nbsp;asd</td><td>&nbsp;sd</td><td>&nbsp;asd</td><td>&nbsp;asdas</td></tr><tr><td>&nbsp;zxc</td><td>&nbsp;asd</td><td>&nbsp;sds</td><td>&nbsp;asd</td><td>&nbsp;asd</td></tr><tr><td>&nbsp;asd</td><td>&nbsp;zxc</td><td>&nbsp;d</td><td>&nbsp;asd</td><td>&nbsp;asd</td></tr></tbody></table><br></div><div>代码测试</div><div><pre><code>function A() {<br>  this.c = 123;<br>}<br>var a = new A();<br>console.log(a.c);</code></pre><br><br>表格测试<br><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"360\"><colgroup><col width=\"72\" span=\"5\"></colgroup><tbody><tr height=\"19\"><td height=\"19\" width=\"72\">修改测试</td><td width=\"72\">阿斯达斯的</td><td width=\"72\">阿斯达斯的</td><td colspan=\"2\" width=\"144\">阿萨德撒多</td></tr><tr height=\"19\"><td height=\"19\">山地自行车</td><td>刹车在西安市</td><td>撒大中型出去玩</td><td colspan=\"2\">阿萨德自行车感受到</td></tr></tbody></table><br>表格测试<br><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"792\"><colgroup><col width=\"72\" span=\"11\"></colgroup><tbody><tr height=\"19\"><td height=\"19\" width=\"72\">阿萨德</td><td width=\"72\">阿斯达斯的</td><td width=\"72\">阿斯达斯的</td><td colspan=\"2\" width=\"144\">阿萨德撒多</td><td width=\"72\">阿萨德</td><td width=\"72\">阿萨德</td><td width=\"72\">阿斯达斯的</td><td width=\"72\">阿斯达斯的</td><td colspan=\"2\" width=\"144\"><br></td></tr><tr height=\"19\"><td height=\"19\">山地自行车</td><td>刹车在西安市</td><td>撒大中型出去玩</td><td colspan=\"2\">阿萨德自行车感受到</td><td>抽象注册</td><td>山地自行车</td><td>刹车在西安市</td><td>撒大中型出去玩</td><td colspan=\"2\"><br></td></tr></tbody></table><br><span style=\"font-style: italic;\"></span><span style=\"font-size: 1rem;\"></span><br></div>','2019-06-23 17:20:54',1),('55a67f6d1ee24b23a1e331941cae8c1c','7ec7e31cefe640d288c9c6b7a75fa9a7',123,'发一篇帖子试试看','<p>听说这是一个很厉害的平台，我来发一个帖子看看</p>','2019-06-23 16:27:43',0),('9fad4461b50548d5a4b5542abed5c987','d42b14c4a5ba48faacf71ebb0cfef487',123,'欢迎来到松田','<div class=\"img-pack\"><img src=\"http://10.2.16.131/images/8f20719e217a3b4d7abe4256b8940431.jpg\" title=\"图片\"><span style=\"color: rgb(153, 153, 153); font-size: 14px;\">松田永远欢迎你..........（到15个字没有？）</span></div>','2019-06-23 17:13:01',0),('a1355af5c0d2485aa7f3f73ae4dbdd29','ba33f06b40094df59248265576bc0759',123,'找人','<p>听说我们学校有人在卖游戏号，有人知道是谁吗？</p>','2019-06-23 17:04:31',0),('f025aa1874ca43a786e48abb8a9f50a7','d42b14c4a5ba48faacf71ebb0cfef487',123,'213','<p>321----------------------------------------</p>','2019-06-23 16:23:58',0);

/*Table structure for table `xy_reply` */

DROP TABLE IF EXISTS `xy_reply`;

CREATE TABLE `xy_reply` (
  `reply_id` varchar(32) NOT NULL COMMENT '回复唯一标识符',
  `user_id` varchar(32) NOT NULL COMMENT '用户唯一标识符',
  `post_id` varchar(32) NOT NULL COMMENT '贴子唯一标识符',
  `previous_id` varchar(32) DEFAULT NULL COMMENT '上一条回复的唯一标识符',
  `reply_content` longtext NOT NULL COMMENT '回复内容',
  `reply_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reply_status` int(1) NOT NULL DEFAULT '0' COMMENT '回复状态(0:发表,1:修改,2:删除)',
  PRIMARY KEY (`reply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='贴子回复';

/*Data for the table `xy_reply` */

insert  into `xy_reply`(`reply_id`,`user_id`,`post_id`,`previous_id`,`reply_content`,`reply_time`,`reply_status`) values ('0fc6dcfebc914d37be84622282e81cc8','8978d3be49a94b6fb1ab6811c2eb9021','4f552b6ac98148cc977d670dc74d8314','d414ce8f0acc4e2e9336d25bd66cb0c6','<p>测试号-01082637</p><p>回复测试，</p><blockquote><div class=\"img-pack\"><img src=\"http://10.2.16.131/images/e28016d434d4137cc2278ff89846813b.jpg\" title=\"图片\"><div class=\"img-caption\">图片</div></div></blockquote>','2019-06-23 17:26:41',0),('865e5b9d78e34da4a45b57495b0fc8ed','5f84b41c164c4779a7223cfbf247e251','9fad4461b50548d5a4b5542abed5c987','db7fa8f8bfea48aa8f83708854b0ab93','<p>我用我小弟的号怎么了，怎么了！！！？？？</p>','2019-06-23 19:54:38',0),('d414ce8f0acc4e2e9336d25bd66cb0c6','7ec7e31cefe640d288c9c6b7a75fa9a7','4f552b6ac98148cc977d670dc74d8314',NULL,'<p>喔，测试成功了</p><p>那么现在来一下回复测试好了</p><p>?<br></p><div class=\"img-pack\"><img src=\"http://10.2.16.131/images/3bc676a26c229d155e4396f8bcadb42f.jpg\" title=\"图片\"><div class=\"img-caption\">图片</div></div><p>看样子测试没问题</p>','2019-06-23 17:22:55',0),('db7fa8f8bfea48aa8f83708854b0ab93','ba33f06b40094df59248265576bc0759','9fad4461b50548d5a4b5542abed5c987',NULL,'<p>老是用我小号乱发东西是吧。多久才15字啊。。。</p>','2019-06-23 17:29:27',0);

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

insert  into `xy_task`(`task_id`,`task_type`,`task_company`,`task_quantity`,`task_size`,`task_money`,`task_message`,`user_id`,`task_status`,`task_recipient`) values ('0e6b59ff371d4d2796a2ccb666f8f911','0','中通','1','小',22,'22','ba33f06b40094df59248265576bc0759',-1,'d42b14c4a5ba48faacf71ebb0cfef487'),('1b1afe2f1794408c8c43eee3651bc623','1','二楼','1','小',10,'','d42b14c4a5ba48faacf71ebb0cfef487',-1,'ba33f06b40094df59248265576bc0759'),('1e36bdbd486c4d5aae62299e0d8c7a0e','0','申通','1','小',5,'','d42b14c4a5ba48faacf71ebb0cfef487',-1,'ba33f06b40094df59248265576bc0759'),('208d9d69b71c4882af6d2120ca57f9c8','0','顺丰','1','小',10,'急件','d42b14c4a5ba48faacf71ebb0cfef487',-1,'0d87226820ea46f7886ffe5967a6e1cc'),('327b51000bd04be2bc578e3320793414','0','中通','1','小',5,'1','ba33f06b40094df59248265576bc0759',0,NULL),('3cddbd4e6df7435bafce36f2b0ae605f','0','22','1','小',22,'22','ba33f06b40094df59248265576bc0759',-1,'0d87226820ea46f7886ffe5967a6e1cc'),('46dcc32f675a4539b35e03a41918abcb','0','中通','2','小',6,'急件','0d87226820ea46f7886ffe5967a6e1cc',0,NULL),('95bb7cfa187d417691d93f8a09fa5807','0','韵达','1','小',11,'asd','ba33f06b40094df59248265576bc0759',0,NULL),('992097af0b0047f4817ca5b99ed2a3d2','1','猪脚饭','1','小',5,'','0d87226820ea46f7886ffe5967a6e1cc',-1,'d42b14c4a5ba48faacf71ebb0cfef487'),('b71d9968f2f34d5a8bd7e0f66e53a49c','0','中通','1','小',3,'','0d87226820ea46f7886ffe5967a6e1cc',-1,'d42b14c4a5ba48faacf71ebb0cfef487'),('c0567f6f4d334f01b8f7520021dc2af3','0','申通','3','都有',12,'','0d87226820ea46f7886ffe5967a6e1cc',0,NULL),('c191dd83673b43a8b0596e6bad19506a','0','圆通','5','小',15,'','d42b14c4a5ba48faacf71ebb0cfef487',0,NULL),('c7ad78f28790442a8d2a6a08c5b546a0','1','三楼','2','小',20,'','ba33f06b40094df59248265576bc0759',0,NULL);

/*Table structure for table `xy_user` */

DROP TABLE IF EXISTS `xy_user`;

CREATE TABLE `xy_user` (
  `user_id` varchar(32) NOT NULL COMMENT '用户唯一标识符',
  `user_name` varchar(15) NOT NULL COMMENT '用户名',
  `user_pass` varchar(20) NOT NULL COMMENT '用户密码',
  `user_avatar` varchar(255) NOT NULL DEFAULT 'http://10.2.16.131/images/99b56d364b5c5ae210cf5622512ec8c1.jpg' COMMENT '用户头像',
  `user_address` varchar(255) DEFAULT '' COMMENT '用户地址',
  `user_phone` varchar(11) NOT NULL COMMENT '用户手机号',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `xy_user_user_phone_uindex` (`user_phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `xy_user` */

insert  into `xy_user`(`user_id`,`user_name`,`user_pass`,`user_avatar`,`user_address`,`user_phone`) values ('0d87226820ea46f7886ffe5967a6e1cc','yxqqq','123456','http://10.2.16.131/images/ffd9a1c29706d2538e7e0d0d6f24181e.jpg','松田','13456789102'),('1a634c5d4d6a4c4ab6f402195eedbab5','帅臻','12345q','http://10.2.16.131/images/c8765183ae465a9c7dc080612b8f7aa9.png','','13719518872'),('227ecfbde83d45d9bcf8fa3b35539667','卖家专用号','123456','http://10.2.16.131/images/99b56d364b5c5ae210cf5622512ec8c1.jpg','','18933287883'),('265dd97b8d1f48efbf0806af4c594066','wj','123456','http://10.2.16.131/images/afc868e5c8ea90e1c8b260a865a6a7fb.jpg','广州大学松田学院','18138737001'),('5f84b41c164c4779a7223cfbf247e251','青爷','123456','http://10.2.16.131/images/6d0a76557d007e86f6cd767388a7ba31.jpg','广州大学松田学院','18138770489'),('7ec7e31cefe640d288c9c6b7a75fa9a7','SnoopyAquarius','654321','http://10.2.16.131/images/bdd2b86a15d36554a346a4480335cc28.jpg','','18632068795'),('8978d3be49a94b6fb1ab6811c2eb9021','SCPL-01082637','654321','http://10.2.16.131/images/99b56d364b5c5ae210cf5622512ec8c1.jpg','','18369456123'),('ba33f06b40094df59248265576bc0759','yxq','123456','http://10.2.16.131/images/a685a9bd0f40440455077b66da2cd03b.jpg','松田','13456789100'),('d42b14c4a5ba48faacf71ebb0cfef487','yxqq','123456','http://10.2.16.131/images/59b8c9a0effffba78fdcfa8277aa2b05.jpg','松田','13456789101');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
