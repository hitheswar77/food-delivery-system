mysqldump: [Warning] Using a password on the command line interface can be insecure.
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: food_delivery
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurants` (
  `restaurant_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`restaurant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants`
--
-- WHERE:  restaurant_id IN (19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36)

LOCK TABLES `restaurants` WRITE;
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
INSERT INTO `restaurants` VALUES (19,'Biryani House','Yelhanka'),(20,'Spice Garden','Yelhanka'),(21,'Noodle King','Yelhanka'),(22,'Fried Chicken Hub','Whitefield'),(23,'Tandoori Express','Whitefield'),(24,'Pasta Palace','Whitefield'),(25,'Momos World','Koramangala'),(26,'Thai Garden','Koramangala'),(27,'Grill Master','Koramangala'),(28,'Dosa Corner','Indiranagar'),(29,'Burger Bliss','Indiranagar'),(30,'Seafood Delight','Indiranagar'),(31,'Choco Cafe','MG Road'),(32,'Wok Express','MG Road'),(33,'Samosa Station','MG Road'),(34,'Sweet Dreams Bakery','Jayanagar'),(35,'BBQ Smokehouse','Jayanagar'),(36,'Vegan Vibes','Jayanagar');
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-05 23:03:49
