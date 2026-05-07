-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: optics
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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) NOT NULL,
  `street` varchar(50) NOT NULL,
  `address_number` varchar(10) NOT NULL,
  `address_floor` varchar(10) DEFAULT NULL,
  `door` varchar(10) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `country` char(2) NOT NULL,
  PRIMARY KEY (`address_id`),
  UNIQUE KEY `supplier_id` (`supplier_id`),
  CONSTRAINT `fk_addresses_suppliers` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,1,'Via Cantù','2','1','A','Milan','20123','IT'),(2,2,'Settima Strada','15','PB','1','Padua','35129','IT');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brands` (
  `brand_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`brand_id`),
  UNIQUE KEY `name` (`name`),
  KEY `fk_brands_supplier` (`supplier_id`),
  CONSTRAINT `fk_brands_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,1,'Ray-Ban'),(2,1,'Oakley'),(3,2,'Carrera');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `recommended_by_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `name` varchar(50) NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `registered_at` date NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_customers_customers` (`recommended_by_id`),
  CONSTRAINT `fk_customers_customers` FOREIGN KEY (`recommended_by_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,NULL,1,'Alice Anderson','08001','600111001','alice@corp.com','2023-01-01'),(2,1,1,'Bob Bennett','08002','600222002','bob@corp.com','2023-04-01'),(3,2,1,'Charlie Clark','08003','600333003','charlie@corp.com','2023-05-01'),(4,NULL,1,'David Dawson','28001','600444004','david@logic.net','2023-01-10'),(5,4,1,'Elena Evans','28002','600555005','elena@logic.net','2023-04-10'),(6,1,1,'Frank Foster','08005','600666006','frank@corp.com','2023-04-05'),(7,NULL,1,'Grace Gomez','41001','600777007','grace@web.org','2023-02-01'),(8,NULL,1,'Henry Harris','41002','600888008','henry@web.org','2023-02-15'),(9,NULL,1,'Isabel Irving','50001','600999009','isabel@web.org','2023-03-01'),(10,NULL,0,'Jack Jackson','50002','600101010','jack@web.org','2023-03-10');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `details`
--

DROP TABLE IF EXISTS `details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `details` (
  `order_id` int(11) NOT NULL,
  `glass_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `sale_unit_price` decimal(8,4) NOT NULL,
  PRIMARY KEY (`order_id`,`glass_id`),
  KEY `fk_details_glasses` (`glass_id`),
  CONSTRAINT `fk_details_glasses` FOREIGN KEY (`glass_id`) REFERENCES `glasses` (`glass_id`),
  CONSTRAINT `fk_details_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `details`
--

LOCK TABLES `details` WRITE;
/*!40000 ALTER TABLE `details` DISABLE KEYS */;
INSERT INTO `details` VALUES (1,1,1,145.0000),(1,2,2,160.0000),(1,5,1,210.0000),(2,3,1,195.0000),(2,4,1,185.0000),(3,1,1,145.0000),(4,2,2,160.0000),(5,4,1,185.0000),(5,5,1,210.0000),(6,1,1,145.0000),(7,2,1,160.0000),(8,3,1,195.0000),(9,4,1,185.0000),(10,5,1,210.0000),(11,1,1,145.0000),(12,2,1,160.0000),(13,3,1,195.0000),(14,4,1,185.0000),(15,5,1,210.0000);
/*!40000 ALTER TABLE `details` ENABLE KEYS */;
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
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Thomas','Anderson'),(2,'Sarah','Connor'),(3,'James','Wilson'),(4,'Elena','Rodríguez'),(5,'David','Chen'),(6,'Linda','Hamilton');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glasses`
--

DROP TABLE IF EXISTS `glasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glasses` (
  `glass_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_id` int(11) NOT NULL,
  `model` varchar(50) NOT NULL,
  `prescription_left` decimal(4,2) NOT NULL,
  `prescription_right` decimal(4,2) NOT NULL,
  `frame_type` enum('Frameless','Acetate','Metallic') DEFAULT NULL,
  `frame_color` varchar(20) NOT NULL,
  `left_lens_color` varchar(20) NOT NULL,
  `right_lens_color` varchar(20) NOT NULL,
  `cost_unit_price` decimal(8,4) NOT NULL,
  `stock` tinyint(4) NOT NULL,
  PRIMARY KEY (`glass_id`),
  KEY `fk_glasses_brands` (`brand_id`),
  CONSTRAINT `fk_glasses_brands` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glasses`
--

LOCK TABLES `glasses` WRITE;
/*!40000 ALTER TABLE `glasses` DISABLE KEYS */;
INSERT INTO `glasses` VALUES (1,1,'Wayfarer Classic',1.25,1.50,'Acetate','Black','Green','Green',85.0000,10),(2,1,'Aviator',0.00,0.00,'Metallic','Gold','Brown','Brown',95.5000,5),(3,2,'Holbrook',2.00,2.00,'Acetate','Matte Black','Blue Prizm','Blue Prizm',110.0000,8),(4,2,'TwoFace',1.00,1.00,'Metallic','Silver','Black','Black',105.0000,4),(5,1,'Rimless Pro',0.50,0.75,'Frameless','Grey','Clear','Clear',130.0000,3);
/*!40000 ALTER TABLE `glasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `ordered_at` datetime NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_orders_employees` (`employee_id`),
  KEY `fk_orders_customers` (`customer_id`),
  CONSTRAINT `fk_orders_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `fk_orders_employees` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,2,1,'2023-01-10 10:00:00'),(2,3,1,'2023-09-15 11:30:00'),(3,2,1,'2023-12-20 16:45:00'),(4,1,2,'2023-02-05 09:15:00'),(5,4,2,'2023-10-10 14:20:00'),(6,1,2,'2023-11-12 10:00:00'),(7,3,4,'2023-03-20 12:00:00'),(8,5,4,'2023-11-25 17:30:00'),(9,6,3,'2023-04-01 10:00:00'),(10,1,5,'2023-05-15 11:00:00'),(11,2,6,'2023-06-20 12:00:00'),(12,3,7,'2023-07-25 13:00:00'),(13,4,8,'2023-08-30 14:00:00'),(14,5,9,'2023-10-05 15:00:00'),(15,6,10,'2023-12-15 16:00:00');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suppliers` (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `nif` char(9) NOT NULL,
  PRIMARY KEY (`supplier_id`),
  UNIQUE KEY `nif` (`nif`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'Luxottica Group','932112233','932112234','A12345678'),(2,'Safilo Group','915556677','915556678','B87654321');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-07  8:47:34
