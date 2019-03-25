/*
SQLyog Professional v12.08 (64 bit)
MySQL - 5.6.70 : Database - p_author
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`p_author` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `p_author`;

/*Table structure for table `article` */

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT '' COMMENT '文章内容',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `delete_status` varchar(1) DEFAULT '1' COMMENT '是否有效  1.有效  2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='发布号作者表';

/*Data for the table `article` */

insert  into `article`(`id`,`content`,`create_time`,`update_time`,`delete_status`) values (5,'莎士比亚','2017-10-25 09:08:45','2017-10-30 17:59:41','1'),(6,'亚里士多德','2017-10-26 10:49:28','2017-11-18 09:54:15','1'),(10,'亚历山大','2017-10-26 14:57:45','2017-11-08 13:28:52','1'),(11,'李白','2017-10-26 15:23:42','2017-10-26 15:23:42','1'),(19,'文章test2','2017-11-18 13:37:07','2017-11-18 13:37:11','1'),(20,'asd','2019-03-23 09:24:04','2019-03-23 09:24:04','1'),(21,'fsfsdf','2019-03-23 09:24:07','2019-03-23 09:24:07','1'),(22,'2sdfsdf','2019-03-23 09:24:19','2019-03-23 09:24:19','1'),(23,'sdsdf','2019-03-23 09:24:20','2019-03-23 09:24:20','1'),(24,'112','2019-03-23 09:24:22','2019-03-23 09:24:22','1'),(25,'水电费','2019-03-23 09:24:24','2019-03-23 09:24:24','1'),(26,'是的服务而','2019-03-23 09:24:25','2019-03-23 09:24:25','1'),(27,'办公会','2019-03-23 09:24:27','2019-03-23 09:24:27','1'),(28,'行政村v','2019-03-23 09:24:30','2019-03-23 09:24:30','1'),(29,'从V型个','2019-03-23 09:24:33','2019-03-23 09:24:33','1'),(30,'选择V型在v','2019-03-23 09:24:35','2019-03-23 09:24:35','1'),(31,'任天野','2019-03-23 09:24:37','2019-03-23 09:24:37','1'),(32,'看看了','2019-03-23 09:24:39','2019-03-23 09:24:39','1'),(33,'VBVC','2019-03-23 09:24:41','2019-03-23 09:24:41','1'),(34,'这些反弹','2019-03-23 09:24:43','2019-03-23 09:24:43','1');

/*Table structure for table `p_id_card` */

DROP TABLE IF EXISTS `p_id_card`;

