-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (arm64)
--
-- Host: localhost    Database: fsaledb
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (5,'AirPods'),(2,'iPad'),(3,'iPhone'),(1,'Mac'),(4,'Watch');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES ('đẹp quá',7,9,1,1,'2024-05-04 21:06:16'),('có tiền sẽ mua!!!!!',7,9,2,1,'2024-05-04 21:06:16'),('chừng nào giảm giá vậy?',10,9,3,1,'2024-05-04 21:06:16');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` float DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'MacBook Air 13 inch với chip M2',24999000,'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/mba13-m2-digitalmat-gallery-1-202402?wid=728&hei=666&fmt=png-alpha&.v=1707263976493',1),(2,'MacBook Pro 14 inch',39999000,'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/mbp-14-digitalmat-gallery-1-202310?wid=728&hei=666&fmt=png-alpha&.v=1696971522628',1),(3,'iMac',36999000,'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/imac24-digitalmat-gallery-1-202310?wid=728&hei=666&fmt=png-alpha&.v=1697559004117',1),(4,'Mac mini',14999000,'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/mac-mini-digitalmat-gallery-1-202301?wid=728&hei=666&fmt=png-alpha&.v=1670038163709',1),(5,'Mac Studio',54999000,'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/mac-studio-digitalmat-gallery-1-202306?wid=728&hei=666&fmt=png-alpha&.v=1683914326094',1),(6,'Studio Display',39999000,'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/studio-display-digitalmat-gallery-1-202203?wid=728&hei=666&fmt=png-alpha&.v=1645207692041',1),(7,'Mac Pro',179999000,'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/mac-pro-digitalmat-gallery-1-202306?wid=728&hei=666&fmt=jpeg&qlt=90&.v=1683842315753',1),(8,'Pro Display XDR',126699000,'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/proxdr-digitalmat-gallery-2-202111?wid=728&hei=666&fmt=jpeg&qlt=90&.v=1635206790000',1),(9,'iPad Pro 11 inch',21199000,'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/ipadpro11-digitalmat-gallery-1-202210?wid=728&hei=666&fmt=png-alpha&.v=1664477161220',2),(10,'iPad Air',15599000,'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/ipadair-digitalmat-gallery-1-202203?wid=728&hei=666&fmt=png-alpha&.v=1644962768135',2),(11,'iPad (thế hệ thứ 10)',11499000,'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/ipad-digitalmat-gallery-1-202210?wid=728&hei=666&fmt=png-alpha&.v=1664392871297',2),(12,'iPad (thế hệ thứ 9)',8399000,'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/ipad-9th-gen-digitalmat-gallery-1-202310?wid=730&hei=666&fmt=png-alpha&.v=1696004296190',2),(13,'iPad mini',12799000,'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/ipad-mini-digitalmat-gallery-1-202111?wid=730&hei=666&fmt=png-alpha&.v=1635183174000',2),(14,'iPhone 15 Pro',28999000,'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/iphone15pro-digitalmat-gallery-1-202309?wid=728&hei=666&fmt=png-alpha&.v=1693346851364',3),(15,'iPhone 15',22999000,'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/iphone15-digitalmat-gallery-1-202309?wid=728&hei=666&fmt=png-alpha&.v=1693346853713',3),(16,'iPhone 14',19999000,'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/iphone14-digitalmat-gallery-1-202303?wid=728&hei=666&fmt=png-alpha&.v=1679072735068',3),(17,'iPhone 13',17299000,'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/iphone13-digitalmat-gallery-1-202203?wid=728&hei=666&fmt=png-alpha&.v=1677662648568',3),(18,'iPhone SE',11999000,'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/iphonese-digitalmat-gallery-1-202203?wid=728&hei=666&fmt=png-alpha&.v=1644987579596',3),(19,'Apple Watch Series 9',10499000,'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/watch-s9-digitalmat-gallery-1-202309_GEO_VN?wid=728&hei=666&fmt=png-alpha&.v=1693846403899',4),(20,'Apple Watch Ultra 2',21999000,'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/watch-ultra2-digitalmat-gallery-1-202309_GEO_VN?wid=728&hei=666&fmt=jpeg&qlt=90&.v=1693846571456',4),(21,'Apple Watch SE',6399000,'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/watch-se-digitalmat-gallery-1-202403?wid=728&hei=666&fmt=png-alpha&.v=1708659557199',4),(22,'AirPods (thế hệ thứ 2)',3499000,'https://www.apple.com/v/airpods/shared/compare/d/images/compare/compare_airpods_2nd_gen__fw52r8rxrpyu_large_2x.png',5),(23,'AirPods (thế hệ thứ 3)',4499000,'https://www.apple.com/v/airpods/shared/compare/d/images/compare/compare_airpods_3rd_gen__dyuzfy04ht0m_large_2x.png',5),(24,'AirPods Pro (thế hệ thứ 2)',6199000,'https://www.apple.com/v/airpods/shared/compare/d/images/compare/compare_airpods_pro__e9uzt0mzviem_large_2x.png',5);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receipt`
--

