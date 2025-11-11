-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: cps298 gas app
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `gas_history`
--

DROP TABLE IF EXISTS `gas_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gas_history` (
  `station_id` int NOT NULL,
  `priceRegular` decimal(4,2) DEFAULT NULL,
  `priceMidGrade` decimal(4,2) DEFAULT NULL,
  `pricePremium` decimal(4,2) DEFAULT NULL,
  `priceDiesel` decimal(4,2) DEFAULT NULL,
  `date_recorded` date DEFAULT NULL,
  KEY `fk_gas_staions_idx` (`station_id`),
  CONSTRAINT `fk_gas_stations` FOREIGN KEY (`station_id`) REFERENCES `gas_stations` (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gas_history`
--

LOCK TABLES `gas_history` WRITE;
/*!40000 ALTER TABLE `gas_history` DISABLE KEYS */;
INSERT INTO `gas_history` VALUES (2,3.20,3.80,4.30,3.80,'2025-10-14'),(3,NULL,NULL,NULL,NULL,'2025-10-14'),(4,3.10,3.67,5.00,4.00,'2025-10-14'),(5,2.90,3.70,4.30,NULL,'2025-10-14'),(6,3.08,3.58,4.08,3.92,'2025-10-14'),(7,3.08,3.63,4.18,NULL,'2025-10-14'),(8,3.08,3.58,4.08,3.70,'2025-10-14'),(9,3.20,3.60,4.50,NULL,'2025-10-14'),(11,3.00,3.50,4.00,3.66,'2025-10-14'),(12,3.25,3.90,NULL,NULL,'2025-10-28'),(13,3.30,4.05,4.80,3.90,'2025-10-28'),(14,3.25,3.85,4.45,3.90,'2025-10-28'),(15,NULL,NULL,NULL,NULL,'2025-10-28'),(16,3.30,NULL,4.50,NULL,'2025-10-28'),(17,3.40,4.30,4.80,3.90,'2025-10-28'),(18,3.30,NULL,4.50,NULL,'2025-10-28'),(21,NULL,NULL,NULL,NULL,'2025-10-28'),(22,3.06,3.90,4.56,3.80,'2025-10-28'),(23,3.06,3.60,4.14,4.10,'2025-10-28'),(24,3.06,3.66,4.16,4.10,'2025-10-28'),(25,3.06,3.52,4.16,4.01,'2025-10-28'),(26,3.10,3.60,NULL,3.80,'2025-10-28'),(27,3.20,3.50,4.20,NULL,'2025-10-28'),(28,2.90,3.50,4.10,3.90,'2025-10-28'),(29,2.90,3.50,4.10,3.90,'2025-10-28'),(30,3.00,3.50,4.00,3.90,'2025-10-28'),(31,3.00,3.50,4.00,3.90,'2025-10-28'),(32,3.20,3.80,4.40,NULL,'2025-10-28'),(33,3.10,3.80,4.40,3.90,'2025-10-28'),(34,3.20,3.70,4.40,NULL,'2025-10-28'),(35,2.88,NULL,NULL,NULL,'2025-10-28'),(36,2.98,3.58,4.18,NULL,'2025-10-28'),(37,2.98,NULL,NULL,NULL,'2025-10-28'),(38,2.99,NULL,4.19,3.80,'2025-10-28'),(39,2.98,NULL,4.28,3.80,'2025-10-28'),(40,2.98,3.50,4.30,NULL,'2025-10-28'),(41,3.30,3.80,4.40,3.90,'2025-10-28'),(42,2.80,3.50,4.10,NULL,'2025-10-28'),(43,2.90,3.40,3.90,3.80,'2025-10-28'),(44,2.90,NULL,NULL,NULL,'2025-10-28'),(46,2.90,3.50,4.10,3.90,'2025-10-28'),(47,2.95,3.85,4.00,NULL,'2025-10-28'),(48,2.69,3.79,NULL,NULL,'2025-10-28'),(49,2.96,3.58,4.26,3.60,'2025-10-28'),(50,3.00,NULL,NULL,3.60,'2025-10-28'),(51,2.86,4.00,NULL,3.80,'2025-10-28'),(52,2.80,NULL,NULL,NULL,'2025-10-28'),(53,NULL,NULL,4.10,NULL,'2025-10-28'),(54,3.00,3.50,4.00,4.00,'2025-10-28'),(55,2.90,NULL,NULL,NULL,'2025-10-28'),(56,3.00,3.60,4.00,3.90,'2025-10-28'),(57,3.00,3.70,4.20,3.60,'2025-10-28'),(58,3.30,3.50,4.00,3.92,'2025-10-28'),(59,NULL,NULL,NULL,NULL,'2025-10-28'),(60,2.99,4.00,4.70,3.60,'2025-10-28'),(61,3.20,3.70,4.20,3.80,'2025-10-28'),(62,3.30,3.00,4.70,NULL,'2025-10-28'),(63,3.25,3.97,NULL,4.30,'2025-10-28'),(64,3.30,3.90,4.50,3.90,'2025-10-28'),(65,NULL,NULL,NULL,NULL,'2025-10-28'),(66,3.04,3.54,4.04,3.40,'2025-10-28'),(67,3.10,3.70,4.30,3.80,'2025-10-28'),(68,3.30,3.90,4.35,3.90,'2025-10-28'),(69,3.20,3.80,4.40,3.90,'2025-10-28'),(70,2.98,3.48,3.98,3.39,'2025-10-28'),(71,3.10,3.70,NULL,3.70,'2025-10-28'),(72,2.96,3.56,4.06,3.76,'2025-10-28'),(73,2.95,3.35,3.75,3.75,'2025-10-28'),(74,3.30,3.83,4.38,3.90,NULL),(75,3.30,3.80,4.43,3.90,NULL),(76,3.30,3.90,4.50,4.00,NULL),(77,3.00,NULL,NULL,3.72,NULL),(78,3.00,3.40,3.95,3.72,NULL),(79,3.18,3.78,4.38,3.78,NULL),(80,3.30,3.70,4.30,3.90,NULL),(81,NULL,NULL,NULL,NULL,NULL),(82,3.30,3.85,4.60,3.90,NULL),(83,3.18,3.63,NULL,3.60,NULL),(84,3.30,3.70,4.20,3.90,NULL),(85,3.30,3.90,4.50,NULL,NULL),(86,3.26,3.85,NULL,3.90,NULL),(87,3.10,3.40,NULL,3.70,NULL),(88,3.16,3.66,4.23,3.60,NULL),(89,NULL,NULL,NULL,NULL,NULL),(90,3.16,3.88,4.43,3.60,NULL),(91,3.18,NULL,4.30,3.70,NULL),(92,2.94,3.44,3.84,3.86,NULL),(93,2.82,3.32,3.82,3.67,NULL),(94,2.83,3.33,3.83,3.67,NULL),(95,3.30,3.90,4.50,4.00,NULL),(96,2.90,NULL,NULL,NULL,NULL),(97,3.30,3.45,4.00,4.00,NULL),(98,NULL,NULL,NULL,NULL,NULL),(99,2.86,3.90,4.40,3.60,NULL),(100,3.00,3.60,NULL,NULL,NULL),(101,2.86,3.80,4.30,3.90,NULL),(102,2.86,3.41,3.96,3.90,NULL),(103,3.00,3.55,4.10,3.60,NULL),(104,3.00,3.55,4.10,NULL,NULL),(105,NULL,NULL,NULL,NULL,NULL),(106,2.96,3.30,NULL,NULL,NULL),(107,3.30,3.60,3.88,3.46,NULL),(108,2.85,3.64,4.20,NULL,NULL),(109,3.30,3.90,4.50,3.46,NULL),(110,2.89,NULL,4.09,3.48,NULL),(111,3.20,NULL,4.71,3.80,NULL),(112,2.77,3.50,4.00,3.90,NULL);
/*!40000 ALTER TABLE `gas_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gas_stations`
--

DROP TABLE IF EXISTS `gas_stations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gas_stations` (
  `station_id` int NOT NULL AUTO_INCREMENT,
  `address1` varchar(30) DEFAULT NULL,
  `address2` varchar(30) DEFAULT NULL,
  `city` char(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `zipcode` varchar(10) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `brand` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `priceRegular` decimal(4,2) DEFAULT NULL,
  `priceMidGrade` decimal(4,2) DEFAULT NULL,
  `pricePremium` decimal(4,2) DEFAULT NULL,
  `priceDiesel` decimal(4,2) DEFAULT NULL,
  `date_recorded` date DEFAULT NULL,
  PRIMARY KEY (`station_id`),
  UNIQUE KEY `UQ_ADDRESS_UNIQUE` (`address1`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gas_stations`
--

LOCK TABLES `gas_stations` WRITE;
/*!40000 ALTER TABLE `gas_stations` DISABLE KEYS */;
INSERT INTO `gas_stations` VALUES (2,'4005 Washtenaw Avenue',NULL,'Ann Arbor','MI','48108','Amoco','amoco',3.20,3.80,4.30,3.80,'2025-10-14'),(3,'3555 Washtenaw Avenue',NULL,'Ann Arbor','MI','48104','Marathon Gas','marathon',NULL,NULL,NULL,NULL,'2025-10-14'),(4,'3240 Washtenaw Avenue',NULL,'Ann Arbor','MI','48104','Shell','shell',3.10,3.67,5.00,4.00,'2025-10-14'),(5,'3031 Washtenaw Avenue',NULL,'Ann Arbor','MI','48104','bp','bp',2.90,3.70,4.30,NULL,'2025-10-14'),(6,'1420 E Stadium Boulevard',NULL,'Ann Arbor','Mi','48104','Circle K','circlek',3.08,3.58,4.08,3.92,'2025-10-14'),(7,'3000 Carpenter Road',NULL,'Ypsilanti','MI','48197','Speedway','Speedway',3.08,3.63,4.18,NULL,'2025-10-14'),(8,'3200 Carpenter Road',NULL,'Ypsilanti','MI','48197','Kroger Fuel Center','kroger',3.08,3.58,4.08,3.70,'2025-10-14'),(9,'4975 Washtenaw Avenue',NULL,'Ypsilanti','MI','48108','bp','bp',3.20,3.60,4.50,NULL,'2025-10-14'),(11,'3995 Carpenter Road',NULL,'Ypsilanti','MI','48197','Meijer Express Gas Station','meijer',3.00,3.50,4.00,3.66,'2025-10-14'),(12,'501 S Main Street',NULL,'Chelsea','MI','48118','Mobil','mobil',3.25,3.90,NULL,NULL,'2025-10-28'),(13,'1629 S Main St',NULL,'Chelsea','MI','48118','Shell','shell',3.30,4.05,4.80,3.90,'2025-10-28'),(14,'930 S Main St',NULL,'Chelsea','MI','48118','Speedway','speedway',3.25,3.85,4.45,3.90,'2025-10-28'),(15,'5 S Fletcher Road',NULL,'Chelsea','MI','48118','Chelsea Gas And Goods','misc',NULL,NULL,NULL,NULL,'2025-10-28'),(16,'3535 Jackson Road',NULL,'Ann Arbor','MI','48103','Marathon Gas','marathon',3.30,NULL,4.50,NULL,'2025-10-28'),(17,'324 N Zeeb Rd',NULL,'Ann Arbor','Mi','48103','bp','bp',3.40,4.30,4.80,3.90,'2025-10-28'),(18,'3535 Jackson Rd',NULL,'Ann Arbor','Mi','48103','Marathon Gas','marathon',3.30,NULL,4.50,NULL,'2025-10-28'),(21,'5671 Jackson Rd',NULL,'Ann Arbor','Mi','48103','Meijer Express Gas Station','meijer',NULL,NULL,NULL,NULL,'2025-10-28'),(22,'5680 Jackson Rd',NULL,'Ann Arbor','Mi','48103','Shell','shell',3.06,3.90,4.56,3.80,'2025-10-28'),(23,'195 Baker Rd',NULL,'Dexter','Mi','48130','Pilot Travel Center','pilot',3.06,3.60,4.14,4.10,'2025-10-28'),(24,'750 Baker Rd',NULL,'Dexter','Mi','48130','Pilot','pilot',3.06,3.66,4.16,4.10,'2025-10-28'),(25,'200 Baker Rd',NULL,'Dexter','Mi','48130','Pilot','pilot',3.06,3.52,4.16,4.01,'2025-10-28'),(26,'6999 E Michigan Ave',NULL,'Saline','Mi','48176','Citgo','citgo',3.10,3.60,NULL,3.80,'2025-10-28'),(27,'924 E Michigan Ave',NULL,'Saline','Mi','48176','bp','bp',3.20,3.50,4.20,NULL,'2025-10-28'),(28,'134 E Michigan Ave',NULL,'Saline','Mi','48176','Speedway','Speedway',2.90,3.50,4.10,3.90,'2025-10-28'),(29,'3510 E Willis Rd',NULL,'Milan','Mi','48160','BP','bp',2.90,3.50,4.10,3.90,'2025-10-28'),(30,'501 W Main St',NULL,'Milan','Mi','48160','Shell','shell',3.00,3.50,4.00,3.90,'2025-10-28'),(31,'531 W Main St',NULL,'Milan','Mi','48160','Kroger Fuel Center','kroger',3.00,3.50,4.00,3.90,'2025-10-28'),(32,'10945 Belleville Rd',NULL,'Belleville','Mi','48111','Marathon Gas','marathon',3.20,3.80,4.40,NULL,'2025-10-28'),(33,'10950 Belleville Rd',NULL,'Belleville','Mi','48111','Mobil','mobil',3.10,3.80,4.40,3.90,'2025-10-28'),(34,'11530 Belleville Rd',NULL,'Belleville','Mi','48111','Shell','shell',3.20,3.70,4.40,NULL,'2025-10-28'),(35,'496 Main St',NULL,'Belleville','Mi','48111','Sunoco','sunoco',2.88,NULL,NULL,NULL,'2025-10-28'),(36,'25 South St',NULL,'Belleville','Mi','48111','Marathon Gas','marathon',2.98,3.58,4.18,NULL,'2025-10-28'),(37,'15400 Sumpter Rd',NULL,'Van Buren Township','Mi','48111','bp','bp',2.98,NULL,NULL,NULL,'2025-10-28'),(38,'17441 Sumpter Rd',NULL,'Van Buren Township','Mi','48111','Sunoco','sunoco',2.99,NULL,4.19,3.80,'2025-10-28'),(39,'19731 Sumpter Rd',NULL,'Van Buren Township','Mi','48111','bp','bp',2.98,NULL,4.28,3.80,'2025-10-28'),(40,'22422 Wick Rd',NULL,'Taylor','Mi','48180','Exxon','exxon',2.98,3.50,4.30,NULL,'2025-10-28'),(41,'21943 Ecorse Rd',NULL,'Taylor','Mi','48180','Speedway','speedway',3.30,3.80,4.40,3.90,'2025-10-28'),(42,'22027 Van Born Rd',NULL,'Taylor','Mi','48180','Exxon','exxon',2.80,3.50,4.10,NULL,'2025-10-28'),(43,'7000 Monroe Blvd',NULL,'Taylor','Mi','48180','Kroger Fuel Center','kroger',2.90,3.40,3.90,3.80,'2025-10-28'),(44,'4551 Beech Daly Rd',NULL,'Dearborn Heights','Mi','48125','bp','bp',2.90,NULL,NULL,NULL,'2025-10-28'),(46,'24344 Ecorse Rd',NULL,'Taylor','Mi','48180','Marathon Gas Fasttrack Market','marathon',2.90,3.50,4.10,3.90,'2025-10-28'),(47,'9225 Telegraph Rd',NULL,'Taylor','Mi','48180','bp','bp',2.95,3.85,4.00,NULL,'2025-10-28'),(48,'19841 Schoolcraft Rd',NULL,'Detroit','Mi','48223','CITGO','citgo',2.69,3.79,NULL,NULL,'2025-10-28'),(49,'24000 Plymouth Rd',NULL,'Redford','Mi','48239','Exxon','exxon',2.96,3.58,4.26,3.60,'2025-10-28'),(50,'14545 Ford Rd',NULL,'Dearborn','Mi','48126','Exxon','exxon',3.00,NULL,NULL,3.60,'2025-10-28'),(51,'161 W 9 Mile Rd',NULL,'Hazel Park','Mi','48030','Mobil','mobil',2.86,4.00,NULL,3.80,'2025-10-28'),(52,'1830 8 Mile Rd',NULL,'Highland Park','Mi','48203','bp','bp',2.80,NULL,NULL,NULL,'2025-10-28'),(53,'4100 8 Mile Rd',NULL,'Detroit','Mi','48234','Shell','shell',NULL,NULL,4.10,NULL,'2025-10-28'),(54,'13727 Plumbrook Rd',NULL,'Sterling Heights','Mi','48312','Marathon Gas','marathon',3.00,3.50,4.00,4.00,'2025-10-28'),(55,'35891 Utica Rd',NULL,'Clinton Township','Mi','48035','bp','bp',2.90,NULL,NULL,NULL,'2025-10-28'),(56,'20705 E Thirteen Mile Rd',NULL,'Roseville','Mi','48066','Kroger Fuel Center','kroger',3.00,3.60,4.00,3.90,'2025-10-28'),(57,'25025 Hoover Rd',NULL,'Warren','Mi','48089','Shell','shell',3.00,3.70,4.20,3.60,'2025-10-28'),(58,'27248 Van Dyke Ave',NULL,'Warren','Mi','48093','Circle K','circlek',3.30,3.50,4.00,3.92,'2025-10-28'),(59,'130 E 11 Mile RD',NULL,'Madison Heights','Mi','48071','Exxon','exxon',NULL,NULL,NULL,NULL,'2025-10-28'),(60,'39600 Van Dyke Ave',NULL,'Sterling Heights','Mi','48313','Shell','shell',2.99,4.00,4.70,3.60,'2025-10-28'),(61,'4889 Rochester Rd',NULL,'Troy','Mi','48085','Kroger Fuel Center','kroger',3.20,3.70,4.20,3.80,'2025-10-28'),(62,'5015 Livernois Rd',NULL,'Troy','Mi','48098','Mobil','mobil',3.30,3.00,4.70,NULL,'2025-10-28'),(63,'2017 Livernois Rd',NULL,'Troy','Mi','48083','Sunoco','sunoco',3.25,3.97,NULL,4.30,'2025-10-28'),(64,'2980 John R Rd',NULL,'Troy','Mi','48083','Speedway','speedway',3.30,3.90,4.50,3.90,'2025-10-28'),(65,'5950 15 Mile Rd',NULL,'Sterling Heights','Mi','48312','bp','bp',NULL,NULL,NULL,NULL,'2025-10-28'),(66,'15341 23 Mile Rd',NULL,'Shelby Township','Mi','48315','Kroger Fuel Center','kroger',3.04,3.54,4.04,3.40,'2025-10-28'),(67,'6980 N Rochester Rd',NULL,'Rochester Hills','Mi','48306','Speedway','speedway',3.10,3.70,4.30,3.80,'2025-10-28'),(68,'100 University Dr',NULL,'Rochester','Mi','48307','bp','bp',3.30,3.90,4.35,3.90,'2025-10-28'),(69,'1010 S Rochester Rd',NULL,'Rochester','Mi','48307','Speedway','speedway',3.20,3.80,4.40,3.90,'2025-10-28'),(70,'8069 22 Mile Rd',NULL,'Utica','Mi','48317','Circle K','circlek',2.98,3.48,3.98,3.39,'2025-10-28'),(71,'749 Featherstone St',NULL,'Pontiac','Mi','48342','Mobil','mobil',3.10,3.70,NULL,3.70,'2025-10-28'),(72,'850 Brown Rd',NULL,'Auburn Hills','Mi','48326','Meijer Express Gas Station','meijer',2.96,3.56,4.06,3.76,'2025-10-28'),(73,'1085 Joslyn Ave',NULL,'Pontiac','Mi','48340','Sunoco','sunoco',2.95,3.35,3.75,3.75,'2025-10-28'),(74,'10050 Clyde Rd',NULL,'Fenton','Mi','48430','Mobil','mobil',3.30,3.83,4.38,3.90,'2025-11-04'),(75,'10440 Highland Rd',NULL,'Hartland','Mi','48353','bp','bp',3.30,3.80,4.43,3.90,'2025-11-04'),(76,'10070 Highland Rd',NULL,'Hartland','Mi','48353','bp','bp',3.30,3.90,4.50,4.00,'2025-11-04'),(77,'20015 Hickory Ridge Rd',NULL,'Holly','Mi','48442','Marathon','marathon',3.00,NULL,NULL,3.72,'2025-11-04'),(78,'3305 Highland Rd',NULL,'Milford','Mi','48380','bp','bp',3.00,3.40,3.95,3.72,'2025-11-04'),(79,'268 W. Highland',NULL,'Highland','Mi','48357','Mobil','Mobil',3.18,3.78,4.38,3.78,'2025-11-04'),(80,'2915 E Highland Rd',NULL,'Highland Township','Mi','48356','Mobil','Mobil',3.30,3.70,4.30,3.90,'2025-11-04'),(81,'3452 Old US 23',NULL,'Brighton','Mi','48114','Exxon','exxon',NULL,NULL,NULL,NULL,'2025-11-04'),(82,'8281 Grand River Ave',NULL,'Brighton','Mi','48114','Shell','shell',3.30,3.85,4.60,3.90,'2025-11-04'),(83,'4525 E Grand River Ave',NULL,'Howell','Mi','48843','Sunoco','sunoco',3.18,3.63,NULL,3.60,'2025-11-04'),(84,'106 W Highland Rd',NULL,'Howell','Mi','48843','Kroger Fuel Center','kroger',3.30,3.70,4.20,3.90,'2025-11-04'),(85,'3100 W Highland Rd',NULL,'Howell','Mi','48843','Mobil','mobil',3.30,3.90,4.50,NULL,'2025-11-04'),(86,'1360 N Burkhart Rd',NULL,'Howell','Mi','48855','Marathon Gas','marathon',3.26,3.85,NULL,3.90,'2025-11-04'),(87,'8030 Mason Rd',NULL,'Fowlerville','Mi','48836','Mobil','mobil',3.10,3.40,NULL,3.70,'2025-11-04'),(88,'3135 Fowlerville Rd',NULL,'Fowlerville','Mi','48836','Mobil','mobil',3.16,3.66,4.23,3.60,'2025-11-04'),(89,'203 W Grand River Ave',NULL,'Fowlerville','Mi','48836','bp','bp',NULL,NULL,NULL,NULL,'2025-11-04'),(90,'935 S Grand Ave',NULL,'Fowlerville','Mi','48836','bp','bp',3.16,3.88,4.43,3.60,'2025-11-04'),(91,'941 S Grand Ave',NULL,'Fowlerville','Mi','48836','Exxon','exxon',3.18,NULL,4.30,3.70,'2025-11-04'),(92,'1119 W Main St',NULL,'Owosso','Mi','48867','Shell','shell',2.94,3.44,3.84,3.86,'2025-11-04'),(93,'1740 W M 21',NULL,'Owosso','Mi','48867','Sunoco','sunoco',2.82,3.32,3.82,3.67,'2025-11-04'),(94,'1315 E M 21',NULL,'Owosso','Mi','48867','Kroger Fuel Center','kroger',2.83,3.33,3.83,3.67,'2025-11-04'),(95,'1655 North Shiawassee St',NULL,'Owosso','Mi','48867','Speedway','speedway',3.30,3.90,4.50,4.00,'2025-11-04'),(96,'100 Woodworth Ave',NULL,'Alma','Mi','48801','Citgo','citgo',2.90,NULL,NULL,NULL,'2025-11-04'),(97,'100 W Lincoln Rd',NULL,'Alma','Mi','48801','Mobil','mobil',3.30,3.45,4.00,4.00,'2025-11-04'),(98,'10673 W St Charles Rd',NULL,'Sumner','Mi','48889','Sunoco','sunoco',NULL,NULL,NULL,NULL,'2025-11-04'),(99,'2988 W Beal City Rd',NULL,'Mt Pleasant','Mi','48858','Citgo','citgo',2.86,3.90,4.40,3.60,'2025-11-04'),(100,'50 N Coldwater Rd',NULL,'Weidman','Mi','48893','Marathon','marathon',3.00,3.60,NULL,NULL,'2025-11-04'),(101,'2977 W Remus Rd',NULL,'Mt Pleasant','Mi','48858','Mobil','mobil',2.86,3.80,4.30,3.90,'2025-11-04'),(102,'3011 N Wodruff Rd',NULL,'Weidman','Mi','48893','Shell','shell',2.86,3.41,3.96,3.90,'2025-11-04'),(103,'4130 E Rosebush Rd',NULL,'Rosebush','Mi','48878','Mobil','mobil',3.00,3.55,4.10,3.60,'2025-11-04'),(104,'3968 N Mission Rd',NULL,'Rosebush','Mi','48878','Shell','shell',3.00,3.55,4.10,NULL,'2025-11-04'),(105,'650 W Norton Ave',NULL,'Muskegon','Mi','49441','Meijer Express Gas Station','meijer',NULL,NULL,NULL,NULL,'2025-11-04'),(106,'1992 S Getty St',NULL,'Muskegon','Mi','49442','Sunoco','sunoco',2.96,3.30,NULL,NULL,'2025-11-04'),(107,'1196 E Sternberg Rd',NULL,'Norton Shores','Mi','49444','Exxon','exxon',3.30,3.60,3.88,3.46,'2025-11-04'),(108,'275 W Muskegon Ave',NULL,'Muskegon','Mi','49440','Shell','shell',2.85,3.64,4.20,NULL,'2025-11-04'),(109,'6582 Grand Haven Rd',NULL,'Norton Shores','Mi','49441','Speedway','speedway',3.30,3.90,4.50,3.46,'2025-11-04'),(110,'3592 E Apple Ave',NULL,'Muskegon','Mi','49442','bp','bp',2.89,NULL,4.09,3.48,'2025-11-04'),(111,'4000 Washtenaw Avenu',NULL,'Ann Arbor','MI','48108','Shell','shell',3.20,NULL,4.71,3.80,'2025-10-14'),(112,'704 W Chicago Rd',NULL,'Sturgis','Mi','49091','Sunoco','sunoco',2.77,3.50,4.00,3.90,'2025-11-11');
/*!40000 ALTER TABLE `gas_stations` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `gas_stations_BEFORE_INSERT` BEFORE INSERT ON `gas_stations` FOR EACH ROW BEGIN
	IF NEW.date_recorded IS NULL THEN
		SET NEW.date_recorded = CURDATE();
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_gas_stations_after_insert` AFTER INSERT ON `gas_stations` FOR EACH ROW BEGIN
    -- The T-SQL MERGE logic is replaced by MySQL's "upsert" statement:
    -- INSERT a new row. If a row with the same 'station_id' (which must be
    -- a primary or unique key in gas_history) already exists, then UPDATE it.
    
    INSERT INTO Gas_history 
        (station_id, priceRegular, priceMidGrade, pricePremium, priceDiesel)
    VALUES 
        (NEW.station_id, NEW.priceRegular, NEW.priceMidGrade, NEW.pricePremium, NEW.priceDiesel)
    ON DUPLICATE KEY UPDATE
        priceRegular = NEW.priceRegular,
        priceMidGrade = NEW.priceMidGrade,
        pricePremium = NEW.pricePremium,
        priceDiesel = NEW.priceDiesel;

    -- Note: NEW.column_name refers to the values of the row just inserted.
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `gas_stations_BEFORE_UPDATE` BEFORE UPDATE ON `gas_stations` FOR EACH ROW BEGIN
	IF NEW.date_recorded IS NULL THEN
		SET NEW.date_recorded = CURDATE();
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_gas_stations_after_update` AFTER UPDATE ON `gas_stations` FOR EACH ROW BEGIN
    -- The logic for an update is identical to the insert in this case,
    -- as the MERGE always updates the existing row in Gas_history or inserts it.
    
    INSERT INTO Gas_history 
        (station_id, priceRegular, priceMidGrade, pricePremium, priceDiesel)
    VALUES 
        (NEW.station_id, NEW.priceRegular, NEW.priceMidGrade, NEW.pricePremium, NEW.priceDiesel)
    ON DUPLICATE KEY UPDATE
        priceRegular = NEW.priceRegular,
        priceMidGrade = NEW.priceMidGrade,
        pricePremium = NEW.pricePremium,
        priceDiesel = NEW.priceDiesel;

    -- Note: We use NEW.column_name, which holds the post-update values.
    -- If you only wanted to fire the trigger when prices *actually changed*, 
    -- you would add an IF condition here checking NEW.priceRegular <> OLD.priceRegular OR ...
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sysdiagrams`
--

DROP TABLE IF EXISTS `sysdiagrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sysdiagrams` (
  `name` varchar(160) NOT NULL,
  `principal_id` int NOT NULL,
  `diagram_id` int NOT NULL,
  `version` int DEFAULT NULL,
  `definition` longblob,
  PRIMARY KEY (`diagram_id`),
  UNIQUE KEY `UK_principal_name` (`principal_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysdiagrams`
--

LOCK TABLES `sysdiagrams` WRITE;
/*!40000 ALTER TABLE `sysdiagrams` DISABLE KEYS */;
INSERT INTO `sysdiagrams` VALUES ('Gas Database Diagram',1,1,1,_binary '\Ğ\Ïà¡±\Z\á\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0>\0\0şÿ	\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0şÿÿÿ\0\0\0\0\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿıÿÿÿ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0şÿÿÿşÿÿÿ\0\0\0şÿÿÿşÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿR\0o\0o\0t\0 \0E\0n\0t\0r\0y\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÿÿÿÿÿÿÿ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0LQúB=\Ü\0\0\0À\0\0\0\0\0\0D\0d\0s\0X\0M\0L\0S\0t\0r\0e\0a\0m\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0ÿÿÿÿÿÿÿÿÿÿÿÿ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\è\0\0\0\0\0\0S\0c\0h\0e\0m\0a\0 \0U\0D\0V\0 \0D\0e\0f\0a\0u\0l\0t\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0&\0\0\0\0\0\0\0ÿÿÿÿ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0D\0S\0R\0E\0F\0-\0S\0C\0H\0E\0M\0A\0-\0C\0O\0N\0T\0E\0N\0T\0S\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0,\0ÿÿÿÿ\0\0\0ÿÿÿÿ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0<\0\0\0\0\0\0<dds><diagram fontclsid=\"{77D2C92D-7779-11D8-9070-00065B840D9C}\" mouseiconclsid=\"{0BE35204-8F91-11CE-9DE3-00AA004BB851}\" defaultlayout=\"MSDDS.Rectilinear\" defaultlineroute=\"MSDDS.Rectilinear\" version=\"7\" nextobject=\"5\" scale=\"100\" pagebreakanchorx=\"0\" pagebreakanchory=\"0\" pagebreaksizex=\"0\" pagebreaksizey=\"0\" scrollleft=\"0\" scrolltop=\"-4657\" gridx=\"150\" gridy=\"150\" marginx=\"5000\" marginy=\"5000\" zoom=\"100\" x=\"23372\" y=\"13741\" backcolor=\"-2147483643\" defaultpersistence=\"3\" PrintPageNumbersMode=\"3\" PrintMarginTop=\"0\" PrintMarginBottom=\"635\" PrintMarginLeft=\"0\" PrintMarginRight=\"0\" marqueeselectionmode=\"1\" mousepointer=\"0\" snaptogrid=\"1\" autotypeannotation=\"1\" showscrollbars=\"1\" viewpagebreaks=\"0\" donotforceconnectorsbehindshapes=\"1\"><font><ddsxmlobjectstreamwrapper binary=\"000008003000000000020000\"/></font><mouseicon><ddsxmlobjectstreamwrapper binary=\"6c74000000000000\"/></mouseicon></diagram><layoutmanager><ddsxmlobj><property name=\"sch_labels_visible\" value=\"0\" vartype=\"11\"/></ddsxmlobj></layoutmanager><ddscontrol controlprogid=\"{623AC075-2C77-4873-883D-930B4364B4BC}\" tooltip=\"CPS298_Gas_Stations\" left=\"11100\" top=\"0\" logicalid=\"1\" controlid=\"1\" masterid=\"0\" hint1=\"0\" hint2=\"0\" width=\"8043\" height=\"7902\" noresize=\"0\" nomove=\"0\" nodefaultattachpoints=\"0\" autodrag=\"0\" usedefaultiddshape=\"0\" selectable=\"1\" showselectionhandles=\"0\" allownudging=\"1\" isannotation=\"0\" dontautolayout=\"0\" groupcollapsed=\"0\" tabstop=\"1\" visible=\"1\" snaptogrid=\"1\"><control><ddsxmlobjectstreaminitwrapper binary=\"21433412080000006b1f0000de1e00007856341207000000140100004300500053003200390038005f004700610073005f00530074006100740069006f006e0073000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000005000000540000002c0000002c0000002c000000340000000000000000000000383e0000b1210000000000002d0100000d0000000c000000070000001c0100002e0e00009a0b000028050000720600007e040000bc070000a6090000c8050000a60900003a0c00005c08000000000000010000006b1f0000de1e0000000000000c0000000c00000002000000020000001c0100002c1000000000000001000000f91b00000805000000000000010000000100000002000000020000001c0100002e0e00000100000000000000f91b0000d302000000000000000000000000000002000000020000001c0100002e0e00000000000000000000dc4b0000b121000000000000000000000d00000004000000040000001c0100002e0e0000c2100000500a000078563412040000007000000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f000000140000004300500053003200390038005f004700610073005f00530074006100740069006f006e0073000000\"/></control><layoutobject><ddsxmlobj><property name=\"ActiveTableViewMode\" value=\"1\" vartype=\"8\"/><property name=\"TableViewMode:0\" value=\"4,0,284,0,3630,1,2970,5,1980\" vartype=\"8\"/><property name=\"TableViewMode:1\" value=\"2,0,284,0,4140\" vartype=\"8\"/><property name=\"TableViewMode:2\" value=\"2,0,284,0,3630\" vartype=\"8\"/><property name=\"TableViewMode:3\" value=\"2,0,284,0,3630\" vartype=\"8\"/><property name=\"TableViewMode:4\" value=\"4,0,284,0,3630,12,4290,11,2640\" vartype=\"8\"/></ddsxmlobj></layoutobject><shape groupshapeid=\"0\" groupnode=\"0\"/></ddscontrol><ddscontrol controlprogid=\"{623AC075-2C77-4873-883D-930B4364B4BC}\" tooltip=\"Gas_Price_History\" left=\"0\" top=\"0\" logicalid=\"2\" controlid=\"2\" masterid=\"0\" hint1=\"0\" hint2=\"0\" width=\"8043\" height=\"3951\" noresize=\"0\" nomove=\"0\" nodefaultattachpoints=\"0\" autodrag=\"0\" usedefaultiddshape=\"0\" selectable=\"1\" showselectionhandles=\"0\" allownudging=\"1\" isannotation=\"0\" dontautolayout=\"0\" groupcollapsed=\"0\" tabstop=\"1\" visible=\"1\" snaptogrid=\"1\"><control><ddsxmlobjectstreaminitwrapper binary=\"21433412080000006b1f00006f0f00007856341207000000140100004700610073005f00500072006900630065005f0048006900730074006f0072007900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000005000000540000002c0000002c0000002c000000340000000000000000000000383e000077140000000000002d010000070000000c000000070000001c0100002e0e00009a0b000028050000720600007e040000bc070000a6090000c8050000a60900003a0c00005c08000000000000010000006b1f00006f0f000000000000050000000500000002000000020000001c0100002c1000000000000001000000f91b00000805000000000000010000000100000002000000020000001c0100002e0e00000100000000000000f91b0000d302000000000000000000000000000002000000020000001c0100002e0e00000000000000000000dc4b0000b121000000000000000000000d00000004000000040000001c0100002e0e0000c2100000500a000078563412040000006c00000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f000000120000004700610073005f00500072006900630065005f0048006900730074006f00720079000000\"/></control><layoutobject><ddsxmlobj><property name=\"ActiveTableViewMode\" value=\"1\" vartype=\"8\"/><property name=\"TableViewMode:0\" value=\"4,0,284,0,3630,1,2970,5,1980\" vartype=\"8\"/><property name=\"TableViewMode:1\" value=\"2,0,284,0,4140\" vartype=\"8\"/><property name=\"TableViewMode:2\" value=\"2,0,284,0,3630\" vartype=\"8\"/><property name=\"TableViewMode:3\" value=\"2,0,284,0,3630\" vartype=\"8\"/><property name=\"TableViewMode:4\" value=\"4,0,284,0,3630,12,4290,11,2640\" vartype=\"8\"/></ddsxmlobj></layoutobject><shape groupshapeid=\"0\" groupnode=\"0\"/></ddscontrol><ddscontrol semanticcookie=\"0100000001000000640062006f00000046004b005f004700610073005f00500072006900630065005f0048006900730074006f00720079005f004300500053003200390038005f004700610073005f00530074006100740069006f006e0073000000\" controlprogid=\"MSDDS.Polyline.080.1\" tooltip=\"Relationship \'FK_Gas_Price_History_CPS298_Gas_Stations\' between \'CPS298_Gas_Stations\' and \'Gas_Price_History\'\" left=\"7743\" top=\"493\" logicalid=\"3\" controlid=\"3\" masterid=\"0\" hint1=\"0\" hint2=\"0\" width=\"3657\" height=\"815\" noresize=\"0\" nomove=\"0\" nodefaultattachpoints=\"1\" autodrag=\"0\" usedefaultiddshape=\"0\" selectable=\"1\" showselectionhandles=\"0\" allownudging=\"1\" isannotation=\"0\" dontautolayout=\"0\" groupcollapsed=\"0\" tabstop=\"1\" visible=\"1\" snaptogrid=\"0\"><control><ddsxmlobj><polyline endtypedst=\"0\" endtypesrc=\"2\" usercolor=\"15790320\" linestyle=\"0\" linerender=\"0\" customendtypedstid=\"0\" customendtypesrcid=\"0\" adornsvisible=\"1\"><adornment percentpos=\"49.9836440955185\" controlid=\"4\" width=\"6113\" height=\"335\" side=\"0\" behavior=\"3\" himetric=\"1528\" distfromline=\"175\" startobj=\"0\" x=\"6515\" y=\"390\" visible=\"0\" allowoverlap=\"1\" usepercent=\"1\"/></polyline></ddsxmlobj></control><layoutobject><ddsxmlobj/></layoutobject><connector sourceid=\"1\" destid=\"2\" sourceattachpoint=\"114\" destattachpoint=\"115\" segmenteditmode=\"0\" bendpointeditmode=\"0\" bendpointvisibility=\"0\" relatedid=\"0\" virtual=\"0\"><point x=\"11100\" y=\"900\"/><point x=\"8043\" y=\"900\"/></connector></ddscontrol><ddscontrol semanticcookie=\"01f6985708f9fd2a\" controlprogid=\"MSDDS.Text.080.1\" left=\"6515\" top=\"390\" logicalid=\"4\" controlid=\"4\" masterid=\"3\" hint1=\"0\" hint2=\"0\" width=\"6113\" height=\"335\" noresize=\"1\" nomove=\"0\" nodefaultattachpoints=\"1\" autodrag=\"1\" usedefaultiddshape=\"1\" selectable=\"1\" showselectionhandles=\"1\" allownudging=\"1\" isannotation=\"0\" dontautolayout=\"1\" groupcollapsed=\"0\" tabstop=\"0\" visible=\"0\" snaptogrid=\"0\"><control><ddsxmlobjectstreaminitwrapper binary=\"00020000e11700004f010000030000000000ffffff000800008001000000150001000000900180380100065461686f6d61280046004b005f004700610073005f00500072006900630065005f0048006900730074006f00720079005f004300500053003200390038005f004700610073005f00530074006100740069006f006e00730000000000\"/></control><layoutobject><ddsxmlobj/></layoutobject><shape groupshapeid=\"0\" groupnode=\"0\"/></ddscontrol></dds>\r\n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0şÿÿÿ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\n\0\0\0\0\0\0\0\0\0\r\0\0\0şÿÿÿşÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ\0\0\0\0\0\0\0\0\0\0\0\0\0\0Na¼\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Û\æ°\é\Ğ­Q\0 \ÉW9\0\0\0`\ãJúB=\Ü\0\0HE\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ö\0\0D\0a\0t\0a\0 \0S\0o\0u\0r\0c\0e\0=\0L\0A\0P\0T\0O\0P\07\04\08\00\0\\\0S\0Q\0L\0E\0X\0P\0R\0E\0S\0S\0;\0I\0n\0i\0t\0i\0a\0l\0 \0C\0a\0t\0a\0l\0o\0g\0=\0\"\0C\0P\0S\02\09\08\0 \0G\0a\0s\0 \0A\0p\0p\0\"\0;\0I\0n\0t\0e\0g\0r\0a\0t\0e\0d\0 \0S\0e\0c\0u\0r\0i\0t\0y\0=\0T\0r\0u\0e\0;\0M\0u\0l\0t\0i\0p\0l\0e\0 \0A\0c\0t\0i\0v\0e\0 \0R\0e\0s\0u\0l\0t\0 \0S\0e\0t\0s\0=\0F\0a\0l\0s\0e\0;\0C\0o\0n\0n\0e\0c\0t\0 \0T\0i\0m\0e\0o\0u\0t\0=\03\00\0;\0T\0r\0u\0s\0t\0 \0S\0e\0r\0v\0e\0r\0 \0C\0e\0r\0t\0i\0f\0i\0c\0a\0t\0e\0=\0F\0a\0l\0s\0e\0;\0P\0a\0c\0k\0e\0t\0 \0S\0i\0z\0e\0=\04\00\09\06\0;\0A\0p\0p\0l\0i\0c\0a\0t\0i\0o\0n\0 \0N\0a\0m\0e\0=\0\"\0M\0i\0c\0r\0o\0s\0o\0f\0t\0 \0S\0Q\0L\0 \0S\0e\0r\0v\0e\0r\0 \0M\0a\0n\0a\0g\0e\0m\0e\0n\0t\0 \0S\0t\0u\0d\0i\0o\0\"\0\0\0\0€\0*\0\0\0G\0a\0s\0 \0D\0a\0t\0a\0b\0a\0s\0e\0 \0D\0i\0a\0g\0r\0a\0m\0\0\0\0&\0(\0\0\0C\0P\0S\02\09\08\0_\0G\0a\0s\0_\0S\0t\0a\0t\0i\0o\0n\0s\0\0\0\0\0\0d\0b\0o\0\0\0\0$\0$\0\0\0G\0a\0s\0_\0P\0r\0i\0c\0e\0_\0H\0i\0s\0t\0o\0r\0y\0\0\0\0\0\0d\0b\0o\0\0\0\0\0\0Ö…	³»kòEš¸7dğ2p\0N\0\0\0{\01\06\03\04\0C\0D\0D\07\0-\00\08\08\08\0-\04\02\0E\03\0-\09\0F\0A\02\0-\0B\06\0D\03\02\05\06\03\0B\09\01\0D\0}\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0S\0c\0h\0e\0m\0a\0 \0U\0D\0V\0 \0D\0e\0f\0a\0u\0l\0t\0 \0P\0o\0s\0t\0 \0V\06\0\0\0\0\0\0\0\0\0\0\0\0\06\0\0ÿÿÿÿÿÿÿÿÿÿÿÿ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0bˆR');
/*!40000 ALTER TABLE `sysdiagrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'cps298 gas app'
--

--
-- Dumping routines for database 'cps298 gas app'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-11 15:51:44
