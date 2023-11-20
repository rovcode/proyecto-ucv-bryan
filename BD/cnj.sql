-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: cnj
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `ciclo`
--

DROP TABLE IF EXISTS `ciclo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciclo` (
  `idciclo` int NOT NULL AUTO_INCREMENT,
  `ciclo` varchar(450) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  PRIMARY KEY (`idciclo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciclo`
--

LOCK TABLES `ciclo` WRITE;
/*!40000 ALTER TABLE `ciclo` DISABLE KEYS */;
/*!40000 ALTER TABLE `ciclo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colegio`
--

DROP TABLE IF EXISTS `colegio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colegio` (
  `idcolegio` int NOT NULL AUTO_INCREMENT,
  `colegio` varchar(450) NOT NULL,
  `ubicacion` varchar(450) DEFAULT NULL,
  `distrito` varchar(450) DEFAULT NULL,
  `departamento` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`idcolegio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colegio`
--

LOCK TABLES `colegio` WRITE;
/*!40000 ALTER TABLE `colegio` DISABLE KEYS */;
/*!40000 ALTER TABLE `colegio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuestionario`
--

DROP TABLE IF EXISTS `cuestionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuestionario` (
  `idcuestionario` int NOT NULL AUTO_INCREMENT,
  `pregunta` varchar(450) NOT NULL,
  `dato1` varchar(450) NOT NULL,
  `dato2` varchar(450) NOT NULL,
  `dato3` varchar(450) NOT NULL,
  `respuesta` varchar(450) NOT NULL,
  `idmodulo` int NOT NULL,
  `nota` double DEFAULT NULL,
  PRIMARY KEY (`idcuestionario`),
  KEY `idmodulo_idx` (`idmodulo`),
  CONSTRAINT `idmodulo` FOREIGN KEY (`idmodulo`) REFERENCES `modulo` (`idmodulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuestionario`
--

LOCK TABLES `cuestionario` WRITE;
/*!40000 ALTER TABLE `cuestionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuestionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `idcurso` int NOT NULL AUTO_INCREMENT,
  `nomb_curso` varchar(450) NOT NULL,
  `descripcion` varchar(450) DEFAULT NULL,
  `idciclo` int NOT NULL,
  `idcolegio` int NOT NULL,
  `idsupervisor` int NOT NULL,
  PRIMARY KEY (`idcurso`),
  KEY `idsupervisor_idx` (`idsupervisor`),
  KEY `idcolegio_idx` (`idcolegio`),
  KEY `idciclo_idx` (`idciclo`),
  CONSTRAINT `idciclo` FOREIGN KEY (`idciclo`) REFERENCES `ciclo` (`idciclo`),
  CONSTRAINT `idcolegio` FOREIGN KEY (`idcolegio`) REFERENCES `colegio` (`idcolegio`),
  CONSTRAINT `idsupervisor` FOREIGN KEY (`idsupervisor`) REFERENCES `supervisor` (`idsupervisor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensajeria`
--

DROP TABLE IF EXISTS `mensajeria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensajeria` (
  `idmensajeria` int NOT NULL AUTO_INCREMENT,
  `texto` varchar(450) NOT NULL,
  `fecha` date NOT NULL,
  `url_img` varchar(450) DEFAULT NULL,
  `idusuario` int NOT NULL,
  PRIMARY KEY (`idmensajeria`),
  KEY `idusuario_idx` (`idusuario`),
  CONSTRAINT `idusuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensajeria`
--

LOCK TABLES `mensajeria` WRITE;
/*!40000 ALTER TABLE `mensajeria` DISABLE KEYS */;
/*!40000 ALTER TABLE `mensajeria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulo`
--

DROP TABLE IF EXISTS `modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modulo` (
  `idmodulo` int NOT NULL AUTO_INCREMENT,
  `modulo` varchar(450) NOT NULL,
  `descripcion` varchar(450) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `idcurso` int NOT NULL,
  PRIMARY KEY (`idmodulo`),
  KEY `idmodulo_idx` (`idcurso`),
  CONSTRAINT `idcurso2` FOREIGN KEY (`idcurso`) REFERENCES `curso` (`idcurso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulo`
--

LOCK TABLES `modulo` WRITE;
/*!40000 ALTER TABLE `modulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supervisor`
--

DROP TABLE IF EXISTS `supervisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supervisor` (
  `idsupervisor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(450) NOT NULL,
  `apellido` varchar(450) NOT NULL,
  `idcolegio` int NOT NULL,
  PRIMARY KEY (`idsupervisor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supervisor`
--

LOCK TABLES `supervisor` WRITE;
/*!40000 ALTER TABLE `supervisor` DISABLE KEYS */;
/*!40000 ALTER TABLE `supervisor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_usuario`
--

DROP TABLE IF EXISTS `tipo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_usuario` (
  `id_tipousuario` int NOT NULL AUTO_INCREMENT,
  `tipo_usuario` varchar(45) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_tipousuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_usuario`
--

LOCK TABLES `tipo_usuario` WRITE;
/*!40000 ALTER TABLE `tipo_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idusuario` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(85) NOT NULL,
  `password` varchar(85) NOT NULL,
  `id_tipousuario` int NOT NULL,
  `nombre` varchar(150) DEFAULT NULL,
  `apellido` varchar(450) DEFAULT NULL,
  `correo` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`idusuario`),
  KEY `id_tipousuario_idx` (`id_tipousuario`),
  CONSTRAINT `id_tipousuario` FOREIGN KEY (`id_tipousuario`) REFERENCES `tipo_usuario` (`id_tipousuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_curso`
--

DROP TABLE IF EXISTS `usuario_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_curso` (
  `idusuario_curso` int NOT NULL AUTO_INCREMENT,
  `idusuario` int NOT NULL,
  `idcurso` int NOT NULL,
  `promedio` double DEFAULT NULL,
  PRIMARY KEY (`idusuario_curso`),
  KEY `id_usuario_idx` (`idusuario`),
  KEY `idcurso_idx` (`idcurso`),
  CONSTRAINT `id_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`),
  CONSTRAINT `idcurso` FOREIGN KEY (`idcurso`) REFERENCES `curso` (`idcurso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_curso`
--

LOCK TABLES `usuario_curso` WRITE;
/*!40000 ALTER TABLE `usuario_curso` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_curso` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-19 17:32:37
