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
-- Table structure for table `quiz_provvisorio`
--

DROP TABLE IF EXISTS `quiz_provvisorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_provvisorio` (
  `idquiz_provvisorio` int NOT NULL,
  `domanda` varchar(45) DEFAULT NULL,
  `quesito1` varchar(45) DEFAULT NULL,
  `quesito2` varchar(45) DEFAULT NULL,
  `quesito3` varchar(45) DEFAULT NULL,
  `quesito4` varchar(45) DEFAULT NULL,
  `risposta_corretta` int DEFAULT NULL,
  `idcourse` int NOT NULL,
  `idchapter` int NOT NULL,
  PRIMARY KEY (`idquiz_provvisorio`,`idcourse`,`idchapter`),
  KEY `idchapter_idx` (`idchapter`),
  KEY `courses_idx` (`idcourse`,`idchapter`),
  CONSTRAINT `chapter` FOREIGN KEY (`idcourse`, `idchapter`) REFERENCES `chapter` (`course`, `chapter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_provvisorio`
--

LOCK TABLES `quiz_provvisorio` WRITE;
/*!40000 ALTER TABLE `quiz_provvisorio` DISABLE KEYS */;
INSERT INTO `quiz_provvisorio` VALUES (1,'Cos\'è un Hard Disk?','Hardware','Software','Hardcase','Soft',1,1,1),(2,'Archivio Online','Chiavetta USB','Hard Disk','Cloud','CD',3,1,1),(3,'Indica il più grande','Gigabite','Kilobite','Megabite','Bite',1,1,1),(4,'Porta di Input/Output','Mouse','Altoparlante','HDMI','Tastiera',3,1,1),(5,'Estensione file compressi','.zip','.mp3','.docx','.pdf',1,1,2),(6,'Organizzazione cartelle','Albero','Cespuglio','Predefinita','Variabile',1,1,2),(7,'Diminuire grandezza file','Upload','Estrazione','Compressione','Ripristino',3,1,2),(8,'Documenti interconnessi in internet','www','Email','VoIP','Instant Messaging',4,1,2),(9,'Archivio Online','Chiavetta USB','Hard Disk','Cloud','CD',3,1,3),(10,'Porta di Input/Output','Mouse','Altoparlante','HDMI','Tastiera',3,1,3),(11,'Diminuire grandezza file','Upload','Estrazione','Compressione','Ripristino',3,1,3),(12,'Estensione file compressi','.zip','.mp3','.docx','.pdf',1,1,3),(13,'Cos\'è un Hard Disk?','Hardware','Software','Hardcase','Soft',1,2,1),(14,'Archivio Online','Chiavetta USB','Hard Disk','Cloud','CD',3,2,1),(15,'Indica il più grande','Gigabite','Kilobite','Megabite','Bite',1,2,1),(16,'Porta di Input/Output','Mouse','Altoparlante','HDMI','Tastiera',3,2,1),(17,'Estensione file compressi','.zip','.mp3','.docx','.pdf',1,2,2),(18,'Organizzazione cartelle','Albero','Cespuglio','Predefinita','Variabile',1,2,2),(19,'Diminuire grandezza file','Upload','Estrazione','Compressione','Ripristino',3,2,2),(20,'Documenti interconnessi in internet','www','Email','VoIP','Instant Messaging',4,2,2),(21,'Archivio Online','Chiavetta USB','Hard Disk','Cloud','CD',3,2,3),(22,'Porta di Input/Output','Mouse','Altoparlante','HDMI','Tastiera',3,2,3),(23,'Diminuire grandezza file','Upload','Estrazione','Compressione','Ripristino',3,2,3),(24,'Cos\'è un Hard Disk?','Hardware','Software','Hardcase','Soft',1,3,1),(25,'Archivio Online','Chiavetta USB','Hard Disk','Cloud','CD',3,3,1),(26,'Indica il più grande','Gigabite','Kilobite','Megabite','Bite',1,3,1),(27,'Porta di Input/Output','Mouse','Altoparlante','HDMI','Tastiera',3,3,1),(28,'Estensione file compressi','.zip','.mp3','.docx','.pdf',1,3,2),(29,'Organizzazione cartelle','Albero','Cespuglio','Predefinita','Variabile',1,3,2),(30,'Diminuire grandezza file','Upload','Estrazione','Compressione','Ripristino',3,3,2),(31,'Documenti interconnessi in internet','www','Email','VoIP','Instant Messaging',4,3,2),(32,'Archivio Online','Chiavetta USB','Hard Disk','Cloud','CD',3,3,3),(33,'Porta di Input/Output','Mouse','Altoparlante','HDMI','Tastiera',3,3,3),(34,'Diminuire grandezza file','Upload','Estrazione','Compressione','Ripristino',3,3,3),(35,'Estensione file compressi','.zip','.mp3','.docx','.pdf',1,3,3),(36,'Cos\'è un Hard Disk?','Hardware','Software','Hardcase','Soft',1,4,1),(37,'Archivio Online','Chiavetta USB','Hard Disk','Cloud','CD',3,4,1),(38,'Indica il più grande','Gigabite','Kilobite','Megabite','Bite',1,4,1),(39,'Porta di Input/Output','Mouse','Altoparlante','HDMI','Tastiera',3,4,1),(40,'Estensione file compressi','.zip','.mp3','.docx','.pdf',1,4,2),(41,'Organizzazione cartelle','Albero','Cespuglio','Predefinita','Variabile',1,4,2),(42,'Diminuire grandezza file','Upload','Estrazione','Compressione','Ripristino',3,4,2),(43,'Documenti interconnessi in internet','www','Email','VoIP','Instant Messaging',4,4,2),(44,'Archivio Online','Chiavetta USB','Hard Disk','Cloud','CD',3,4,3),(45,'Porta di Input/Output','Mouse','Altoparlante','HDMI','Tastiera',3,4,3),(46,'Diminuire grandezza file','Upload','Estrazione','Compressione','Ripristino',3,4,3),(47,'Estensione file compressi','.zip','.mp3','.docx','.pdf',1,4,3),(48,'Cos\'è un Hard Disk?','Hardware','Software','Hardcase','Soft',1,5,1),(49,'Archivio Online','Chiavetta USB','Hard Disk','Cloud','CD',3,5,1),(50,'Indica il più grande','Gigabite','Kilobite','Megabite','Bite',1,5,1),(51,'Porta di Input/Output','Mouse','Altoparlante','HDMI','Tastiera',3,5,1),(52,'Estensione file compressi','.zip','.mp3','.docx','.pdf',1,5,2),(53,'Organizzazione cartelle','Albero','Cespuglio','Predefinita','Variabile',1,5,2),(54,'Diminuire grandezza file','Upload','Estrazione','Compressione','Ripristino',3,5,2),(55,'Documenti interconnessi in internet','www','Email','VoIP','Instant Messaging',4,5,2),(56,'Archivio Online','Chiavetta USB','Hard Disk','Cloud','CD',3,5,3),(57,'Porta di Input/Output','Mouse','Altoparlante','HDMI','Tastiera',3,5,3),(58,'Diminuire grandezza file','Upload','Estrazione','Compressione','Ripristino',3,5,3),(59,'Estensione file compressi','.zip','.mp3','.docx','.pdf',1,5,3),(60,'Cos\'è un Hard Disk?','Hardware','Software','Hardcase','Soft',1,6,1),(61,'Archivio Online','Chiavetta USB','Hard Disk','Cloud','CD',3,6,1),(62,'Indica il più grande','Gigabite','Kilobite','Megabite','Bite',1,6,1),(63,'Porta di Input/Output','Mouse','Altoparlante','HDMI','Tastiera',3,6,1),(64,'Estensione file compressi','.zip','.mp3','.docx','.pdf',1,6,2),(65,'Organizzazione cartelle','Albero','Cespuglio','Predefinita','Variabile',1,6,2),(66,'Diminuire grandezza file','Upload','Estrazione','Compressione','Ripristino',3,6,2),(67,'Documenti interconnessi in internet','www','Email','VoIP','Instant Messaging',4,6,2),(68,'Archivio Online','Chiavetta USB','Hard Disk','Cloud','CD',3,6,3),(69,'Porta di Input/Output','Mouse','Altoparlante','HDMI','Tastiera',3,6,3),(70,'Diminuire grandezza file','Upload','Estrazione','Compressione','Ripristino',3,6,3),(71,'Estensione file compressi','.zip','.mp3','.docx','.pdf',1,6,3),(72,'Cos\'è un Hard Disk?','Hardware','Software','Hardcase','Soft',1,7,1),(73,'Archivio Online','Chiavetta USB','Hard Disk','Cloud','CD',3,7,1),(74,'Indica il più grande','Gigabite','Kilobite','Megabite','Bite',1,7,1),(75,'Porta di Input/Output','Mouse','Altoparlante','HDMI','Tastiera',3,7,1),(76,'Estensione file compressi','.zip','.mp3','.docx','.pdf',1,7,2),(77,'Organizzazione cartelle','Albero','Cespuglio','Predefinita','Variabile',1,7,2),(78,'Diminuire grandezza file','Upload','Estrazione','Compressione','Ripristino',3,7,2),(79,'Documenti interconnessi in internet','www','Email','VoIP','Instant Messaging',4,7,2),(80,'Archivio Online','Chiavetta USB','Hard Disk','Cloud','CD',3,7,3),(81,'Porta di Input/Output','Mouse','Altoparlante','HDMI','Tastiera',3,7,3),(82,'Diminuire grandezza file','Upload','Estrazione','Compressione','Ripristino',3,7,3),(83,'Estensione file compressi','.zip','.mp3','.docx','.pdf',1,7,3);
/*!40000 ALTER TABLE `quiz_provvisorio` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-03 16:43:29
