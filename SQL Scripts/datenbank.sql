-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: mynewdb
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
-- Table structure for table `dozents`
--

DROP TABLE IF EXISTS `dozents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dozents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `benutzername` varchar(45) NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `PW` varchar(255) NOT NULL,
  `vorname` varchar(30) DEFAULT NULL,
  `nachname` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=304 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dozents`
--

LOCK TABLES `dozents` WRITE;
/*!40000 ALTER TABLE `dozents` DISABLE KEYS */;
INSERT INTO `dozents` VALUES (100,'pkrug','pkrug@hs-bremen.de','$2b$10$lLS.jESvlzHfd7n3Vc66/.MhZx1dalrENz8pq8j7/mZBfEbBE08f2','Peter','Krug'),(200,'oheike','oheike@hs-bremen.de','$2b$10$cMrV8V.ybMc2aoGxgscawedxokSOizh7dx4pcfvWEiTh6Kzxrx9BG','Otto','Heike'),(300,'tbruns','tbruns@hs-bremen.de','$2b$10$QP09zU/OnFDHOAw48H1W1OvwNKeR1SDh4/t8V7E.vetESG/5hS6D6','Torben','Bruns'),(301,'btannert','btannert@hs-bremen.de','$2b$10$anMWlnwgIqJij1G.caEhp.iEsEQXeK8gdHb2zT.WkeQQjykBy76E.','Benjamin','Tannert'),(302,'ggeißner','ggeißner@hs-bremen.de','$2b$10$/31dcI9QUre9S6hkdKa8G.bIn2RbuOLsr3bek5IGMoO50itzkc.e6','Gesine','Geißner'),(303,'rmüller','rmüller@hs-bremen.de','$2b$10$Cij1DvVMYMUl8IfSxvZIau/ueiim3Fq1i1LNjLwLxDRRfVpIXxG3u','Rudi','Müller');
/*!40000 ALTER TABLE `dozents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moduls`
--

DROP TABLE IF EXISTS `moduls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `moduls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bezeichnung` varchar(45) NOT NULL,
  `semester` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `credits` int(11) NOT NULL,
  `beschreibung` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moduls`
--

LOCK TABLES `moduls` WRITE;
/*!40000 ALTER TABLE `moduls` DISABLE KEYS */;
INSERT INTO `moduls` VALUES (1,'Programmieren 1',1,1,6,''),(2,'Mathe 1',1,2,6,''),(3,'Gestaltung 1',1,3,6,''),(4,'Medieninformatik 1',1,4,6,NULL),(5,'Informatik',1,5,6,NULL),(6,'Programmieren 2',2,1,6,NULL),(7,'Mathe 2',2,2,6,NULL),(8,'Gestaltung 2',2,3,6,NULL),(9,'Medieninformatik 2',2,4,6,NULL),(10,'Rechnernetze',2,5,6,NULL),(11,'Softwaretechnik',3,1,6,NULL),(12,'Medienformate und Algorithmen',3,2,6,NULL),(13,'Informationssicherheit',3,3,6,NULL),(14,'Projekt 1',3,4,6,'Wahlpflicht Projekt 1'),(15,'Mensch-Computer-Interaktion',3,5,6,NULL),(17,'Datenbankbasierte Web-Anwendung',4,1,6,NULL),(18,'Computergrafik',4,2,6,NULL),(19,'Projekt 2',4,3,6,NULL),(20,'Gestaltung - Ausgewählte Kapitel',4,4,6,NULL),(21,'Wahlpflichtmodul Medieninformatik (Ausland) 1',5,1,6,NULL),(22,'Wahlpflichtmodul Medieninformatik (Ausland) 2',5,2,6,NULL),(23,'Wahlmodul Medieninformatik (Ausland) 1',5,3,6,NULL),(24,'Wahlmodul Medieninformatik 1 (HSB)',5,4,6,NULL),(25,'Auslandssemester-Begleitung',5,5,6,NULL),(26,'Praxisvorbereitung',6,2,6,NULL),(31,'Mikrocontroller',6,1,6,NULL),(32,'Praxisvorbereitung',6,2,6,NULL),(33,'XML-Technologien',6,3,6,NULL),(34,'Data Mining',6,4,6,NULL),(35,'Software Projektmanagement',6,5,6,NULL),(36,'Spezielle Gebiete der Medientheorie',6,6,6,NULL),(38,'Aktuelle Themen der Medieninformatik',6,8,6,NULL),(39,'Praxis in Unternehmen',7,1,6,NULL),(40,'Bachelor Thesis Gesamt',7,2,6,NULL);
/*!40000 ALTER TABLE `moduls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pruefungs`
--

DROP TABLE IF EXISTS `pruefungs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pruefungs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `semester` int(11) NOT NULL,
  `bezeichnung` varchar(45) NOT NULL,
  `pruefungsart` varchar(45) NOT NULL,
  `versuch` int(11) NOT NULL,
  `anmeldedatum` date DEFAULT NULL,
  `pruefungsdatum` date DEFAULT NULL,
  `nummer` int(11) DEFAULT NULL,
  `moduls_id` int(11) NOT NULL,
  `dozents_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pruefungs_moduls_idx` (`moduls_id`),
  KEY `fk_pruefungs_dozents1_idx` (`dozents_id`),
  CONSTRAINT `fk_pruefungs_dozents1` FOREIGN KEY (`dozents_id`) REFERENCES `dozents` (`id`),
  CONSTRAINT `fk_pruefungs_moduls` FOREIGN KEY (`moduls_id`) REFERENCES `moduls` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pruefungs`
--

LOCK TABLES `pruefungs` WRITE;
/*!40000 ALTER TABLE `pruefungs` DISABLE KEYS */;
INSERT INTO `pruefungs` VALUES (3,1,'Programmieren 1','Klausur',1,'2019-05-14','2019-08-23',1111,1,100),(4,1,'Mathe 1','Klausur',1,'2019-02-20','2019-07-20',1112,2,200),(5,1,'Gestaltung 1','Klausur',1,'2019-02-22','2019-07-22',1113,3,200),(6,2,'Programmieren 2','Projekt',1,'2019-06-14','2019-09-07',1211,6,100),(7,1,'Medieninformatik','Klausur',1,'2019-06-14','2019-09-07',1141,4,100),(8,1,'Informatik','Klausur',1,'2019-06-14','2019-09-07',1151,5,100),(9,2,'Gestaltung 2','Klausur',1,'2019-06-14','2019-09-07',1231,8,100),(10,2,'Medieninformatik 2','Projekt',1,'2019-06-14','2019-09-07',1241,9,100),(11,2,'Mathe 2','Klausur',1,'2019-06-14','2019-09-07',1221,7,100),(12,2,'Rechnernetze','Klausur',1,'2019-06-14','2019-09-07',1251,10,100),(13,3,'Softwaretechnik','Klausur',1,'2020-06-14','2020-09-07',1311,11,302),(14,3,'Medienformate und Algorithmen','Klausur',1,'2020-06-14','2020-09-07',1321,12,302),(15,3,'Informationssicherheit','Klausur',1,'2020-06-14','2020-09-07',1331,13,302),(17,3,'Video','Klausur',1,'2020-06-14','2020-09-07',1341,14,303),(18,3,'Open Code','Klausur',1,'2000-02-01','2020-09-07',1341,14,200),(19,3,'Mensch-Computer-Interaktion','Klausur',1,'2020-06-14','2020-09-07',1342,15,302),(21,4,'Datenbankbasierte Webanwendung','Projekt',1,'2020-06-20','2020-09-20',1411,17,301),(24,4,'Computergrafik','Klausur',1,'2020-06-20','2020-09-20',1421,18,301),(25,4,'Betaville','Projekt',1,'2020-06-20','2020-09-20',1431,14,301);
/*!40000 ALTER TABLE `pruefungs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_belegt_moduls`
--

DROP TABLE IF EXISTS `student_belegt_moduls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `student_belegt_moduls` (
  `student_id` varchar(45) NOT NULL,
  `modul_id` varchar(45) NOT NULL,
  `klausur_id` varchar(45) NOT NULL,
  `note` varchar(45) DEFAULT NULL,
  `versuch` varchar(45) NOT NULL,
  `credits` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`student_id`,`modul_id`,`klausur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_belegt_moduls`
--

LOCK TABLES `student_belegt_moduls` WRITE;
/*!40000 ALTER TABLE `student_belegt_moduls` DISABLE KEYS */;
INSERT INTO `student_belegt_moduls` VALUES ('1','11','2',NULL,'1',NULL),('1','12','3','3.0','2','4'),('2','10','1','2.0','1','4'),('3','14','5','1.0','1','2'),('3','14','6','2.0','1','2');
/*!40000 ALTER TABLE `student_belegt_moduls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `benutzername` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `PW` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `vorname` varchar(255) NOT NULL,
  `nachname` varchar(255) NOT NULL,
  `matrikelnummer` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matrikelnummer_UNIQUE` (`matrikelnummer`)
) ENGINE=InnoDB AUTO_INCREMENT=10034 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (10000,'phans','phans@hs-bremen.de','$2b$10$BTusOz/GiBeKZkMk5/gqAOVSmFhppQaa5g64zuy.gIZUec28HHGI2','Peter','Hans',50000),(10001,'hschmitz','hschmitz@hs-bremen.de','$2b$10$DVXNqe7mG1bsM72hL4fX7.ySoDZw0Ifb4OFUagZhORMncTzaITU5G','Heinz','Schmitz',50001),(10002,'jmaass','jmaass@hs-bremen.de','$2b$10$PQThyYmD8zy60tWvwzRc7OydqIOJf9DmBJQWbc3KeSDLe1eKcHdMa','Jule','Maaß',50002),(10031,'cflocke','cflocke@hs-bremen.de','$2b$10$3GXfbPaK9/5x1eSokmqbcuf0VhE2tkh/PmFZZVxyq2317AeUDhq0e','Claudia','Flocke',50031),(10032,'fbuchholz','fbuchholz@hs-bremen.de','$2b$10$B9iMFDEhlIh2Ve2.Eza.Pu8gO.QwEmn2CdKbXXdUVIj1qDoLRY2yu','Florian','Buchholz',50032),(10033,'lwerdermann','lwerdermann@hs-bremen.de','$2b$10$YWbVuyTbA0T5l5WIKMUxC.Co//BZB1S4N1sZ4jVgQdaQXy/Jdnsk.','Lukas','Werdermann',50033);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students_has_moduls`
--

DROP TABLE IF EXISTS `students_has_moduls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `students_has_moduls` (
  `students_id` int(11) NOT NULL,
  `moduls_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`students_id`,`moduls_id`),
  KEY `fk_students_has_moduls_moduls1_idx` (`moduls_id`),
  KEY `fk_students_has_moduls_students1_idx` (`students_id`),
  CONSTRAINT `fk_students_has_moduls_moduls1` FOREIGN KEY (`moduls_id`) REFERENCES `moduls` (`id`),
  CONSTRAINT `fk_students_has_moduls_students1` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students_has_moduls`
--

LOCK TABLES `students_has_moduls` WRITE;
/*!40000 ALTER TABLE `students_has_moduls` DISABLE KEYS */;
INSERT INTO `students_has_moduls` VALUES (10001,1,0),(10001,2,0),(10001,3,0),(10001,4,0),(10001,5,0),(10002,1,0),(10002,2,0),(10002,3,0),(10002,4,0),(10002,5,0),(10002,6,0),(10002,8,0),(10002,9,0),(10002,10,0),(10002,11,0),(10002,14,0),(10002,17,0),(10002,18,0),(10031,10,0),(10031,14,0),(10031,17,0),(10031,18,0),(10031,19,0),(10032,14,0),(10032,17,0),(10032,18,0),(10032,19,0),(10033,14,0),(10033,15,0),(10033,17,0),(10033,18,0),(10033,19,0);
/*!40000 ALTER TABLE `students_has_moduls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students_has_pruefungs`
--

DROP TABLE IF EXISTS `students_has_pruefungs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `students_has_pruefungs` (
  `students_id` int(11) NOT NULL,
  `pruefungs_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `note` float DEFAULT NULL,
  PRIMARY KEY (`students_id`,`pruefungs_id`),
  KEY `fk_students_has_pruefungs_pruefungs1_idx` (`pruefungs_id`),
  KEY `fk_students_has_pruefungs_students1_idx` (`students_id`),
  CONSTRAINT `fk_students_has_pruefungs_pruefungs1` FOREIGN KEY (`pruefungs_id`) REFERENCES `pruefungs` (`id`),
  CONSTRAINT `fk_students_has_pruefungs_students1` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students_has_pruefungs`
--

LOCK TABLES `students_has_pruefungs` WRITE;
/*!40000 ALTER TABLE `students_has_pruefungs` DISABLE KEYS */;
INSERT INTO `students_has_pruefungs` VALUES (10001,3,0,5),(10001,4,0,0),(10001,5,0,0),(10001,7,0,0),(10001,8,0,3.7),(10002,3,0,2.7),(10002,4,0,0),(10002,5,0,2.3),(10002,6,0,1.7),(10002,7,0,0),(10002,8,0,0),(10002,9,0,5),(10002,10,0,0),(10002,12,0,0),(10002,13,0,0),(10002,21,0,1),(10002,24,0,1),(10002,25,0,0),(10031,12,0,0),(10031,17,0,0),(10031,21,0,2.3),(10031,24,0,2.3),(10031,25,0,1.3),(10032,21,0,1),(10032,24,0,1),(10032,25,0,1.3),(10033,19,0,0),(10033,21,0,1),(10033,24,0,1),(10033,25,0,1.3);
/*!40000 ALTER TABLE `students_has_pruefungs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students_has_studiengangs`
--

DROP TABLE IF EXISTS `students_has_studiengangs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `students_has_studiengangs` (
  `students_id` int(11) NOT NULL,
  `studiengangs_id` int(11) NOT NULL,
  PRIMARY KEY (`students_id`,`studiengangs_id`),
  KEY `fk_students_has_studiengangs_studiengangs1_idx` (`studiengangs_id`),
  KEY `fk_students_has_studiengangs_students1_idx` (`students_id`),
  CONSTRAINT `fk_students_has_studiengangs_students1` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`),
  CONSTRAINT `fk_students_has_studiengangs_studiengangs1` FOREIGN KEY (`studiengangs_id`) REFERENCES `studiengangs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students_has_studiengangs`
--

LOCK TABLES `students_has_studiengangs` WRITE;
/*!40000 ALTER TABLE `students_has_studiengangs` DISABLE KEYS */;
INSERT INTO `students_has_studiengangs` VALUES (10001,1),(10002,1),(10031,1),(10032,1),(10033,1);
/*!40000 ALTER TABLE `students_has_studiengangs` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Verschiedene Studiengänge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studiengangs`
--

LOCK TABLES `studiengangs` WRITE;
/*!40000 ALTER TABLE `studiengangs` DISABLE KEYS */;
INSERT INTO `studiengangs` VALUES (1,'Internationaler Studiengang Medieninformatik','','Bachelor of Science',210),(2,'Technische Informatik','Die Langweiler vom Dienst','Bachelor of Science',210);
/*!40000 ALTER TABLE `studiengangs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studiengangs_has_moduls`
--

DROP TABLE IF EXISTS `studiengangs_has_moduls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `studiengangs_has_moduls` (
  `studiengangs_id` int(11) NOT NULL,
  `moduls_id` int(11) NOT NULL,
  PRIMARY KEY (`studiengangs_id`,`moduls_id`),
  KEY `fk_studiengangs_has_moduls_moduls1_idx` (`moduls_id`),
  KEY `fk_studiengangs_has_moduls_studiengangs1_idx` (`studiengangs_id`),
  CONSTRAINT `fk_studiengangs_has_moduls_moduls1` FOREIGN KEY (`moduls_id`) REFERENCES `moduls` (`id`),
  CONSTRAINT `fk_studiengangs_has_moduls_studiengangs1` FOREIGN KEY (`studiengangs_id`) REFERENCES `studiengangs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studiengangs_has_moduls`
--

LOCK TABLES `studiengangs_has_moduls` WRITE;
/*!40000 ALTER TABLE `studiengangs_has_moduls` DISABLE KEYS */;
INSERT INTO `studiengangs_has_moduls` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,17),(1,18),(1,19),(1,20),(1,21),(1,22),(1,23),(1,24),(1,25),(1,26),(1,31),(1,32),(1,33),(1,34),(1,35),(1,36),(1,38),(1,39),(1,40);
/*!40000 ALTER TABLE `studiengangs_has_moduls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `termins`
--

DROP TABLE IF EXISTS `termins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `termins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `termin_bezeichnung` varchar(45) NOT NULL,
  `datum` date NOT NULL,
  `erledigt` tinyint(4) NOT NULL,
  `students_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_termins_students1_idx` (`students_id`),
  CONSTRAINT `fk_termins_students1` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `termins`
--

LOCK TABLES `termins` WRITE;
/*!40000 ALTER TABLE `termins` DISABLE KEYS */;
INSERT INTO `termins` VALUES (9,'Datenbanken Abgabe','2019-06-26',0,10002),(12,'Hausaufgaben','2019-09-13',0,10002),(35,'Prüfung Softwaretechnik','2020-09-07',0,10002),(36,'Prüfung Mathe 1','2019-07-20',0,10002),(37,'Prüfung Medieninformatik','2019-09-07',0,10002),(39,'Prüfung Medieninformatik 2','2019-09-07',0,10002),(40,'Prüfung Informatik','2019-09-07',0,10002),(47,'Prüfung Betaville','2020-09-20',0,10002);
/*!40000 ALTER TABLE `termins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mynewdb'
--

--
-- Dumping routines for database 'mynewdb'
--
/*!50003 DROP PROCEDURE IF EXISTS `all_grades_student` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `all_grades_student`(stud_id VARCHAR(45))
BEGIN

/*Select alle Prüfungen mit Modul mit noten für einen Studenten*/
Select T1.id,  T1.benutzername, T2.nummer, T2.bezeichnung, T2.versuch, T2.pruefungsart, T2.semester, T3.note, T4.credits, T2.pruefungsdatum, T6.benutzername as dozent_name  
from students T1, pruefungs T2, students_has_pruefungs T3, moduls T4, students_has_moduls T5, dozents T6
where T1.id = stud_id
and T3.students_id = stud_id
and T2.id = T3.pruefungs_id
and T5.students_id = stud_id
and T4.id = T5.moduls_id
and T2.moduls_id = T4.id
and T6.id = T2.dozents_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `all_moduls_semester` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `all_moduls_semester`(sem VARCHAR(45))
BEGIN
/* Module eines Semesters */
select distinct moduls.semester, moduls.bezeichnung, moduls.beschreibung as moduls_bez
 from pruefungs, moduls
 where moduls.semester = sem;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `all_moduls_student` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `all_moduls_student`(stud_id VARCHAR(45))
