/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.6.27-log : Database - ssmbuild
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ssmbuild` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ssmbuild`;

/*Table structure for table `books` */

DROP TABLE IF EXISTS `books`;

CREATE TABLE `books` (
  `bookID` int(10) NOT NULL AUTO_INCREMENT COMMENT '书id',
  `bookName` varchar(100) NOT NULL COMMENT '书名',
  `bookCounts` int(11) NOT NULL COMMENT '数量',
  `detail` varchar(200) NOT NULL COMMENT '描述',
  KEY `bookID` (`bookID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `books` */

insert  into `books`(`bookID`,`bookName`,`bookCounts`,`detail`) values (2,'MySQL',10,'从删库到跑路'),(3,'Linux',5,'从进门到进牢'),(4,'xd',1,'2');

/*Table structure for table `image` */

DROP TABLE IF EXISTS `image`;

CREATE TABLE `image` (
  `imageId` int(10) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `imageAddress` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`imageId`),
  KEY `id1` (`id`),
  CONSTRAINT `id1` FOREIGN KEY (`id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `image` */

insert  into `image`(`imageId`,`id`,`imageAddress`) values (1,1,'http://localhost:8080/information/static/image/图片231.png'),(2,2,'http://localhost:8080/information/static/image/logo.png'),(14,4,'http://localhost:8080/information/static/image/4.jpeg'),(15,5,'http://localhost:8080/information/static/image/5.jpeg'),(16,6,'http://localhost:8080/information/static/image/6.jpeg'),(17,7,'http://localhost:8080/information/static/image/7.jpeg'),(18,8,'http://localhost:8080/information/static/image/8.jpeg'),(19,9,'http://localhost:8080/information/static/image/9.jpeg'),(20,10,'http://localhost:8080/information/static/image/10.jpeg'),(21,11,'http://localhost:8080/information/static/image/11.jpeg'),(22,12,'http://localhost:8080/information/static/image/12.jpeg'),(23,13,'http://localhost:8080/information/static/image/13.jpeg'),(24,16,'http://localhost:8080/information/static/image/avatar.jpg'),(25,17,'http://localhost:8080/information/static/image/ren.jpeg'),(26,3,'http://localhost:8080/information/static/image/bird.jpeg');

/*Table structure for table `information` */

DROP TABLE IF EXISTS `information`;

CREATE TABLE `information` (
  `informationId` int(20) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `signature` varchar(500) DEFAULT NULL,
  `eMail` varchar(500) DEFAULT NULL,
  `qq` varchar(500) DEFAULT NULL,
  `phone` varchar(500) DEFAULT NULL,
  `wechat` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`informationId`),
  KEY `informationId` (`id`),
  CONSTRAINT `informationId` FOREIGN KEY (`id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `information` */

insert  into `information`(`informationId`,`id`,`signature`,`eMail`,`qq`,`phone`,`wechat`) values (1,1,'明德自强，求是力行','1822649761@qq.com','1822649761','15236447077','15236447077'),(3,16,'洋洋喜欢金色雨','18895632589@qq.com','18895632589','18895632589','18895632589'),(4,5,'小明0','小明0','小明0','小明0','小明0'),(5,17,'9999999999','99999','9999999999','152987','9999999999'),(6,18,'我的人生呀！','1822649761@qq.com','1822649761','15236447007','1822649761');

/*Table structure for table `privateletter` */

DROP TABLE IF EXISTS `privateletter`;

CREATE TABLE `privateletter` (
  `privateLetterId` int(10) NOT NULL AUTO_INCREMENT,
  `sendId` int(11) NOT NULL,
  `receiveId` int(11) DEFAULT NULL,
  `content` text,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isReceive` int(10) DEFAULT NULL,
  PRIMARY KEY (`privateLetterId`),
  KEY `receiveId` (`receiveId`),
  KEY `sendId` (`sendId`),
  CONSTRAINT `receiveId` FOREIGN KEY (`receiveId`) REFERENCES `users` (`id`),
  CONSTRAINT `sendId` FOREIGN KEY (`sendId`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

/*Data for the table `privateletter` */

insert  into `privateletter`(`privateLetterId`,`sendId`,`receiveId`,`content`,`time`,`isReceive`) values (1,1,2,'我爱你','2021-04-15 19:12:01',0),(3,1,2,'i love you forever','2021-04-26 19:21:03',0),(4,2,1,'111111','2021-04-14 22:55:49',0),(8,1,2,'我是你爹','2021-04-26 23:56:31',0),(10,1,2,'我是你爹','2021-04-26 23:58:54',0),(11,1,2,'爸爸爱你','2021-04-26 23:59:39',0),(12,2,1,'    滚','2021-04-27 00:00:26',0),(13,1,2,'    爸爸爱你','2021-04-27 00:06:59',0),(14,2,1,'    我想杀你 滚吧 傻逼','2021-04-27 00:07:34',0),(15,1,2,'    爸爸爱你','2021-04-27 00:08:39',0),(16,1,2,'    爸爸爱你','2021-04-27 00:09:12',0),(17,1,2,'    爸爸爱你','2021-04-27 00:09:19',0),(18,1,2,'    爸爸爱你','2021-04-27 00:09:21',0),(19,1,2,'    爸爸爱你','2021-04-27 00:09:22',0),(20,1,2,'    爸爸爱你','2021-04-27 00:11:50',0),(21,1,2,'   我想杀人','2021-04-27 00:12:01',0),(22,1,2,'   我想杀人','2021-04-27 00:12:19',0),(23,1,2,'    好呀','2021-04-27 00:18:53',0),(24,1,2,'    好呀','2021-04-27 00:20:16',0),(25,1,2,'   滚吧','2021-04-27 00:20:24',0),(26,1,2,'  尼玛死了呢','2021-04-27 00:20:57',0),(27,1,2,' 终归人','2021-04-27 00:23:23',0),(28,1,2,'我是你爸爸','2021-04-27 00:23:30',0),(29,1,2,'任何在世界上，你不该在世界上\n','2021-04-27 00:23:50',0),(30,1,2,'你知道吗，你的一生很垃圾的','2021-04-27 00:24:07',0),(31,2,1,'    我知道你的过去\n','2021-04-27 00:24:39',0),(32,2,1,'    当时你的未来，我很难受！\n','2021-04-27 00:24:52',0),(33,2,1,'没有一个人 和你一起吗','2021-04-27 00:25:05',0),(34,2,1,'孤独吧！哈哈哈','2021-04-27 00:25:13',0),(35,1,2,'你真的很机车呢！','2021-04-27 00:29:31',0),(36,1,2,'是呢','2021-04-27 00:29:42',0),(37,1,2,'？','2021-04-27 00:32:17',0),(38,1,2,'？','2021-04-27 00:32:30',0),(39,1,2,'？','2021-04-27 00:34:11',0),(40,1,2,' 你真的太垃圾了','2021-04-27 00:34:19',0),(41,2,1,'孤独吧！哈哈哈','2021-04-27 00:34:22',0),(42,1,2,' 嗯','2021-04-27 00:34:29',0),(43,2,1,'滚吧','2021-04-27 00:34:40',0),(44,1,2,' ？','2021-04-27 00:34:45',0),(45,2,1,' ?','2021-04-27 00:52:50',0),(46,3,1,'111','2021-04-27 01:12:11',0),(47,1,2,NULL,'2021-04-27 14:41:39',0),(48,1,2,'  寒月找铁艺','2021-04-27 14:42:21',0),(49,1,2,' ？','2021-04-27 14:42:27',0),(50,1,3,'    你真好看','2021-04-27 17:55:41',0),(51,1,2,'  你在干啥？\n\n','2021-04-27 18:38:27',0),(52,1,2,' ？','2021-04-27 18:38:32',0),(53,16,1,'    ?\n','2021-04-27 22:16:37',0),(54,16,1,'    你不要伤心，一切还好！','2021-04-27 22:16:48',0),(55,16,1,'    世界是美好的！','2021-04-27 22:17:11',0),(56,16,4,'    你好\n','2021-04-27 22:23:56',0),(57,16,4,'    你不呀难过!\n','2021-04-27 22:24:34',0),(58,16,1,'    世界并不完美,但我么可以治愈自己','2021-04-27 22:25:04',0),(59,1,16,'    好的！','2021-04-27 22:25:47',0),(60,16,1,'    嗯，加油！','2021-04-27 22:30:30',0),(61,16,1,'    en ','2021-04-30 19:14:16',0),(62,16,1,'    你好！\n','2021-04-30 19:29:08',0),(63,1,2,'    你好！','2021-04-30 19:45:57',0),(64,1,3,'    你好！','2021-04-30 19:48:47',0),(65,1,16,'    嗯 加油！','2021-04-30 20:05:22',0),(66,1,16,'    一起加油！','2021-04-30 20:06:33',0),(67,3,1,'  1111','2021-05-07 14:56:20',0),(68,1,3,'    你好呀？请问图书馆今天开馆了吗？','2021-05-10 15:47:02',0),(69,1,2,'    你好','2021-05-23 18:05:28',0),(70,1,16,'    你好 心理委员','2021-05-23 18:05:45',0),(71,1,16,'    你好','2021-05-23 18:15:04',0),(72,1,3,'    你好 管理员','2021-05-23 18:16:40',0),(73,1,16,'    心理委员','2021-05-23 18:16:54',0),(74,16,1,'    你好','2021-05-23 18:18:05',0),(75,1,16,'    你好 心理委员 ！','2021-05-23 18:24:42',0),(76,16,1,'    你好','2021-05-23 18:25:48',0),(77,1,16,'    你好\n','2021-05-24 09:32:32',0),(78,1,16,'    你好！','2021-05-24 09:33:57',0),(79,1,2,'    ？\n','2021-12-20 21:54:23',0),(80,16,1,'    1','2024-04-18 18:52:28',0),(81,16,1,'    2','2024-04-18 18:52:31',0),(82,16,1,'    3','2024-04-18 18:52:33',0),(83,16,1,'    4','2024-04-18 18:52:34',0),(84,16,1,'    ?\n','2024-04-18 18:55:50',0),(85,1,16,'    2','2024-04-18 18:57:58',0);

/*Table structure for table `punishment` */

DROP TABLE IF EXISTS `punishment`;

CREATE TABLE `punishment` (
  `punishmentId` int(10) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `punishmentUser` int(11) DEFAULT NULL,
  `punishmentContent` text,
  `punishmentType` int(10) DEFAULT NULL,
  `punishmentBegin` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `punishmentOver` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `punishmentTime` text,
  `outdated` int(10) DEFAULT NULL,
  PRIMARY KEY (`punishmentId`),
  KEY `PF01` (`id`),
  KEY `PF02` (`punishmentUser`),
  CONSTRAINT `PF01` FOREIGN KEY (`id`) REFERENCES `users` (`id`),
  CONSTRAINT `PF02` FOREIGN KEY (`punishmentUser`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `punishment` */

insert  into `punishment`(`punishmentId`,`id`,`punishmentUser`,`punishmentContent`,`punishmentType`,`punishmentBegin`,`punishmentOver`,`punishmentTime`,`outdated`) values (11,1,3,'禁止登录1天',3,'2021-05-08 16:53:29','2021-05-09 16:34:24','1',1),(13,1,3,'禁止发帖1天',1,'2021-05-23 18:26:26','2021-05-24 18:26:26','1',0);

/*Table structure for table `replys` */

DROP TABLE IF EXISTS `replys`;

CREATE TABLE `replys` (
  `replyId` int(5) NOT NULL AUTO_INCREMENT,
  `topicId` int(20) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `replyContexts` text,
  PRIMARY KEY (`replyId`),
  KEY `rid` (`id`),
  KEY `rtopicId` (`topicId`),
  CONSTRAINT `rid` FOREIGN KEY (`id`) REFERENCES `users` (`id`),
  CONSTRAINT `rtopicId` FOREIGN KEY (`topicId`) REFERENCES `topics` (`topicId`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

/*Data for the table `replys` */

insert  into `replys`(`replyId`,`topicId`,`id`,`replyContexts`) values (1,1,1,'我草你妈？'),(2,1,2,'你妈死了吧 草'),(3,1,2,'笑死我了'),(4,1,1,'农大就一般吧'),(5,1,1,'请输入'),(6,1,1,'请输入我的人生'),(7,6,1,'农大还是不错'),(8,6,1,'嗯嗯嗯嫩'),(9,5,1,'天天向上'),(10,5,1,'嗯 加油'),(11,5,5,'小明爱学习'),(12,5,5,'学习，是指通过阅读、听讲、思考、研究、实践等途径获得知识和技能的过程。学习分为狭义与广义两种：\r\n狭义：通过阅读、听讲、研究、观察、理解、探索、实验、实践等手段获得知识或技能的过程，是一种使个体可以得到持续变化（知识和技能，方法与过程，情感与价值的改善和升华）的行为方式。例如通过学校教育获得知识的过程。\r\n广义：是人在生活过程中，通过获得经验而产生的行为或行为潜能的相对持久为方式。次广义学习指人类的学习。'),(13,5,6,'学习是通过阅读、听讲、观察、研究、实践等途径而获得知识、技能或认知的过程。'),(14,7,6,'水尼玛呢'),(15,5,9,'小鸟学飞。《礼记·月令》：“鹰乃学习。” 陈澔集说：“学习，雏学数飞也。”'),(16,77,1,'我看见了，还在食堂保卫处。'),(17,77,10,'你自问自答吗？'),(18,79,4,'JSP2.0中的一个主要功能是JSP fragment，它的基本特点是可以使处理JSP的容器推迟评估JSP标记属性。我们知道一般JSP是首先评估JSP标记的属性，然后在处理JSP标记时使用这些属性，而JSP fragment提供了动态的属性。也就是说，这些属性在JSP处理其标记体时是可以被改变的。JSP需要将这样的属性定义为 javax.servlet.jsp.tagext.JspFragment类型。当JSP标记设置成这种形式时，这种标记属性实际上的处理方法类似于标记体。在实现标记的程序中，标记属性可以被反复评估多次。这种用法称为JSP fragment。JSP fragment还可以定义在一个SimpleTag处理程序中使用的自制标记动作。像前面例子说明的，getJspBody返回一个 JspFragment对象并可以在doTag方法中多次使用。需要注意的是，使用JSP fragment的JSP只能有一般的文本和JSP action，不能有scriptlet和scriptlet表达式'),(19,79,4,'静态数据在输入文件中的内容和输出给HTTP响应的内容完全一致。此时，该JSP输入文件会是一个没有内嵌JAVA或动作的HTML页面。而且，客户端每次请求都会得到相同的响应内容。\r\nJSP指令\r\nJSP指令控制JSP编译器如何去生成servlet，以下是可用的指令：\r\n包含指令include –包含指令通知JSP编译器把另外一个文件完全包含入当前文件中。效果就好像被包含文件的内容直接被粘贴到当前文件中一样。这个功能和C预处理器所提供的很类似。被包含文件的扩展名一般都是\"jspf\"（即JSPFragment，JSP碎片）:'),(20,80,4,'太难了'),(21,5,5,'你好呀'),(22,5,1,'学个癖习'),(23,6,5,'11111111111111111'),(24,82,5,'1.2、SpringMVC     \r\n        Spring MVC属于SpringFrameWork的后续产品，已经融合在Spring Web Flow里面。Spring MVC 分离了控制器、模型对象、分派器以及处理程序对象的角色，这种分离让它们更容易进行定制'),(25,82,5,'       MyBatis 本是apache的一个开源项目iBatis, 2010年这个项目由apache software foundation 迁移到了google code，并且改名为MyBatis 。MyBatis是一个基于Java的持久层框架。iBATIS提供的持久层框架包括SQL Maps和Data Access Objects（DAO）MyBatis 消除了几乎所有的JDBC代码和参数的手工设置以及结果集的检索。MyBatis 使用简单的 XML或注解用于配置和原始映射，将接口和 Java 的POJOs（Plain Old Java Objects，普通的 Java对象）映射成数据库中的记录。\r\n\r\n '),(26,83,16,'请输入'),(27,83,16,'要加油加'),(28,2,1,'你好'),(29,5,5,'抑郁'),(30,2,16,'橘猫就是橘色的猫'),(31,2,10,'羡慕有猫的人'),(32,1,16,'？？？？？'),(33,1,16,'河南农业大学');

/*Table structure for table `topics` */

DROP TABLE IF EXISTS `topics`;

CREATE TABLE `topics` (
  `topicId` int(20) NOT NULL AUTO_INCREMENT,
  `topicSectonId` int(5) DEFAULT '0',
  `id` int(11) DEFAULT NULL,
  `topicReplyCount` int(20) DEFAULT NULL,
  `topicImage` int(20) DEFAULT NULL,
  `topicTitle` varchar(500) DEFAULT NULL,
  `topicContexts` text,
  `topicTime` int(11) DEFAULT NULL,
  `topicLastClickTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`topicId`),
  KEY `id` (`id`),
  CONSTRAINT `id` FOREIGN KEY (`id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

/*Data for the table `topics` */

insert  into `topics`(`topicId`,`topicSectonId`,`id`,`topicReplyCount`,`topicImage`,`topicTitle`,`topicContexts`,`topicTime`,`topicLastClickTime`) values (1,1,1,55,0,'我的学校最美丽','百年学校真的美',22,'2021-05-23 17:33:08'),(2,1,1,48,1,'橘猫','小虎有什么坏心思呢？',22,'2021-05-23 17:36:50'),(5,0,2,33,1,'好好学习','真的难？',222,'2021-05-23 17:37:35'),(6,0,1,7,0,'毕业季，你想说啥','<p>我想说农大再见！<br/></p>',0,'2021-04-15 19:19:53'),(7,1,1,1,1,'周末钓鱼吗','我太喜欢钓鱼了，我上辈子估计就是鱼！\r\n',0,'2021-05-23 17:36:40'),(77,1,1,0,0,'我的电脑丢了','<p>我在河南农业大学食堂丢了一个电脑。<br/></p>',0,'2021-04-18 16:39:37'),(78,3,4,0,0,'兰亭园','<p><img src=\"http://img.baidu.com/hi/jx2/j_0001.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0001.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0002.gif\"/></p><p>奖金一万元</p><p><br/></p>',0,'2021-05-23 17:36:25'),(79,4,4,5,0,'jsp技术','<p><span style=\"color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 28px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">JSP 2.0中加入了新的创建自制标记的</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/API/10154\" style=\"color: rgb(19, 110, 194); text-decoration: none; font-family: arial, 宋体, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 28px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">API</a><span style=\"color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 28px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">，javax.servlet.jsp.tagext.SimpleTag定义了用来实现简单标记的接口。和 JSP 1.2中的已有接口不同的是，SimpleTag接口不使用doStartTag和doEndTag方法，而提供了一个简单的doTag方法。这个方法在调用该标记时只被使用一次。而需要在一个自制标记中实现的所有逻辑过程、循环和对标记体的评估等都在这个方法中实现。从这个方面来讲， SimpleTag和IterationTag可以达到同等的作用。但SimpleTag的方法和处理周期要简单得多。在SimpleTag中还有用来设置JSP内容的setJspBody和getJspBody方法。Web容器会使用setJspBody方法定义一个代表JSP内容的 JspFragment对象。实现SimpleTag标记的程序可以在doTag方法中根据需要多次调用getJspBody.invoke方法以处理JSP内容。</span><br/></p>',0,'2021-04-18 17:03:15'),(80,2,4,12,0,'高数太难了QAQ','<p>干啥都不会，高数也不会<img src=\"http://img.baidu.com/hi/jx2/j_0025.gif\"/></p>',0,'2021-04-18 17:05:26'),(81,2,5,1,0,'好累','<p>学习太难了<br/></p>',0,'2021-04-19 15:35:25'),(82,2,5,5,0,'ssm技术','<p><span style=\"color: rgb(0, 0, 0); font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">&nbsp;&nbsp; Spring是一个开源框架，Spring是于2003&nbsp;年兴起的一个轻量级的Java&nbsp;开发框架，由Rod&nbsp;Johnson&nbsp;在其著作Expert&nbsp;One-On-One&nbsp;J2EE&nbsp;Development&nbsp;and&nbsp;Design中阐述的部分理念和原型衍生而来。它是为了解决企业应用开发的复杂性而创建的。Spring使用基本的JavaBean来完成以前只可能由EJB完成的事情。然而，Spring的用途不仅限于服务器端的开发。从简单性、可测试性和松耦合的角度而言，任何Java应用都可以从Spring中受益。&nbsp;简单来说，Spring是一个轻量级的控制反转（IoC）和面向切面（AOP）的容器框架。</span></p>',0,'2021-04-19 22:26:49'),(83,0,1,8,0,'这几天生病有些难受！','<p>感觉挺孤独的！<br/></p>',0,'2021-05-23 17:32:38'),(84,0,5,2,0,'心理问题','<p>我感觉有些难受<br/></p>',0,'2021-05-10 17:34:52'),(85,3,10,1,0,'毕业答辩','<p>今天答辩很开心！<br/></p>',0,'2021-05-23 17:52:09'),(86,0,10,1,0,'今天天气不错','<p>适合出去<br/></p>',0,'2021-05-23 17:56:05'),(87,0,10,1,0,'大学真好','<p>大学过的不错<br/></p>',0,'2021-05-23 17:58:57'),(88,0,10,0,0,'天气','<p>天气不错<br/></p>',0,'2021-05-23 18:02:59'),(89,0,1,1,0,'1111111','<p>eeeeeeee<br/></p>',0,'2021-05-23 18:04:57'),(90,0,1,2,0,'QQ群','<p>111111111111111111<br/></p>',0,'2021-05-23 18:14:10'),(91,0,1,1,0,'太阳','<p>太阳原理<br/></p>',0,'2021-05-23 18:16:15'),(92,0,1,0,0,'cat','<p>cat <br/></p>',0,'2021-05-23 18:21:46'),(93,0,1,0,0,'doggggg','<p>cat<br/></p>',0,'2021-05-23 18:24:13');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studentNumber` varchar(10) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `type` int(1) NOT NULL DEFAULT '0',
  `userName` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`studentNumber`,`password`,`type`,`userName`) values (1,'1710113085','1',0,'panda'),(2,'171011302','1',1,'tom'),(3,'171011303','1',2,'ben'),(4,'1710112000','1',0,'xiaohong'),(5,'1710112011','1',0,'xiaoming1'),(6,'1710112022','1',0,'xiaoming2'),(7,'1710112033','1',0,'xiaoming3'),(8,'1710112044','1',0,'xiaoming4'),(9,'1710112055','1',0,'xiaoming5'),(10,'1710112066','1',0,'xd'),(11,'1710112077','1',0,'xiaoming7'),(12,'1710112088','1',0,'xiaoming8'),(13,'1710112099','1',0,'xiaoming9'),(14,'1710115099','1',0,'111'),(15,'1710115099','1',0,'liming'),(16,'1710118888','1',1,'yang1'),(17,'9999999999','1',0,'xiaozhang'),(18,'1910113085','1',0,'jackMA'),(19,NULL,'1',1,'0'),(20,NULL,'1',1,'0'),(100,'1710113044','1',0,'jerry');

/*Table structure for table `word` */

DROP TABLE IF EXISTS `word`;

CREATE TABLE `word` (
  `wordId` int(10) NOT NULL AUTO_INCREMENT,
  `rank` int(10) DEFAULT '1',
  `wordContent` varchar(100) DEFAULT NULL,
  `count` int(10) DEFAULT '0',
  PRIMARY KEY (`wordId`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

/*Data for the table `word` */

insert  into `word`(`wordId`,`rank`,`wordContent`,`count`) values (4,1,'痛苦',0),(28,1,'抑郁',0),(31,3,'精神问题',0),(32,1,'心理问题',0),(33,1,'心理出现问题',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
