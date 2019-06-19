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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `benutzername` varchar(45) NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `PW` int(11) NOT NULL,
  `vorname` varchar(30) DEFAULT NULL,
  `nachname` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dozents`
--

LOCK TABLES `dozents` WRITE;
/*!40000 ALTER TABLE `dozents` DISABLE KEYS */;
INSERT INTO `dozents` VALUES (100,'pkrug','pkrug@hs-bremen.de',100100,'peter','krug'),(200,'oheike','oheike@hs-bremen.de',200200,'otto','heike'),(300,'tbruns','tbruns@hs-bremen.de',300300,'torben','bruns');
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
  `nummer` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moduls`
--

LOCK TABLES `moduls` WRITE;
/*!40000 ALTER TABLE `moduls` DISABLE KEYS */;
INSERT INTO `moduls` VALUES (1,'Programmieren 1',1,1,6,'',1110),(2,'Mathe 1',1,2,6,'',1120);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pruefungs`
--

LOCK TABLES `pruefungs` WRITE;
/*!40000 ALTER TABLE `pruefungs` DISABLE KEYS */;
INSERT INTO `pruefungs` VALUES (3,1,'Programmieren 1','Klausur',1,'2019-05-14','2019-08-23',1111,1,100),(4,1,'Mathe 1 KL','Klasur',1,'2019-02-20','2019-07-20',1112,2,200);
/*!40000 ALTER TABLE `pruefungs` ENABLE KEYS */;
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
  `PW` varchar(255) NOT NULL,
  `vorname` varchar(255) NOT NULL,
  `nachname` varchar(255) NOT NULL,
  `matrikelnummer` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10020 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (10000,'phans','phans@hs-bremen.de','111','Peter','Hans',50000),(10001,'hschmitz','hschmitz@hs-bremen.de','555','Heinz','Schmitz',50001),(10002,'JMaaß','JMaaß@hs-bremen.de','Purzelbärchen','Jule','Maaß',50002),(10003,'FBuchholz','FBuchholz@hs-bremen.de','test','Florian','Buchholz',50003),(10004,'HKramer','HKramer@hs-bremen.de','313111','Hugo','Kramer',50004),(10005,'HuKramer','HuKramer@hs-bremen.de','313111','Hugo','Kramer',50005),(10006,'HKrome','HKrome@hs-bremen.de','tttest','Horst','Krome',50006),(10007,'Jörg','buchholz@hs-bremen.de','zrr','Jörg','Buchholz',50007),(10008,'Kreativ','Werdmal@kreativ.de','000','Horst','Uschibert',50008),(10009,'BTannert','BTannert@hs-bremen.de','999','Benjamin','Tannert',50009),(10010,'kkönig','könig@hs-bremen.de','222','Klaus','König',50010),(10011,'hulla','hulla@hs-bremen.de','333','Horst','Ulla',50011),(10012,'FWoichek','FWoichek@hs-bremen.de','superheld','Fabian','Woichek',50012),(10013,'WTjark','WTjark@hs-bremen.de','232','Wio','Tjark',50013),(10016,'pklempner','pklempner@hs-bremen.de','889','Paolo','Klempner',60016),(10017,'srath','srath@hs-bremen.de','123','Sven','Rath',50017),(10018,'jhorstmeister','jhorstmeister@hs-bremen.de','1233','Jan','Horstmeister',50018),(10019,'jhorstick','jhorstick@hs-bremen.de','test','Jannik','Horstick',50019);
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
INSERT INTO `students_has_moduls` VALUES (10001,1,0),(10002,1,0),(10002,2,0);
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
INSERT INTO `students_has_pruefungs` VALUES (10001,3,0,NULL),(10002,3,0,NULL),(10002,4,0,1.7);
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
INSERT INTO `students_has_studiengangs` VALUES (10001,1),(10002,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Verschiedene Studiengänge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studiengangs`
--

LOCK TABLES `studiengangs` WRITE;
/*!40000 ALTER TABLE `studiengangs` DISABLE KEYS */;
INSERT INTO `studiengangs` VALUES (1,'Internationaler Studiengang Medieninformatik','','Bachelor of Science',210);
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
INSERT INTO `studiengangs_has_moduls` VALUES (1,1);
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
  PRIMARY KEY (`id`,`students_id`),
  KEY `fk_termins_students1_idx` (`students_id`),
  CONSTRAINT `fk_termins_students1` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `termins`
--

LOCK TABLES `termins` WRITE;
/*!40000 ALTER TABLE `termins` DISABLE KEYS */;
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
select DISTINCT  T1.id,  T1.benutzername, T4.nummer, T4.bezeichnung, T2.semester, T5.note, T2.credits, T4.versuch
from students T1, moduls T2, students_has_moduls T3, pruefungs T4, students_has_pruefungs T5
where T1.id = stud_id 
and T3.students_id = stud_id 
and T2.id = T3.moduls_id
and T4.moduls_id = T3.moduls_id
and T5.pruefungs_id = T4.id;

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
select DISTINCT T1.id, T2.bezeichnung, T3.nummer, T3.versuch, T3.dozents_id, T2.semester, T3.anmeldedatum, T3.pruefungsdatum, T4.status, T6.benutzername
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
select DISTINCT T1.id, T1.benutzername, T3.bezeichnung, T3.pruefungsdatum
from students T1, students_has_pruefungs T2, pruefungs T3
where T2.students_id = student_id
and T1.id = student_id
and T3.id = T2.pruefungs_id;
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
where T2.students_id = stud_id;
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
select DISTINCT T1.id, T1.benutzername, T2.bezeichnung, T2.abschluss
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

-- Dump completed on 2019-06-19 17:21:36
