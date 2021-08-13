CREATE DATABASE  IF NOT EXISTS `buymedb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `buymedb`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: buymedb
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `username` varchar(16) NOT NULL DEFAULT 'used for login',
  `email` varchar(255) DEFAULT 'used for contact',
  `password` varchar(32) NOT NULL DEFAULT 'used for login',
  `isAdmin` bit(1) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('Admin','admin@test.com','adminpassword',_binary ''),('Soren','sorenmorici@gmail.com','gam171',NULL),('test Crep','fakeCrep@Gmail.com','fake',NULL);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admincomplaints`
--

DROP TABLE IF EXISTS `admincomplaints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admincomplaints` (
  `idcomplaint` int NOT NULL AUTO_INCREMENT,
  `username` varchar(16) DEFAULT NULL,
  `complaint` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idcomplaint`),
  KEY `complainer_idx` (`username`),
  CONSTRAINT `complainer` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admincomplaints`
--

LOCK TABLES `admincomplaints` WRITE;
/*!40000 ALTER TABLE `admincomplaints` DISABLE KEYS */;
INSERT INTO `admincomplaints` VALUES (1,'testing','Soren'),(3,'Soren','testing another'),(4,'Soren','one last one for good measure'),(5,'testing','can you change my password please?');
/*!40000 ALTER TABLE `admincomplaints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert`
--

DROP TABLE IF EXISTS `alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alert` (
  `al_username` varchar(16) NOT NULL,
  `a_interested` varchar(499) NOT NULL,
  PRIMARY KEY (`al_username`,`a_interested`),
  KEY `ali_interested_idx` (`a_interested`),
  CONSTRAINT `all_interested_users` FOREIGN KEY (`a_interested`) REFERENCES `list` (`interested_users_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `alu_username` FOREIGN KEY (`al_username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert`
--

LOCK TABLES `alert` WRITE;
/*!40000 ALTER TABLE `alert` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auction_history`
--

DROP TABLE IF EXISTS `auction_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auction_history` (
  `i_iditem` int NOT NULL,
  `i_username` varchar(16) NOT NULL,
  PRIMARY KEY (`i_iditem`,`i_username`),
  KEY `hu_username_idx` (`i_username`),
  CONSTRAINT `hi_iditem` FOREIGN KEY (`i_iditem`) REFERENCES `item` (`iditem`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hu_username` FOREIGN KEY (`i_username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auction_history`
--

LOCK TABLES `auction_history` WRITE;
/*!40000 ALTER TABLE `auction_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `auction_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bid`
--

DROP TABLE IF EXISTS `bid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bid` (
  `u_username` varchar(16) NOT NULL,
  `i_iditem` int NOT NULL,
  PRIMARY KEY (`u_username`,`i_iditem`),
  KEY `ib_iditem_idx` (`i_iditem`),
  CONSTRAINT `ib_iditem` FOREIGN KEY (`i_iditem`) REFERENCES `item` (`iditem`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ub_username` FOREIGN KEY (`u_username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bid`
--

LOCK TABLES `bid` WRITE;
/*!40000 ALTER TABLE `bid` DISABLE KEYS */;
/*!40000 ALTER TABLE `bid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index`
--

DROP TABLE IF EXISTS `index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `index` (
  `i_iditem` int NOT NULL,
  `x_interested_users_` varchar(499) NOT NULL,
  PRIMARY KEY (`x_interested_users_`,`i_iditem`),
  KEY `ii_interested_idx` (`x_interested_users_`),
  KEY `ii_interested` (`x_interested_users_`),
  KEY `ii_itemID_idx` (`i_iditem`),
  CONSTRAINT `ii_itemID` FOREIGN KEY (`i_iditem`) REFERENCES `item` (`iditem`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ix_interested_user` FOREIGN KEY (`x_interested_users_`) REFERENCES `list` (`interested_users_`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index`
--

LOCK TABLES `index` WRITE;
/*!40000 ALTER TABLE `index` DISABLE KEYS */;
/*!40000 ALTER TABLE `index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `iditem` int NOT NULL,
  `Seller_Username` varchar(16) DEFAULT NULL,
  `Product_Name` varchar(45) DEFAULT NULL,
  `Leaderboard` varchar(100) DEFAULT NULL,
  `Auction_Leader` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iditem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list`
--

DROP TABLE IF EXISTS `list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `list` (
  `i_iditem` int NOT NULL,
  `interested_users_` varchar(499) NOT NULL,
  PRIMARY KEY (`interested_users_`,`i_iditem`),
  KEY `il_iditem_idx` (`i_iditem`),
  CONSTRAINT `il_iditem` FOREIGN KEY (`i_iditem`) REFERENCES `item` (`iditem`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list`
--

LOCK TABLES `list` WRITE;
/*!40000 ALTER TABLE `list` DISABLE KEYS */;
/*!40000 ALTER TABLE `list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modify_item`
--

DROP TABLE IF EXISTS `modify_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modify_item` (
  `a_username` varchar(16) NOT NULL,
  `IDitem` int NOT NULL,
  PRIMARY KEY (`a_username`,`IDitem`),
  KEY `mi_IDitem_idx` (`IDitem`),
  CONSTRAINT `ai_username` FOREIGN KEY (`a_username`) REFERENCES `admin` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mi_iditem` FOREIGN KEY (`IDitem`) REFERENCES `item` (`iditem`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modify_item`
--

LOCK TABLES `modify_item` WRITE;
/*!40000 ALTER TABLE `modify_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `modify_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modify_user`
--

DROP TABLE IF EXISTS `modify_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modify_user` (
  `u_username` varchar(19) NOT NULL,
  `a_username` varchar(19) NOT NULL,
  PRIMARY KEY (`u_username`,`a_username`),
  KEY `a_username_idx` (`a_username`),
  CONSTRAINT `am_username` FOREIGN KEY (`a_username`) REFERENCES `admin` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `um_username` FOREIGN KEY (`u_username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modify_user`
--

LOCK TABLES `modify_user` WRITE;
/*!40000 ALTER TABLE `modify_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `modify_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `records`
--

DROP TABLE IF EXISTS `records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `records` (
  `c_username` varchar(16) NOT NULL,
  `i_iditem` int NOT NULL,
  PRIMARY KEY (`c_username`,`i_iditem`),
  KEY `ri_iditem_idx` (`i_iditem`),
  CONSTRAINT `ri_iditem` FOREIGN KEY (`i_iditem`) REFERENCES `item` (`iditem`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ru_username` FOREIGN KEY (`c_username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `records`
--

LOCK TABLES `records` WRITE;
/*!40000 ALTER TABLE `records` DISABLE KEYS */;
/*!40000 ALTER TABLE `records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
  `u_username` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `a_username` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`a_username`,`u_username`),
  KEY `username_idx` (`u_username`),
  CONSTRAINT `ar_username` FOREIGN KEY (`a_username`) REFERENCES `admin` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ur_username` FOREIGN KEY (`u_username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=ujis;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sell`
--

DROP TABLE IF EXISTS `sell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sell` (
  `i_iditem` int NOT NULL,
  PRIMARY KEY (`i_iditem`),
  CONSTRAINT `is_iditem` FOREIGN KEY (`i_iditem`) REFERENCES `item` (`iditem`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sell`
--

LOCK TABLES `sell` WRITE;
/*!40000 ALTER TABLE `sell` DISABLE KEYS */;
/*!40000 ALTER TABLE `sell` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `username` varchar(16) NOT NULL DEFAULT 'used for login',
  `password` varchar(32) NOT NULL DEFAULT 'used for login',
  `email` varchar(255) DEFAULT 'used for contact',
  `Credit_card` varchar(19) DEFAULT NULL,
  `Address` varchar(500) DEFAULT 'used for shipping',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Hold information for Customers of BuyMe, the online auction system.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('Soren','testingpasswords','sorenmorici@gmail.com','0123456789123456789','Barnegat, NJ'),('testing','testing pass','test@test.com','','');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usernotifications`
--

DROP TABLE IF EXISTS `usernotifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usernotifications` (
  `idNotifications` int NOT NULL AUTO_INCREMENT,
  `Notification` varchar(500) DEFAULT NULL,
  `username` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`idNotifications`),
  KEY `username_idx` (`username`),
  CONSTRAINT `username` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usernotifications`
--

LOCK TABLES `usernotifications` WRITE;
/*!40000 ALTER TABLE `usernotifications` DISABLE KEYS */;
INSERT INTO `usernotifications` VALUES (1,'this is a test notification','testing'),(2,'another notification','testing'),(3,'sorens notification','Soren'),(4,NULL,NULL),(5,NULL,NULL),(6,NULL,NULL),(7,NULL,NULL);
/*!40000 ALTER TABLE `usernotifications` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-13  0:00:16
