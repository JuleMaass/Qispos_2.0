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
-- Dumping data for table `dozents`
--

LOCK TABLES `dozents` WRITE;
/*!40000 ALTER TABLE `dozents` DISABLE KEYS */;
INSERT INTO `dozents` VALUES ('pkrug',100,'pkrug@hs-bremen.de',100100,'peter','krug'),('oheike',200,'oheike@hs-bremen.de',200200,'otto','heike'),('tbruns',300,'tbruns@hs-bremen.de',300300,'torben','bruns');
/*!40000 ALTER TABLE `dozents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `klausurs`
--

LOCK TABLES `klausurs` WRITE;
/*!40000 ALTER TABLE `klausurs` DISABLE KEYS */;
INSERT INTO `klausurs` VALUES (1,'Matheklausur1',NULL),(2,'Matheklausur2',NULL),(3,'Rechnernetze1',NULL),(4,'Programmieren1',NULL),(5,'Englisch',NULL),(6,'Englisch_Referat',NULL);
/*!40000 ALTER TABLE `klausurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `moduls`
--

LOCK TABLES `moduls` WRITE;
/*!40000 ALTER TABLE `moduls` DISABLE KEYS */;
INSERT INTO `moduls` VALUES (10,'Mathe-leicht',1,4,100),(11,'Mathe2',2,4,100),(12,'Rechnernetze',2,4,200),(13,'Programmieren1',1,4,300),(14,'Englisch',4,4,400);
/*!40000 ALTER TABLE `moduls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `student_belegt_moduls`
--

LOCK TABLES `student_belegt_moduls` WRITE;
/*!40000 ALTER TABLE `student_belegt_moduls` DISABLE KEYS */;
INSERT INTO `student_belegt_moduls` VALUES (1,11,2,NULL,'1',NULL),(1,12,3,'3.0','2','4'),(2,10,1,'2.0','1','4'),(3,14,5,'1.0','1','2'),(3,14,6,'2.0','1','2');
/*!40000 ALTER TABLE `student_belegt_moduls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES ('phans','1','phans@hs-bremen.de','111','Peter','Hans'),('HKrome','10','HKrome@hs-bremen.de','tttest','Horst','Krome'),('HKramer','11','HKramer@hs-bremen.de','313111','Hugo','Kramer'),('HuKramer','12','HuKramer@hs-bremen.de','313111','Hugo','Kramer'),('BTannert','13','BTannert@hs-bremen.de','999','Benjamin','Tannert'),('kkönig','2','könig@hs-bremen.de','222','Klaus','König'),('hulla','3','hulla@hs-bremen.de','333','Horst','Ulla'),('lmeier','4','lmeier@hs-bremen.de','444','Lisa','Meier'),('hschmitz','5','hschmitz@hs-bremen.de','555','Heinz','Schmitz'),('FBuchholz','7','FBuchholz@hs-bremen.de','test','Florian','Buchholz'),('JMaaß','9','JMaaß@hs-bremen.de','Purzelbärchen','Jule','Maaß'),('Kreativ','9222','Werdmal@kreativ.de','000','Horst','Uschibert'),('Jörg','999','buchholz@hs-bremen.de','zrr','Jörg','Buchholz');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-12 10:05:43
