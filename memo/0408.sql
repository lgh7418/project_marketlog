-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: marketlog
-- ------------------------------------------------------
-- Server version	8.0.15

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (3,5,'https://m.mail.naver.com/',2500),(6,5,'https://m.blog.naver.com/s486s012',3000),(8,5,'https://m.blog.naver.com/hjookkk',0),(10,5,'https://m.cafe.naver.com/jobyjjava003',1000),(11,6,'https://m.blog.naver.com/s486s012/221464384000',3000);
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
  `goods_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`address_no`,`goods_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (0,'맛있는 빵',5000,NULL),(0,'치유의 빵',7000,NULL),(0,'크림치즈빵',3000,NULL),(3,'유용한 상품',30000,3),(3,'저렴한 상품',20000,1),(3,'좋은 상품',10000,2),(6,'3가지 허브 시골빵',6000,NULL),(6,'김밝은 농부의 서리태 통밀빵',5000,NULL),(6,'단팥 쑥 시골빵 ',6000,NULL),(6,'두부 브라우니',3000,NULL),(6,'미숫가루 통밀스콘',2500,NULL),(6,'바질 치아바타 ',3000,NULL),(6,'발렌타인 데이 초코스콘',2500,NULL),(6,'병아리콩 가득 통밀빵',5000,NULL),(6,'쑥 치아바타',3500,NULL),(6,'쑥 플레인 깜빠뉴',6000,NULL),(6,'영양가득 호밀빵 ',8000,NULL),(6,'올리브 깜빠뉴',7000,NULL),(6,'올리브 치아바타',3500,NULL),(6,'자가제분 통밀식빵',8000,NULL),(6,'장모님 통밀빵',4500,NULL),(6,'착한 팥앙금 통밀빵',5000,NULL),(6,'초코 바게트',5000,NULL),(6,'치유의 빵',7700,NULL),(6,'호밀 펌퍼니클 ',8000,NULL),(6,'홍순영 농부 금강밀 시골빵',6000,NULL),(6,'홍순영 농부 호밀빵',8000,NULL),(8,'아말피코스트 호텔 숙박',150000,2),(8,'이탈리아 숙박',200000,1),(11,'3가지 허브 시골빵',6000,7),(11,'바질 치아바타',3000,9),(11,'영양가득 호밀빵',8000,4),(11,'올리브 깜빠뉴',7000,8),(11,'자가제분 통밀식빵',8000,2),(11,'치유의 빵',7700,1),(11,'호밀 펌퍼니클',8000,5),(11,'홍순영 농부 금강밀 시골빵',6000,6),(11,'홍순영 농부 호밀빵',8000,3);
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
  `postcode` int(11) DEFAULT NULL,
  `address` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT 'null',
  `detail_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT 'null',
  `phone1` int(11) DEFAULT '0',
  `phone2` int(11) DEFAULT '0',
  `phone3` int(11) DEFAULT '0',
  PRIMARY KEY (`member_no`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'asd','asd','name','2019-03-28 10:01:38',NULL,'null','null',0,0,0),(2,'spring1@gmail.com','12345','홍길동1','2019-03-22 11:28:40',NULL,'null','null',0,0,0),(3,'spring2@gmail.com','12345','홍길동2','2019-03-25 11:43:17',NULL,'null','null',0,0,0),(4,'spring4@gmail.com','1234','길동','2019-03-26 15:01:20',NULL,'null','null',0,0,0),(5,'spring@gmail.com','1234','홍길동','2019-03-22 11:11:46',42449,'대구 남구 대덕북길 5 (대명동)','',10,5555,7777),(6,'marketlog@gmail.com','1234','김모모','2019-04-06 23:49:51',1689,'서울 노원구 상계로 26 (상계동)','.',10,9988,7766),(7,'buyer@gmail.com','1234','박나나','2019-04-07 00:51:26',46769,'부산 강서구 가덕해안로 3-1 (성북동)','2층',10,1234,5678);
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
INSERT INTO `order_goods` VALUES (1,'저렴한 상품',20000,1,NULL),(11,'저렴한 상품',20000,1,NULL),(12,'저렴한 상품',20000,1,NULL),(12,'좋은 상품',10000,1,'메모'),(13,'단팥 쑥 시골빵 ',6000,1,NULL),(13,'바질 치아바타 ',3000,1,NULL),(14,'두부 브라우니',3000,1,NULL),(15,'김밝은 농부의 서리태 통밀빵',5000,1,NULL),(15,'미숫가루 통밀스콘',2500,1,NULL),(15,'쑥 플레인 깜빠뉴',6000,1,NULL),(16,'병아리콩 가득 통밀빵',5000,1,NULL),(17,'미숫가루 통밀스콘',2500,1,NULL),(17,'영양가득 호밀빵 ',8000,1,NULL),(18,'밀빵',20000,1,''),(19,'치유의 빵',7700,1,NULL),(19,'3가지 허브 시골빵',6000,1,'얇게 썰어주세요'),(19,'바질 치아바타',3000,2,NULL),(20,'영양가득 호밀빵',8000,2,NULL),(20,'올리브 깜빠뉴',7000,1,NULL),(21,'영양가득 호밀빵',8000,1,NULL),(21,'호밀 펌퍼니클',8000,2,'자르지 말아주세요'),(21,'자가제분 통밀식빵',8000,1,NULL),(22,'치유의 빵',7700,5,NULL),(23,'올리브 깜빠뉴',7000,1,NULL),(23,'홍순영 농부 호밀빵',8000,1,NULL),(23,'홍순영 농부 금강밀 시골빵',6000,2,NULL),(24,'영양가득 호밀빵',8000,1,NULL),(24,'3가지 허브 시골빵',6000,2,NULL);
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
  `memo` varchar(600) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `total_price` int(11) DEFAULT NULL,
  `order_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `order_status` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`order_no`),
  KEY `member_no_idx` (`member_no`),
  KEY `address_no_idx` (`address_no`),
  CONSTRAINT `adress_no` FOREIGN KEY (`address_no`) REFERENCES `address` (`address_no`),
  CONSTRAINT `member_no` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_info`
--

LOCK TABLES `order_info` WRITE;
/*!40000 ALTER TABLE `order_info` DISABLE KEYS */;
INSERT INTO `order_info` VALUES (11,5,3,'홍림',46760,'부산 강서구 르노삼성대로 14 (신호동)','.',10,1234,1234,'경비실에 맡겨주세요.',NULL,'2019-04-01 17:15:16',0),(12,5,3,'홍길동',42957,'대구 달성군 화원읍 류목정길 5','',10,1234,1234,'경비실에 맡겨주세요.',NULL,'2019-04-02 09:51:02',1),(13,5,6,'홍길동',48419,'부산 남구 고동골로18번길 15 (문현동)','.',10,1234,1234,'경비실에 맡겨주세요.',NULL,'2019-04-05 13:07:23',0),(14,5,6,'홍길동',46249,'부산 금정구 금단로 93-1 (구서동)','.',10,1234,1234,'경비실에 맡겨주세요.',NULL,'2019-04-05 13:09:40',0),(15,5,6,'홍길동',6000,'서울 강남구 강남대로 708 (압구정동)','',10,1234,1234,'경비실에 맡겨주세요.',NULL,'2019-04-05 13:15:42',0),(16,5,6,'김마켓',42957,'대구 달성군 화원읍 류목정길 5','',10,1234,1234,'경비실에 맡겨주세요.',NULL,'2019-04-05 13:17:58',1),(17,5,6,'김마켓',46760,'부산 강서구 르노삼성대로 14 (신호동)','',10,1234,1234,'경비실에 맡겨주세요.',NULL,'2019-04-05 13:19:44',0),(19,7,11,'박나나',46769,'부산 강서구 가덕해안로 3-1 (성북동)','2층',10,1234,5678,'경비실에 맡겨주세요',22700,'2019-04-07 01:10:52',0),(21,7,11,'김구해',8654,'서울 금천구 삼성산길 3 (시흥동)','',10,2222,3333,'부재시 경비실',35000,'2019-04-07 02:31:49',0),(22,5,11,'홍림',42449,'대구 남구 대덕북길 5 (대명동)','',10,5555,7777,'',41500,'2019-04-07 02:34:39',1),(23,5,11,'김사나',51755,'경남 창원시 마산합포구 가포해안길 15 (가포동)','',10,1234,5678,'',30000,'2019-04-07 02:37:03',1),(24,6,11,'조맹부',1689,'서울 노원구 상계로 26 (상계동)','.',10,9988,7766,'',23000,'2019-04-07 02:39:10',0);
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

-- Dump completed on 2019-04-08  4:19:35
