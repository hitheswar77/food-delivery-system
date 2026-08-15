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
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_items` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `restaurant_id` int DEFAULT NULL,
  `item_name` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `restaurant_id` (`restaurant_id`),
  CONSTRAINT `menu_items_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`restaurant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--
-- WHERE:  restaurant_id IN (19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36)

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (40,19,'Chicken Biryani',350.00),(41,19,'Mutton Biryani',400.00),(42,19,'Vegetable Biryani',280.00),(43,19,'Biryani Combo',450.00),(44,20,'Paneer Tikka',320.00),(45,20,'Tandoori Chicken',380.00),(46,20,'Butter Chicken',360.00),(47,20,'Dal Makhani',280.00),(48,21,'Hakka Noodles',250.00),(49,21,'Chow Mein',280.00),(50,21,'Singapore Noodles',300.00),(51,21,'Noodle Combo',350.00),(52,22,'Crispy Fried Chicken',320.00),(53,22,'Spicy Chicken Wings',280.00),(54,22,'Chicken Drumsticks',260.00),(55,22,'Chicken Bucket',600.00),(56,23,'Tandoori Naan',180.00),(57,23,'Tandoori Roti',160.00),(58,23,'Tandoori Paneer',340.00),(59,23,'Tandoori Combo',420.00),(60,24,'Spaghetti Carbonara',320.00),(61,24,'Penne Arrabbiata',300.00),(62,24,'Fettuccine Alfredo',340.00),(63,24,'Pasta Combo',380.00),(64,25,'Chicken Momos',200.00),(65,25,'Vegetable Momos',180.00),(66,25,'Paneer Momos',220.00),(67,25,'Momos Platter',380.00),(68,26,'Green Curry',310.00),(69,26,'Pad Thai',290.00),(70,26,'Tom Yum Soup',250.00),(71,26,'Thai Combo',420.00),(72,27,'Grilled Chicken Steak',380.00),(73,27,'Grilled Fish',420.00),(74,27,'BBQ Ribs',450.00),(75,27,'Grill Platter',550.00),(76,28,'Masala Dosa',220.00),(77,28,'Paneer Dosa',240.00),(78,28,'Cheese Dosa',260.00),(79,28,'Dosa Combo',320.00),(80,29,'Classic Beef Burger',280.00),(81,29,'Spicy Paneer Burger',260.00),(82,29,'Double Cheese Burger',320.00),(83,29,'Burger Meal',380.00),(84,30,'Fish Fry',350.00),(85,30,'Shrimp Curry',420.00),(86,30,'Crab Masala',480.00),(87,30,'Seafood Combo',550.00),(88,31,'Chocolate Cake',280.00),(89,31,'Coffee with Pastry',220.00),(90,31,'Chocolate Mousse',240.00),(91,31,'Cafe Combo',340.00),(92,32,'Chow Mein',270.00),(93,32,'Fried Rice',250.00),(94,32,'Chicken Manchuria',300.00),(95,32,'Wok Combo',380.00),(96,33,'Samosa (4 pieces)',120.00),(97,33,'Aloo Samosa',140.00),(98,33,'Jalebi',180.00),(99,33,'Samosa Combo',250.00),(100,34,'Chocolate Chip Cookie',100.00),(101,34,'Croissant',150.00),(102,34,'Cheesecake Slice',200.00),(103,34,'Bakery Box',380.00),(104,35,'Smoked Chicken',380.00),(105,35,'BBQ Pulled Pork',420.00),(106,35,'Smoked Brisket',480.00),(107,35,'BBQ Platter',600.00),(108,36,'Vegan Buddha Bowl',320.00),(109,36,'Vegan Burger',280.00),(110,36,'Quinoa Salad',260.00),(111,36,'Vegan Meal Box',380.00);
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-05 23:03:58
