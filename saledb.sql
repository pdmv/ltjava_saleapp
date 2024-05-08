-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (arm64)
--
-- Host: localhost    Database: saledb
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
  `name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Mac','Máy tính xách tay'),(2,'iPad','Máy tính bảng'),(3,'iPhone','Điện thoại thông minh'),(4,'Watch','Đồng hồ thông minh'),(5,'AirPods','Tai nghe'),(6,'Phụ kiện','Phụ kiện hỗ trợ các thiết bị');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_idx` (`product_id`),
  KEY `fk_user_idx` (`user_id`),
  CONSTRAINT `fk_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'Hài lòng',6,1,'2023-08-27 22:24:00'),(2,'Sản phẩm tốt',7,1,'2023-08-27 20:24:00'),(3,'Giá hợp lý',6,1,'2023-08-27 21:24:00'),(4,'Quá đẹp',6,1,'2023-08-27 00:00:00'),(5,'Quá đẹp',6,2,'2023-08-27 00:00:00');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `unit_price` decimal(10,0) DEFAULT '0',
  `quantity` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_ORDERDETAIL_ORDER_idx` (`order_id`),
  KEY `FK_ORDERDETAIL_PRODUCT_idx` (`product_id`),
  CONSTRAINT `FK_ORDERDETAIL_ORDER` FOREIGN KEY (`order_id`) REFERENCES `sale_order` (`id`),
  CONSTRAINT `FK_ORDERDETAIL_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (5,4,1,24999000,1),(6,4,2,39999000,1),(7,4,3,36999000,1),(8,5,1,24999000,1),(9,5,3,36999000,1),(10,5,7,179999000,1),(11,6,2,39999000,1),(12,7,5,54999000,1),(13,7,6,39999000,3),(14,8,1,24999000,1),(15,8,2,39999000,2),(16,8,3,36999000,1),(17,9,1,24999000,1),(18,9,2,39999000,2),(19,10,4,14999000,1),(20,10,5,54999000,5),(21,11,1,24999000,2),(22,11,2,39999000,2),(23,11,3,36999000,1),(24,13,2,39999000,0),(25,13,1,24999000,0);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prod_tag`
--

DROP TABLE IF EXISTS `prod_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prod_tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `f1_idx` (`product_id`),
  KEY `f2_idx` (`tag_id`),
  CONSTRAINT `f1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `f2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prod_tag`
--

