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

insert  into `xy_reply`(`reply_id`,`user_id`,`post_id`,`previous_id`,`reply_content`,`reply_time`,`reply_status`) values ('016d6496815948c492ccc11cc5a4b8e4','92aa2e75ba6f413888bebf0392baab17','fb030ca65a634562a3559eba60ebf095','8608e990cf0c40388b115d57f9ee731f','<p>MicroSoft YES！</p>','2019-06-04 20:58:46',0),('03116b8fab914c059ee4c54f56678383','92aa2e75ba6f413888bebf0392baab17','fb030ca65a634562a3559eba60ebf095',NULL,'<p>11</p>','2019-06-03 17:00:15',0),('07f60a9d8b8441c099a7d56c360fdd0f','92aa2e75ba6f413888bebf0392baab17','fb030ca65a634562a3559eba60ebf095',NULL,'<p>123432424324324</p>','2019-06-03 16:47:06',0),('1ce6c30b8ede4f218087a482ce9b5bef','92aa2e75ba6f413888bebf0392baab17','fb030ca65a634562a3559eba60ebf095',NULL,'<p>6</p>','2019-06-03 16:59:47',0),('2c115f6d6d954d8d9194336418e2b0a3','92aa2e75ba6f413888bebf0392baab17','fb030ca65a634562a3559eba60ebf095',NULL,'<p>5</p>','2019-06-03 16:59:41',0),('2e755a7397924d8dbcd7e90b5e236d05','f825cd6255f64afc8ed6950c3de1ff36','fb030ca65a634562a3559eba60ebf095',NULL,'<p>回复一个看看啊修改</p>','2019-06-01 11:02:27',1),('30d8bfd879cc4e4fbdf43f046a0dff93','92aa2e75ba6f413888bebf0392baab17','b2626bf92cd84414af70b8455794d809','896950ad3c8a457698ae0c90206c03da','<p>回复一下你</p>','2019-06-03 11:31:36',0),('37cdb31e5c7b48a187c570e3d355ff72','92aa2e75ba6f413888bebf0392baab17','fb030ca65a634562a3559eba60ebf095','43aaf11602a5452d8c03eb09e125b290','<p>18</p>','2019-06-04 21:35:51',0),('43aaf11602a5452d8c03eb09e125b290','92aa2e75ba6f413888bebf0392baab17','fb030ca65a634562a3559eba60ebf095',NULL,'<p>10</p>','2019-06-03 17:00:09',0),('539f27913e0742678fbeab3db8b44f2c','92aa2e75ba6f413888bebf0392baab17','b2626bf92cd84414af70b8455794d809',NULL,'<p>阿斯达斯的大所多</p>','2019-05-24 18:33:20',2),('5507b0074cf44b6d9b2b98255ee78a74','92aa2e75ba6f413888bebf0392baab17','fb030ca65a634562a3559eba60ebf095','07f60a9d8b8441c099a7d56c360fdd0f','<p>213t34t3464553rwesfdsdfd</p>','2019-06-03 16:47:13',0),('691bfe9d33b941a988000346adf46403','92aa2e75ba6f413888bebf0392baab17','fb030ca65a634562a3559eba60ebf095','c108be04a6394cb5a2b865ea391cb74f','<p>21</p>','2019-06-04 21:36:10',0),('7f89bc61b3294e83b1d3b595921b5e10','92aa2e75ba6f413888bebf0392baab17','f42e0ece7c7d43e78edf822a4469dada',NULL,'<p>再来两个<span style=\"font-size: 1rem;\">再来两个</span><span style=\"font-size: 1rem;\">再来两个</span><span style=\"font-size: 1rem;\">再来两个</span></p>','2019-05-31 16:02:01',2),('8608e990cf0c40388b115d57f9ee731f','92aa2e75ba6f413888bebf0392baab17','fb030ca65a634562a3559eba60ebf095','5507b0074cf44b6d9b2b98255ee78a74','<p>你要干啥</p>','2019-06-04 20:58:27',0),('896950ad3c8a457698ae0c90206c03da','f825cd6255f64afc8ed6950c3de1ff36','b2626bf92cd84414af70b8455794d809',NULL,'<p>我就来回复了</p>','2019-06-01 11:04:43',0),('97ec79d3a2464ac9a3a1dd7cd37c1955','92aa2e75ba6f413888bebf0392baab17','b2626bf92cd84414af70b8455794d809','539f27913e0742678fbeab3db8b44f2c','<p>阿斯达斯的多</p>','2019-05-24 18:33:27',0),('b8da0cafd5b2437ab490dc4348803727','92aa2e75ba6f413888bebf0392baab17','fb030ca65a634562a3559eba60ebf095',NULL,'<p>9</p>','2019-06-03 17:00:03',0),('b975bf4b0f4043b2b48fa03932754ec4','92aa2e75ba6f413888bebf0392baab17','fb030ca65a634562a3559eba60ebf095',NULL,'<p>7</p>','2019-06-03 16:59:53',0),('bc51e725ad9247eda95dfc40298b3266','92aa2e75ba6f413888bebf0392baab17','fb030ca65a634562a3559eba60ebf095',NULL,'<p>水电费萨达斯的</p>','2019-06-04 20:54:30',0),('be5e9c0c83b347a79b872185c45ac498','92aa2e75ba6f413888bebf0392baab17','fb030ca65a634562a3559eba60ebf095','07f60a9d8b8441c099a7d56c360fdd0f','<p>阿斯达斯的防守打法是对方防守打法手动阀12134124235234321312313</p>','2019-06-04 20:58:11',0),('c108be04a6394cb5a2b865ea391cb74f','92aa2e75ba6f413888bebf0392baab17','fb030ca65a634562a3559eba60ebf095','f2698fd7adba4770bc02c3f4f661915e','<p>20</p>','2019-06-04 21:36:03',0),('c3841f23ea324c78b57558c3d26e10f8','92aa2e75ba6f413888bebf0392baab17','fb030ca65a634562a3559eba60ebf095','03116b8fab914c059ee4c54f56678383','<p>17</p>','2019-06-04 21:35:42',0),('dc08a427e61047eeb2ceb93b27522ffd','92aa2e75ba6f413888bebf0392baab17','fb030ca65a634562a3559eba60ebf095',NULL,'<p>8</p>','2019-06-03 16:59:59',0),('e48f175714ff4dbcb7d25af300092f33','92aa2e75ba6f413888bebf0392baab17','fb030ca65a634562a3559eba60ebf095',NULL,'<p>阿斯达斯的</p>','2019-06-04 20:54:23',0),('eed3af55b3fb4aedb85885d3bea63650','92aa2e75ba6f413888bebf0392baab17','5a270e50977f4f7d91b56d95ef38f135',NULL,'<p>再来一个12321123213阿萨德阿斯达斯的阿萨德哇奥所多</p>','2019-05-31 15:54:17',1),('f2698fd7adba4770bc02c3f4f661915e','92aa2e75ba6f413888bebf0392baab17','fb030ca65a634562a3559eba60ebf095',NULL,'<p>19</p>','2019-06-04 21:35:55',0),('fe720e087e434b389d313d250a3408e0','92aa2e75ba6f413888bebf0392baab17','f42e0ece7c7d43e78edf822a4469dada','7f89bc61b3294e83b1d3b595921b5e10','<p>再来两个<span style=\"font-size: 1rem;\">再来两个</span><span style=\"font-size: 1rem;\">再来两个</span><span style=\"font-size: 1rem;\">再来两个</span><span style=\"font-size: 1rem;\">再来两个</span></p>','2019-05-31 16:02:04',2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
