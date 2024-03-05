CREATE DATABASE  IF NOT EXISTS `hotel` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hotel`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hotel
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int NOT NULL,
  `firstname` varchar(200) DEFAULT NULL,
  `surname` varchar(200) DEFAULT NULL,
  `tel` int DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Tebi','Bless',654321789,'tebi@gmail.com'),(2,'Nanda','Laure',678547329,'nanda@gmail.com'),(3,'Abdoul','Idriss',623456789,'abdoul@gmail.com'),(4,'Jane','Mary',698432567,'jane@gmail.com'),(5,'Poukam','Tresor',693453678,'poukam@gmail.com');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `id` int NOT NULL,
  `comments` varchar(200) DEFAULT NULL,
  `ratings` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `reservations_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reservations_id` (`reservations_id`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`reservations_id`) REFERENCES `reservations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,'i think they can do better',3,'2022-12-10',1),(2,'very good',4,'2024-02-19',4),(3,'normal',3,'2024-03-04',5);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` int NOT NULL,
  `payment_method` enum('cash','mobile money','orange money') DEFAULT NULL,
  `status` enum('paid','due','partially paid') DEFAULT NULL,
  `date` date DEFAULT NULL,
  `customers_id` int DEFAULT NULL,
  `rooms_id` int DEFAULT NULL,
  `services_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customers_id` (`customers_id`),
  KEY `rooms_id` (`rooms_id`),
  KEY `services_id` (`services_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`customers_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`rooms_id`) REFERENCES `rooms` (`id`),
  CONSTRAINT `payments_ibfk_3` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,'orange money','due','2024-02-14',5,5,3),(2,'cash','paid','2024-02-28',4,4,2),(3,'cash','paid','2022-12-28',2,3,1),(4,'mobile money','partially paid','2023-08-29',1,2,2),(5,'cash','due','2022-12-01',3,1,1);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservations` (
  `id` int NOT NULL,
  `arrival_date` date DEFAULT NULL,
  `departure_date` date DEFAULT NULL,
  `num_of_guests` int DEFAULT NULL,
  `special_preferences` varchar(100) DEFAULT NULL,
  `reservation_status` enum('confirmed','canceled','pending') DEFAULT NULL,
  `customers_id` int DEFAULT NULL,
  `rooms_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customers_id` (`customers_id`),
  KEY `rooms_id` (`rooms_id`),
  CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`customers_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`rooms_id`) REFERENCES `rooms` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
INSERT INTO `reservations` VALUES (1,'2022-12-03','2022-12-10',1,'bed types','confirmed',1,1),(2,'2023-09-01','2023-09-03',4,'extra pillows','pending',3,2),(3,'2023-01-01','2023-01-05',5,'pet accomodations','canceled',4,3),(4,'2024-02-16','2024-02-19',1,'refrigerators','confirmed',2,5),(5,'2024-03-01','2024-03-04',4,'speakers','confirmed',5,4);
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `id` int NOT NULL,
  `type` enum('single','double','suite') DEFAULT NULL,
  `status` enum('available','occupied','cleaning') DEFAULT NULL,
  `price_per_night` int DEFAULT NULL,
  `special_amenities` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,'single','available',30000,'none'),(2,'double','occupied',75000,'balcony'),(3,'suite','occupied',150000,'jacuzzi'),(4,'suite','cleaning',175000,'seaview'),(5,'single','cleaning',25000,'none'),(6,'double','available',90000,'balcony');
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `id` int NOT NULL,
  `service_name` enum('spa','restaurant','gym') DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `opening_hours` time DEFAULT NULL,
  `price` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'spa','a place to relax','10:00:00',12000),(2,'restaurant','a place to eat','08:00:00',2500),(3,'gym','used for sports','06:00:00',3500);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-05 17:40:19
