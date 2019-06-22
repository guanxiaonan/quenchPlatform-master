-- MySQL dump 10.13  Distrib 5.7.18, for Win64 (x86_64)
--
-- Host: localhost    Database: manage_platform
-- ------------------------------------------------------
-- Server version	5.7.18-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `core_account`
--

DROP TABLE IF EXISTS `core_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_account` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(32) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `salt` varchar(6) NOT NULL COMMENT '随机数',
  `type` tinyint(4) unsigned NOT NULL COMMENT '账户类型(1:个人/高校教师,2:企业,3:政府工作人员)',
  `status` tinyint(4) unsigned NOT NULL COMMENT '状态，0停用，1可用',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='账户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_account`
--

LOCK TABLES `core_account` WRITE;
/*!40000 ALTER TABLE `core_account` DISABLE KEYS */;
INSERT INTO `core_account` VALUES (1,'admin','7f6f0f472a6022fe651dd51e6b22019d','ys5yg',1,1,'2019-06-14 07:56:22','2019-06-14 07:56:22'),(2,'11','3d28f42bae07898c7ed87953852dda81','egr8l',1,1,'2019-06-19 02:05:28','2019-06-19 02:05:28'),(3,'33','170060368a7b75bafe6c62c57ea05e20','cvqhs',1,1,'2019-06-21 05:28:18','2019-06-21 05:28:18');
/*!40000 ALTER TABLE `core_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_individual_achievements`
--

DROP TABLE IF EXISTS `core_individual_achievements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_individual_achievements` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `accountID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci COMMENT='个人科研成果表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_individual_achievements`
--

LOCK TABLES `core_individual_achievements` WRITE;
/*!40000 ALTER TABLE `core_individual_achievements` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_individual_achievements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_individual_info`
--

DROP TABLE IF EXISTS `core_individual_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_individual_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `accountID` int(11) unsigned NOT NULL COMMENT '账户ID',
  `realName` varchar(64) DEFAULT NULL COMMENT '真实姓名',
  `gender` tinyint(4) unsigned DEFAULT NULL COMMENT '性别(1:男2:女)',
  `face` varchar(1024) DEFAULT NULL COMMENT '头像路径',
  `politicalStatus` tinyint(4) unsigned DEFAULT NULL COMMENT '政治面貌(1:中共党员,2:中共预备党员,3:共青团员,4:民盟,5:群众)',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `phone` varchar(11) NOT NULL COMMENT '工作单位电话',
  `cellphone` varchar(11) NOT NULL COMMENT '手机号码',
  `email` varchar(256) DEFAULT NULL COMMENT '邮箱',
  `education` tinyint(4) unsigned NOT NULL COMMENT '最高学历（1：初中，2：高中，3中专，4大专，5本科，6硕士，7博士）',
  `degree` tinyint(4) unsigned NOT NULL COMMENT '最高学位（1：初中，2：高中，3中专，4大专，5本科，6硕士，7博士）',
  `university` varchar(128) NOT NULL COMMENT '毕业学校',
  `major` varchar(128) NOT NULL COMMENT '所学专业',
  `graduationTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '毕业时间',
  `title` tinyint(4) unsigned NOT NULL COMMENT '最高职称（1:员级,2:助理级,3:中级职称,4:副高级职称,5:高级职称）',
  `areaID` int(11) unsigned DEFAULT NULL COMMENT '工作单位区域ID',
  `workPlaceID` varchar(128) NOT NULL COMMENT '工作单位详细地址',
  `workTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '参加工作时间',
  `addressID` int(11) unsigned DEFAULT NULL COMMENT '家庭住址区域ID',
  `address` varchar(256) DEFAULT NULL COMMENT '家庭详细住址',
  `introduce` varchar(512) DEFAULT NULL COMMENT '个人简介',
  `researchDirections` varchar(256) DEFAULT NULL COMMENT '主要研究方向',
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `fk_individual_info_account_id` (`accountID`),
  CONSTRAINT `fk_individual_info_account_id` FOREIGN KEY (`accountID`) REFERENCES `core_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='个人信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_individual_info`
--

LOCK TABLES `core_individual_info` WRITE;
/*!40000 ALTER TABLE `core_individual_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_individual_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuihuo`
--

DROP TABLE IF EXISTS `cuihuo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuihuo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL COMMENT '淬火炉记录时间',
  `temperature` varchar(45) COLLATE utf8_danish_ci DEFAULT NULL COMMENT '淬火炉温度',
  `humidity` varchar(45) COLLATE utf8_danish_ci DEFAULT NULL COMMENT '淬火炉湿度',
  `pressure` varchar(45) COLLATE utf8_danish_ci DEFAULT NULL COMMENT '淬火炉压强',
  `jiezhi` varchar(45) COLLATE utf8_danish_ci DEFAULT NULL COMMENT '淬火介质',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci COMMENT='淬火炉数据记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuihuo`
--

LOCK TABLES `cuihuo` WRITE;
/*!40000 ALTER TABLE `cuihuo` DISABLE KEYS */;
INSERT INTO `cuihuo` VALUES (1,'2019-06-22 19:43:00','789','90','778','有机水溶液');
/*!40000 ALTER TABLE `cuihuo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `huihuo`
--

DROP TABLE IF EXISTS `huihuo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `huihuo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL COMMENT '数据输入时间',
  `temperature` varchar(45) COLLATE utf8_danish_ci DEFAULT NULL COMMENT '温度',
  `humidity` varchar(45) COLLATE utf8_danish_ci DEFAULT NULL COMMENT '湿度',
  `pressure` varchar(45) COLLATE utf8_danish_ci DEFAULT NULL COMMENT '压强',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci COMMENT='回火炉数据输入';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `huihuo`
--

LOCK TABLES `huihuo` WRITE;
/*!40000 ALTER TABLE `huihuo` DISABLE KEYS */;
/*!40000 ALTER TABLE `huihuo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jiare`
--

DROP TABLE IF EXISTS `jiare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jiare` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `time` datetime DEFAULT NULL COMMENT '输入数据的时间',
  `temperature` varchar(45) COLLATE utf8_danish_ci DEFAULT NULL COMMENT '温度',
  `humidity` varchar(45) COLLATE utf8_danish_ci DEFAULT NULL COMMENT '湿度',
  `pressure` varchar(45) COLLATE utf8_danish_ci DEFAULT NULL COMMENT '压强',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci COMMENT='加热炉数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jiare`
--

LOCK TABLES `jiare` WRITE;
/*!40000 ALTER TABLE `jiare` DISABLE KEYS */;
INSERT INTO `jiare` VALUES (1,'2019-06-19 18:04:00','456','78','998'),(2,'2019-06-19 18:04:00','456','78','998'),(3,'2019-06-19 18:07:00','567','88','778'),(4,'2019-06-21 13:28:00','765','90','766'),(5,'2019-06-21 13:28:00','765','90','766'),(6,'2019-06-21 13:28:00','765','90','766'),(7,'2019-06-21 13:28:00','765','90','766'),(8,'2019-06-21 13:28:00','765','90','766'),(9,'2019-06-21 13:28:00','765','90','766'),(10,'2019-06-22 18:35:00','789','87','767');
/*!40000 ALTER TABLE `jiare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lengque`
--

DROP TABLE IF EXISTS `lengque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lengque` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL COMMENT '输入时间',
  `temperature` varchar(45) COLLATE utf8_danish_ci DEFAULT NULL COMMENT '温度',
  `humidity` varchar(45) COLLATE utf8_danish_ci DEFAULT NULL COMMENT '湿度',
  `pressure` varchar(45) COLLATE utf8_danish_ci DEFAULT NULL COMMENT '压强',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci COMMENT='冷却炉数据输入';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lengque`
--

LOCK TABLES `lengque` WRITE;
/*!40000 ALTER TABLE `lengque` DISABLE KEYS */;
INSERT INTO `lengque` VALUES (1,'2019-06-22 18:32:00','45','89','123'),(2,'2019-06-22 18:32:00','45','89','123'),(3,'2019-06-22 15:56:00','677','87','877');
/*!40000 ALTER TABLE `lengque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'manage_platform'
--

--
-- Dumping routines for database 'manage_platform'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-22 19:46:59
