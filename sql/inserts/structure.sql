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
-- Table structure for table `caracteristicas`
--

DROP TABLE IF EXISTS `caracteristicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caracteristicas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_sentido` int(11) NOT NULL,
  `categoria` enum('A','C','D','N','P','R','S','V','Z','W','I') COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `caracteristicas_fk` (`id_sentido`),
  CONSTRAINT `caracteristicas_fk` FOREIGN KEY (`id_sentido`) REFERENCES `sentidos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorias_verbose`
--

DROP TABLE IF EXISTS `categorias_verbose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias_verbose` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` char(1) COLLATE utf8mb4_bin NOT NULL,
  `verbose` varchar(35) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `palabras`
--

DROP TABLE IF EXISTS `palabras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `palabras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lema` varchar(35) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `PALABRAS_UN` (`lema`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `propiedades`
--

DROP TABLE IF EXISTS `propiedades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propiedades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `id_caracteristicas` int(11) NOT NULL,
  `propiedad` enum('T','D','G','N','PP','PN','NC','NSC','C','P','M','TN','PR') COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `propiedades_sentido` (`id_caracteristicas`),
  CONSTRAINT `propiedades_sentido` FOREIGN KEY (`id_caracteristicas`) REFERENCES `caracteristicas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `propiedades_verbose`
--

DROP TABLE IF EXISTS `propiedades_verbose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propiedades_verbose` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `propiedad` char(3) COLLATE utf8mb4_bin NOT NULL,
  `verbose` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `TIPOS_PROPIEDADES_UN` (`propiedad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sentidos`
--

DROP TABLE IF EXISTS `sentidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sentidos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_palabra` int(11) NOT NULL,
  `id_raiz` int(11) DEFAULT NULL,
  `sentido` text COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  KEY `SENTIDOS_FK` (`id_palabra`),
  KEY `SENTIDOS_FK_1` (`id_raiz`),
  CONSTRAINT `SENTIDOS_FK` FOREIGN KEY (`id_palabra`) REFERENCES `palabras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SENTIDOS_FK_1` FOREIGN KEY (`id_raiz`) REFERENCES `palabras` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-05 13:52:41
