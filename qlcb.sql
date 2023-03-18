-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: qlcb
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_rules`
--

DROP TABLE IF EXISTS `admin_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_rules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `min_time_flight_sche` float DEFAULT NULL,
  `max_between_airport_quantity` float DEFAULT NULL,
  `min_time_stay_airport` float DEFAULT NULL,
  `max_time_stay_airport` float DEFAULT NULL,
  `customer_time_ticket` float DEFAULT NULL,
  `staff_time_ticket` float DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_rules`
--

LOCK TABLES `admin_rules` WRITE;
/*!40000 ALTER TABLE `admin_rules` DISABLE KEYS */;
INSERT INTO `admin_rules` VALUES (1,0.5,2,0.33,0.5,12,4,'2023-03-17 19:24:57'),(2,0.5,1,0.3,0.5,13,5,'2023-03-17 22:48:57'),(3,0.4,1,0.33,0.5,12,4,'2023-03-17 23:11:07');
/*!40000 ALTER TABLE `admin_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airport`
--

DROP TABLE IF EXISTS `airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airport` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airport`
--

LOCK TABLES `airport` WRITE;
/*!40000 ALTER TABLE `airport` DISABLE KEYS */;
INSERT INTO `airport` VALUES (1,'Tân Sơn Nhất'),(2,'Nội Bài'),(3,'Côn Đảo'),(4,'Cà Mau'),(5,'Cần Thơ'),(6,'Phú Bài'),(7,'Vân Đồn'),(8,'Đà Nẵng'),(9,'Phú Quốc'),(10,'Vinh');
/*!40000 ALTER TABLE `airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `between_airport`
--

DROP TABLE IF EXISTS `between_airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `between_airport` (
  `id` int NOT NULL AUTO_INCREMENT,
  `airport_id` int DEFAULT NULL,
  `flight_sche_id` int DEFAULT NULL,
  `time_stay` float NOT NULL,
  `note` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `airport_id` (`airport_id`),
  KEY `flight_sche_id` (`flight_sche_id`),
  CONSTRAINT `between_airport_ibfk_1` FOREIGN KEY (`airport_id`) REFERENCES `airport` (`id`),
  CONSTRAINT `between_airport_ibfk_2` FOREIGN KEY (`flight_sche_id`) REFERENCES `flight_sche` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `between_airport`
--

LOCK TABLES `between_airport` WRITE;
/*!40000 ALTER TABLE `between_airport` DISABLE KEYS */;
INSERT INTO `between_airport` VALUES (1,8,5,0.4,'',0),(2,1,6,0.44,'',0),(3,1,8,0.5,'',1),(4,7,8,0.33,'',0),(5,1,9,0.3,'',1),(6,1,9,0.3,'',0);
/*!40000 ALTER TABLE `between_airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Nguyễn Văn B','1234567890','1234567890'),(2,'Nguyễn Văn B','1234567890','1234567890'),(3,'Nguyễn Văn B','1234567890','1234567890'),(4,'Tsần Thị Bích Huyền','0386858149','1234567890'),(5,'nhóm 6','1234567890','1234567890'),(6,'Bích Huyền','1234567890','1234567890'),(7,'Nguyễn Văn B','1234567890','1234567890'),(8,'huyen','1234567890','1234567890');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight_sche`
--

DROP TABLE IF EXISTS `flight_sche`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight_sche` (
  `id` int NOT NULL AUTO_INCREMENT,
  `airport_from` int DEFAULT NULL,
  `airport_to` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `time_start` datetime NOT NULL,
  `time_end` datetime NOT NULL,
  `quantity_ticket_1st` int NOT NULL,
  `quantity_ticket_1st_booked` int DEFAULT NULL,
  `quantity_ticket_2nd` int NOT NULL,
  `quantity_ticket_2nd_booked` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `airport_from` (`airport_from`),
  KEY `airport_to` (`airport_to`),
  CONSTRAINT `flight_sche_ibfk_1` FOREIGN KEY (`airport_from`) REFERENCES `airport` (`id`),
  CONSTRAINT `flight_sche_ibfk_2` FOREIGN KEY (`airport_to`) REFERENCES `airport` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight_sche`
--

LOCK TABLES `flight_sche` WRITE;
/*!40000 ALTER TABLE `flight_sche` DISABLE KEYS */;
INSERT INTO `flight_sche` VALUES (1,1,2,1,0,'2023-03-19 21:18:00','2023-03-19 23:20:00',50,6,50,0,5000000),(2,2,3,1,0,'2023-03-20 17:18:00','2023-03-20 21:18:00',50,1,50,0,5000000),(3,1,2,1,0,'2023-03-17 23:31:00','2023-03-18 02:32:00',50,0,50,0,500000),(4,10,9,1,0,'2023-03-18 04:28:00','2023-03-18 07:28:00',50,1,50,0,5000000),(5,1,6,1,0,'2023-03-20 17:00:00','2023-03-20 21:42:00',50,0,50,0,6000000),(6,3,8,0,1,'2023-03-22 16:47:00','2023-03-22 21:47:00',50,0,50,0,0),(7,1,4,1,0,'2023-03-23 21:48:00','2023-03-23 23:48:00',50,0,50,0,6000000),(8,4,10,1,0,'2023-03-23 22:42:00','2023-03-24 01:43:00',40,0,50,0,5000000),(9,3,8,1,0,'2023-03-20 23:04:00','2023-03-21 03:04:00',50,0,50,0,5000000),(10,6,10,0,1,'2023-03-20 17:05:00','2023-03-20 22:05:00',50,0,50,0,0),(11,1,2,1,0,'2023-03-18 01:12:00','2023-03-18 03:13:00',50,0,50,0,5000000),(12,1,2,1,0,'2023-03-18 00:15:00','2023-03-18 02:17:00',50,0,50,0,5000000);
/*!40000 ALTER TABLE `flight_sche` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `id` int NOT NULL AUTO_INCREMENT,
  `author_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `flight_sche_id` int DEFAULT NULL,
  `ticket_price` int NOT NULL,
  `ticket_type` int NOT NULL,
  `ticket_package_price` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  KEY `customer_id` (`customer_id`),
  KEY `flight_sche_id` (`flight_sche_id`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`),
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`flight_sche_id`) REFERENCES `flight_sche` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,3,1,1,5000000,1,0,'2023-03-17 21:24:01'),(2,1,2,2,5000000,1,0,'2023-03-17 21:24:48'),(3,1,3,1,5000000,1,0,'2023-03-17 21:29:36'),(4,5,4,1,5320000,1,320000,'2023-03-17 22:19:54'),(5,7,5,1,5320000,1,320000,'2023-03-17 22:39:01'),(6,2,6,4,5320000,1,320000,'2023-03-17 22:41:24'),(7,10,7,1,5320000,1,320000,'2023-03-17 23:00:33'),(8,2,8,1,5400000,1,400000,'2023-03-17 23:02:47');
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_role` enum('USER','ADMIN','STAFF') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Quản trị viên','admin','e10adc3949ba59abbe56e057f20f883e',NULL,'ADMIN','ad32e604e17467fc435538334fbddf3e'),(2,'Nhân viên','staff','e10adc3949ba59abbe56e057f20f883e',NULL,'STAFF','ad32e604e17467fc435538334fbddf3e'),(3,'Người dùng','user','e10adc3949ba59abbe56e057f20f883e',NULL,'USER','ad32e604e17467fc435538334fbddf3e'),(4,'Huyền Bích','tsanthibichhuyen251@gmail.com','e10adc3949ba59abbe56e057f20f883e','https://lh3.googleusercontent.com/a/AGNmyxabpwluhj2KeVpz1JzgJmtQgmKcyxJG6zTD3gejAA=s96-c','USER','ad32e604e17467fc435538334fbddf3e'),(5,'Huyền B','tsanthibichhuyen200@gmail.com','e10adc3949ba59abbe56e057f20f883e','https://lh3.googleusercontent.com/a/AGNmyxaW_RzEzfUx-IGOC2U9UmZWWR6kitzu7SWvQkys=s96-c','USER','ad32e604e17467fc435538334fbddf3e'),(6,'bichhuyen','BHuyen','212aa204f0b6d82a08ec93e50a072c74',NULL,'USER','cdad5e6d26c836589e5afd458464ac82'),(7,'nhom6','nhom6','212aa204f0b6d82a08ec93e50a072c74',NULL,'USER','cdad5e6d26c836589e5afd458464ac82'),(10,'Bích Huyền','huyền','212aa204f0b6d82a08ec93e50a072c74',NULL,'USER','9f729356c6ad9f37572debc43021d4e5'),(11,'nhom 6','admin1','e10adc3949ba59abbe56e057f20f883e',NULL,'ADMIN','abcd');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-18  8:05:18
