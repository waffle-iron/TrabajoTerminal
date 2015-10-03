-- MySQL dump 10.13  Distrib 5.5.43, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: tt
-- ------------------------------------------------------
-- Server version	5.5.43-0ubuntu0.14.04.1

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
-- Table structure for table `AREA`
--

DROP TABLE IF EXISTS `AREA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AREA` (
  `idArea` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idArea`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AREA`
--

LOCK TABLES `AREA` WRITE;
/*!40000 ALTER TABLE `AREA` DISABLE KEYS */;
INSERT INTO `AREA` VALUES (1,'ciencias');
/*!40000 ALTER TABLE `AREA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AREA_HAS_PROYECTO`
--

DROP TABLE IF EXISTS `AREA_HAS_PROYECTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AREA_HAS_PROYECTO` (
  `Area_idArea` int(11) NOT NULL,
  `Proyecto_idProyectos` int(11) NOT NULL,
  PRIMARY KEY (`Area_idArea`,`Proyecto_idProyectos`),
  KEY `fk_Area_has_Proyecto_Proyecto1_idx` (`Proyecto_idProyectos`),
  KEY `fk_Area_has_Proyecto_Area1_idx` (`Area_idArea`),
  CONSTRAINT `fk_Area_has_Proyecto_Area1` FOREIGN KEY (`Area_idArea`) REFERENCES `AREA` (`idArea`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Area_has_Proyecto_Proyecto1` FOREIGN KEY (`Proyecto_idProyectos`) REFERENCES `PROYECTO` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AREA_HAS_PROYECTO`
--

LOCK TABLES `AREA_HAS_PROYECTO` WRITE;
/*!40000 ALTER TABLE `AREA_HAS_PROYECTO` DISABLE KEYS */;
/*!40000 ALTER TABLE `AREA_HAS_PROYECTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Correo`
--

DROP TABLE IF EXISTS `Correo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Correo` (
  `idCorreo` int(11) NOT NULL AUTO_INCREMENT,
  `Asunto` varchar(45) DEFAULT NULL,
  `contenido` tinytext NOT NULL,
  `EMISOR` int(11) NOT NULL,
  `RECEPTOR` int(11) NOT NULL,
  PRIMARY KEY (`idCorreo`),
  KEY `fk_Correo_USUARIO1_idx` (`EMISOR`),
  KEY `fk_Correo_USUARIO2_idx` (`RECEPTOR`),
  CONSTRAINT `fk_Correo_USUARIO1` FOREIGN KEY (`EMISOR`) REFERENCES `USUARIO` (`idUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Correo_USUARIO2` FOREIGN KEY (`RECEPTOR`) REFERENCES `USUARIO` (`idUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Correo`
--

LOCK TABLES `Correo` WRITE;
/*!40000 ALTER TABLE `Correo` DISABLE KEYS */;
INSERT INTO `Correo` VALUES (1,'casdfv','dasf',1,1);
/*!40000 ALTER TABLE `Correo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DIRECCION`
--

DROP TABLE IF EXISTS `DIRECCION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DIRECCION` (
  `idDireccion` int(11) NOT NULL AUTO_INCREMENT,
  `calle` varchar(45) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `colonia` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `usuario` int(11) NOT NULL,
  PRIMARY KEY (`idDireccion`),
  KEY `fk_DIRECCION_USUARIO1_idx` (`usuario`),
  CONSTRAINT `fk_DIRECCION_USUARIO1` FOREIGN KEY (`usuario`) REFERENCES `USUARIO` (`idUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DIRECCION`
--

LOCK TABLES `DIRECCION` WRITE;
/*!40000 ALTER TABLE `DIRECCION` DISABLE KEYS */;
INSERT INTO `DIRECCION` VALUES (1,'TGFD',32132,'123213','123312',1);
/*!40000 ALTER TABLE `DIRECCION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ENTREGABLE`
--

DROP TABLE IF EXISTS `ENTREGABLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ENTREGABLE` (
  `idEntregable` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `tarea` int(11) NOT NULL,
  PRIMARY KEY (`idEntregable`),
  KEY `fk_Entregable_Tarea1_idx` (`tarea`),
  CONSTRAINT `fk_Entregable_Tarea1` FOREIGN KEY (`tarea`) REFERENCES `TAREA` (`idTarea`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ENTREGABLE`
--

LOCK TABLES `ENTREGABLE` WRITE;
/*!40000 ALTER TABLE `ENTREGABLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ENTREGABLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ESCUELA`
--

DROP TABLE IF EXISTS `ESCUELA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ESCUELA` (
  `idEscuela` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `abreviacion` varchar(45) DEFAULT NULL,
  `nivel` int(11) NOT NULL,
  `area` int(11) NOT NULL,
  PRIMARY KEY (`idEscuela`),
  KEY `fk_Escuela_Nivel1_idx` (`nivel`),
  KEY `fk_Escuela_Area1_idx` (`area`),
  CONSTRAINT `fk_Escuela_Area1` FOREIGN KEY (`area`) REFERENCES `AREA` (`idArea`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Escuela_Nivel1` FOREIGN KEY (`nivel`) REFERENCES `NIVEL` (`idNivel`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ESCUELA`
--

LOCK TABLES `ESCUELA` WRITE;
/*!40000 ALTER TABLE `ESCUELA` DISABLE KEYS */;
INSERT INTO `ESCUELA` VALUES (1,'ESCUELA SUPERIOR COMPUTO','ESCOM',1,1),(2,'EWQRTRH','DSAFESAFD',1,1);
/*!40000 ALTER TABLE `ESCUELA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ESTADO`
--

DROP TABLE IF EXISTS `ESTADO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ESTADO` (
  `idEstado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ESTADO`
--

LOCK TABLES `ESTADO` WRITE;
/*!40000 ALTER TABLE `ESTADO` DISABLE KEYS */;
INSERT INTO `ESTADO` VALUES (1,'iniciando');
/*!40000 ALTER TABLE `ESTADO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GRADO_ACADEMICO`
--

DROP TABLE IF EXISTS `GRADO_ACADEMICO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GRADO_ACADEMICO` (
  `idGrado_academico` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idGrado_academico`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GRADO_ACADEMICO`
--

LOCK TABLES `GRADO_ACADEMICO` WRITE;
/*!40000 ALTER TABLE `GRADO_ACADEMICO` DISABLE KEYS */;
INSERT INTO `GRADO_ACADEMICO` VALUES (1,'avanzado'),(2,'DFSHK');
/*!40000 ALTER TABLE `GRADO_ACADEMICO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDIOMA`
--

DROP TABLE IF EXISTS `IDIOMA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDIOMA` (
  `idIdiomas` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idIdiomas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDIOMA`
--

LOCK TABLES `IDIOMA` WRITE;
/*!40000 ALTER TABLE `IDIOMA` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDIOMA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INVITACION`
--

DROP TABLE IF EXISTS `INVITACION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INVITACION` (
  `idInvitacion` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `usuario` int(11) NOT NULL,
  `proyecto` int(11) NOT NULL,
  PRIMARY KEY (`idInvitacion`),
  KEY `fk_INVITACION_USUARIO_COLABORADOR_PROYECTO1_idx` (`usuario`,`proyecto`),
  CONSTRAINT `fk_INVITACION_USUARIO_COLABORADOR_PROYECTO1` FOREIGN KEY (`usuario`, `proyecto`) REFERENCES `USUARIO_COLABORADOR_PROYECTO` (`Usuario_idUsuarios`, `Proyecto_idProyectos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INVITACION`
--

LOCK TABLES `INVITACION` WRITE;
/*!40000 ALTER TABLE `INVITACION` DISABLE KEYS */;
/*!40000 ALTER TABLE `INVITACION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NIVEL`
--

DROP TABLE IF EXISTS `NIVEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NIVEL` (
  `idNivel` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idNivel`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NIVEL`
--

LOCK TABLES `NIVEL` WRITE;
/*!40000 ALTER TABLE `NIVEL` DISABLE KEYS */;
INSERT INTO `NIVEL` VALUES (1,'superior');
/*!40000 ALTER TABLE `NIVEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PALABRA_CLAVE`
--

DROP TABLE IF EXISTS `PALABRA_CLAVE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PALABRA_CLAVE` (
  `idPalabrasClave` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPalabrasClave`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PALABRA_CLAVE`
--

LOCK TABLES `PALABRA_CLAVE` WRITE;
/*!40000 ALTER TABLE `PALABRA_CLAVE` DISABLE KEYS */;
/*!40000 ALTER TABLE `PALABRA_CLAVE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PALABRA_CLAVE_HAS_PROYECTO`
--

DROP TABLE IF EXISTS `PALABRA_CLAVE_HAS_PROYECTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PALABRA_CLAVE_HAS_PROYECTO` (
  `PalabrasClave_idPalabrasClave` int(11) NOT NULL,
  `Proyecto_idProyectos` int(11) NOT NULL,
  PRIMARY KEY (`PalabrasClave_idPalabrasClave`,`Proyecto_idProyectos`),
  KEY `fk_PalabrasClave_has_Proyecto_Proyecto1_idx` (`Proyecto_idProyectos`),
  KEY `fk_PalabrasClave_has_Proyecto_PalabrasClave1_idx` (`PalabrasClave_idPalabrasClave`),
  CONSTRAINT `fk_PalabrasClave_has_Proyecto_PalabrasClave1` FOREIGN KEY (`PalabrasClave_idPalabrasClave`) REFERENCES `PALABRA_CLAVE` (`idPalabrasClave`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PalabrasClave_has_Proyecto_Proyecto1` FOREIGN KEY (`Proyecto_idProyectos`) REFERENCES `PROYECTO` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PALABRA_CLAVE_HAS_PROYECTO`
--

LOCK TABLES `PALABRA_CLAVE_HAS_PROYECTO` WRITE;
/*!40000 ALTER TABLE `PALABRA_CLAVE_HAS_PROYECTO` DISABLE KEYS */;
/*!40000 ALTER TABLE `PALABRA_CLAVE_HAS_PROYECTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROYECTO`
--

DROP TABLE IF EXISTS `PROYECTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROYECTO` (
  `idProyecto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` longtext,
  `fechaInicio` date DEFAULT NULL,
  `fechaFin` date DEFAULT NULL,
  `privado` tinyint(1) DEFAULT '0',
  `avance` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `coordinador` int(11) NOT NULL,
  PRIMARY KEY (`idProyecto`),
  KEY `fk_Proyecto_Usuario1_idx` (`coordinador`),
  KEY `fk_Proyecto_TipoProyecto1_idx` (`tipo`),
  KEY `fk_Proyecto_Estado1_idx` (`estado`),
  CONSTRAINT `fk_Proyecto_Estado1` FOREIGN KEY (`estado`) REFERENCES `ESTADO` (`idEstado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proyecto_TipoProyecto1` FOREIGN KEY (`tipo`) REFERENCES `TIPO_PROYECTO` (`idTipoProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proyecto_Usuario1` FOREIGN KEY (`coordinador`) REFERENCES `USUARIO` (`idUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROYECTO`
--

LOCK TABLES `PROYECTO` WRITE;
/*!40000 ALTER TABLE `PROYECTO` DISABLE KEYS */;
INSERT INTO `PROYECTO` VALUES (1,'PROYECTOS DE INVESTIGACIÓN','DSAFAGDSAVVVASFSFDSDFSAFDAS','2015-12-12','2015-12-12',NULL,12,1,1,1),(2,'sFh,n','faddgb,m','2015-09-10','2015-10-16',NULL,123,1,1,1);
/*!40000 ALTER TABLE `PROYECTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TAREA`
--

DROP TABLE IF EXISTS `TAREA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TAREA` (
  `idTarea` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `descripcion` longtext,
  `avance` int(11) DEFAULT NULL,
  `fechaEntrega` date DEFAULT NULL,
  `usuario` int(11) NOT NULL,
  `proyecto` int(11) NOT NULL,
  PRIMARY KEY (`idTarea`),
  KEY `fk_TAREA_USUARIO_COLABORADOR_PROYECTO1_idx` (`usuario`,`proyecto`),
  CONSTRAINT `fk_TAREA_USUARIO_COLABORADOR_PROYECTO1` FOREIGN KEY (`usuario`, `proyecto`) REFERENCES `USUARIO_COLABORADOR_PROYECTO` (`Usuario_idUsuarios`, `Proyecto_idProyectos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TAREA`
--

LOCK TABLES `TAREA` WRITE;
/*!40000 ALTER TABLE `TAREA` DISABLE KEYS */;
/*!40000 ALTER TABLE `TAREA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TIPO_PROYECTO`
--

DROP TABLE IF EXISTS `TIPO_PROYECTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TIPO_PROYECTO` (
  `idTipoProyecto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipoProyecto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TIPO_PROYECTO`
--

LOCK TABLES `TIPO_PROYECTO` WRITE;
/*!40000 ALTER TABLE `TIPO_PROYECTO` DISABLE KEYS */;
INSERT INTO `TIPO_PROYECTO` VALUES (1,'TT');
/*!40000 ALTER TABLE `TIPO_PROYECTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USUARIO`
--

DROP TABLE IF EXISTS `USUARIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USUARIO` (
  `idUsuarios` int(11) NOT NULL AUTO_INCREMENT,
  `nombreUsuario` varchar(45) DEFAULT NULL,
  `contraseña` varchar(45) DEFAULT NULL,
  `nombres` varchar(45) DEFAULT NULL,
  `aPaterno` varchar(45) DEFAULT NULL,
  `aMaterno` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `estadoCivil` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `sexo` varchar(45) DEFAULT NULL,
  `fechaIngresoIPN` date DEFAULT NULL,
  `Evaluacion` int(11) NOT NULL,
  `escuela` int(11) NOT NULL,
  `grado` int(11) NOT NULL,
  PRIMARY KEY (`idUsuarios`),
  KEY `fk_Usuario_Escuela1_idx` (`escuela`),
  KEY `fk_Usuario_Grado_academico1_idx` (`grado`),
  CONSTRAINT `fk_Usuario_Escuela1` FOREIGN KEY (`escuela`) REFERENCES `ESCUELA` (`idEscuela`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Grado_academico1` FOREIGN KEY (`grado`) REFERENCES `GRADO_ACADEMICO` (`idGrado_academico`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USUARIO`
--

LOCK TABLES `USUARIO` WRITE;
/*!40000 ALTER TABLE `USUARIO` DISABLE KEYS */;
INSERT INTO `USUARIO` VALUES (1,'DARCUSFENIX','dsasgegfsadgsgf','JUANdsasgegfsadgsgf','VÁZQUEZdsasgegfsadgsgf','CRISOSTOMOdsasgegfsadgsgf','juancvfenix@gmail.com','2015-10-10','MEXdsasgegfsadgsgf','+525530271655','dsasgegfsadgsgf','2015-10-10',11,1,1);
/*!40000 ALTER TABLE `USUARIO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USUARIO_COLABORADOR_PROYECTO`
--

DROP TABLE IF EXISTS `USUARIO_COLABORADOR_PROYECTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USUARIO_COLABORADOR_PROYECTO` (
  `Usuario_idUsuarios` int(11) NOT NULL,
  `Proyecto_idProyectos` int(11) NOT NULL,
  PRIMARY KEY (`Usuario_idUsuarios`,`Proyecto_idProyectos`),
  KEY `fk_Usuario_has_Proyecto_Proyecto1_idx` (`Proyecto_idProyectos`),
  KEY `fk_Usuario_has_Proyecto_Usuario1_idx` (`Usuario_idUsuarios`),
  CONSTRAINT `fk_Usuario_has_Proyecto_Proyecto1` FOREIGN KEY (`Proyecto_idProyectos`) REFERENCES `PROYECTO` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_has_Proyecto_Usuario1` FOREIGN KEY (`Usuario_idUsuarios`) REFERENCES `USUARIO` (`idUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USUARIO_COLABORADOR_PROYECTO`
--

LOCK TABLES `USUARIO_COLABORADOR_PROYECTO` WRITE;
/*!40000 ALTER TABLE `USUARIO_COLABORADOR_PROYECTO` DISABLE KEYS */;
/*!40000 ALTER TABLE `USUARIO_COLABORADOR_PROYECTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USUARIO_HAS_IDOMAS`
--

DROP TABLE IF EXISTS `USUARIO_HAS_IDOMAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USUARIO_HAS_IDOMAS` (
  `Usuarios_idUsuarios` int(11) NOT NULL,
  `Idiomas_idIdiomas` int(11) NOT NULL,
  PRIMARY KEY (`Usuarios_idUsuarios`,`Idiomas_idIdiomas`),
  KEY `fk_Usuarios_has_Idiomas_Idiomas1_idx` (`Idiomas_idIdiomas`),
  KEY `fk_Usuarios_has_Idiomas_Usuarios1_idx` (`Usuarios_idUsuarios`),
  CONSTRAINT `fk_Usuarios_has_Idiomas_Idiomas1` FOREIGN KEY (`Idiomas_idIdiomas`) REFERENCES `IDIOMA` (`idIdiomas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuarios_has_Idiomas_Usuarios1` FOREIGN KEY (`Usuarios_idUsuarios`) REFERENCES `USUARIO` (`idUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USUARIO_HAS_IDOMAS`
--

LOCK TABLES `USUARIO_HAS_IDOMAS` WRITE;
/*!40000 ALTER TABLE `USUARIO_HAS_IDOMAS` DISABLE KEYS */;
/*!40000 ALTER TABLE `USUARIO_HAS_IDOMAS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-03 16:29:31
