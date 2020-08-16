/*
SQLyog Ultimate v8.32 
MySQL - 5.5.27 : Database - ssm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ssm` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ssm`;

/*Table structure for table `attachment` */

DROP TABLE IF EXISTS `attachment`;

CREATE TABLE `attachment` (
  `attachmentId` int(11) NOT NULL AUTO_INCREMENT COMMENT '附件ID',
  `attachmentName` varchar(50) DEFAULT NULL COMMENT '名称',
  `attachmentPath` varchar(50) DEFAULT NULL COMMENT '路径',
  `attachmentTime` datetime DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`attachmentId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `attachment` */

insert  into `attachment`(`attachmentId`,`attachmentName`,`attachmentPath`,`attachmentTime`) values (1,'手动备份20171129142347.xls','logs/backup','2017-11-29 14:23:47'),(2,'手动备份20171129142641.xls','logs/backup','2017-11-29 14:26:41'),(3,'手动备份20171129142920.xls','logs/backup','2017-11-29 14:29:20');

/*Table structure for table `log` */

DROP TABLE IF EXISTS `log`;

CREATE TABLE `log` (
  `logId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志',
  `userName` varchar(30) DEFAULT NULL COMMENT '操作人',
  `createTime` datetime DEFAULT NULL COMMENT '时间',
  `content` text COMMENT '详细',
  `operation` varchar(300) DEFAULT NULL COMMENT '操作类型（增删改）',
  `ip` varchar(60) DEFAULT NULL COMMENT 'IP地址',
  `module` varchar(40) DEFAULT NULL COMMENT '所属模块',
  PRIMARY KEY (`logId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

/*Data for the table `log` */

insert  into `log`(`logId`,`userName`,`createTime`,`content`,`operation`,`ip`,`module`) values (1,'test','2017-11-29 14:31:04',NULL,'退出',NULL,NULL),(2,'test','2017-11-29 14:31:14',NULL,'登录','192.168.1.17',NULL),(3,'admin','2020-08-14 17:29:26',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(4,'admin','2020-08-14 17:32:50',NULL,'退出',NULL,NULL),(5,'admin','2020-08-14 17:32:54',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(6,'admin','2020-08-14 19:13:55',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(7,'admin','2020-08-14 19:50:44',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(8,'admin','2020-08-14 19:50:44',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(9,'admin','2020-08-14 19:55:11',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(10,'admin','2020-08-14 19:55:15','intercept the method: com.xiaoshu.controller.StudentContoller.userList\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'c.id\' in \'where clause\'\r\n### The error may exist in file [E:\\Workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\ssm\\WEB-INF\\classes\\mapper\\StudentMapper.xml]\r\n### The error may involve com.xiaoshu.dao.StudentMapper.findStudentVoAll-Inline\r\n### The error occurred while setting parameters\r\n### SQL: SELECT count(0) FROM student s, teacher t WHERE s.teacherid = c.id\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'c.id\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'c.id\' in \'where clause\'','拦截到异常','0:0:0:0:0:0:0:1','/ssm'),(11,'admin','2020-08-14 19:56:06','intercept the method: com.xiaoshu.controller.StudentContoller.userList\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'c.name\' in \'field list\'\r\n### The error may exist in file [E:\\Workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\ssm\\WEB-INF\\classes\\mapper\\StudentMapper.xml]\r\n### The error may involve com.xiaoshu.dao.StudentMapper.findStudentVoAll-Inline\r\n### The error occurred while setting parameters\r\n### SQL: SELECT s.*,c.name cname FROM student s,teacher t WHERE s.teacherid=t.id LIMIT 10\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'c.name\' in \'field list\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'c.name\' in \'field list\'','拦截到异常','0:0:0:0:0:0:0:1','/ssm'),(12,'admin','2020-08-14 20:08:13',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(13,'admin','2020-08-14 20:42:23',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(14,'admin','2020-08-14 20:56:05',NULL,'登录','0:0:0:0:0:0:0:1',NULL),(15,'admin','2020-08-14 20:56:05',NULL,'登录','0:0:0:0:0:0:0:1',NULL);

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `menuId` int(10) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menuName` varchar(50) DEFAULT NULL COMMENT '名称',
  `menuUrl` varchar(100) DEFAULT NULL COMMENT '方法',
  `parentId` int(11) DEFAULT NULL COMMENT '父ID',
  `menuDescription` varchar(200) DEFAULT NULL COMMENT '描述',
  `state` varchar(20) DEFAULT NULL COMMENT '状态/OPEN/CLOSED',
  `iconCls` varchar(50) DEFAULT NULL COMMENT '图标',
  `seq` int(11) DEFAULT NULL COMMENT '顺序排序',
  PRIMARY KEY (`menuId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `menu` */

insert  into `menu`(`menuId`,`menuName`,`menuUrl`,`parentId`,`menuDescription`,`state`,`iconCls`,`seq`) values (1,'SSM系统','',-1,'主菜单','isParent','fa fa-university',1),(2,'系统管理','',1,'','isParent','fa fa-desktop',1),(3,'修改密码','javascript:editPassword();//',1,'','close','fa fa-key',4),(4,'安全退出','logout.htm',1,'','close','fa fa-user-times',5),(5,'菜单管理','menu/menuIndex.htm',2,'','','fa fa-sliders',4),(6,'角色管理','role/roleIndex.htm',2,'','','fa fa-users',3),(7,'用户管理','user/userIndex.htm',2,'','','fa fa-user',2),(8,'日志管理','log/logIndex.htm',2,'','','fa fa-tags',4),(9,'学生管理','',1,'','isParent','',6),(10,'学生管理','student/studentIndex.htm',9,'',NULL,'',1);

/*Table structure for table `operation` */

DROP TABLE IF EXISTS `operation`;

CREATE TABLE `operation` (
  `operationId` int(11) NOT NULL AUTO_INCREMENT COMMENT '具体的方法',
  `operationName` varchar(100) DEFAULT NULL COMMENT '方法名',
  `menuId` int(11) DEFAULT NULL COMMENT '所属菜单',
  `menuName` varchar(50) NOT NULL,
  `operationCode` varchar(50) DEFAULT NULL,
  `iconCls` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`operationId`),
  KEY `menuId` (`menuId`),
  CONSTRAINT `operation_ibfk_1` FOREIGN KEY (`menuId`) REFERENCES `menu` (`menuId`)
) ENGINE=InnoDB AUTO_INCREMENT=10019 DEFAULT CHARSET=utf8 COMMENT='具体的页面按钮上的方法\r\n（此自增ID至少从10000开始）';

/*Data for the table `operation` */

insert  into `operation`(`operationId`,`operationName`,`menuId`,`menuName`,`operationCode`,`iconCls`) values (10000,'添加',5,'菜单管理','add',''),(10001,'修改',5,'菜单管理','edit',''),(10002,'删除',5,'菜单管理','del',''),(10003,'添加',7,'用户管理','btn_add','glyphicon glyphicon-plus'),(10004,'修改',7,'用户管理','btn_edit','glyphicon glyphicon-pencil'),(10005,'删除',7,'用户管理','btn_delete','glyphicon glyphicon-remove'),(10006,'添加',6,'角色管理','btn_add','glyphicon glyphicon-plus'),(10007,'修改',6,'角色管理','btn_edit','glyphicon glyphicon-pencil'),(10008,'删除',6,'角色管理','btn_delete','glyphicon glyphicon-remove'),(10009,'授权',6,'角色管理','btn_rightCtrl','glyphicon glyphicon-eye-open'),(10010,'下载后台日志（log4j）',8,'日志管理','btn_downloadLog4j','glyphicon glyphicon-download-alt'),(10011,'手动备份（业务操作）',8,'日志管理','btn_manualBackup','glyphicon glyphicon-inbox'),(10012,'删除',8,'日志管理','btn_delete','glyphicon glyphicon-remove'),(10013,'按钮管理',5,'菜单管理','btnCtrl',''),(10014,'备份日志记录',8,'日志管理','btn_downloadLogBus','glyphicon glyphicon-download'),(10015,'添加学生',10,'学生管理','btn_add',''),(10016,'修改学生',10,'学生管理','btn_upd',''),(10017,'添加老师',10,'学生管理','btn_addT',''),(10018,'Echarts报表',10,'学生管理','btn_bb','');

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `roleName` varchar(20) DEFAULT NULL COMMENT '角色名称',
  `menuIds` varchar(200) DEFAULT NULL COMMENT '菜单IDs',
  `operationIds` varchar(200) DEFAULT NULL COMMENT '按钮IDS',
  `roleDescription` varchar(200) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`roleId`,`roleName`,`menuIds`,`operationIds`,`roleDescription`) values (1,'超级管理员','1,2,3,4,5,6,7,8,9,10','10000,10001,10002,10013,10006,10007,10008,10009,10003,10004,10005,10010,10011,10012,10014,10015,10016,10017,10018','拥有全部权限的超级管理员角色'),(2,'测试员','1,2,3,4,6,7,8','10006,10007,10008,10009,10003,10004,10005,10010,10011,10012,10014','拥有系统所有业务功能的角色');

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacherid` int(11) DEFAULT NULL,
  `name` varchar(55) DEFAULT NULL,
  `age` varchar(55) DEFAULT NULL,
  `code` varchar(55) DEFAULT NULL,
  `grade` varchar(55) DEFAULT NULL,
  `entrytime` datetime DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `student` */

insert  into `student`(`id`,`teacherid`,`name`,`age`,`code`,`grade`,`entrytime`,`createtime`) values (1,2,'李雷','20','001','一年级','2019-04-28 19:17:31',NULL),(2,1,'小明','25','004','二年级','2019-04-23 18:50:43',NULL),(3,3,'张华','28','1020','三年级','2019-04-18 16:53:16',NULL);

/*Table structure for table `teacher` */

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) DEFAULT NULL,
  `age` varchar(55) DEFAULT NULL,
  `entrytime` datetime DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `teacher` */

insert  into `teacher`(`id`,`name`,`age`,`entrytime`,`createtime`) values (1,'马云',NULL,NULL,NULL),(2,'雷军',NULL,NULL,NULL),(3,'马化腾',NULL,NULL,NULL),(5,'方世玉',NULL,NULL,NULL);

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `tokenId` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL COMMENT '用户ID',
  `userAgent` varchar(50) DEFAULT NULL COMMENT '用户（md5）',
  `token` varchar(100) DEFAULT NULL COMMENT 'md5(username+md5(useragent))',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `expireTime` datetime DEFAULT NULL COMMENT '到期时间',
  PRIMARY KEY (`tokenId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户登录信息（用于自动登录）';

/*Data for the table `token` */

insert  into `token`(`tokenId`,`userId`,`userAgent`,`token`,`createTime`,`expireTime`) values (1,1,'0b239ed7c13c034f6b834897f0b54bba','66895df164cf660402ab453a53496cd6','2017-11-29 14:26:21','2017-12-13 14:26:21');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `userName` varchar(20) DEFAULT NULL COMMENT '用户名',
  `password` varchar(20) DEFAULT NULL COMMENT '密码',
  `userType` tinyint(4) DEFAULT NULL COMMENT '用户类型',
  `roleId` int(11) DEFAULT NULL COMMENT '角色ID',
  `userDescription` varchar(200) DEFAULT NULL COMMENT '描述信息',
  PRIMARY KEY (`userId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`userId`,`userName`,`password`,`userType`,`roleId`,`userDescription`) values (1,'admin','admin',NULL,1,'超级管理员，供开发方使用'),(2,'test','test',NULL,2,'测试员，供测试方使用');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
