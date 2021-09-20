-- MySQL dump 10.13  Distrib 8.0.26, for macos11.3 (x86_64)
--
-- Host: 127.0.0.1    Database: EQUIPO
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `equipos`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `EQUIPO` /*!40100 DEFAULT CHARACTER SET utf8 */;

use EQUIPO;

DROP TABLE IF EXISTS `equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipos` (
  `id_equipos` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_equipos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipos`
--

LOCK TABLES `equipos` WRITE;
/*!40000 ALTER TABLE `equipos` DISABLE KEYS */;
INSERT INTO `equipos` VALUES (1,'colo-colo'),(2,'concepcion'),(3,'valdivia'),(4,'chacarita');
/*!40000 ALTER TABLE `equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goles_partido`
--

DROP TABLE IF EXISTS `goles_partido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goles_partido` (
  `fk_partido` int NOT NULL,
  `fk_jugador` int NOT NULL,
  `cantidad_gol` int NOT NULL,
  KEY `fk_partido` (`fk_partido`),
  KEY `fk_jugador` (`fk_jugador`),
  CONSTRAINT `goles_partido_ibfk_1` FOREIGN KEY (`fk_partido`) REFERENCES `partidos` (`id_partidos`),
  CONSTRAINT `goles_partido_ibfk_2` FOREIGN KEY (`fk_jugador`) REFERENCES `jugadores` (`id_jugadores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goles_partido`
--

LOCK TABLES `goles_partido` WRITE;
/*!40000 ALTER TABLE `goles_partido` DISABLE KEYS */;
INSERT INTO `goles_partido` VALUES (1,1,2),(1,4,1);
/*!40000 ALTER TABLE `goles_partido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugadores`
--

DROP TABLE IF EXISTS `jugadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jugadores` (
  `id_jugadores` int NOT NULL AUTO_INCREMENT,
  `fk_equipos` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `fecha_nacimiento` datetime DEFAULT NULL,
  PRIMARY KEY (`id_jugadores`),
  KEY `fk_equipos` (`fk_equipos`),
  CONSTRAINT `jugadores_ibfk_1` FOREIGN KEY (`fk_equipos`) REFERENCES `equipos` (`id_equipos`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugadores`
--

LOCK TABLES `jugadores` WRITE;
/*!40000 ALTER TABLE `jugadores` DISABLE KEYS */;
INSERT INTO `jugadores` VALUES (1,1,'goku','1994-08-31 00:00:00'),(2,1,'vegeta','1990-08-31 00:00:00'),(3,1,'bulma','1993-08-31 00:00:00'),(4,2,'freezer','1994-08-31 00:00:00'),(5,2,'cooler','1990-08-31 00:00:00'),(6,2,'cold','1993-08-31 00:00:00');
/*!40000 ALTER TABLE `jugadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partidos`
--

DROP TABLE IF EXISTS `partidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partidos` (
  `id_partidos` int NOT NULL AUTO_INCREMENT,
  `fk_equipo_local` int DEFAULT NULL,
  `fk_equipo_visitante` int DEFAULT NULL,
  `goles_local` int DEFAULT NULL,
  `goles_visitante` int DEFAULT NULL,
  `fecha_partido` datetime DEFAULT NULL,
  PRIMARY KEY (`id_partidos`),
  KEY `fk_equipo_local` (`fk_equipo_local`),
  KEY `fk_equipo_visitante` (`fk_equipo_visitante`),
  CONSTRAINT `partidos_ibfk_1` FOREIGN KEY (`fk_equipo_local`) REFERENCES `equipos` (`id_equipos`),
  CONSTRAINT `partidos_ibfk_2` FOREIGN KEY (`fk_equipo_visitante`) REFERENCES `equipos` (`id_equipos`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partidos`
--

LOCK TABLES `partidos` WRITE;
/*!40000 ALTER TABLE `partidos` DISABLE KEYS */;
INSERT INTO `partidos` VALUES (1,1,2,2,1,'2021-09-16 00:00:00'),(2,3,2,2,1,'2021-09-16 00:00:00'),(3,3,1,2,1,'2021-09-16 00:00:00'),(4,3,2,2,1,'2016-01-01 00:00:00'),(5,1,2,2,1,'2016-02-12 00:00:00'),(6,4,2,10,1,'2017-02-12 00:00:00'),(7,4,1,4,20,'2019-02-12 00:00:00'),(8,3,4,1,10,'2020-02-12 00:00:00');
/*!40000 ALTER TABLE `partidos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-20 12:18:14
