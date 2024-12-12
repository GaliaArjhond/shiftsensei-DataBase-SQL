-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: shiftsenseidb
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `access`
--

DROP TABLE IF EXISTS `access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `access` (
  `accessId` int NOT NULL AUTO_INCREMENT,
  `accessName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`accessId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access`
--

LOCK TABLES `access` WRITE;
/*!40000 ALTER TABLE `access` DISABLE KEYS */;
INSERT INTO `access` VALUES (1,'user'),(2,'admin');
/*!40000 ALTER TABLE `access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `adminId` int NOT NULL AUTO_INCREMENT,
  `adminLicense` varchar(50) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `phoneNumber` int DEFAULT NULL,
  `passwordhash` varchar(255) NOT NULL,
  `accessId` int DEFAULT NULL,
  PRIMARY KEY (`adminId`),
  KEY `fk_admin_access` (`accessId`),
  CONSTRAINT `fk_admin_access` FOREIGN KEY (`accessId`) REFERENCES `access` (`accessId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'12345','Arjhond','Galia',98765431,'password',2);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deletionlogs`
--

DROP TABLE IF EXISTS `deletionlogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deletionlogs` (
  `logId` int NOT NULL AUTO_INCREMENT,
  `nurseId` int NOT NULL,
  `reason` text NOT NULL,
  `deletionDate` datetime NOT NULL,
  PRIMARY KEY (`logId`),
  KEY `nurseId` (`nurseId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deletionlogs`
--

LOCK TABLES `deletionlogs` WRITE;
/*!40000 ALTER TABLE `deletionlogs` DISABLE KEYS */;
INSERT INTO `deletionlogs` VALUES (7,0,'','2024-12-08 03:27:04'),(8,0,'','2024-12-08 03:27:38'),(9,0,'','2024-12-08 05:21:24'),(10,0,'','2024-12-08 05:22:06');
/*!40000 ALTER TABLE `deletionlogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `departmentId` int NOT NULL AUTO_INCREMENT,
  `departmentName` varchar(100) NOT NULL,
  PRIMARY KEY (`departmentId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Emergency Room (ER)'),(2,'Intensive Care Unit (ICU)'),(3,'Surgical Department (OR)'),(4,'Maternity Ward (MW)'),(5,'Pediatrics (PED)'),(6,'Cardiology (CAR)'),(7,'Oncology (ONC)'),(8,'Orthopedics (ORT)'),(9,'Neonatal Intensive Care Unit (NICU)'),(10,'Psychiatry(PSY)');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `explvls`
--

DROP TABLE IF EXISTS `explvls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `explvls` (
  `expLvlsId` int NOT NULL AUTO_INCREMENT,
  `levelName` varchar(100) NOT NULL,
  PRIMARY KEY (`expLvlsId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `explvls`
--

LOCK TABLES `explvls` WRITE;
/*!40000 ALTER TABLE `explvls` DISABLE KEYS */;
INSERT INTO `explvls` VALUES (1,'Entry-Level (EL)'),(2,'Junior Nurse (JN)'),(3,'Intermediate Nurse (IN)'),(4,'Senior Nurse (SN)'),(5,'Expert Nurse (EN)'),(6,'Nurse Practitioner (NP)'),(7,'Clinical Nurse Specialist (CNS)');
/*!40000 ALTER TABLE `explvls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurse`
--

DROP TABLE IF EXISTS `nurse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nurse` (
  `nurseId` int NOT NULL AUTO_INCREMENT,
  `nurseLicense` varchar(50) NOT NULL,
  `passwordHash` varchar(100) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `mname` varchar(50) DEFAULT NULL,
  `Lname` varchar(50) NOT NULL,
  `email` varchar(250) NOT NULL,
  `address` text,
  `phoneNumber` varchar(15) DEFAULT NULL,
  `dateOfBirth` datetime DEFAULT NULL,
  `bio` text,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `SecurityQuestionId` int DEFAULT NULL,
  `SecurityAnswerHash` varchar(255) DEFAULT NULL,
  `expLvlsId` int DEFAULT NULL,
  `departmentId` int DEFAULT NULL,
  `positionId` int DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT '1',
  `createAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `endTime` time DEFAULT NULL,
  `shiftTypeId` int DEFAULT '2',
  `shiftsId` int DEFAULT NULL,
  `startTime` time DEFAULT NULL,
  `accessId` int DEFAULT '1',
  PRIMARY KEY (`nurseId`),
  UNIQUE KEY `email` (`email`),
  KEY `expLvlsId` (`expLvlsId`),
  KEY `departmentId` (`departmentId`),
  KEY `positionId` (`positionId`),
  KEY `SecurityQuestionId` (`SecurityQuestionId`),
  KEY `fk_nurse_shiftType` (`shiftTypeId`),
  KEY `fk_shiftsId` (`shiftsId`),
  KEY `fk_nurse_access` (`accessId`),
  CONSTRAINT `fk_nurse_access` FOREIGN KEY (`accessId`) REFERENCES `access` (`accessId`),
  CONSTRAINT `fk_nurse_shiftType` FOREIGN KEY (`shiftTypeId`) REFERENCES `shifttype` (`shiftTypeId`),
  CONSTRAINT `fk_shiftsId` FOREIGN KEY (`shiftsId`) REFERENCES `shifts` (`shiftId`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `nurse_ibfk_1` FOREIGN KEY (`expLvlsId`) REFERENCES `explvls` (`expLvlsId`),
  CONSTRAINT `nurse_ibfk_2` FOREIGN KEY (`departmentId`) REFERENCES `department` (`departmentId`),
  CONSTRAINT `nurse_ibfk_3` FOREIGN KEY (`positionId`) REFERENCES `position` (`positionId`),
  CONSTRAINT `nurse_ibfk_4` FOREIGN KEY (`SecurityQuestionId`) REFERENCES `securityquestion` (`securityQuestionId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurse`
--

LOCK TABLES `nurse` WRITE;
/*!40000 ALTER TABLE `nurse` DISABLE KEYS */;
INSERT INTO `nurse` VALUES (3,'12345','1234','Joy','H','Rose','joy@gmail.com','123 bahay','0987654321','2000-06-14 20:29:52',NULL,NULL,1,'none',5,3,3,1,'2024-12-10 12:31:05','2024-12-11 03:16:21','2024-12-10','2024-12-26','08:00:00',2,NULL,NULL,NULL),(4,'12345','1234','Arjhond','G','Galia','galia@gmail.com','bahay','09876543231','2003-10-20 13:30:37',NULL,NULL,4,'green',4,7,8,1,'2024-12-11 05:31:31','2024-12-11 05:31:31','2024-12-11','2024-12-11','13:30:37',2,NULL,'13:30:37',NULL);
/*!40000 ALTER TABLE `nurse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `position` (
  `positionId` int NOT NULL AUTO_INCREMENT,
  `positionName` varchar(100) NOT NULL,
  PRIMARY KEY (`positionId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,'Registered Nurse (RN)'),(2,'Nurse Practitioner (NP)'),(3,'Charge Nurse(CN)'),(4,'Head Nurse(HN)'),(5,'Clinical Nurse Specialist (CNS)'),(6,'Licensed Practical Nurse (LPN)'),(7,'Nursing Assistant (CNA)'),(8,'Nurse Anesthetist (CRNA)'),(9,'Operating Room Nurse (Perioperative Nurse)'),(10,'Nurse Educator (NE)');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `securityquestion`
--

DROP TABLE IF EXISTS `securityquestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `securityquestion` (
  `securityQuestionId` int NOT NULL AUTO_INCREMENT,
  `SecurityQuestion` varchar(250) NOT NULL,
  PRIMARY KEY (`securityQuestionId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `securityquestion`
--

LOCK TABLES `securityquestion` WRITE;
/*!40000 ALTER TABLE `securityquestion` DISABLE KEYS */;
INSERT INTO `securityquestion` VALUES (1,'What is your mother\'s maiden name?'),(2,'What was the name of your first pet?'),(3,'What is the name of the city where you were born?'),(4,'What is your favorite color?'),(5,'What was the make and model of your first car?'),(6,'What was the name of your elementary school?');
/*!40000 ALTER TABLE `securityquestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shifts`
--

DROP TABLE IF EXISTS `shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shifts` (
  `shiftId` int NOT NULL AUTO_INCREMENT,
  `shiftName` varchar(100) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `startTime` time DEFAULT NULL,
  `endTime` time DEFAULT NULL,
  `departmentId` int DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `shiftTimeId` int DEFAULT NULL,
  PRIMARY KEY (`shiftId`),
  KEY `fk_department` (`departmentId`),
  KEY `fk_shiftTime` (`shiftTimeId`),
  CONSTRAINT `fk_department` FOREIGN KEY (`departmentId`) REFERENCES `department` (`departmentId`),
  CONSTRAINT `fk_shiftTime` FOREIGN KEY (`shiftTimeId`) REFERENCES `shifttime` (`shiftTimeId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shifts`
--

LOCK TABLES `shifts` WRITE;
/*!40000 ALTER TABLE `shifts` DISABLE KEYS */;
INSERT INTO `shifts` VALUES (9,'Test 1','2024-12-12 00:00:00','2024-12-24 00:00:00','16:00:00','04:00:00',6,'2024-12-12 08:19:12',2);
/*!40000 ALTER TABLE `shifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shifttime`
--

DROP TABLE IF EXISTS `shifttime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shifttime` (
  `shiftTimeId` int NOT NULL AUTO_INCREMENT,
  `shiftTimeName` varchar(100) NOT NULL,
  PRIMARY KEY (`shiftTimeId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shifttime`
--

LOCK TABLES `shifttime` WRITE;
/*!40000 ALTER TABLE `shifttime` DISABLE KEYS */;
INSERT INTO `shifttime` VALUES (1,'Morning Shift'),(2,'Evening Shift'),(3,'Night Shift');
/*!40000 ALTER TABLE `shifttime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shifttype`
--

DROP TABLE IF EXISTS `shifttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shifttype` (
  `shiftTypeId` int NOT NULL AUTO_INCREMENT,
  `shiftTypeName` varchar(100) NOT NULL,
  PRIMARY KEY (`shiftTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shifttype`
--

LOCK TABLES `shifttype` WRITE;
/*!40000 ALTER TABLE `shifttype` DISABLE KEYS */;
INSERT INTO `shifttype` VALUES (1,'assigned'),(2,'unassigned');
/*!40000 ALTER TABLE `shifttype` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-12 17:02:26
