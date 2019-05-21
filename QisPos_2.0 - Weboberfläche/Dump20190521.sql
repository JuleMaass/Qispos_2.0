-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mynewdb
-- ------------------------------------------------------
-- Server version	8.0.16

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
-- Table structure for table `dozent`
--

DROP TABLE IF EXISTS `dozent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dozent` (
  `benutzername` varchar(45) NOT NULL,
  `id` int(11) NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `PW` int(11) NOT NULL,
  `vorname` varchar(30) DEFAULT NULL,
  `nachname` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dozent`
--

LOCK TABLES `dozent` WRITE;
/*!40000 ALTER TABLE `dozent` DISABLE KEYS */;
INSERT INTO `dozent` VALUES ('pkrug',100,'pkrug@hs-bremen.de',100100,'peter','krug'),('oheike',200,'oheike@hs-bremen.de',200200,'otto','heike'),('tbruns',300,'tbruns@hs-bremen.de',300300,'torben','bruns');
/*!40000 ALTER TABLE `dozent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `klausur`
--

DROP TABLE IF EXISTS `klausur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `klausur` (
  `id` int(11) NOT NULL,
  `bezeichnung` varchar(30) NOT NULL,
  `datum` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klausur`
--

LOCK TABLES `klausur` WRITE;
/*!40000 ALTER TABLE `klausur` DISABLE KEYS */;
INSERT INTO `klausur` VALUES (1,'Matheklausur1',NULL),(2,'Matheklausur2',NULL),(3,'Rechnernetze1',NULL),(4,'Programmieren1',NULL),(5,'Englisch',NULL),(6,'Englisch_Referat',NULL),(7,'Datenbanken1',NULL);
/*!40000 ALTER TABLE `klausur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modul`
--

DROP TABLE IF EXISTS `modul`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `modul` (
  `id` int(11) NOT NULL,
  `modulname` varchar(30) NOT NULL,
  `semester` int(11) DEFAULT NULL,
  `credits` int(11) DEFAULT NULL,
  `dozent_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`dozent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modul`
--

LOCK TABLES `modul` WRITE;
/*!40000 ALTER TABLE `modul` DISABLE KEYS */;
INSERT INTO `modul` VALUES (10,'Mathe-leicht',1,4,100),(11,'Mathe2',2,4,100),(12,'Rechnernetze',2,4,200),(13,'Programmieren1',1,4,300),(14,'Englisch',4,4,400);
/*!40000 ALTER TABLE `modul` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `student` (
  `benutzername` varchar(15) NOT NULL,
  `id` int(11) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `PW` int(11) NOT NULL,
  `vorname` varchar(45) DEFAULT NULL,
  `nachname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('phans',1,'phans@hs-bremen.de',111,'Peter','Hans'),('kkönig',2,'könig@hs-bremen.de',222,'Klaus','König'),('hulla',3,'hulla@hs-bremen.de',333,'Horst','Ulla'),('lmeier',4,'lmeier@hs-bremen.de',444,'Lisa','Meier'),('hschmitz',5,'hschmitz@hs-bremen.de',555,'Heinz','Schmitz');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_belegt_modul`
--

DROP TABLE IF EXISTS `student_belegt_modul`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `student_belegt_modul` (
  `student_id` int(11) NOT NULL,
  `modul_id` int(11) NOT NULL,
  `klausur_id` int(11) NOT NULL,
  `note` varchar(45) DEFAULT NULL,
  `versuch` varchar(45) NOT NULL,
  `credits` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`student_id`,`modul_id`,`klausur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_belegt_modul`
--

LOCK TABLES `student_belegt_modul` WRITE;
/*!40000 ALTER TABLE `student_belegt_modul` DISABLE KEYS */;
INSERT INTO `student_belegt_modul` VALUES (1,11,2,NULL,'1',NULL),(1,12,3,'3.0','2','4'),(2,10,1,'2.0','1','4'),(3,14,5,'1.0','1','2'),(3,14,6,'2.0','1','2');
/*!40000 ALTER TABLE `student_belegt_modul` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mynewdb'
--

--
-- Dumping routines for database 'mynewdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-21 14:05:11
