-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: pizzeria
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `provinces`
--

DROP TABLE IF EXISTS `provinces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provinces` (
  `province_id` int(11) NOT NULL AUTO_INCREMENT,
  `province` varchar(50) NOT NULL,
  PRIMARY KEY (`province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provinces`
--

LOCK TABLES `provinces` WRITE;
/*!40000 ALTER TABLE `provinces` DISABLE KEYS */;
INSERT INTO `provinces` VALUES (1,'Barcelona');
/*!40000 ALTER TABLE `provinces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(50) NOT NULL,
  `province_id` int(11) NOT NULL,
  PRIMARY KEY (`city_id`),
  KEY `fk_cities_provinces` (`province_id`),
  CONSTRAINT `fk_cities_provinces` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Barcelona',1),(2,'L\'Hospitalet de Llobregat',1),(3,'Badalona',1),(4,'Santa Coloma de Gramenet',1),(5,'Sant Adria de Besos',1),(6,'Esplugues de Llobregat',1);
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `street` varchar(50) NOT NULL,
  `address_number` varchar(10) NOT NULL,
  `address_floor` varchar(10) DEFAULT NULL,
  `door` varchar(10) DEFAULT NULL,
  `city_id` int(11) NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `fk_customers_cities` (`city_id`),
  CONSTRAINT `fk_customers_cities` FOREIGN KEY (`city_id`) REFERENCES `cities` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Joan','Garcia','611000001','Carrer de Consell de Cent','350','1','1',1,'08007'),(2,'Elena','Martí','611000002','Carrer de Casp','45','2','A',1,'08007'),(3,'Pere','López','611000003','Carrer de Pau Claris','120','3','2',1,'08007'),(4,'Carme','Sánchez','611000004','Carrer dels Arcs','5','4','B',1,'08003'),(5,'Sergi','Roca','611000005','Carrer de la Princesa','22','1','1',1,'08003'),(6,'Anna','Vidal','611000006','Carrer de Sant Pere Més Alt','15','2','C',1,'08003'),(7,'Lluís','Serra','611000007','Carrer de Verdi','10','Principal','1',1,'08012'),(8,'Marta','Font','611000008','Carrer de Terol','28','3','2',1,'08012'),(9,'Albert','Dalmau','611000009','Travessera de Gràcia','150','2','1',1,'08012'),(10,'Sílvia','Solé','611000010','Carrer de Galileu','88','4','A',1,'08028'),(11,'Marc','Bosch','611000011','Carrer de Numància','42','1','2',1,'08028'),(12,'Núria','Prats','611000012','Carrer de Joan Güell','110','3','1',1,'08028'),(13,'Oscar','Muntané','611000013','Passeig d\'Urrútia','25','2','B',1,'08031'),(14,'Clara','Vila','611000014','Carrer de Cartellà','70','1','1',1,'08031'),(15,'Pol','Gispert','611000015','Carrer de Talamanca','12','4','3',1,'08031'),(16,'Roser','Bru','611000016','Carrer de Joncar','33','2','1',1,'08005'),(17,'Enric','Mas','611000017','Carrer de Ramon Turró','180','3','A',1,'08005'),(18,'Júlia','Costa','611000018','Carrer de Wad-Ras','25','1','2',1,'08005'),(19,'Biel','Roig','611000019','Carrer de Muntaner','450','5','1',1,'08017'),(20,'Gemma','Oliver','611000020','Carrer de Mandri','14','2','B',1,'08017'),(21,'Xavi','Torres','611000021','Carrer de Mitre','200','4','C',1,'08017'),(22,'Laura','Pou','611000022','Carrer de Mallorca','300','1','1',1,'08007'),(23,'Ricard','Moya','611000023','Carrer d\'Enric Granados','85','3','2',1,'08007'),(24,'Marina','Escuté','611000024','Via Augusta','120','2','A',1,'08017'),(25,'Oriol','Grau','611000025','Carrer de Balmes','320','4','4',1,'08007'),(26,'Paula','Roses','611000026','Carrer de Pujades','95','2','1',1,'08005'),(27,'Ivan','Valls','611000027','Carrer de Borriana','30','1','2',1,'08031'),(28,'Mireia','Pons','611000028','Carrer de Brasil','15','5','B',1,'08028'),(29,'Andreu','Gual','611000029','Carrer d\'Astúries','44','2','1',1,'08012'),(30,'Sofia','Abad','611000030','Carrer d\'Avinyó','12','3','3',1,'08003');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dark_kitchens`
--

DROP TABLE IF EXISTS `dark_kitchens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dark_kitchens` (
  `dark_kitchen_id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(20) NOT NULL,
  `street` varchar(50) NOT NULL,
  `address_number` varchar(10) NOT NULL,
  `address_floor` varchar(10) DEFAULT NULL,
  `door` varchar(10) DEFAULT NULL,
  `city_id` int(11) NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  PRIMARY KEY (`dark_kitchen_id`),
  KEY `fk_dark_kitchens_cities` (`city_id`),
  CONSTRAINT `fk_dark_kitchens_cities` FOREIGN KEY (`city_id`) REFERENCES `cities` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dark_kitchens`
--

LOCK TABLES `dark_kitchens` WRITE;
/*!40000 ALTER TABLE `dark_kitchens` DISABLE KEYS */;
INSERT INTO `dark_kitchens` VALUES (1,'932001122','Carrer d\'Aragó','255',NULL,NULL,1,'08007'),(2,'933445566','Via Laietana','32',NULL,NULL,1,'08003'),(3,'934556677','Carrer de la Riera de Cassoles','12',NULL,NULL,1,'08012'),(4,'935667788','Carrer de Sants','150',NULL,NULL,1,'08028'),(5,'936778899','Passeig de Fabra i Puig','88',NULL,NULL,1,'08031'),(6,'937889900','Carrer de Marià Aguiló','45',NULL,NULL,1,'08005'),(7,'938990011','Avinguda de Sarrià','102',NULL,NULL,1,'08017');
/*!40000 ALTER TABLE `dark_kitchens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `national_id` varchar(15) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `role` enum('delivery person','cook') DEFAULT NULL,
  `dark_kitchen_id` int(11) NOT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `national_id` (`national_id`),
  KEY `fk_employees_dark_kitchens` (`dark_kitchen_id`),
  CONSTRAINT `fk_employees_dark_kitchens` FOREIGN KEY (`dark_kitchen_id`) REFERENCES `dark_kitchens` (`dark_kitchen_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Marc','Vila','40285193A','622000001','cook',1),(2,'Laia','Sanz','19375026B','622000002','cook',1),(3,'Pau','García','74028519C','622000003','delivery person',1),(4,'Núria','Soler','03618472D','622000004','delivery person',1),(5,'Oriol','Rius','51927306E','622000005','delivery person',1),(6,'Jordi','Pujol','28405917A','622000006','cook',2),(7,'Marta','Ferrer','91736204B','622000007','cook',2),(8,'Albert','Dalmau','06294183C','622000008','delivery person',2),(9,'Sílvia','Solé','37502861D','622000009','delivery person',2),(10,'Carme','Sánchez','49175038E','622000010','delivery person',2),(11,'Oscar','Muntané','10582736A','622000011','cook',3),(12,'Clara','Vila','82649170B','622000012','cook',3),(13,'Pol','Gispert','39105824C','622000013','delivery person',3),(14,'Roser','Bru','70461935D','622000014','delivery person',3),(15,'Enric','Mas','58273641E','622000015','delivery person',3),(16,'Júlia','Costa','26395018A','622000016','cook',4),(17,'Biel','Roig','04827361B','622000017','cook',4),(18,'Gemma','Oliver','91740526C','622000018','delivery person',4),(19,'Xavi','Torres','35061942D','622000019','delivery person',4),(20,'Laura','Pou','82740516E','622000020','delivery person',4),(21,'Ricard','Moya','10593627A','622000021','cook',5),(22,'Marina','Escuté','73910548B','622000022','cook',5),(23,'Oriol','Grau','28461059C','622000023','delivery person',5),(24,'Paula','Roses','60284731D','622000024','delivery person',5),(25,'Ivan','Valls','49162053E','622000025','delivery person',5),(26,'Mireia','Pons','05827419A','622000026','cook',6),(27,'Andreu','Gual','37105926B','622000027','cook',6),(28,'Sofia','Abad','82630514C','622000028','delivery person',6),(29,'Pere','Martí','19472605D','622000029','delivery person',6),(30,'Elena','Bosch','50381647E','622000030','delivery person',6),(31,'Joan','Serra','91730462A','622000031','cook',7),(32,'Anna','Font','26401835B','622000032','cook',7),(33,'Lluís','Dalmau','73926041C','622000033','delivery person',7),(34,'Carme','Roca','05183927D','622000034','delivery person',7),(35,'Sergi','Vidal','48261703E','622000035','delivery person',7);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `ordered_at` datetime NOT NULL,
  `customer_id` int(11) NOT NULL,
  `dark_kitchen_id` int(11) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_orders_customers` (`customer_id`),
  KEY `fk_orders_dark_kitchens` (`dark_kitchen_id`),
  CONSTRAINT `fk_orders_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `fk_orders_dark_kitchens` FOREIGN KEY (`dark_kitchen_id`) REFERENCES `dark_kitchens` (`dark_kitchen_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2024-03-20 19:15:00',1,1),(2,'2024-03-20 19:22:00',4,2),(3,'2024-03-20 19:30:00',7,3),(4,'2024-03-20 19:38:00',10,4),(5,'2024-03-20 19:45:00',13,5),(6,'2024-03-20 19:53:00',16,6),(7,'2024-03-20 20:01:00',19,7),(8,'2024-03-20 20:09:00',2,1),(9,'2024-03-20 20:17:00',5,2),(10,'2024-03-20 20:25:00',11,4);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(50) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'pizza'),(2,'burger'),(3,'drink');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `cost_unit_price` decimal(7,4) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `fk_products_categories` (`category_id`),
  CONSTRAINT `fk_products_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,1,4.5000,'Margherita','Tomato sauce, mozzarella, and basil','/static/img/pizza_margherita.jpg'),(2,1,5.2000,'Pepperoni','Tomato sauce, mozzarella, and spicy pepperoni','/static/img/pizza_pepperoni.jpg'),(3,1,6.0000,'Four Cheeses','Mozzarella, gorgonzola, parmesan, and emmental','/static/img/pizza_4cheeses.jpg'),(4,1,5.5000,'Prosciutto','Tomato sauce, mozzarella, and ham','/static/img/pizza_prosciutto.jpg'),(5,1,6.5000,'BBQ Chicken','BBQ sauce, chicken, red onion, and mozzarella','/static/img/pizza_bbq.jpg'),(6,1,5.8000,'Vegetarian','Mushrooms, peppers, onions, and olives','/static/img/pizza_veggie.jpg'),(7,1,6.2000,'Hawaiian','Tomato sauce, mozzarella, ham, and pineapple','/static/img/pizza_hawaii.jpg'),(8,1,6.8000,'Carbonara','Cream, mozzarella, bacon, and onion','/static/img/pizza_carbonara.jpg'),(9,1,7.0000,'Truffle Mushroom','White base, mushrooms, and truffle oil','/static/img/pizza_truffle.jpg'),(10,1,6.4000,'Diavola','Spicy salami, chili oil, and tomato','/static/img/pizza_diavola.jpg'),(11,2,4.0000,'Classic Burger','Beef, lettuce, tomato, and onion','/static/img/burger_classic.jpg'),(12,2,4.5000,'Cheeseburger','Beef, cheddar cheese, and pickles','/static/img/burger_cheese.jpg'),(13,2,5.5000,'Bacon Burger','Beef, bacon, and BBQ sauce','/static/img/burger_bacon.jpg'),(14,2,6.0000,'Truffle Burger','Beef, caramelized onion, and truffle mayo','/static/img/burger_truffle.jpg'),(15,2,5.8000,'Chicken Crispy','Breaded chicken, mayo, and lettuce','/static/img/burger_chicken.jpg'),(16,2,5.5000,'Goat Cheese Burger','Beef, goat cheese, and honey','/static/img/burger_goat.jpg'),(17,2,6.2000,'Double Smash','Double beef patty and secret sauce','/static/img/burger_smash.jpg'),(18,2,5.2000,'Veggie Burger','Chickpea patty and vegan mayo','/static/img/burger_veggie.jpg'),(19,3,2.5000,'Orange Juice','Freshly squeezed natural orange juice','/static/img/juice_orange.jpg'),(20,3,2.5000,'Apple Juice','Organic cold-pressed apple juice','/static/img/juice_apple.jpg'),(21,3,2.8000,'Pineapple Juice','Tropical pineapple juice','/static/img/juice_pineapple.jpg'),(22,3,3.0000,'Mixed Berry Juice','Blueberry, raspberry, and strawberry blend','/static/img/juice_berries.jpg'),(23,3,2.5000,'Peach Juice','Smooth and sweet peach nectar','/static/img/juice_peach.jpg'),(24,3,2.0000,'Lemonade','Classic lemon juice with mint','/static/img/juice_lemon.jpg'),(25,3,1.5000,'Mineral Water','Still water 500ml','/static/img/water.jpg');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(50) NOT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'Vegan'),(2,'Gluten-Free'),(3,'Spicy'),(4,'Healthy'),(5,'Organic'),(6,'Chef Choice'),(7,'Local Product');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_tags`
--

DROP TABLE IF EXISTS `products_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_tags` (
  `product_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`tag_id`),
  KEY `fk_products_tags_tags` (`tag_id`),
  CONSTRAINT `fk_products_tags_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `fk_products_tags_tags` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_tags`
--

LOCK TABLES `products_tags` WRITE;
/*!40000 ALTER TABLE `products_tags` DISABLE KEYS */;
INSERT INTO `products_tags` VALUES (2,3),(6,1),(9,6),(10,3),(14,6),(16,6),(18,1),(18,4),(19,4),(19,7),(20,4),(20,5),(21,4),(22,4),(22,5),(24,4),(24,7);
/*!40000 ALTER TABLE `products_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `details`
--

DROP TABLE IF EXISTS `details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `details` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `sale_unit_price` decimal(7,4) NOT NULL,
  PRIMARY KEY (`order_id`,`product_id`),
  KEY `fk_details_products` (`product_id`),
  CONSTRAINT `fk_details_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `fk_details_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `details`
--

LOCK TABLES `details` WRITE;
/*!40000 ALTER TABLE `details` DISABLE KEYS */;
INSERT INTO `details` VALUES (1,1,2,10.3500),(1,19,2,5.7500),(2,2,1,11.9600),(2,11,1,9.2000),(2,20,1,5.7500),(3,3,3,13.8000),(3,21,3,6.4400),(4,12,2,10.3500),(4,19,2,5.7500),(5,4,2,12.6500),(5,13,1,12.6500),(5,22,3,6.9000),(6,11,4,9.2000),(6,23,4,5.7500),(7,5,1,14.9500),(7,14,1,13.8000),(7,24,2,4.6000),(8,1,1,10.3500),(8,25,1,3.4500),(9,15,1,13.3400),(9,19,1,5.7500),(10,6,1,13.3400),(10,16,1,12.6500);
/*!40000 ALTER TABLE `details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliveries`
--

DROP TABLE IF EXISTS `deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deliveries` (
  `delivery_id` int(11) NOT NULL AUTO_INCREMENT,
  `delivered_at` datetime NOT NULL,
  `order_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  PRIMARY KEY (`delivery_id`),
  UNIQUE KEY `order_id` (`order_id`),
  KEY `fk_deliveries_employees` (`employee_id`),
  CONSTRAINT `fk_deliveries_employees` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`),
  CONSTRAINT `fk_deliveries_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveries`
--

LOCK TABLES `deliveries` WRITE;
/*!40000 ALTER TABLE `deliveries` DISABLE KEYS */;
INSERT INTO `deliveries` VALUES (1,'2024-03-20 19:45:00',1,3),(2,'2024-03-20 19:55:00',2,8),(3,'2024-03-20 20:15:00',3,13),(4,'2024-03-20 20:05:00',4,18),(5,'2024-03-20 21:00:00',6,28),(6,'2024-03-20 21:25:00',8,3),(7,'2024-03-20 21:50:00',9,8);
/*!40000 ALTER TABLE `deliveries` ENABLE KEYS */;
UNLOCK TABLES;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-10 13:44:37