CREATE TABLE `p_id_card` (
  `id_card` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `p_id_card` */

insert  into `p_id_card`(`id_card`) values ('14'),('14ssssss'),('sdfsdf'),('?½??ı??ĵ?');

/*Table structure for table `p_operation_log` */

DROP TABLE IF EXISTS `p_operation_log`;

CREATE TABLE `p_operation_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `op_user` varchar(25) DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `p_operation_log` */

/*Table structure for table `p_person_control` */

DROP TABLE IF EXISTS `p_person_control`;

CREATE TABLE `p_person_control` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_no` varchar(20) DEFAULT NULL,
  `NAME` varchar(30) DEFAULT NULL,
  `sex` varchar(5) DEFAULT NULL,
  `id_card` varchar(30) NOT NULL,
  `birthplace` varchar(30) DEFAULT NULL,
  `TYPE` varchar(30) DEFAULT NULL,
  `case_type` varchar(30) DEFAULT NULL,
  `photo_url` varchar(100) DEFAULT NULL,
  `is_delete` int(2) DEFAULT '0',
  `add_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_control_id_card` (`id_card`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;

/*Data for the table `p_person_control` */

insert  into `p_person_control`(`id`,`id_no`,`NAME`,`sex`,`id_card`,`birthplace`,`TYPE`,`case_type`,`photo_url`,`is_delete`,`add_time`,`edit_time`) values (1,'N000001','陈浩','男','330381198901160130','浙江','非公安','一般案件','\\static\\images\\stock\\100455.png',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,NULL,'老谭 ','男','330389199001233632','江西','重点人员','重点案件',NULL,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(60,'UN991','张三','男','123456','江苏','重点人员','刑事案件','\\static\\images\\stock\\1553480171(1).jpg',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(61,'UN98898','李四','男','330582654','浙江','重点人员','一般案件',NULL,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(65,'UN987','王大翠','女','1258988774x','12233','重点人员','偷盗案件','\\static\\images\\stock\\QQ图片20190325094905.png',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(66,'UN676283','小巫石','男','33669995','安徽','一般人员','老赖','\\static\\images\\stock\\123.jpg',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(67,'UN0042','王菲','男','232345435','浙江','是否','爱施德玩儿',NULL,1,'2019-03-23 09:58:53','2019-03-23 09:58:53'),(68,'UN0045','水电费','男','345345','江苏',' 双方都','双方各',NULL,1,'2019-03-23 09:58:53','2019-03-23 09:58:53'),(69,'UN0048','山东人','男','345345345','无锡','是否','爱施德玩儿',NULL,1,'2019-03-23 09:58:53','2019-03-23 09:58:53'),(70,'UN0051','第三方','女','234234','深刻的房间',' 双方都','双方各',NULL,1,'2019-03-23 09:58:53','2019-03-23 09:58:53'),(71,'UN0054','先吃饭','女','100345','水电费','是否','爱施德玩儿','\\static\\images\\stock\\100345.JPG',1,'2019-03-23 09:58:53','2019-03-23 09:58:53'),(72,'UN0057','佛挡杀佛','女','100356','爱施德若',' 双方都','双方各',NULL,1,'2019-03-23 09:58:53','2019-03-23 09:58:53'),(73,'UN0060','玩儿','男','100367','水电费','是否','爱施德玩儿',NULL,1,'2019-03-23 09:58:53','2019-03-23 09:58:53'),(74,'UN0063','水电费','男','100378','爱施德若',' 双方都','双方各','\\static\\images\\stock\\376312.jpg',1,'2019-03-23 09:58:53','2019-03-23 09:58:53'),(75,'UN0066','许','男','100389','水电费','是否','爱施德玩儿',NULL,1,'2019-03-23 09:58:53','2019-03-23 09:58:53'),(76,'UN0069','往前二翁人','女','100400','爱施德若',' 双方都','双方各',NULL,1,'2019-03-23 09:58:53','2019-03-23 09:58:53'),(77,'UN0072','水电费','女','100411','水电费','是否','爱施德玩儿',NULL,1,'2019-03-23 09:58:53','2019-03-23 09:58:53'),(78,'UN0075','保存下吧','男','100422','爱施德若',' 双方都','双方各','\\static\\images\\stock\\100422.png',1,'2019-03-23 09:58:53','2019-03-23 09:58:53'),(79,'UN0078','玩儿','男','100433','水电费','是否','爱施德玩儿',NULL,1,'2019-03-23 09:58:53','2019-03-23 09:58:53'),(80,'UN0081','水电费','男','100444','爱施德若',' 双方都','双方各',NULL,1,'2019-03-23 09:58:53','2019-03-23 09:58:53'),(81,'UN0084','玩儿','女','100455','水电费','是否','爱施德玩儿','\\static\\images\\stock\\100455.png',1,'2019-03-23 09:58:53','2019-03-23 09:58:53'),(82,'UN0087','玩儿','男','100466','爱施德若',' 双方都','双方各',NULL,1,'2019-03-23 09:58:53','2019-03-23 09:58:53'),(83,'UN0090','这个','男','100477','水电费','是否','爱施德玩儿',NULL,1,'2019-03-23 09:58:53','2019-03-23 09:58:53'),(84,'UN0093','血常规','男','100488','爱施德若',' 双方都','双方各',NULL,1,'2019-03-23 09:58:53','2019-03-23 09:58:53'),(85,'UN0096','往前二翁人','女','100499','水电费','是否','爱施德玩儿',NULL,1,'2019-03-23 09:58:53','2019-03-23 09:58:53'),(86,'UN0099','刷新','女','100510','爱施德若',' 双方都','双方各',NULL,1,'2019-03-23 09:58:53','2019-03-23 09:58:53'),(87,'UN0102','的双方各','女','100521','水电费','是否','爱施德玩儿',NULL,1,'2019-03-23 09:58:53','2019-03-23 09:58:53'),(88,'UN0105','程序','男','100532','爱施德若',' 双方都','双方各',NULL,1,'2019-03-23 09:58:53','2019-03-23 09:58:53'),(89,'UN0108','许','男','100543','水电费','是否','爱施德玩儿',NULL,1,'2019-03-23 09:58:53','2019-03-23 09:58:53'),(90,'UN0111','无色若','男','100554','爱施德若',' 双方都','双方各',NULL,1,'2019-03-23 09:58:53','2019-03-23 09:58:53'),(91,'UN0114','申请未二','女','100565','水电费','是否','爱施德玩儿',NULL,1,'2019-03-23 09:58:53','2019-03-23 09:58:53'),(92,'UN0117','咯法规','男','100576','爱施德若',' 双方都','双方各',NULL,1,'2019-03-23 09:58:53','2019-03-23 09:58:53'),(93,'UN0120','pool','男','100587','水电费','是否','爱施德玩儿',NULL,1,'2019-03-23 09:58:53','2019-03-23 09:58:53'),(94,'UN0123','瑞','男','100598','爱施德若',' 双方都','双方各',NULL,1,'2019-03-23 09:58:53','2019-03-23 09:58:53'),(95,'UN0126','erotic','女','100609','水电费','是否','爱施德玩儿',NULL,1,'2019-03-23 09:58:53','2019-03-23 09:58:53'),(96,'UN0129','的法国进口','男','100620','爱施德若',' 双方都','双方各',NULL,1,'2019-03-23 09:58:53','2019-03-23 09:58:53'),(97,'UN0132','俄日图','男','100631','水电费','是否','爱施德玩儿',NULL,1,'2019-03-23 09:58:53','2019-03-23 09:58:53'),(98,'UN0135','发的开关机','男','100642','爱施德若',' 双方都','双方各',NULL,1,'2019-03-23 09:58:53','2019-03-23 09:58:53'),(99,'UN0138','CVBS','男','100653','水电费','是否','爱施德玩儿',NULL,1,'2019-03-23 09:58:53','2019-03-23 09:58:53'),(100,'UN0141','问题','男','100664','爱施德若',' 双方都','双方各',NULL,1,'2019-03-23 09:58:53','2019-03-23 09:58:53'),(101,'UN0144','发达国家看','男','100675','水电费','是否','爱施德玩儿',NULL,1,'2019-03-23 09:58:53','2019-03-23 09:58:53'),(102,'UN0147','问题','女','100686','爱施德若',' 双方都','双方各',NULL,1,'2019-03-23 09:58:53','2019-03-23 09:58:53'),(103,'UN0150','电饭锅','女','100697','水电费','是否','爱施德玩儿',NULL,1,'2019-03-23 09:58:53','2019-03-23 09:58:53'),(104,'UN0153','客人提供','男','100708','爱施德若',' 双方都','双方各',NULL,1,'2019-03-23 09:58:53','2019-03-23 09:58:53'),(105,'UN0156','俄日呕吐','女','100719','水电费','是否','爱施德玩儿',NULL,1,'2019-03-23 09:58:54','2019-03-23 09:58:54'),(106,'UN676283','小巫石','男','33669995','安徽','重点人员','老赖','\\static\\images\\stock\\123.jpg',1,'2019-03-25 14:06:37','2019-03-25 14:06:37'),(107,'UN9105','小虎儿','1','1258988774xsxcc','122332e4','重点人员','偷盗案件',NULL,1,'2019-03-25 23:48:13','2019-03-25 23:48:13'),(108,'UN0042','王菲','男','232345435','浙江','是否','爱施德玩儿','\\static\\images\\stock\\pytest.jpg',0,'2019-03-25 23:51:14','2019-03-25 23:51:14'),(109,'UN0045','水电费','男','345345','江苏',' 双方都','双方各',NULL,0,'2019-03-25 23:51:14','2019-03-25 23:51:14'),(110,'UN0048','山东人','男','345345345','无锡','是否','爱施德玩儿',NULL,0,'2019-03-25 23:51:14','2019-03-25 23:51:14'),(111,'UN0051','第三方','女','234234','深刻的房间',' 双方都','双方各',NULL,0,'2019-03-25 23:51:14','2019-03-25 23:51:14'),(112,'UN0054','先吃饭','女','100345','水电费','是否','爱施德玩儿',NULL,0,'2019-03-25 23:51:14','2019-03-25 23:51:14'),(113,'UN0057','佛挡杀佛','女','100356','爱施德若',' 双方都','双方各',NULL,0,'2019-03-25 23:51:14','2019-03-25 23:51:14'),(114,'UN0060','玩儿','男','100367','水电费','是否','爱施德玩儿',NULL,0,'2019-03-25 23:51:14','2019-03-25 23:51:14'),(115,'UN0063','水电费','男','1003782254','爱施德若',' 双方都','双方各',NULL,0,'2019-03-25 23:51:14','2019-03-25 23:51:14'),(116,'UN0066','许','男','100389','水电费','是否','爱施德玩儿',NULL,0,'2019-03-25 23:51:14','2019-03-25 23:51:14'),(117,'UN0069','往前二翁人','女','100400','爱施德若',' 双方都','双方各',NULL,0,'2019-03-25 23:51:14','2019-03-25 23:51:14'),(118,'UN0072','水电费','女','100411','水电费','是否','爱施德玩儿',NULL,0,'2019-03-25 23:51:14','2019-03-25 23:51:14'),(119,'UN0075','保存下吧','男','100422','爱施德若',' 双方都','双方各',NULL,0,'2019-03-25 23:51:14','2019-03-25 23:51:14'),(120,'UN0078','玩儿','男','100433','水电费','是否','爱施德玩儿',NULL,0,'2019-03-25 23:51:14','2019-03-25 23:51:14'),(121,'UN0081','水电费','男','100444','爱施德若',' 双方都','双方各',NULL,0,'2019-03-25 23:51:14','2019-03-25 23:51:14'),(122,'UN0084','玩儿','女','100455','水电费','是否','爱施德玩儿',NULL,0,'2019-03-25 23:51:14','2019-03-25 23:51:14'),(123,'UN0087','玩儿','男','100466','爱施德若',' 双方都','双方各',NULL,0,'2019-03-25 23:51:14','2019-03-25 23:51:14'),(124,'UN0090','这个','男','100477','水电费','是否','爱施德玩儿',NULL,0,'2019-03-25 23:51:14','2019-03-25 23:51:14'),(125,'UN0093','血常规','男','100488','爱施德若',' 双方都','双方各',NULL,0,'2019-03-25 23:51:14','2019-03-25 23:51:14'),(126,'UN0096','往前二翁人','女','100499','水电费','是否','爱施德玩儿',NULL,0,'2019-03-25 23:51:14','2019-03-25 23:51:14'),(127,'UN0099','刷新','女','100510','爱施德若',' 双方都','双方各',NULL,0,'2019-03-25 23:51:14','2019-03-25 23:51:14'),(128,'UN0102','的双方各','女','100521','水电费','是否','爱施德玩儿',NULL,0,'2019-03-25 23:51:14','2019-03-25 23:51:14'),(129,'UN0105','程序','男','100532','爱施德若',' 双方都','双方各',NULL,0,'2019-03-25 23:51:14','2019-03-25 23:51:14'),(130,'UN0108','许','男','100543','水电费','是否','爱施德玩儿',NULL,0,'2019-03-25 23:51:15','2019-03-25 23:51:15'),(131,'UN0111','无色若','男','100554','爱施德若',' 双方都','双方各',NULL,0,'2019-03-25 23:51:15','2019-03-25 23:51:15'),(132,'UN0114','申请未二','女','100565','水电费','是否','爱施德玩儿',NULL,0,'2019-03-25 23:51:15','2019-03-25 23:51:15'),(133,'UN0117','咯法规','男','100576','爱施德若',' 双方都','双方各',NULL,0,'2019-03-25 23:51:15','2019-03-25 23:51:15'),(134,'UN0120','pool','男','100587','水电费','是否','爱施德玩儿',NULL,0,'2019-03-25 23:51:15','2019-03-25 23:51:15'),(135,'UN0123','瑞','男','100598','爱施德若',' 双方都','双方各',NULL,0,'2019-03-25 23:51:15','2019-03-25 23:51:15'),(136,'UN0126','erotic','女','100609','水电费','是否','爱施德玩儿',NULL,0,'2019-03-25 23:51:15','2019-03-25 23:51:15'),(137,'UN0129','的法国进口','男','100620','爱施德若',' 双方都','双方各',NULL,0,'2019-03-25 23:51:15','2019-03-25 23:51:15'),(138,'UN0132','俄日图','男','100631','水电费','是否','爱施德玩儿',NULL,0,'2019-03-25 23:51:15','2019-03-25 23:51:15'),(139,'UN0135','发的开关机','男','100642','爱施德若',' 双方都','双方各',NULL,0,'2019-03-25 23:51:15','2019-03-25 23:51:15'),(140,'UN0138','CVBS','男','100653','水电费','是否','爱施德玩儿',NULL,0,'2019-03-25 23:51:15','2019-03-25 23:51:15'),(141,'UN0141','问题','男','100664','爱施德若',' 双方都','双方各',NULL,0,'2019-03-25 23:51:15','2019-03-25 23:51:15'),(142,'UN0144','发达国家看','男','100675','水电费','是否','爱施德玩儿',NULL,0,'2019-03-25 23:51:15','2019-03-25 23:51:15'),(143,'UN0147','问题','女','100686','爱施德若',' 双方都','双方各',NULL,0,'2019-03-25 23:51:15','2019-03-25 23:51:15'),(144,'UN0150','电饭锅','女','100697','水电费','是否','爱施德玩儿',NULL,0,'2019-03-25 23:51:15','2019-03-25 23:51:15'),(145,'UN0153','客人提供','男','100708','爱施德若',' 双方都','双方各',NULL,0,'2019-03-25 23:51:15','2019-03-25 23:51:15'),(146,'UN0156','俄日呕吐','女','100719','水电费','是否','爱施德玩儿',NULL,0,'2019-03-25 23:51:15','2019-03-25 23:51:15'),(147,'UN9105','小虎儿sdf','2','1258988774xsxcc','122332e4','重点人员','偷盗案件',NULL,1,'2019-03-25 23:51:31','2019-03-25 23:51:31'),(148,'UN0042水电费','王菲电放费','女','232345435234','浙江','是否','爱施德玩儿',NULL,0,'2019-03-25 23:52:33','2019-03-25 23:52:33');

/*Table structure for table `p_person_info_history` */

DROP TABLE IF EXISTS `p_person_info_history`;

CREATE TABLE `p_person_info_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(30) DEFAULT NULL,
  `nation` varchar(10) DEFAULT NULL,
  `id_card` varchar(30) NOT NULL,
  `card_type` int(11) DEFAULT NULL,
  `collect_point` varchar(30) DEFAULT NULL,
  `collect_person` varchar(30) DEFAULT NULL,
  `collect_time` time DEFAULT NULL,
  `collect_from` varchar(30) DEFAULT NULL,
  `information_from` varchar(30) DEFAULT NULL,
  `photo_url` varchar(100) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `edit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `p_person_info_history` */

/*Table structure for table `p_person_spot_info` */

DROP TABLE IF EXISTS `p_person_spot_info`;

CREATE TABLE `p_person_spot_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(30) DEFAULT NULL,
  `nation` varchar(10) DEFAULT NULL,
  `id_card` varchar(30) NOT NULL,
  `card_type` int(11) DEFAULT NULL,
  `collect_point` varchar(30) DEFAULT NULL,
  `collect_person` varchar(30) DEFAULT NULL,
  `collect_time` time DEFAULT NULL,
  `collect_from` varchar(30) DEFAULT NULL,
  `information_from` varchar(30) DEFAULT NULL,
  `photo_url` varchar(100) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `edit_time` datetime DEFAULT NULL,
  `is_deal` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_spot_id_card` (`id_card`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

/*Data for the table `p_person_spot_info` */

insert  into `p_person_spot_info`(`id`,`NAME`,`nation`,`id_card`,`card_type`,`collect_point`,`collect_person`,`collect_time`,`collect_from`,`information_from`,`photo_url`,`add_time`,`edit_time`,`is_deal`) values (30,NULL,NULL,'100433',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(31,NULL,NULL,'100378',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(32,NULL,NULL,'100488',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(61,NULL,NULL,'330381198901160130',NULL,NULL,NULL,NULL,NULL,NULL,'\\static\\images\\spot\\330381198901160130.jpg',NULL,'2019-03-25 18:08:37',1),(62,NULL,NULL,'330381198901160130',NULL,NULL,NULL,NULL,NULL,NULL,'\\static\\images\\spot\\330381198901160130.jpg',NULL,'2019-03-25 18:09:05',1),(63,NULL,NULL,'330381198901160130',NULL,'一号采集点',NULL,NULL,NULL,NULL,'\\static\\images\\spot\\330381198901160130.jpg',NULL,NULL,0);

/*Table structure for table `p_point` */

DROP TABLE IF EXISTS `p_point`;

CREATE TABLE `p_point` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) DEFAULT NULL,
  `point_name` varchar(50) DEFAULT NULL,
  `contacts` varchar(30) DEFAULT NULL,
  `contact_phone` varchar(15) DEFAULT NULL,
  `add_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_delete` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `p_point` */

insert  into `p_point`(`id`,`number`,`point_name`,`contacts`,`contact_phone`,`add_time`,`is_delete`) values (1,NULL,'一号才几点',NULL,NULL,'2019-03-25 20:55:27',1),(2,NULL,'二号采集点',NULL,NULL,'2019-03-25 22:25:39',1),(3,NULL,'二号采集点',NULL,NULL,'2019-03-25 22:30:21',1),(4,NULL,'二号采集点',NULL,NULL,'2019-03-25 22:32:06',0),(5,NULL,'三号采集点',NULL,NULL,'2019-03-25 22:32:15',0),(6,NULL,'一号采集点',NULL,NULL,'2019-03-25 22:48:45',0);

/*Table structure for table `p_sync_task` */

DROP TABLE IF EXISTS `p_sync_task`;

CREATE TABLE `p_sync_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collect_point_id` int(30) DEFAULT NULL,
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `edit_time` timestamp NULL DEFAULT NULL,
  `is_deal` int(11) DEFAULT NULL,
  `is_delete` int(2) DEFAULT '0',
  `deal_type` int(2) DEFAULT '1' COMMENT '1、新增同步信息 2、取消同步信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `p_sync_task` */

insert  into `p_sync_task`(`id`,`collect_point_id`,`add_time`,`edit_time`,`is_deal`,`is_delete`,`deal_type`) values (1,1,'2019-03-25 22:30:45','2019-03-25 22:30:45',0,1,1),(2,1,'2019-03-25 22:31:50','2019-03-25 22:31:50',0,1,1),(3,1,'2019-03-25 22:31:47','2019-03-25 22:31:47',0,1,2),(4,1,'2019-03-25 22:31:48','2019-03-25 22:31:48',0,1,1),(5,1,'2019-03-25 22:31:49','2019-03-25 22:31:49',0,1,1),(6,1,'2019-03-25 22:31:58','2019-03-25 22:31:58',0,1,1),(7,1,'2019-03-25 22:32:21',NULL,0,0,1),(8,4,'2019-03-25 22:48:53','2019-03-25 22:48:53',0,1,1),(9,5,'2019-03-25 22:48:55','2019-03-25 22:48:55',0,1,1),(10,1,'2019-03-25 22:32:24',NULL,0,0,2),(11,4,'2019-03-25 22:48:52','2019-03-25 22:48:52',0,1,2),(12,5,'2019-03-25 22:48:52','2019-03-25 22:48:52',0,1,2),(13,4,'2019-03-25 23:29:11','2019-03-25 23:29:11',0,1,1),(14,5,'2019-03-25 23:29:12','2019-03-25 23:29:12',0,1,1),(15,6,'2019-03-25 23:28:58','2019-03-25 23:28:58',0,1,1),(16,4,'2019-03-25 23:29:10','2019-03-25 23:29:10',0,1,2),(17,5,'2019-03-25 23:29:09','2019-03-25 23:29:09',0,1,2),(18,6,'2019-03-25 23:29:00','2019-03-25 23:29:00',0,1,2),(19,4,'2019-03-25 23:29:07','2019-03-25 23:29:07',0,1,1),(20,5,'2019-03-25 23:29:08','2019-03-25 23:29:08',0,1,1),(21,6,'2019-03-25 23:29:03','2019-03-25 23:29:03',0,1,1),(22,4,'2019-03-25 23:29:16','2019-03-25 23:29:16',0,1,1),(23,5,'2019-03-25 23:29:15','2019-03-25 23:29:15',0,1,1),(24,6,'2019-03-25 23:36:17','2019-03-25 23:36:17',1,0,1),(25,4,'2019-03-25 23:37:47',NULL,0,0,2),(26,5,'2019-03-25 23:37:47',NULL,0,0,2),(27,6,'2019-03-25 23:38:15','2019-03-25 23:38:15',1,0,2);

/*Table structure for table `p_test` */

DROP TABLE IF EXISTS `p_test`;

CREATE TABLE `p_test` (
  `id` int(11) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `p_test` */

insert  into `p_test`(`id`,`code`) values (1,'ss'),(2,'aa');

/*Table structure for table `sys_permission` */

DROP TABLE IF EXISTS `sys_permission`;

CREATE TABLE `sys_permission` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT '自定id,主要供前端展示权限列表分类排序使用.',
  `menu_code` varchar(255) DEFAULT '' COMMENT '归属菜单,前端判断并展示菜单使用,',
  `menu_name` varchar(255) DEFAULT '' COMMENT '菜单的中文释义',
  `permission_code` varchar(255) DEFAULT '' COMMENT '权限的代码/通配符,对应代码中@RequiresPermissions 的value',
  `permission_name` varchar(255) DEFAULT '' COMMENT '本权限的中文释义',
  `required_permission` tinyint(1) DEFAULT '2' COMMENT '是否本菜单必选权限, 1.必选 2非必选 通常是"列表"权限是必选',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='后台权限表';

/*Data for the table `sys_permission` */

insert  into `sys_permission`(`id`,`menu_code`,`menu_name`,`permission_code`,`permission_name`,`required_permission`) values (101,'article','文章管理','article:list','列表',1),(102,'article','文章管理','article:add','新增',2),(103,'article','文章管理','article:update','修改',2),(601,'user','用户','user:list','列表',1),(602,'user','用户','user:add','新增',2),(603,'user','用户','user:update','修改',2),(701,'role','角色权限','role:list','列表',1),(702,'role','角色权限','role:add','新增',2),(703,'role','角色权限','role:update','修改',2),(704,'role','角色权限','role:delete','删除',2),(901,'personmonitor','布控人员管理','personmonitor:list','列表',1),(902,'personmonitor','布控人员管理','personmonitor:add','新增',2),(903,'personmonitor','布控人员管理','personmonitor:update','修改',2),(904,'personmonitor','布控人员管理','personmonitor:delete','删除',2),(1001,'monitor','监控黑名单','monitorcheck:list','列表',1);

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) DEFAULT NULL COMMENT '角色名',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delete_status` varchar(1) DEFAULT '1' COMMENT '是否有效  1有效  2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='后台角色表';

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`role_name`,`create_time`,`update_time`,`delete_status`) values (1,'管理员','2017-11-22 16:24:34','2017-11-22 16:24:52','1'),(2,'作家','2017-11-22 16:24:34','2017-11-22 16:24:52','1'),(3,'程序员','2017-11-22 16:28:47','2017-11-22 16:28:47','1');

/*Table structure for table `sys_role_permission` */

DROP TABLE IF EXISTS `sys_role_permission`;

CREATE TABLE `sys_role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  `permission_id` int(11) DEFAULT NULL COMMENT '权限id',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delete_status` varchar(1) DEFAULT '1' COMMENT '是否有效 1有效     2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='角色-权限关联表';

/*Data for the table `sys_role_permission` */

insert  into `sys_role_permission`(`id`,`role_id`,`permission_id`,`create_time`,`update_time`,`delete_status`) values (1,2,101,'2017-11-22 16:26:21','2017-11-22 16:26:32','1'),(2,2,102,'2017-11-22 16:26:21','2017-11-22 16:26:32','1'),(5,2,602,'2017-11-22 16:28:28','2017-11-22 16:28:28','1'),(6,2,601,'2017-11-22 16:28:28','2017-11-22 16:28:28','1'),(7,2,603,'2017-11-22 16:28:28','2017-11-22 16:28:28','1'),(8,2,703,'2017-11-22 16:28:28','2017-11-22 16:28:28','1'),(9,2,701,'2017-11-22 16:28:28','2017-11-22 16:28:28','1'),(10,2,702,'2017-11-22 16:28:28','2017-11-22 16:28:28','1'),(11,2,704,'2017-11-22 16:28:31','2017-11-22 16:28:31','1'),(12,2,103,'2017-11-22 16:28:31','2017-11-22 16:28:31','1'),(13,3,601,'2017-11-22 16:28:47','2017-11-22 16:28:47','1'),(14,3,701,'2017-11-22 16:28:47','2017-11-22 16:28:47','1'),(15,3,702,'2017-11-22 16:35:01','2017-11-22 16:35:01','1'),(16,3,704,'2017-11-22 16:35:01','2017-11-22 16:35:01','1'),(17,3,102,'2017-11-22 16:35:01','2017-11-22 16:35:01','1'),(18,3,101,'2017-11-22 16:35:01','2017-11-22 16:35:01','1'),(19,3,603,'2017-11-22 16:35:01','2017-11-22 16:35:01','1'),(20,2,901,'2019-03-12 22:43:25','2019-03-12 22:46:55','1'),(21,2,902,'2019-03-12 22:43:28','2019-03-12 22:46:56','1'),(22,2,903,'2019-03-12 22:43:31','2019-03-12 22:46:57','1');

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称',
  `role_id` int(11) DEFAULT '0' COMMENT '角色ID',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `delete_status` varchar(1) DEFAULT '1' COMMENT '是否有效  1有效  2无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10008 DEFAULT CHARSET=utf8 COMMENT='运营后台用户表';

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`username`,`password`,`nickname`,`role_id`,`create_time`,`update_time`,`delete_status`) values (10003,'admin','123456','超级用户23',1,'2017-10-30 11:52:38','2017-11-17 23:51:40','1'),(10004,'user','123456','用户1',1,'2017-10-30 16:13:02','2019-03-14 07:25:52','1'),(10005,'aaa','123456','abba',1,'2017-11-15 14:02:56','2017-11-17 23:51:42','1'),(10007,'test','123456','就看看列表',3,'2017-11-22 16:29:41','2017-11-22 16:29:41','1');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
