-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: springdb
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
-- Table structure for table `p_address`
--

DROP TABLE IF EXISTS `p_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `p_address` (
  `address_no` int(11) NOT NULL,
  `member_no` int(11) NOT NULL,
  `goods_address` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `shipping` int(11) DEFAULT '0',
  PRIMARY KEY (`address_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `p_address`
--

LOCK TABLES `p_address` WRITE;
/*!40000 ALTER TABLE `p_address` DISABLE KEYS */;
INSERT INTO `p_address` VALUES (2,5,'https://m.cafe.naver.com/jobyjjava003',1000);
/*!40000 ALTER TABLE `p_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `p_goods`
--

DROP TABLE IF EXISTS `p_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `p_goods` (
  `address_no` int(11) NOT NULL,
  `goods_name` varchar(45) COLLATE utf8_bin NOT NULL,
  `goods_price` int(11) DEFAULT '0',
  PRIMARY KEY (`address_no`,`goods_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `p_goods`
--

LOCK TABLES `p_goods` WRITE;
/*!40000 ALTER TABLE `p_goods` DISABLE KEYS */;
INSERT INTO `p_goods` VALUES (2,'상품1',11),(2,'상품2',33);
/*!40000 ALTER TABLE `p_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `p_member`
--

DROP TABLE IF EXISTS `p_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `p_member` (
  `member_no` int(11) NOT NULL AUTO_INCREMENT,
  `email_id` varchar(50) COLLATE utf8_bin NOT NULL,
  `member_pw` varchar(45) COLLATE utf8_bin NOT NULL,
  `member_name` varchar(45) COLLATE utf8_bin NOT NULL,
  `joindate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`member_no`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `p_member`
--

LOCK TABLES `p_member` WRITE;
/*!40000 ALTER TABLE `p_member` DISABLE KEYS */;
INSERT INTO `p_member` VALUES (1,'asd','asd','name','2019-03-28 10:01:38'),(2,'spring1@gmail.com','12345','홍길동1','2019-03-22 11:28:40'),(3,'spring2@gmail.com','12345','홍길동2','2019-03-25 11:43:17'),(4,'spring4@gmail.com','1234','길동','2019-03-26 15:01:20'),(5,'spring@gmail.com','1234','홍길동','2019-03-22 11:11:46');
/*!40000 ALTER TABLE `p_member` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-29 16:23:22
