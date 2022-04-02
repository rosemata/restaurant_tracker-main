CREATE DATABASE  IF NOT EXISTS `restaurant_tracker` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `restaurant_tracker`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: restaurant_tracker
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(15) NOT NULL,
  `name` varchar(40) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'630 551 1234','Kurtis Jemison','kurtis2@gmail.com'),(2,'630 694 9273','Roselle Mata','rmata@gmail.com'),(3,'458 894 5534','Jimmy John','jimmyjohn@gmail.com'),(4,'213 312 1239','Karen James','karenJames@gmail.com'),(5,'985 248 1235','Chuck E Cheese','chuck@cheese.com');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_order`
--

DROP TABLE IF EXISTS `customer_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_order` (
  `order_id` smallint NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `restaurant_id` smallint NOT NULL,
  `date` date NOT NULL,
  `total_cost` smallint NOT NULL,
  `num_items` smallint NOT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_id` (`order_id`),
  UNIQUE KEY `customer_id` (`customer_id`),
  UNIQUE KEY `restaurant_id` (`restaurant_id`),
  CONSTRAINT `customer_order_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_order_ibfk_2` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_order`
--

LOCK TABLES `customer_order` WRITE;
/*!40000 ALTER TABLE `customer_order` DISABLE KEYS */;
INSERT INTO `customer_order` VALUES (1,1,1,'2022-02-13',640,23),(2,2,2,'2022-02-16',23,4),(3,3,3,'2022-02-26',59,6),(4,4,4,'2022-02-13',78,7),(5,5,5,'2022-02-20',15,2);
/*!40000 ALTER TABLE `customer_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` int NOT NULL,
  `restaurant_id` smallint NOT NULL,
  `name` varchar(50) NOT NULL,
  `job_title` varchar(30) NOT NULL,
  `salary` int NOT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `employee_id` (`employee_id`),
  UNIQUE KEY `restaurant_id` (`restaurant_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (123,1,'Mort Becka','Line Cook',53000),(125,2,'Kemp Dinah','Host',30000),(217,3,'Jaye Normina','Hostess',30000),(236,5,'Odetta Keitha','Supervisor',100000),(256,4,'Kaleigh Christobel','Manager',80000);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `zip_code` char(5) NOT NULL,
  `city_name` varchar(30) NOT NULL,
  PRIMARY KEY (`zip_code`),
  UNIQUE KEY `zip_code` (`zip_code`),
  UNIQUE KEY `city_name` (`city_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES ('59101','Billings'),('11743','Huntington'),('30024','Mchenry'),('60011','Roselle'),('32728','Winter Springs');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `location_view`
--

DROP TABLE IF EXISTS `location_view`;
/*!50001 DROP VIEW IF EXISTS `location_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `location_view` AS SELECT 
 1 AS `zip_code`,
 1 AS `city_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `long_employee_name_view`
--

DROP TABLE IF EXISTS `long_employee_name_view`;
/*!50001 DROP VIEW IF EXISTS `long_employee_name_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `long_employee_name_view` AS SELECT 
 1 AS `employee_id`,
 1 AS `restaurant_id`,
 1 AS `name`,
 1 AS `job_title`,
 1 AS `salary`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `lots_of_employees_view`
--

DROP TABLE IF EXISTS `lots_of_employees_view`;
/*!50001 DROP VIEW IF EXISTS `lots_of_employees_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `lots_of_employees_view` AS SELECT 
 1 AS `restaurant_id`,
 1 AS `state`,
 1 AS `num_of_employees`,
 1 AS `city_name`,
 1 AS `employee_id`,
 1 AS `name`,
 1 AS `job_title`,
 1 AS `salary`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `id` smallint NOT NULL AUTO_INCREMENT,
  `order_id` smallint NOT NULL,
  `quantity` smallint NOT NULL,
  `cost` smallint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,13,10,100),(2,5,9,27),(3,89,13,37),(4,58,123,500),(5,78,329,121);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `restaurant_id` smallint NOT NULL AUTO_INCREMENT,
  `zip_code` char(5) NOT NULL,
  `state` varchar(20) NOT NULL,
  `num_of_employees` smallint NOT NULL,
  PRIMARY KEY (`restaurant_id`),
  UNIQUE KEY `restaurant_id` (`restaurant_id`),
  UNIQUE KEY `zip_code` (`zip_code`),
  CONSTRAINT `restaurant_ibfk_1` FOREIGN KEY (`zip_code`) REFERENCES `location` (`zip_code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,'59101','MT',10),(2,'11743','NY',15),(3,'30024','GA',18),(4,'60011','IL',12),(5,'32728','FL',29);
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `restaurant_avg_view`
--

DROP TABLE IF EXISTS `restaurant_avg_view`;
/*!50001 DROP VIEW IF EXISTS `restaurant_avg_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `restaurant_avg_view` AS SELECT 
 1 AS `restaurant_id`,
 1 AS `zip_code`,
 1 AS `state`,
 1 AS `num_of_employees`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `restaurant_city_view`
--

DROP TABLE IF EXISTS `restaurant_city_view`;
/*!50001 DROP VIEW IF EXISTS `restaurant_city_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `restaurant_city_view` AS SELECT 
 1 AS `restaurant_id`,
 1 AS `state`,
 1 AS `num_of_employees`,
 1 AS `city_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `restaurant_view`
--

DROP TABLE IF EXISTS `restaurant_view`;
/*!50001 DROP VIEW IF EXISTS `restaurant_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `restaurant_view` AS SELECT 
 1 AS `restaurant_id`,
 1 AS `zip_code`,
 1 AS `state`,
 1 AS `num_of_employees`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `location_view`
--

/*!50001 DROP VIEW IF EXISTS `location_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `location_view` AS select `location`.`zip_code` AS `zip_code`,`location`.`city_name` AS `city_name` from `location` where (`location`.`zip_code` >= 30000) order by `location`.`zip_code` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `long_employee_name_view`
--

/*!50001 DROP VIEW IF EXISTS `long_employee_name_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `long_employee_name_view` AS select `employee`.`employee_id` AS `employee_id`,`employee`.`restaurant_id` AS `restaurant_id`,`employee`.`name` AS `name`,`employee`.`job_title` AS `job_title`,`employee`.`salary` AS `salary` from `employee` where (length(`employee`.`name`) > 10) order by length(`employee`.`name`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `lots_of_employees_view`
--

/*!50001 DROP VIEW IF EXISTS `lots_of_employees_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `lots_of_employees_view` AS select `restaurant`.`restaurant_id` AS `restaurant_id`,`restaurant`.`state` AS `state`,`restaurant`.`num_of_employees` AS `num_of_employees`,`location`.`city_name` AS `city_name`,`employee`.`employee_id` AS `employee_id`,`employee`.`name` AS `name`,`employee`.`job_title` AS `job_title`,`employee`.`salary` AS `salary` from ((`restaurant` join `location` on((`location`.`zip_code` = `restaurant`.`zip_code`))) join `employee` on((`employee`.`restaurant_id` = `restaurant`.`restaurant_id`))) where (`restaurant`.`num_of_employees` > (select avg(`restaurant`.`num_of_employees`) from `restaurant`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `restaurant_avg_view`
--

/*!50001 DROP VIEW IF EXISTS `restaurant_avg_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `restaurant_avg_view` AS select `restaurant`.`restaurant_id` AS `restaurant_id`,`restaurant`.`zip_code` AS `zip_code`,`restaurant`.`state` AS `state`,`restaurant`.`num_of_employees` AS `num_of_employees` from `restaurant` where (`restaurant`.`num_of_employees` > (select avg(`restaurant`.`num_of_employees`) from `restaurant`)) order by `restaurant`.`restaurant_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `restaurant_city_view`
--

/*!50001 DROP VIEW IF EXISTS `restaurant_city_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `restaurant_city_view` AS select `restaurant`.`restaurant_id` AS `restaurant_id`,`restaurant`.`state` AS `state`,`restaurant`.`num_of_employees` AS `num_of_employees`,`location`.`city_name` AS `city_name` from (`restaurant` join `location` on((`location`.`zip_code` = `restaurant`.`zip_code`))) where exists(select `restaurant`.`num_of_employees`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `restaurant_view`
--

/*!50001 DROP VIEW IF EXISTS `restaurant_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `restaurant_view` AS select `restaurant`.`restaurant_id` AS `restaurant_id`,`restaurant`.`zip_code` AS `zip_code`,`restaurant`.`state` AS `state`,`restaurant`.`num_of_employees` AS `num_of_employees` from `restaurant` where (`restaurant`.`restaurant_id` > 1) order by `restaurant`.`restaurant_id` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-01 20:22:57
