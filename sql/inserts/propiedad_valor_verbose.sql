-- MySQL dump 10.13  Distrib 5.7.38, for Linux (x86_64)
--
-- Host: localhost    Database: LibreDic
-- ------------------------------------------------------
-- Server version	5.7.38-0ubuntu0.18.04.1

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
-- Table structure for table `propiedad_valor_verbose`
--

DROP TABLE IF EXISTS `propiedad_valor_verbose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propiedad_valor_verbose` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` char(1) COLLATE utf8mb4_bin NOT NULL,
  `tipo` char(3) COLLATE utf8mb4_bin NOT NULL,
  `valor` char(3) COLLATE utf8mb4_bin NOT NULL,
  `verbose` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `propiedad_valor_verbose_categoria_IDX` (`categoria`,`tipo`,`valor`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propiedad_valor_verbose`
--

LOCK TABLES `propiedad_valor_verbose` WRITE;
/*!40000 ALTER TABLE `propiedad_valor_verbose` DISABLE KEYS */;
INSERT INTO `propiedad_valor_verbose` VALUES (100,'A','T','O','ordinal'),(101,'A','T','Q','qualificativo'),(102,'A','T','P','posesivo'),(103,'A','D','S','superlativo'),(104,'A','D','V','evaluativo'),(105,'A','G','F','femenino'),(106,'A','G','M','masculino'),(107,'A','G','C','comun'),(108,'A','N','S','singular'),(109,'A','N','P','plural'),(110,'A','N','N','invariable'),(111,'A','PP','1','1'),(112,'A','PP','2','2'),(113,'A','PP','3','3'),(114,'A','PN','S','singular'),(115,'A','PN','P','plural'),(116,'A','PN','N','invariable'),(117,'C','T','C','coordinantes'),(118,'C','T','S','subordinantes'),(119,'D','T','A','articulo'),(120,'D','T','D','demostrativo'),(121,'D','T','I','indefindo'),(122,'D','T','P','posesivo'),(123,'D','T','T','interrogativo'),(124,'D','T','E','exclamativo'),(125,'D','PR','1','1'),(126,'D','PR','2','2'),(127,'D','PR','3','3'),(128,'D','G','F','femenino'),(129,'D','G','M','masculino'),(130,'D','G','C','comun'),(131,'D','N','S','singular'),(132,'D','N','F','plural'),(133,'D','N','C','comun'),(134,'D','PN','S','singular'),(135,'D','PN','F','plural'),(136,'D','PN','C','comun'),(137,'N','T','C','comun'),(138,'N','T','P','propio'),(139,'N','G','F','femenino'),(140,'N','G','M','masculino'),(141,'N','G','C','comun'),(142,'N','N','S','singular'),(143,'N','N','P','plural'),(144,'N','N','N','invariable'),(145,'N','NC','S','persona'),(146,'N','NC','G','lugar'),(147,'N','NC','O','organizacion'),(148,'N','NC','V','otro'),(149,'N','D','V','evaluativo'),(150,'P','T','D','demostrativo'),(151,'P','T','E','exclamativo'),(152,'P','T','I','indefinido'),(153,'P','T','P','personal'),(154,'P','T','R','relativo'),(155,'P','T','T','interrogativo'),(156,'P','PR','1','1'),(157,'P','PR','2','2'),(158,'P','PR','3','3'),(159,'P','G','F','femenino'),(160,'P','G','M','masculino'),(161,'P','G','C','comun'),(162,'P','N','S','singular'),(163,'P','N','P','plural'),(164,'P','N','N','invariable'),(165,'P','C','N','nominativo'),(166,'P','C','A','acusativo'),(167,'P','C','D','dativo'),(168,'P','C','O','oblicuo'),(169,'P','P','P','formal'),(170,'R','T','N','negativo'),(171,'R','T','G','general'),(172,'S','T','P','preposicion'),(173,'V','T','M','principal'),(174,'V','T','A','auxiliar'),(175,'V','T','S','semiauxiliar'),(176,'V','M','I','indicativo'),(177,'V','M','S','subjuntivo'),(178,'V','M','M','imperativo'),(179,'V','M','P','participio'),(180,'V','M','G','gerundio'),(181,'V','M','N','infinitivo'),(182,'V','TN','P','presente'),(183,'V','TN','I','imperfecto'),(184,'V','TN','F','futuro'),(185,'V','TN','S','pasado'),(186,'V','TN','C','condicional'),(187,'V','PR','1','1'),(188,'V','PR','2','2'),(189,'V','PR','3','3'),(190,'V','N','S','singular'),(191,'V','N','P','plural'),(192,'V','G','F','femenino'),(193,'V','G','M','masculino'),(194,'V','G','C','comun'),(195,'Z','T','D','partitivo'),(196,'Z','T','M','moneda'),(197,'Z','T','P','porcentage'),(198,'Z','T','U','unidad');
/*!40000 ALTER TABLE `propiedad_valor_verbose` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-05 13:47:46