BEGIN
/* select module für student*/
select DISTINCT T1.id, T3.bezeichnung, T3.nummer, T3.versuch, T3.dozents_id, T2.semester, T3.anmeldedatum, T3.pruefungsdatum, T4.status, T6.benutzername
from students T1, moduls T2, pruefungs T3, students_has_moduls T4, students_has_pruefungs T5, dozents T6
where T1.id = stud_id
and T4.students_id = stud_id
and T2.id = T4.moduls_id
and T5.students_id = stud_id
and T3.moduls_id = T4.moduls_id
and T6.id = T3.dozents_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `all_moduls_studiengang` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `all_moduls_studiengang`(studiengangs_id VARCHAR(45))
BEGIN
select T1.* 
from moduls T1, studiengangs_has_moduls T3
where T3.studiengangs_id = studiengangs_id
and T1.id = T3.moduls_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `all_pruefungsinformationen_studiengang` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `all_pruefungsinformationen_studiengang`(studiengangs_id VARCHAR(45))
BEGIN

/*pruefungsinformationen eines Moduls*/
 select moduls.id as moduls_id, pruefungs.bezeichnung as pruefungs_bez,  pruefungs.pruefungsdatum,  dozents.nachname, pruefungs.id
 from pruefungs, moduls, dozents, studiengangs_has_moduls
 where studiengangs_has_moduls.studiengangs_id = studiengangs_id
 and moduls.id = studiengangs_has_moduls.moduls_id
 and pruefungs.moduls_id = moduls.id
 and dozents.id = pruefungs.dozents_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `all_pruefungs_dozent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `all_pruefungs_dozent`(doz_id VARCHAR(45))
BEGIN
select T1.nummer, T1.bezeichnung as pruefungs_bez, T1.pruefungsart, T1. pruefungsdatum, T2.id as stud_id, T2.matrikelnummer, T3.note, T3.pruefungs_id as pruef_id
from pruefungs T1, students T2, students_has_pruefungs T3
where T1.dozents_id = doz_id
and T3.pruefungs_id = T1.id
and T3.students_id = T2.id; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `all_pruefungs_once_dozent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `all_pruefungs_once_dozent`(doz_id VARCHAR(45))
BEGIN
select bezeichnung, pruefungsart, pruefungsdatum
from pruefungs
where dozents_id = doz_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `all_pruefung_student` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `all_pruefung_student`(student_id VARCHAR(45))
BEGIN
/* Select Prüfungen für Studenten */
select T1.id, T1.benutzername, T2.note, T2.pruefungs_id, T3.bezeichnung, T3.pruefungsdatum
from students T1, students_has_pruefungs T2, pruefungs T3
where T1.id = student_id
and T2.students_id = student_id
and T3.id = T2.pruefungs_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `all_semesters_studiengang` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `all_semesters_studiengang`(studiengangs_id VARCHAR(45))
BEGIN
/* Semester eines Studiengangs*/
select distinct T1.semester  
from moduls T1, studiengangs_has_moduls T2
where T2.studiengangs_id = studiengangs_id
and T1.id = T2.moduls_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `all_termins_student` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `all_termins_student`(stud_id VARCHAR(45))
BEGIN
select  T2.id, T2.termin_bezeichnung, T2.datum, T2.erledigt
from  termins T2
where T2.students_id = stud_id
order by
T2.datum;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `count_students` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `count_students`()
BEGIN
/*anzahl der studeierenden die noten haben*/
select count(DISTINCT students_id) as summe_studs 
from students_has_pruefungs;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_students_has_moduls` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_students_has_moduls`(stud_id VARCHAR(45), modul_id VARCHAR(45))
BEGIN
delete from students_has_moduls 
where students_id = stud_id
and moduls_id = modul_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_students_has_pruefungs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_students_has_pruefungs`(stud_id VARCHAR(45), pruef_id VARCHAR(45))
BEGIN
delete from students_has_pruefungs 
where students_id = stud_id
and pruefungs_id = pruef_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_termin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_termin`(termin_id VARCHAR(45))
BEGIN
DELETE FROM termins WHERE id = termin_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ges_note_student` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ges_note_student`(stud_id VARCHAR(45))
BEGIN
select T1.students_id, sum(T1.note) as gesamtNote, count(*) as count, T2.matrikelnummer
from students_has_pruefungs T1, students T2
where students_id = stud_id 
and note is not null 
and note != 0 and note < 4.0
and T2.id = stud_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_student_has_moduls` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_student_has_moduls`(student_id VARCHAR(45), modul_id VARCHAR(45))
BEGIN
insert into students_has_moduls values (student_id,  modul_id,0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_student_has_pruefungs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_student_has_pruefungs`(student_id VARCHAR(45), pruefungs_id VARCHAR(45))
BEGIN
insert into students_has_pruefungs values (student_id, pruefungs_id,0,0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_student_has_studiengangs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_student_has_studiengangs`(student_id VARCHAR(45), studiengangs_id VARCHAR(45))
BEGIN
insert into students_has_studiengangs values (student_id, studiengangs_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_termin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_termin`(bezeichnung VARCHAR(45), datum DATE, stud_id VARCHAR(45))
BEGIN
INSERT into termins
values (NULL,bezeichnung,datum,0,stud_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `student_studies` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `student_studies`(stud_id VARCHAR(45))
BEGIN
/* select Studiengang und abschluss für student*/
select DISTINCT T1.id, T1.benutzername, T2.bezeichnung, T2.abschluss, T2.id
from students T1, studiengangs T2, students_has_studiengangs T3
where T1.id = stud_id
and T3.students_id = stud_id
and T2.id = T3.studiengangs_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `studiengang_with_moduls` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `studiengang_with_moduls`()
BEGIN
/*alle module mit semestern eines studiengangs, */
select T1.bezeichnung as studBezeichnung, T2.bezeichnung as modBezeichnung, T2.semester
from studiengangs T1, moduls T2, studiengangs_has_moduls T3
where T1.id = T3.studiengangs_id
and T2.id = T3.moduls_id;

/*anzahl der semester eines studiengangs zählen das ist möglicherweise auch im code direkt zu berechnen
select T1.bezeichnung as stud_ezeichnung, count(distinct T2.semester) as semester_anzahl
from studiengangs T1, moduls T2, studiengangs_has_moduls T3
where T1.id = T3.studiengangs_id
and T2.id = T3.moduls_id;*/
      
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_note` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_note`(pruef VARCHAR(45), stud_id VARCHAR(45), note_neu VARCHAR(45))
BEGIN
update students_has_pruefungs 
set note = note_neu
where students_id = stud_id
and pruefungs_id = pruef ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_termin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_termin`(termin_id INT)
BEGIN
UPDATE termins
SET erledigt = 1
WHERE id = termin_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-30  1:42:59
