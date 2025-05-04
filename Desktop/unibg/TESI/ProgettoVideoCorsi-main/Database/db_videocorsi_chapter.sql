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
-- Table structure for table `chapter`
--

DROP TABLE IF EXISTS `chapter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chapter` (
  `course` int NOT NULL,
  `chapter` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `video` varchar(45) DEFAULT NULL,
  `is_final` int DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`course`,`chapter`),
  CONSTRAINT `` FOREIGN KEY (`course`) REFERENCES `courses` (`idcourses`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chapter`
--

LOCK TABLES `chapter` WRITE;
/*!40000 ALTER TABLE `chapter` DISABLE KEYS */;
INSERT INTO `chapter` VALUES (1,1,'Computer e Dispositivi','3tdtTkNMGvA',0,'Hardware e Software'),(1,2,'Gestione dei file','3tdtTkNMGvA',0,'Organizzazione di file e cartelle'),(1,3,'Esame finale',NULL,1,'Test di valutazione'),(2,1,'Navigazione nel web','1TaSYPJ3AY8',0,'Utilizzo del browser'),(2,2,'Posta elettronica','1TaSYPJ3AY8',0,'Invio e gestione email'),(2,3,'Esame finale',NULL,1,'Test di valutazione'),(3,1,'Documento','-sYgH4C8Y58',0,'Creazione di un documento'),(3,2,'Oggetti','-sYgH4C8Y58',0,'Creazione tabelle e grafici'),(3,3,'Esame finale',NULL,1,'Test di valutazione'),(4,1,'Fogli di calcolo','Qt391I6DDhk',0,'Gestione di righe e colonne'),(4,2,'Grafici','Qt391I6DDhk',0,'Creazione e modifica grafici'),(4,3,'Esame finale',NULL,1,'Test di valutazione'),(5,1,'Malware','fURRUIHfDPc',0,'Tipologia malware e prevezione'),(5,2,'Sicurezza in rete','fURRUIHfDPc',0,'Siti sicuri, pericoli social e mail'),(5,3,'Esame finale',NULL,1,'Test di valutazione'),(6,1,'Presentazione','R6FdzLKiGxA',0,'Creazione e gestione slide'),(6,2,'Oggetti','R6FdzLKiGxA',0,'Creazione tabelle e grafici'),(6,3,'Esame finale',NULL,1,'Test di valutazione'),(7,1,'Cloud','a3jEh5PJFYM',0,'Gestione cloud Computing'),(7,2,'Google suite','a3jEh5PJFYM',0,'Drive, Calendar, Documenti'),(7,3,'Esame finale',NULL,1,'Test di valutazione');
/*!40000 ALTER TABLE `chapter` ENABLE KEYS */;
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
