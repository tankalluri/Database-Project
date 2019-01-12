CREATE DATABASE  IF NOT EXISTS `student_housing_management_system` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `student_housing_management_system`;
-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: student_housing_management_system
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `address` (
  `aptNum` int(11) DEFAULT NULL,
  `streetName` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zip` char(5) DEFAULT NULL,
  `addressId` int(11) NOT NULL,
  PRIMARY KEY (`addressId`),
  KEY `city_search` (`city`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (63,'St Germain','Boston','MA','2115',120),(12,'Peterborough','Brighton','MA','2135',121),(677,'Devon','Malden','MA','2755',122),(98,'Warren Street','Allston','MA','2095',123),(78,'Causeway Street','Cambridge','MA','2167',124),(2,'Anne Street','Boston','MA','2115',221),(62,'Clearway Street','Boston','MA','2115',1234);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backup_student_info`
--

DROP TABLE IF EXISTS `backup_student_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `backup_student_info` (
  `studentId` int(11) DEFAULT NULL,
  `studentFirstName` varchar(50) DEFAULT NULL,
  `studentLastName` varchar(50) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `phoneNumber` char(10) DEFAULT NULL,
  `departmentId` int(11) DEFAULT NULL,
  `addressID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backup_student_info`
--

LOCK TABLES `backup_student_info` WRITE;
/*!40000 ALTER TABLE `backup_student_info` DISABLE KEYS */;
INSERT INTO `backup_student_info` VALUES (1400957,'Tanmayee','Kalluri','1994-12-28','9087650125',345,1234),(120987690,'Daniel','Stakhov','1989-12-09','9876123509',122,221);
/*!40000 ALTER TABLE `backup_student_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bed`
--

DROP TABLE IF EXISTS `bed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bed` (
  `bedId` int(11) NOT NULL,
  `roomNumber` int(11) DEFAULT NULL,
  PRIMARY KEY (`bedId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bed`
--

LOCK TABLES `bed` WRITE;
/*!40000 ALTER TABLE `bed` DISABLE KEYS */;
INSERT INTO `bed` VALUES (1,100),(2,101),(3,102),(4,103),(5,104);
/*!40000 ALTER TABLE `bed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `building` (
  `buildingNumber` int(11) NOT NULL,
  `numberOfRooms` int(11) DEFAULT NULL,
  `buildingName` varchar(50) DEFAULT NULL,
  `addressId` int(11) NOT NULL,
  PRIMARY KEY (`buildingNumber`,`addressId`),
  KEY `addressId_idx` (`addressId`),
  KEY `building_search` (`buildingName`),
  CONSTRAINT `addressId_building` FOREIGN KEY (`addressId`) REFERENCES `address` (`addressid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
INSERT INTO `building` VALUES (220,30,'Speare Hall',120),(221,10,'Stetson Hall',120),(222,5,'Stephen Hall',121),(223,20,'Carnegie Hall',124),(224,70,'Snell Hall',123);
/*!40000 ALTER TABLE `building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `department` (
  `departmentId` int(11) NOT NULL,
  `departmentName` varchar(50) DEFAULT NULL,
  `addressId` int(11) NOT NULL,
  PRIMARY KEY (`departmentId`,`addressId`),
  KEY `addressId_idx` (`addressId`),
  KEY `department_search` (`departmentName`),
  CONSTRAINT `addressId` FOREIGN KEY (`addressId`) REFERENCES `address` (`addressid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (348,'College of Arts',120),(345,'College of Engineering',122),(346,'College of Health Sciences',121),(343,'College of Science',124),(344,'College of Science',124),(344,'Law College',121);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foodoutlet`
--

DROP TABLE IF EXISTS `foodoutlet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `foodoutlet` (
  `outletId` int(11) NOT NULL,
  `outletName` varchar(45) DEFAULT NULL,
  `menuId` int(11) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `buildingId` int(11) NOT NULL,
  PRIMARY KEY (`outletId`,`buildingId`),
  KEY `buildingNumber_idx` (`buildingId`),
  KEY `foodoutlet_search` (`outletName`,`cost`),
  CONSTRAINT `buildingNumber_food` FOREIGN KEY (`buildingId`) REFERENCES `building` (`buildingnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foodoutlet`
--

LOCK TABLES `foodoutlet` WRITE;
/*!40000 ALTER TABLE `foodoutlet` DISABLE KEYS */;
INSERT INTO `foodoutlet` VALUES (52,'Popoye Chicken',95,12,220),(56,'Zatar',90,8,221),(57,'Sweet Pizza',67,7,222),(58,'Dumpling Palace',89,17,223),(59,'Pho Basil',900,12,221);
/*!40000 ALTER TABLE `foodoutlet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foodoutlet_has_item`
--

DROP TABLE IF EXISTS `foodoutlet_has_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `foodoutlet_has_item` (
  `foodOutlets_outletId` int(11) NOT NULL,
  `item_itemId` int(11) NOT NULL,
  PRIMARY KEY (`foodOutlets_outletId`,`item_itemId`),
  KEY `fk_foodOutlets_has_item_item1_idx` (`item_itemId`),
  KEY `fk_foodOutlets_has_item_foodOutlets1_idx` (`foodOutlets_outletId`),
  CONSTRAINT `fk_foodOutlets_has_item_foodOutlets1` FOREIGN KEY (`foodOutlets_outletId`) REFERENCES `foodoutlet` (`outletid`),
  CONSTRAINT `fk_foodOutlets_has_item_item1` FOREIGN KEY (`item_itemId`) REFERENCES `item` (`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foodoutlet_has_item`
--

LOCK TABLES `foodoutlet_has_item` WRITE;
/*!40000 ALTER TABLE `foodoutlet_has_item` DISABLE KEYS */;
INSERT INTO `foodoutlet_has_item` VALUES (56,12),(57,13),(58,14),(59,15),(52,16);
/*!40000 ALTER TABLE `foodoutlet_has_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foodoutlet_has_staff`
--

DROP TABLE IF EXISTS `foodoutlet_has_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `foodoutlet_has_staff` (
  `foodOutlets_outletId` int(11) NOT NULL,
  `staffInformation_staffId` int(11) NOT NULL,
  PRIMARY KEY (`foodOutlets_outletId`,`staffInformation_staffId`),
  KEY `fk_foodOutlets_has_staffInformation_staffInformation1_idx` (`staffInformation_staffId`),
  KEY `fk_foodOutlets_has_staffInformation_foodOutlets1_idx` (`foodOutlets_outletId`),
  CONSTRAINT `fk_foodOutlets_has_staffInformation_foodOutlets1` FOREIGN KEY (`foodOutlets_outletId`) REFERENCES `foodoutlet` (`outletid`),
  CONSTRAINT `fk_foodOutlets_has_staffInformation_staffInformation1` FOREIGN KEY (`staffInformation_staffId`) REFERENCES `staff` (`staffid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foodoutlet_has_staff`
--

LOCK TABLES `foodoutlet_has_staff` WRITE;
/*!40000 ALTER TABLE `foodoutlet_has_staff` DISABLE KEYS */;
INSERT INTO `foodoutlet_has_staff` VALUES (52,3450),(56,3456),(57,3457),(58,3458),(59,3459);
/*!40000 ALTER TABLE `foodoutlet_has_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `freetransportation`
--

DROP TABLE IF EXISTS `freetransportation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `freetransportation` (
  `studentId` int(11) NOT NULL,
  `dropLocation` int(11) NOT NULL,
  PRIMARY KEY (`studentId`,`dropLocation`),
  KEY `dropLoc_idx` (`dropLocation`),
  CONSTRAINT `dropLoc` FOREIGN KEY (`dropLocation`) REFERENCES `building` (`buildingnumber`),
  CONSTRAINT `studentId_transport` FOREIGN KEY (`studentId`) REFERENCES `studentuniversityinformation` (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `freetransportation`
--

LOCK TABLES `freetransportation` WRITE;
/*!40000 ALTER TABLE `freetransportation` DISABLE KEYS */;
INSERT INTO `freetransportation` VALUES (1400987,220),(2400957,221),(1403957,222),(1400967,223),(1440957,224);
/*!40000 ALTER TABLE `freetransportation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `item` (
  `itemId` int(11) NOT NULL,
  `itemName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`itemId`),
  KEY `item_search` (`itemName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (16,'Chaat'),(14,'Fried Rice'),(15,'Noodles'),(13,'Pasta'),(12,'Pizza');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `timestamp` timestamp(6) NULL DEFAULT NULL,
  KEY `id_student` (`id`),
  CONSTRAINT `id_staff` FOREIGN KEY (`id`) REFERENCES `staff` (`staffid`),
  CONSTRAINT `id_student` FOREIGN KEY (`id`) REFERENCES `studentuniversityinformation` (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mealplan`
--

DROP TABLE IF EXISTS `mealplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mealplan` (
  `planId` int(11) NOT NULL,
  `studentId` int(11) DEFAULT NULL,
  `term` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`planId`),
  KEY `studentId_idx` (`studentId`),
  CONSTRAINT `studentId_meal` FOREIGN KEY (`studentId`) REFERENCES `studentuniversityinformation` (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mealplan`
--

LOCK TABLES `mealplan` WRITE;
/*!40000 ALTER TABLE `mealplan` DISABLE KEYS */;
INSERT INTO `mealplan` VALUES (111,1440957,'Sem 8'),(112,1400967,'Sem 1'),(113,1403957,'Sem 2'),(114,2400957,'Sem 4'),(115,1400987,'Sem 8');
/*!40000 ALTER TABLE `mealplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `message` (
  `stuId` int(11) DEFAULT NULL,
  `message` varchar(20) DEFAULT NULL,
  KEY `studentId_key_idx` (`stuId`),
  CONSTRAINT `studentId_key` FOREIGN KEY (`stuId`) REFERENCES `studentuniversityinformation` (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (91400957,'Joined');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `payment` (
  `paymentId` int(11) NOT NULL,
  `studentId` int(11) NOT NULL,
  `paymentDate` date DEFAULT NULL,
  `monthlyFees` decimal(4,0) DEFAULT NULL,
  `paymentStatus` varchar(45) DEFAULT NULL,
  `fineImposed` decimal(4,0) DEFAULT NULL,
  PRIMARY KEY (`paymentId`,`studentId`),
  KEY `studentId_idx` (`studentId`),
  CONSTRAINT `studentId_payment` FOREIGN KEY (`studentId`) REFERENCES `studentuniversityinformation` (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (90001,1400987,'2017-09-27',1300,'Paid',0),(90002,2400957,'2018-09-27',800,'Late payment',20),(90003,1403957,'2016-08-23',1200,'Late',34),(90004,1400967,'2017-12-12',600,'Paid',0),(90005,1440957,'2018-11-20',500,'Paid',0);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `room` (
  `roomNumber` int(11) NOT NULL,
  `studentId` int(11) NOT NULL,
  `bedId` int(11) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`roomNumber`,`studentId`),
  KEY `studentId_idx` (`studentId`),
  KEY `bedId_idx` (`bedId`),
  CONSTRAINT `bedId` FOREIGN KEY (`bedId`) REFERENCES `bed` (`bedid`),
  CONSTRAINT `studentId_ref` FOREIGN KEY (`studentId`) REFERENCES `studentuniversityinformation` (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (990,1400967,4,'Italian Style'),(991,1440957,5,'Persian Style'),(993,2400957,2,'French Style'),(996,1403957,3,'Arab Style'),(999,1400987,1,'Italian Style');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `staff` (
  `staffId` int(11) NOT NULL,
  `buildingNumber` int(11) NOT NULL,
  `staffFirstName` varchar(90) DEFAULT NULL,
  `staffLastName` varchar(45) DEFAULT NULL,
  `typeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`staffId`,`buildingNumber`),
  KEY `buildingNumber_idx` (`buildingNumber`),
  KEY `typeID_idx` (`typeId`),
  KEY `staff_search` (`staffFirstName`),
  CONSTRAINT `buildingNumber` FOREIGN KEY (`buildingNumber`) REFERENCES `building` (`buildingnumber`),
  CONSTRAINT `typeID` FOREIGN KEY (`typeId`) REFERENCES `stafftype` (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (3450,224,'Lin','Dan',892),(3453,220,'Rafael','Nadal',892),(3456,220,'Melissa','George',890),(3457,221,'Sidharth','Pati',890),(3458,222,'Padma','Priya',890),(3459,223,'Nikhil','Narla',891);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stafftype`
--

DROP TABLE IF EXISTS `stafftype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `stafftype` (
  `typeId` int(11) NOT NULL,
  `typeName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`typeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stafftype`
--

LOCK TABLES `stafftype` WRITE;
/*!40000 ALTER TABLE `stafftype` DISABLE KEYS */;
INSERT INTO `stafftype` VALUES (890,'Food Outlet Staff'),(891,'Maintenence Staff'),(892,'Security Staff');
/*!40000 ALTER TABLE `stafftype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentdorminfo`
--

DROP TABLE IF EXISTS `studentdorminfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `studentdorminfo` (
  `roomNumber` int(11) DEFAULT NULL,
  `buildingNumber` int(11) DEFAULT NULL,
  `studentId` int(11) NOT NULL,
  PRIMARY KEY (`studentId`),
  KEY `studentId_idx` (`studentId`),
  CONSTRAINT `studentId` FOREIGN KEY (`studentId`) REFERENCES `studentuniversityinformation` (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentdorminfo`
--

LOCK TABLES `studentdorminfo` WRITE;
/*!40000 ALTER TABLE `studentdorminfo` DISABLE KEYS */;
INSERT INTO `studentdorminfo` VALUES (991,220,1400967),(996,223,1403957),(999,224,1440957),(993,222,2400957),(990,221,91400957);
/*!40000 ALTER TABLE `studentdorminfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_subsequent_tables` AFTER INSERT ON `studentdorminfo` FOR EACH ROW begin
insert into message values(new.studentId, 'Joined');
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `studentuniversityinformation`
--

DROP TABLE IF EXISTS `studentuniversityinformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `studentuniversityinformation` (
  `studentId` int(11) NOT NULL,
  `studentFirstName` varchar(50) DEFAULT NULL,
  `studentLastName` varchar(50) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `phoneNumber` char(10) DEFAULT NULL,
  `pointOfContactFirstName` varchar(50) DEFAULT NULL,
  `pointOfContactLastName` varchar(50) DEFAULT NULL,
  `pointOfContactNumber` char(10) DEFAULT NULL,
  `departmentId` int(11) DEFAULT NULL,
  `addressID` int(11) DEFAULT NULL,
  PRIMARY KEY (`studentId`),
  KEY `departmentId_idx` (`departmentId`),
  KEY `addressId_idx` (`addressID`),
  CONSTRAINT `addressId_ref` FOREIGN KEY (`addressID`) REFERENCES `address` (`addressid`),
  CONSTRAINT `departmentId` FOREIGN KEY (`departmentId`) REFERENCES `department` (`departmentid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentuniversityinformation`
--

LOCK TABLES `studentuniversityinformation` WRITE;
/*!40000 ALTER TABLE `studentuniversityinformation` DISABLE KEYS */;
INSERT INTO `studentuniversityinformation` VALUES (1400957,'Tanmayee','Kalluri','1994-12-28','9087650125','Shobha','Murthy','9945283680',345,1234),(1400967,'Kate','Dhara','1999-11-08','9945890128','Swagatika','Dash','9945283680',346,1234),(1400987,'Rahman','Hussain','2000-04-15','8176175634','Farhat','Ali',NULL,344,121),(1403957,'Sanjeev','Dhara','1992-02-28','8106007519','Srinivas','Dhara','9945283680',345,124),(1440957,'Yang','Li','2000-12-28','9492034232','Shia','Li','9440921265',343,1234),(2400957,'Elijah','Anderson','2000-09-04','2408881592','Matt','Anderson',NULL,344,123),(91400957,'Amrutha','Malladi','1995-07-18','9700072011','Jawahar','Malladi','9945283680',348,121);
/*!40000 ALTER TABLE `studentuniversityinformation` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `backup_student_details` AFTER DELETE ON `studentuniversityinformation` FOR EACH ROW begin
insert into backup_student_info
(studentId, studentFirstName,studentLastName,dateOfBirth,
phoneNumber, departmentId,addressID) values
(old.studentId, old.studentFirstName, old.studentLastName,old.dateOfBirth,
old.phoneNumber, old.departmentId, old.addressID);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `utilities`
--

DROP TABLE IF EXISTS `utilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `utilities` (
  `utilityId` int(11) NOT NULL,
  `utilityType` varchar(45) DEFAULT NULL,
  `plan` varchar(45) DEFAULT NULL,
  `cost` decimal(4,0) DEFAULT NULL,
  `studentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`utilityId`),
  KEY `studentId_idx` (`studentId`),
  CONSTRAINT `studentId_utilities` FOREIGN KEY (`studentId`) REFERENCES `studentuniversityinformation` (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilities`
--

LOCK TABLES `utilities` WRITE;
/*!40000 ALTER TABLE `utilities` DISABLE KEYS */;
INSERT INTO `utilities` VALUES (91234,'WiFi','Monthly',23,1400987),(91235,'WiFi','Quarterly',47,2400957),(91236,'TV','Yearly',100,1403957),(91237,'Oven','Quarterly',43,1400967),(91238,'Kettle','Monthly',10,1440957);
/*!40000 ALTER TABLE `utilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_menuforoutlets`
--

DROP TABLE IF EXISTS `v_menuforoutlets`;
/*!50001 DROP VIEW IF EXISTS `v_menuforoutlets`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `v_menuforoutlets` AS SELECT 
 1 AS `outletName`,
 1 AS `itemName`,
 1 AS `cost`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_student_dorm_info_room`
--

DROP TABLE IF EXISTS `v_student_dorm_info_room`;
/*!50001 DROP VIEW IF EXISTS `v_student_dorm_info_room`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `v_student_dorm_info_room` AS SELECT 
 1 AS `studentId`,
 1 AS `studentFirstName`,
 1 AS `studentLastName`,
 1 AS `phoneNumber`,
 1 AS `roomNumber`,
 1 AS `type`,
 1 AS `buildingName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_visitormeeting`
--

DROP TABLE IF EXISTS `v_visitormeeting`;
/*!50001 DROP VIEW IF EXISTS `v_visitormeeting`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `v_visitormeeting` AS SELECT 
 1 AS `VisitorMeeting`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `visitor`
--

DROP TABLE IF EXISTS `visitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `visitor` (
  `visitorFirstName` varchar(50) NOT NULL,
  `visitorLastName` varchar(45) DEFAULT NULL,
  `studentId` int(11) NOT NULL,
  `visitorRelationship` varchar(45) DEFAULT NULL,
  `dateOfMeeting` date DEFAULT NULL,
  `dateOfExit` date DEFAULT NULL,
  `inTime` time DEFAULT NULL,
  `outTime` time DEFAULT NULL,
  `buildingId` int(11) NOT NULL,
  `isAdult` char(1) DEFAULT NULL,
  `purposeOfVisit` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`visitorFirstName`,`studentId`,`buildingId`),
  KEY `studentId_idx` (`studentId`),
  KEY `buildingId_idx` (`buildingId`),
  KEY `visitor_search` (`visitorFirstName`),
  CONSTRAINT `buildingId` FOREIGN KEY (`buildingId`) REFERENCES `building` (`buildingnumber`),
  CONSTRAINT `studentId_ref_visitor` FOREIGN KEY (`studentId`) REFERENCES `studentuniversityinformation` (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitor`
--

LOCK TABLES `visitor` WRITE;
/*!40000 ALTER TABLE `visitor` DISABLE KEYS */;
INSERT INTO `visitor` VALUES ('Jessica','Parker',2400957,'Mother','2018-08-10','2018-08-10','03:00:00','07:00:00',221,'Y','Need to give things'),('Rohan','Gupta',1440957,'Friend','2018-06-22','2018-06-22','12:00:00','02:00:00',222,'N','Catch up with friend'),('Tanisha','Shah',1400987,'Friend','2018-11-09','2018-11-09','12:00:00','02:00:00',220,'Y','Casual meeting');
/*!40000 ALTER TABLE `visitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'student_housing_management_system'
--

--
-- Dumping routines for database 'student_housing_management_system'
--
/*!50003 DROP FUNCTION IF EXISTS `funct_sqrt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `funct_sqrt`(x1 int, x2 int) RETURNS int(11)
begin
declare dist int;
set dist=sqrt(x1-x2);
return dist;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `new_food_prices` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `new_food_prices`(old_cost int) RETURNS int(11)
begin
declare revised_cost int;
set revised_cost=old_cost+5;
return revised_cost;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `revised_plan_prices` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `revised_plan_prices`(cost int) RETURNS int(11)
begin
declare revised_cost int;
set revised_cost=pow(cost,2);
return revised_cost;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `revised_plan_prices_new` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `revised_plan_prices_new`(cost int) RETURNS int(11)
begin
declare revised_cost int;
set revised_cost=pow(cost,1.3);
return revised_cost;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `count_proc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `count_proc`()
begin
select count(itemId) as 'Number of Items' from item;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_proc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_proc`(id int,fname varchar(50), lname varchar(50),dateOfBirth date, phNum char(10), deptId int, addId int)
begin
insert into backup_student_info
(studentId, studentFirstName,studentLastName,dateOfBirth,
phoneNumber, departmentId,addressID) values
(id, fname, lname, dateOfBirth,
phNum, deptId, addId);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `v_menuforoutlets`
--

/*!50001 DROP VIEW IF EXISTS `v_menuforoutlets`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_menuforoutlets` AS select `f`.`outletName` AS `outletName`,`i`.`itemName` AS `itemName`,`f`.`cost` AS `cost` from ((`foodoutlet` `f` join `foodoutlet_has_item` `fi`) join `item` `i`) where ((`f`.`outletId` = `fi`.`foodOutlets_outletId`) and (`i`.`itemId` = `fi`.`item_itemId`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_student_dorm_info_room`
--

/*!50001 DROP VIEW IF EXISTS `v_student_dorm_info_room`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_student_dorm_info_room` AS select `s`.`studentId` AS `studentId`,`s`.`studentFirstName` AS `studentFirstName`,`s`.`studentLastName` AS `studentLastName`,`s`.`phoneNumber` AS `phoneNumber`,`r`.`roomNumber` AS `roomNumber`,`r`.`type` AS `type`,`b`.`buildingName` AS `buildingName` from (((`studentuniversityinformation` `s` join `studentdorminfo` `d`) join `room` `r`) join `building` `b`) where ((`r`.`roomNumber` = `d`.`roomNumber`) and (`r`.`studentId` = `d`.`studentId`) and (`s`.`studentId` = `d`.`studentId`) and (`d`.`buildingNumber` = `b`.`buildingNumber`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_visitormeeting`
--

/*!50001 DROP VIEW IF EXISTS `v_visitormeeting`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_visitormeeting` AS select concat(`v`.`visitorFirstName`,' ',`v`.`visitorLastName`,' - ',`v`.`visitorRelationship`,' ,visited ',`s`.`studentFirstName`,' ',`s`.`studentLastName`,' bearing the ID ',`s`.`studentId`,' to ',`v`.`purposeOfVisit`) AS `VisitorMeeting` from (`visitor` `v` join `studentuniversityinformation` `s` on((`v`.`studentId` = `s`.`studentId`))) */;
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


#transactions
start transaction;
lock table mealplan write;
update mealplan set term='Sem 8' where planId=111;
insert into mealplan values(116, 001403957,'Sem 5');
delete from mealplan where planId=116;
unlock table;
commit;

start transaction;
update studentuniversityinformation set studentFirstName='Rohita' where studentId=001400967;
update studentuniversityinformation set studentFirstName='Dana' where studentId=001400967;
update studentuniversityinformation set studentFirstName='Genivieve' where studentId=001400967;
update studentuniversityinformation set studentFirstName='Kate' where studentId=001400967;
commit;

rollback;

#7 indexes
create index city_search on address(city);
create index building_search on building(buildingName);
create index department_search on department(departmentName);
create index foodoutlet_search on foodoutlet(outletName,cost);
create index item_search on item(itemName);
create index staff_search on staff(staffFirstName);
create index visitor_search on visitor(visitorFirstName);

drop index city_search on address;

#query analyzer
explain select * from login;
explain select * from login where id=3456;
explain select * from studentuniversityinformation s inner join studentdorminfo l on l.studentId=s.studentId;
explain select * from studentuniversityinformation s inner join visitor v on s.studentId=v.studentId;

#5 users created
create user 'DriverJoseph' identified by 'joseph';
create user 'RSORia' identified by 'ria';
create user 'FoodManagerSherry' identified by 'sherry';
create user 'Admin' identified by 'admin';
create user 'StaffManager' identified by 'staff';
#4 grant, revoke 
revoke all, grant option from DriverJoseph;
revoke all, grant option from RSORia;
revoke all, grant option from FoodManagerSherry;
revoke all, grant option from `Admin`;
#5 grants
grant all on student_housing_management_system.* to `Admin`;
grant select on student_housing_management_system.freetransportation to DriverJoseph;
grant select on student_housing_management_system.foodoutlet to FoodManagerSherry;
grant select on student_housing_management_system.login to RSORia;
grant update,select on student_housing_management_system.staff to StaffManager;

-- Dump completed on 2018-12-13 10:08:29
