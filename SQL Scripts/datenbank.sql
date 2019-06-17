-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: mynewdb
-- ------------------------------------------------------
-- Server version	8.0.15

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
-- Table structure for table `dozents`
--

DROP TABLE IF EXISTS `dozents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dozents` (
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
-- Dumping data for table `dozents`
--

LOCK TABLES `dozents` WRITE;
/*!40000 ALTER TABLE `dozents` DISABLE KEYS */;
INSERT INTO `dozents` VALUES ('pkrug',100,'pkrug@hs-bremen.de',100100,'peter','krug'),('oheike',200,'oheike@hs-bremen.de',200200,'otto','heike'),('tbruns',300,'tbruns@hs-bremen.de',300300,'torben','bruns');
/*!40000 ALTER TABLE `dozents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `klausurs`
--

DROP TABLE IF EXISTS `klausurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `klausurs` (
  `id` int(11) NOT NULL,
  `bezeichnung` varchar(30) NOT NULL,
  `datum` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klausurs`
--

LOCK TABLES `klausurs` WRITE;
/*!40000 ALTER TABLE `klausurs` DISABLE KEYS */;
INSERT INTO `klausurs` VALUES (1,'Matheklausur1',NULL),(2,'Matheklausur2',NULL),(3,'Rechnernetze1',NULL),(4,'Programmieren1',NULL),(5,'Englisch',NULL),(6,'Englisch_Referat',NULL);
/*!40000 ALTER TABLE `klausurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moduls`
--

DROP TABLE IF EXISTS `moduls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `moduls` (
  `id` int(11) NOT NULL,
  `bezeichnung` varchar(45) NOT NULL,
  `semester` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `credits` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `beschreibung` varchar(45) DEFAULT NULL,
  `nummer` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moduls`
--

LOCK TABLES `moduls` WRITE;
/*!40000 ALTER TABLE `moduls` DISABLE KEYS */;
/*!40000 ALTER TABLE `moduls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pruefungs`
--

DROP TABLE IF EXISTS `pruefungs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pruefungs` (
  `id` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `bezeichnung` varchar(45) NOT NULL,
  `pruefungsart` varchar(45) NOT NULL,
  `versuch` int(11) NOT NULL,
  `anmeldedatum` datetime NOT NULL,
  `pruefungsdatum` datetime NOT NULL,
  `status` tinyint(4) NOT NULL,
  `nummer` int(11) DEFAULT NULL,
  `note` float NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `dozent_id` FOREIGN KEY (`id`) REFERENCES `dozents` (`id`),
  CONSTRAINT `modul_id` FOREIGN KEY (`id`) REFERENCES `moduls` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pruefungs`
--

LOCK TABLES `pruefungs` WRITE;
/*!40000 ALTER TABLE `pruefungs` DISABLE KEYS */;
/*!40000 ALTER TABLE `pruefungs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `students` (
  `benutzername` varchar(255) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `PW` varchar(255) NOT NULL,
  `vorname` varchar(255) NOT NULL,
  `nachname` varchar(255) NOT NULL,
  `matrikelnummer` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10017 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES ('phans',10000,'phans@hs-bremen.de','111','Peter','Hans',50000),('hschmitz',10001,'hschmitz@hs-bremen.de','555','Heinz','Schmitz',50001),('JMaaß',10002,'JMaaß@hs-bremen.de','Purzelbärchen','Jule','Maaß',50002),('FBuchholz',10003,'FBuchholz@hs-bremen.de','test','Florian','Buchholz',50003),('HKramer',10004,'HKramer@hs-bremen.de','313111','Hugo','Kramer',50004),('HuKramer',10005,'HuKramer@hs-bremen.de','313111','Hugo','Kramer',50005),('HKrome',10006,'HKrome@hs-bremen.de','tttest','Horst','Krome',50006),('Jörg',10007,'buchholz@hs-bremen.de','zrr','Jörg','Buchholz',50007),('Kreativ',10008,'Werdmal@kreativ.de','000','Horst','Uschibert',50008),('BTannert',10009,'BTannert@hs-bremen.de','999','Benjamin','Tannert',50009),('kkönig',10010,'könig@hs-bremen.de','222','Klaus','König',50010),('hulla',10011,'hulla@hs-bremen.de','333','Horst','Ulla',50011),('FWoichek',10012,'FWoichek@hs-bremen.de','superheld','Fabian','Woichek',50012),('WTjark',10013,'WTjark@hs-bremen.de','232','Wio','Tjark',50013),('pklempner',10016,'pklempner@hs-bremen.de','889','Paolo','Klempner',60016);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studiengangs`
--

DROP TABLE IF EXISTS `studiengangs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `studiengangs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bezeichnung` varchar(45) NOT NULL,
  `beschreibung` varchar(45) DEFAULT NULL,
  `abschluss` varchar(45) NOT NULL,
  `creditsmin` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Verschiedene Studiengänge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studiengangs`
--

LOCK TABLES `studiengangs` WRITE;
/*!40000 ALTER TABLE `studiengangs` DISABLE KEYS */;
/*!40000 ALTER TABLE `studiengangs` ENABLE KEYS */;
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

-- Dump completed on 2019-06-17 13:06:06
