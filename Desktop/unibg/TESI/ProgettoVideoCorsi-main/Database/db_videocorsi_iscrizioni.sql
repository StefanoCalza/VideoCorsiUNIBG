-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: db_videocorsi
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `iscrizioni`
--

DROP TABLE IF EXISTS `iscrizioni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iscrizioni` (
  `idCourse` int NOT NULL,
  `id_User` int NOT NULL,
  `idChapter` int NOT NULL,
  `passed` int DEFAULT '0',
  PRIMARY KEY (`idCourse`,`id_User`,`idChapter`),
  KEY `user_idx` (`id_User`),
  KEY `chapter_idx` (`idChapter`),
  KEY `course_idx` (`idCourse`,`idChapter`),
  CONSTRAINT `course` FOREIGN KEY (`idCourse`, `idChapter`) REFERENCES `chapter` (`course`, `chapter`),
  CONSTRAINT `user` FOREIGN KEY (`id_User`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iscrizioni`
--

LOCK TABLES `iscrizioni` WRITE;
/*!40000 ALTER TABLE `iscrizioni` DISABLE KEYS */;
INSERT INTO `iscrizioni` VALUES (1,0,1,1),(1,0,2,0),(1,0,3,0),(1,1,1,1),(1,1,2,1),(1,1,3,0),(1,2,1,2),(1,2,2,2),(1,2,3,2),(2,2,1,0),(2,2,2,0),(2,2,3,0),(3,1,1,0),(3,1,2,0),(3,1,3,0),(3,2,1,0),(3,2,2,0),(3,2,3,0),(4,2,1,0),(4,2,2,0),(4,2,3,0),(5,2,1,0),(5,2,2,0),(5,2,3,0),(6,2,1,0),(6,2,2,0),(6,2,3,0),(7,2,1,0),(7,2,2,0),(7,2,3,0);
/*!40000 ALTER TABLE `iscrizioni` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-03 16:43:28