DROP TABLE IF EXISTS `receipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receipt` (
  `user_id` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `receipt_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipt`
--

LOCK TABLES `receipt` WRITE;
/*!40000 ALTER TABLE `receipt` DISABLE KEYS */;
INSERT INTO `receipt` VALUES (7,1,1,'2024-01-04 19:27:16'),(8,2,1,'2024-05-04 19:27:16'),(9,3,1,'2024-05-04 19:27:16'),(7,4,1,'2024-05-04 19:58:44'),(7,5,1,'2024-05-04 19:58:44');
/*!40000 ALTER TABLE `receipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receipt_details`
--

DROP TABLE IF EXISTS `receipt_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receipt_details` (
  `quantity` int DEFAULT NULL,
  `unit_price` float DEFAULT NULL,
  `receipt_id` int NOT NULL,
  `product_id` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `receipt_id` (`receipt_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `receipt_details_ibfk_1` FOREIGN KEY (`receipt_id`) REFERENCES `receipt` (`id`),
  CONSTRAINT `receipt_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipt_details`
--

LOCK TABLES `receipt_details` WRITE;
/*!40000 ALTER TABLE `receipt_details` DISABLE KEYS */;
INSERT INTO `receipt_details` VALUES (1,24999000,1,1,1,1,'2024-05-04 19:27:16'),(1,39999000,1,6,2,1,'2024-05-04 19:27:16'),(1,179999000,1,7,3,1,'2024-05-04 19:27:16'),(1,126699000,1,8,4,1,'2024-05-04 19:27:16'),(1,3499000,2,22,5,1,'2024-05-04 19:27:16'),(1,28999000,3,14,6,1,'2024-05-04 19:27:16'),(1,10499000,3,19,7,1,'2024-05-04 19:27:16'),(1,36999000,3,3,8,1,'2024-05-04 19:27:16'),(3,24999000,4,1,9,1,'2024-05-04 19:58:44'),(3,8399000,4,12,10,1,'2024-05-04 19:58:44'),(3,39999000,4,6,11,1,'2024-05-04 19:58:44'),(1,21199000,4,9,12,1,'2024-05-04 19:58:44'),(5,15599000,5,10,13,1,'2024-05-04 19:58:44'),(3,11499000,5,11,14,1,'2024-05-04 19:58:44'),(1,12799000,5,13,15,1,'2024-05-04 19:58:44'),(3,22999000,5,15,16,1,'2024-05-04 19:58:44'),(2,19999000,5,16,17,1,'2024-05-04 19:58:44'),(4,17299000,5,17,18,1,'2024-05-04 19:58:44'),(5,11999000,5,18,19,1,'2024-05-04 19:58:44'),(9,39999000,5,2,20,1,'2024-05-04 19:58:44'),(5,21999000,5,20,21,1,'2024-05-04 19:58:44'),(5,6399000,5,21,22,1,'2024-05-04 19:58:44'),(3,4499000,5,23,23,1,'2024-05-04 19:58:44'),(5,6199000,5,24,24,1,'2024-05-04 19:58:44'),(3,14999000,5,4,25,1,'2024-05-04 19:58:44'),(3,54999000,5,5,26,1,'2024-05-04 19:58:44');
/*!40000 ALTER TABLE `receipt_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_role` enum('USER','ADMIN') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (6,'admin','https://res.cloudinary.com/dyuafq1hx/image/upload/v1709253624/bb54dtyptzcrpuiygwgr.png','admin','0e7517141fb53f21ee439b355b5a1d0a','ADMIN'),(7,'Phạm Đỗ Minh Vương','https://res.cloudinary.com/dyuafq1hx/image/upload/v1708760622/dcz7wz2hpdghvd794scp.jpg','user1','24c9e15e52afc47c225b757e7bee1f9d','USER'),(8,'Nguyễn Văn Hai','https://res.cloudinary.com/dyuafq1hx/image/upload/v1708760662/ar849b4zgg9erfxvpkuw.jpg','user2','7e58d63b60197ceb55a1c487989a3720','USER'),(9,'Trần Văn Ba','https://res.cloudinary.com/dyuafq1hx/image/upload/v1708760817/iltvnuha7ta0t4ycwflt.jpg','user3','92877af70a45fd6a2ed7fe81e1236b78','USER'),(10,'Nguyễn Thị Ngọc Tư','https://res.cloudinary.com/dyuafq1hx/image/upload/v1708761287/mrc4nggbnjhqyfwlg6cm.jpg','user4','3f02ebe3d7929b091e3d8ccfde2f3bc6','USER');
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

-- Dump completed on 2024-05-08 18:44:38
