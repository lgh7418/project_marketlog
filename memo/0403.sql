-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: marketlog
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `address` (
  `address_no` int(11) NOT NULL AUTO_INCREMENT,
  `member_no` int(11) NOT NULL,
  `goods_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `shipping` int(11) DEFAULT '0',
  PRIMARY KEY (`address_no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (2,5,'https://m.cafe.naver.com/jobyjjava003',1000),(3,5,'https://m.mail.naver.com/',2500);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `goods` (
  `address_no` int(11) NOT NULL,
  `goods_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `goods_price` int(11) DEFAULT '0',
  PRIMARY KEY (`address_no`,`goods_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (2,'상품1',11),(2,'상품2',33),(3,'저렴한 상품',20000),(3,'좋은 상품',10000);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `member` (
  `member_no` int(11) NOT NULL AUTO_INCREMENT,
  `email_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `member_pw` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `member_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `joindate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`member_no`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'asd','asd','name','2019-03-28 10:01:38'),(2,'spring1@gmail.com','12345','홍길동1','2019-03-22 11:28:40'),(3,'spring2@gmail.com','12345','홍길동2','2019-03-25 11:43:17'),(4,'spring4@gmail.com','1234','길동','2019-03-26 15:01:20'),(5,'spring@gmail.com','1234','홍길동','2019-03-22 11:11:46');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_goods`
--

DROP TABLE IF EXISTS `order_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order_goods` (
  `order_no` int(11) NOT NULL,
  `goods_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `goods_price` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `memo` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_goods`
--

LOCK TABLES `order_goods` WRITE;
/*!40000 ALTER TABLE `order_goods` DISABLE KEYS */;
INSERT INTO `order_goods` VALUES (1,'저렴한 상품',20000,1,NULL),(11,'저렴한 상품',20000,1,NULL),(12,'저렴한 상품',20000,1,NULL),(12,'좋은 상품',10000,1,'메모');
/*!40000 ALTER TABLE `order_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_info`
--

DROP TABLE IF EXISTS `order_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order_info` (
  `order_no` int(11) NOT NULL AUTO_INCREMENT,
  `member_no` int(11) DEFAULT NULL,
  `address_no` int(11) DEFAULT NULL,
  `recipient` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `postcode` int(11) DEFAULT NULL,
  `address` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `detail_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `phone1` int(11) DEFAULT NULL,
  `phone2` int(11) DEFAULT NULL,
  `phone3` int(11) DEFAULT NULL,
  `memo` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `order_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `order_status` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`order_no`),
  KEY `member_no_idx` (`member_no`),
  KEY `address_no_idx` (`address_no`),
  CONSTRAINT `adress_no` FOREIGN KEY (`address_no`) REFERENCES `address` (`address_no`),
  CONSTRAINT `member_no` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_info`
--

LOCK TABLES `order_info` WRITE;
/*!40000 ALTER TABLE `order_info` DISABLE KEYS */;
INSERT INTO `order_info` VALUES (11,5,3,'홍림',46760,'부산 강서구 르노삼성대로 14 (신호동)','.',10,1234,1234,'경비실에 맡겨주세요.','2019-04-01 17:15:16',0),(12,5,3,'홍길동',42957,'대구 달성군 화원읍 류목정길 5','',10,1234,1234,'경비실에 맡겨주세요.','2019-04-02 09:51:02',0);
/*!40000 ALTER TABLE `order_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-03 16:31:04
