CREATE DATABASE  IF NOT EXISTS `voting` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `voting`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: voting
-- ------------------------------------------------------
-- Server version	5.6.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `username` varchar(12) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('CEO','CEO');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applicants`
--

DROP TABLE IF EXISTS `applicants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applicants` (
  `eventname` varchar(45) NOT NULL,
  `appliedforpost` varchar(45) NOT NULL,
  `isapproved` bit(1) NOT NULL,
  `rollno` varchar(12) NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phoneno` varchar(15) NOT NULL,
  `gender` varchar(1) NOT NULL,
  PRIMARY KEY (`rollno`),
  UNIQUE KEY `rollno_UNIQUE` (`rollno`),
  KEY `ei_idx` (`eventname`),
  CONSTRAINT `en` FOREIGN KEY (`eventname`) REFERENCES `electionevent` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rolln` FOREIGN KEY (`rollno`) REFERENCES `students` (`rollno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='		';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applicants`
--

LOCK TABLES `applicants` WRITE;
/*!40000 ALTER TABLE `applicants` DISABLE KEYS */;
INSERT INTO `applicants` VALUES ('Gymkhana Elections - 2015','UG_Senate_First_Year','\0','y12uc222','Sai Siddharth Padmanabhuni','sai@ga.com','8564251335','M'),('Gymkhana Elections - 2015','P','\0','y12uc294','dhananjay','dhananjay@gmail.com','8564251596','M'),('Gymkhana Elections - 2015','P','','y12uc344','Ram Gupta','eam@gupts.com','8562253156','M');
/*!40000 ALTER TABLE `applicants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidates`
--

DROP TABLE IF EXISTS `candidates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidates` (
  `rollno` varchar(15) NOT NULL,
  `agenda` longtext,
  `photo` longblob,
  `points` varchar(45) DEFAULT NULL,
  `haswon` bit(1) NOT NULL,
  PRIMARY KEY (`rollno`),
  UNIQUE KEY `rollno_UNIQUE` (`rollno`),
  CONSTRAINT `rollnn` FOREIGN KEY (`rollno`) REFERENCES `students` (`rollno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidates`
--

LOCK TABLES `candidates` WRITE;
/*!40000 ALTER TABLE `candidates` DISABLE KEYS */;
INSERT INTO `candidates` VALUES ('Y12UC344',NULL,NULL,NULL,'\0');
/*!40000 ALTER TABLE `candidates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `electionevent`
--

DROP TABLE IF EXISTS `electionevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `electionevent` (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `date` date NOT NULL,
  `starttime` time NOT NULL,
  `endtime` time NOT NULL,
  PRIMARY KEY (`eid`),
  UNIQUE KEY `eid_UNIQUE` (`eid`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `electionevent`
--

LOCK TABLES `electionevent` WRITE;
/*!40000 ALTER TABLE `electionevent` DISABLE KEYS */;
INSERT INTO `electionevent` VALUES (2,'Gymkhana Elections - 2015','2015-01-27','12:00:00','20:00:00'),(4,'Gymkhana Elections - 2016','2016-01-12','12:00:00','00:00:00'),(7,'Gymkhana','2015-01-27','00:00:00','04:00:00'),(12,'sffsef','2015-01-27','14:00:00','00:15:12'),(19,'sgsrhwr','2015-01-26','12:00:00','14:00:00'),(27,'Gympkhana Elections 2011','2015-05-26','12:01:28','14:01:28'),(30,'Gymkhana El','2015-05-27','05:53:00','05:53:00');
/*!40000 ALTER TABLE `electionevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `rollno` varchar(12) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`rollno`),
  UNIQUE KEY `rollno_UNIQUE` (`rollno`),
  CONSTRAINT `roll` FOREIGN KEY (`rollno`) REFERENCES `students` (`rollno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('14UB234','14ub234'),('Y12UC222','y12uc222'),('Y12UC294','y12uc294'),('Y12UC344','y12uc344'),('Y12UC567','y12uc567'),('Y15UC034','y15uc034');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `positions` (
  `eid` int(11) NOT NULL,
  `position` varchar(45) NOT NULL,
  `allowedbatch` varchar(45) NOT NULL,
  KEY `eid_idx` (`eid`),
  CONSTRAINT `eid` FOREIGN KEY (`eid`) REFERENCES `electionevent` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
INSERT INTO `positions` VALUES (2,'P','all'),(2,'VP','all'),(2,'GSP','all'),(2,'GSC','all'),(4,'P','all'),(4,'VP','all'),(4,'GSP','all'),(4,'GSC','all'),(4,'GSST','GSST'),(4,'UG_Senate_Fourth_Year','UG_Senate_Fourth_Year'),(4,'UG_Senate_Third_Year','UG_Senate_Third_Year'),(4,'UG_Senate_Second_Year','UG_Senate_Second_Year'),(4,'PG','PG'),(4,'P','all'),(4,'VP','all'),(4,'GSP','all'),(4,'PG','PG'),(7,'P','all'),(7,'VP','all'),(7,'GSP','all'),(7,'PG','PG'),(12,'P','all'),(19,'P','all'),(19,'VP','all'),(19,'UG_Senate_Second_Year','UG_Senate_Second_Year'),(27,'P','all'),(30,'P','all'),(30,'VP','all'),(30,'PG','PG');
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `rollno` varchar(12) NOT NULL,
  `cgpa` double NOT NULL,
  `batch` int(11) NOT NULL,
  `votegiven` bit(1) NOT NULL,
  PRIMARY KEY (`rollno`),
  UNIQUE KEY `rollno_UNIQUE` (`rollno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES ('14UB234',6.8,1,'\0'),('Y12UC222',3.98,1,'\0'),('Y12UC234',5.65,3,'\0'),('Y12UC294',5.6,3,'\0'),('Y12UC344',6.45,4,'\0'),('Y12UC567',8.9,4,'\0'),('Y15UC034',9.54,1,'\0');
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

-- Dump completed on 2015-05-07  0:42:42