LOCK TABLES `prod_tag` WRITE;
/*!40000 ALTER TABLE `prod_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `prod_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `price` decimal(10,0) DEFAULT '0',
  `manufacturer` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `image` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_PRODUCE_CATEGORY_idx` (`category_id`),
  CONSTRAINT `FK_PRODUCE_CATEGORY` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'MacBook Air 13 inch với chip M2','Thiết kế gọn nhẹ — MacBook Air nhẹ và mỏng dưới 2 cm, nên bạn có thể đem theo ở bất cứ nơi đâu.',24999000,'Apple','https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/mba13-m2-digitalmat-gallery-1-202402?wid=728&hei=666&fmt=png-alpha&.v=1707263976493',NULL,_binary '',1),(2,'MacBook Pro 14 inch','Với M3, M3 Pro, hoặc M3 Max, những con chip tiên tiến nhất dành cho máy tính cá nhân của Apple, MacBook Pro trao cho bạn sức mạnh để thực hiện các dự án phức tạp nhất',39999000,'Apple','https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/mbp-14-digitalmat-gallery-1-202310?wid=728&hei=666&fmt=png-alpha&.v=1696971522628',NULL,_binary '',1),(3,'iMac','Màn hình Retina 4,5K 24 inch sống động',36999000,'Apple','https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/imac24-digitalmat-gallery-1-202310?wid=728&hei=666&fmt=png-alpha&.v=1697559004117',NULL,_binary '',1),(4,'Mac mini','Mac mini biến mọi bàn làm việc thành máy trạm mạnh mẽ, để bạn có thể sáng tạo, lập trình và hợp tác',14999000,'Apple','https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/mac-mini-digitalmat-gallery-1-202301?wid=728&hei=666&fmt=png-alpha&.v=1670038163709',NULL,_binary '',1),(5,'Mac Studio','Thiết kế nhỏ gọn tuyệt đẹp vừa vặn với bàn làm việc của bạn',54999000,'Apple','https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/mac-studio-digitalmat-gallery-1-202306?wid=728&hei=666&fmt=png-alpha&.v=1683914326094',NULL,_binary '',1),(6,'Studio Display','Màn hình Retina 5K 27 inch cuốn hút bạn với 14.7 triệu pixel và một tỷ màu',39999000,'Apple','https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/studio-display-digitalmat-gallery-1-202203?wid=728&hei=666&fmt=png-alpha&.v=1645207692041',NULL,_binary '',1),(7,'Mac Pro','Siêu mạnh mẽ với M2 Ultra, chip mạnh mẽ và giàu năng lực nhất của chúng tôi hiện nay',179999000,'Apple','https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/mac-pro-digitalmat-gallery-1-202306?wid=728&hei=666&fmt=jpeg&qlt=90&.v=1683842315753',NULL,_binary '',1),(8,'Pro Display XDR','Màn hình Retina 6K 32 inch đem lại hình ảnh chi tiết và sắc nét vượt bậc',126699000,'Apple','https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/proxdr-digitalmat-gallery-2-202111?wid=728&hei=666&fmt=jpeg&qlt=90&.v=1635206790000',NULL,_binary '',1),(9,'iPad Pro 11 inch','Chip Apple M4 mang đến hiệu năng như mơ cho các luồng công việc chuyên nghiệp và thời lượng pin dùng cả ngày',28999000,'Apple','https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/ipadpro11-digitalmat-gallery-1-202404?wid=728&hei=666&fmt=png-alpha&.v=1713308651643',NULL,_binary '',2),(10,'iPad Air','Chip Apple M2 tạo đà cho bước nhảy vọt về hiệu năng, cùng với thời lượng pin bền bỉ cả ngày',16990000,'Apple','https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/ipadair11-digitalmat-gallery-1-202404?wid=728&hei=666&fmt=jpeg&qlt=90&.v=1713308648429',NULL,_binary '',2),(11,'iPad (thế hệ thứ 10)','Chip A14 Bionic cho phép bạn chạy nhiều ứng dụng và hoạt động mượt mà giữa các ứng dụng',9999000,'Apple','https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/ipad-digitalmat-gallery-1-202210?wid=728&hei=666&fmt=png-alpha&.v=1664392871297',NULL,_binary '',2),(12,'iPad (thế hệ thứ 9)','Rẻ vô địch.',8399000,'Apple','https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/ipad-9th-gen-digitalmat-gallery-1-202310?wid=730&hei=666&fmt=png-alpha&.v=1696004296190',NULL,_binary '',2),(13,'iPad mini','Chip A15 Bionic mang đến hiệu năng phi thường và thời lượng pin bền bỉ cả ngày',12799000,'Apple','https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/ipad-mini-digitalmat-gallery-1-202111?wid=730&hei=666&fmt=png-alpha&.v=1635183174000',NULL,_binary '',2),(14,'iPhone 15 Pro','Thiết kế bằng titan bền chắc và nhẹ cùng với nút Tác Vụ giúp bạn truy cập nhanh đến tính năng yêu thích',28999000,'Apple','https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/iphone15pro-digitalmat-gallery-1-202309?wid=728&hei=666&fmt=png-alpha&.v=1693346851364',NULL,_binary '',3),(15,'iPhone 15','Dynamic Island hiển thị linh động các cảnh báo và Hoạt Động Trực Tiếp, nhờ đó bạn sẽ không bỏ lỡ thông tin khi đang làm việc khác',22999000,'Apple','https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/iphone15-digitalmat-gallery-1-202309?wid=728&hei=666&fmt=png-alpha&.v=1693346853713',NULL,_binary '',3),(16,'iPhone 14','Camera Chính cấp độ Pro và khả năng xử lý hình ảnh được cải thiện giúp chụp được những bức ảnh tuyệt vời trong mọi điều kiện ánh sáng',19999000,'Apple','https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/iphone14-digitalmat-gallery-1-202303?wid=728&hei=666&fmt=png-alpha&.v=1679072735068',NULL,_binary '',3),(17,'iPhone 13','Màn hình Super Retina XDR 15,4 cm',17299000,'Apple','https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/iphone13-digitalmat-gallery-1-202203?wid=728&hei=666&fmt=png-alpha&.v=1677662648568',NULL,_binary '',3),(18,'iPhone SE','A15 Bionic, chip siêu nhanh giống như chip của iPhone 13',11999000,'Apple','https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/iphonese-digitalmat-gallery-1-202203?wid=728&hei=666&fmt=png-alpha&.v=1644987579596',NULL,_binary '',3),(19,'Apple Watch Series 9','Màn hình Retina Luôn Bật sáng hơn với mặt trước bằng kính chống nứt, bền bỉ',10499000,'Apple','https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/watch-s9-digitalmat-gallery-1-202309_GEO_VN?wid=728&hei=666&fmt=png-alpha&.v=1693846403899',NULL,_binary '',4),(20,'Apple Watch Ultra 2','Vỏ titan 49mm bền bỉ với nút Tác Vụ tùy chỉnh tạo nên sự cân bằng hoàn hảo giữa trọng lượng, độ chắc chắn và khả năng chống ăn mòn',21999000,'Apple','https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/watch-ultra2-digitalmat-gallery-1-202309_GEO_VN?wid=728&hei=666&fmt=jpeg&qlt=90&.v=1693846571456',NULL,_binary '',4),(21,'Apple Watch SE','Nhận các chỉ số tập luyện và chế độ xem tiên tiến',6399000,'Apple','https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/watch-se-digitalmat-gallery-1-202403?wid=728&hei=666&fmt=png-alpha&.v=1708659557199',NULL,_binary '',4),(22,'AirPods (thế hệ thứ 2)','Thời gian nghe hơn 24 giờ với hộp sạc',3499000,'Apple','https://www.apple.com/v/airpods/compare/e/images/overview/airpods_2gen_white__benan2ckzxyq_small_2x.png',NULL,_binary '',5),(23,'AirPods (thế hệ thứ 3)','Thời gian nghe lên đến 30 giờ với hộp sạc',4499000,'Apple','https://www.apple.com/v/airpods/compare/e/images/overview/airpods_3gen_white__car4z3m37ss2_small_2x.png',NULL,_binary '',5),
(24,'AirPods Pro (thế hệ thứ 2)','Chế độ Âm Thanh Không Gian. Cá Nhân Hóa với tính năng theo dõi đầu chủ động',6199000,'Apple','https://www.apple.com/v/airpods/compare/e/images/overview/airpods_pro_white__cd2arklqu16q_small_2x.png',NULL,_binary '',5),
(25,'Magic Keyboard với Touch ID và Numeric Keypad','Magic Keyboard nay có Touch ID, giúp xác thực nhanh chóng, dễ dàng và bảo mật mỗi lần đăng nhập và mua hàng.',4701000,'Apple','https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/MMMR3?wid=532&hei=582&fmt=png-alpha&.v=1645719947833',NULL,_binary '',6),
(26,'Magic Trackpad','Magic Trackpad có thể kết nối không dây và sạc lại được, bao gồm đầy đủ các thao tác Multi‑Touch và công nghệ Force Touch.',3522000,'Apple','https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/MMMP3?wid=532&hei=582&fmt=png-alpha&.v=1645136899926',NULL,_binary '',6),
(27,'Magic Mouse','Magic Mouse có thể kết nối không dây và sạc lại được, với phần đế được thiết kế tối ưu giúp di chuyển dễ dàng trên mặt bàn.',2339000,'Apple','https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/MMMQ3?wid=532&hei=582&fmt=png-alpha&.v=1645138486301',NULL,_binary '',6),
(28,'Apple Pencil Pro','Apple Pencil Pro mang đến thêm bao năng lực kỳ diệu giúp bạn hiện thực hóa những ý tưởng của mình.',3499000,'Apple','https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/MX2D3?wid=532&hei=582&fmt=png-alpha&.v=1713841707336',NULL,_binary '',6),
(29,'Magic Keyboard cho iPad Pro 11 inch (M4)','Magic Keyboard cho iPad Pro mang đến trải nghiệm gõ phím và bàn di chuột tuyệt vời, trong một thiết kế mới với kiểu dáng trang nhã, nhỏ gọn cùng phần kê tay bằng nhôm.',8299000,'Apple','https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/MWR53_FV402?wid=1420&hei=930&fmt=png-alpha&.v=1714185737600',NULL,_binary '',6),
(30,'Ốp Lưng Trong Suốt MagSafe cho iPhone 15 Pro Max','Mỏng, nhẹ và dễ cầm, ốp lưng do Apple thiết kế này phô diễn được màu sắc tuyệt vời của iPhone 15 Pro Max, đồng thời còn là lớp bảo vệ tăng cường.',1429000,'Apple','https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/MT233?wid=532&hei=582&fmt=png-alpha&.v=1693248327138',NULL,_binary '',6),
(31,'Bộ sạc USB-C 20W','Bộ Sạc Apple USB-C 20W giúp sạc nhanh và hiệu quả tại nhà, trong văn phòng hoặc khi đang di chuyển. Kết nối với iPhone 8 trở lên để sạc nhanh — 50% pin trong khoảng 30 phút.',549000,'Apple','https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/MU7V2?wid=532&hei=582&fmt=png-alpha&.v=1542406861289',NULL,_binary '',6),
(32,'Bộ Sạc MagSafe','Bộ Sạc MagSafe khiến cho việc sạc không dây trở nên cực kỳ dễ dàng.',1199000,'Apple','https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/MHXH3?wid=532&hei=582&fmt=png-alpha&.v=1661269793559',NULL,_binary '',6),
(33,'Cáp Sạc USB-C 240W (2 m)','Sợi cáp sạc dài 2 mét này được thiết kế theo kiểu cáp bện với cổng kết nối USB-C ở cả hai đầu và là phụ kiện lý tưởng để sạc, đồng bộ hóa và chuyển dữ liệu giữa các thiết bị USB-C.',819000,'Apple','https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/MU2G3?wid=532&hei=582&fmt=png-alpha&.v=1693236163178',NULL,_binary '',6),
(34,'Dây Quấn Thể Thao','Mềm mại, thoáng khí và nhẹ, Dây Quấn Thể Thao có thiết kế cài băng dính dán giúp bạn điều chỉnh dễ dàng và nhanh chóng.',1249000,'Apple','https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/MW4Q3_FV401_GEO_VN?wid=1420&hei=930&fmt=png-alpha&.v=1708710643511',NULL,_binary '',6),
(35,'Vòng Bện Solo','Mỗi dây đeo Vòng Bện Solo đều có thiết kế co giãn độc đáo, mang lại cảm giác cực kỳ thoải mái, dễ dàng đeo vào hay tháo ra khỏi cổ tay.',2549000,'Apple','https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/MWM63ref_FV401?wid=532&hei=582&fmt=png-alpha&.v=1708546807270',NULL,_binary '',6);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_order`
--

DROP TABLE IF EXISTS `sale_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_date` datetime NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ORDER_USER_idx` (`user_id`),
  CONSTRAINT `FK_ORDER_USER` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_order`
--

LOCK TABLES `sale_order` WRITE;
/*!40000 ALTER TABLE `sale_order` DISABLE KEYS */;
INSERT INTO `sale_order` VALUES (4,'2020-01-03 00:00:00',7),(5,'2020-02-03 00:00:00',7),(6,'2020-03-03 00:00:00',7),(7,'2020-05-04 00:00:00',7),(8,'2020-06-05 00:00:00',6),(9,'2020-07-05 00:00:00',7),(10,'2020-09-07 00:00:00',6),(11,'2020-02-07 00:00:00',8),(12,'2020-11-17 18:43:31',NULL),(13,'2020-11-17 18:48:11',NULL);
/*!40000 ALTER TABLE `sale_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tagcol` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `phone` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `username` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `active` bit(1) DEFAULT b'1',
  `user_role` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `avatar` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (6,'Thanh','Duong','thanh.dh@ou.edu.vn','0984461467','dhthanh','$2a$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO',_binary '','ROLE_ADMIN',NULL),(7,'Thanh','Duong','dhthanhqa@gmail.com','0984461461','thanhduong','$2a$10$RL0rTJd2ThLmCzYHMhz9aOBBZfA8ybYpa3Ugl9ds.Pkb8AjtSHWua',_binary '','ROLE_USER',NULL),(8,'Doremon','Mr','mon@gmail.com','1111111111','doremon','$2a$10$qv8SsUwRnp/YhPWTPqdgp.MXJ01hcW4ji6wKvP6.qkWWx1ZxhqxyG',_binary '','ROLE_USER',NULL),(9,'Tester','From React','abc@gmail.com','1234567890','thanhduong999','$2a$10$DT8XCG5IEd0RS0iKleeJ9.1LXWezuUj/qY2SLq/Vy64zUlxHHK9rG',NULL,'ROLE_USER','https://res.cloudinary.com/dxxwcby8l/image/upload/v1692330009/vuyk886cdgjykoi6qs3f.png');
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

-- Dump completed on 2024-05-08 21:31:57
