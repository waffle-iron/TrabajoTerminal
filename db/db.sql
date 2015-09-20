-- phpMyAdmin SQL Dump
-- version 4.4.12
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-09-2015 a las 23:24:47
-- Versión del servidor: 5.6.25
-- Versión de PHP: 5.6.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tt`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE IF NOT EXISTS `area` (
  `idArea` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `area`
--

INSERT INTO `area` (`idArea`, `nombre`) VALUES
(1, 'ciencias');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area_has_proyecto`
--

CREATE TABLE IF NOT EXISTS `area_has_proyecto` (
  `Area_idArea` int(11) NOT NULL,
  `Proyecto_idProyectos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `correo`
--

CREATE TABLE IF NOT EXISTS `correo` (
  `idCorreo` int(11) NOT NULL,
  `Asunto` varchar(45) DEFAULT NULL,
  `contenido` tinytext NOT NULL,
  `EMISOR` int(11) NOT NULL,
  `RECEPTOR` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `correo`
--

INSERT INTO `correo` (`idCorreo`, `Asunto`, `contenido`, `EMISOR`, `RECEPTOR`) VALUES
(3, 'Salud', 'dasd', 1, 1),
(5, 'Correo', 'Blabla', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE IF NOT EXISTS `direccion` (
  `idDireccion` int(11) NOT NULL,
  `calle` varchar(45) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `colonia` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `usuario` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entregable`
--

CREATE TABLE IF NOT EXISTS `entregable` (
  `idEntregable` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `tarea` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `escuela`
--

CREATE TABLE IF NOT EXISTS `escuela` (
  `idEscuela` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `abreviacion` varchar(45) DEFAULT NULL,
  `nivel` int(11) NOT NULL,
  `area` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `escuela`
--

INSERT INTO `escuela` (`idEscuela`, `nombre`, `abreviacion`, `nivel`, `area`) VALUES
(1, 'ESCUELA SUPERIOR COMPUTO', 'ESCOM', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE IF NOT EXISTS `estado` (
  `idEstado` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`idEstado`, `nombre`) VALUES
(1, 'iniciando');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grado_academico`
--

CREATE TABLE IF NOT EXISTS `grado_academico` (
  `idGrado_academico` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `grado_academico`
--

INSERT INTO `grado_academico` (`idGrado_academico`, `nombre`) VALUES
(1, 'avanzado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idioma`
--

CREATE TABLE IF NOT EXISTS `idioma` (
  `idIdiomas` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invitacion`
--

CREATE TABLE IF NOT EXISTS `invitacion` (
  `idInvitacion` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `usuario` int(11) NOT NULL,
  `proyecto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel`
--

CREATE TABLE IF NOT EXISTS `nivel` (
  `idNivel` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `nivel`
--

INSERT INTO `nivel` (`idNivel`, `nombre`) VALUES
(1, 'superior');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `palabra_clave`
--

CREATE TABLE IF NOT EXISTS `palabra_clave` (
  `idPalabrasClave` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `palabra_clave_has_proyecto`
--

CREATE TABLE IF NOT EXISTS `palabra_clave_has_proyecto` (
  `PalabrasClave_idPalabrasClave` int(11) NOT NULL,
  `Proyecto_idProyectos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto`
--

CREATE TABLE IF NOT EXISTS `proyecto` (
  `idProyecto` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` longtext,
  `fechaInicio` date DEFAULT NULL,
  `fechaFin` date DEFAULT NULL,
  `privado` tinyint(1) DEFAULT '0',
  `avance` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `coordinador` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proyecto`
--

INSERT INTO `proyecto` (`idProyecto`, `nombre`, `descripcion`, `fechaInicio`, `fechaFin`, `privado`, `avance`, `tipo`, `estado`, `coordinador`) VALUES
(1, 'PROYECTOS DE INVESTIGACIÓN', 'DSAFAGDSAVVVASFSFDSDFSAFDAS', '2015-12-12', '2015-12-12', NULL, 12, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarea`
--

CREATE TABLE IF NOT EXISTS `tarea` (
  `idTarea` int(11) NOT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `descripcion` longtext,
  `avance` int(11) DEFAULT NULL,
  `fechaEntrega` date DEFAULT NULL,
  `usuario` int(11) NOT NULL,
  `proyecto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_proyecto`
--

CREATE TABLE IF NOT EXISTS `tipo_proyecto` (
  `idTipoProyecto` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_proyecto`
--

INSERT INTO `tipo_proyecto` (`idTipoProyecto`, `nombre`) VALUES
(1, 'TT');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `idUsuarios` int(11) NOT NULL,
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
  `grado` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuarios`, `nombreUsuario`, `contraseña`, `nombres`, `aPaterno`, `aMaterno`, `email`, `fechaNacimiento`, `estadoCivil`, `telefono`, `sexo`, `fechaIngresoIPN`, `Evaluacion`, `escuela`, `grado`) VALUES
(1, 'DARCUSFENIX', 'dsasgegfsadgsgf', 'JUANdsasgegfsadgsgf', 'VÁZQUEZdsasgegfsadgsgf', 'CRISOSTOMOdsasgegfsadgsgf', 'juancvfenix@gmail.com', '2015-10-10', 'MEXdsasgegfsadgsgf', '+525530271655', 'dsasgegfsadgsgf', '2015-10-10', 11, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_colaborador_proyecto`
--

CREATE TABLE IF NOT EXISTS `usuario_colaborador_proyecto` (
  `Usuario_idUsuarios` int(11) NOT NULL,
  `Proyecto_idProyectos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_has_idomas`
--

CREATE TABLE IF NOT EXISTS `usuario_has_idomas` (
  `Usuarios_idUsuarios` int(11) NOT NULL,
  `Idiomas_idIdiomas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`idArea`);

--
-- Indices de la tabla `area_has_proyecto`
--
ALTER TABLE `area_has_proyecto`
  ADD PRIMARY KEY (`Area_idArea`,`Proyecto_idProyectos`),
  ADD KEY `fk_Area_has_Proyecto_Proyecto1_idx` (`Proyecto_idProyectos`),
  ADD KEY `fk_Area_has_Proyecto_Area1_idx` (`Area_idArea`);

--
-- Indices de la tabla `correo`
--
ALTER TABLE `correo`
  ADD PRIMARY KEY (`idCorreo`),
  ADD KEY `fk_Correo_USUARIO1_idx` (`EMISOR`),
  ADD KEY `fk_Correo_USUARIO2_idx` (`RECEPTOR`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`idDireccion`),
  ADD KEY `fk_DIRECCION_USUARIO1_idx` (`usuario`);

--
-- Indices de la tabla `entregable`
--
ALTER TABLE `entregable`
  ADD PRIMARY KEY (`idEntregable`),
  ADD KEY `fk_Entregable_Tarea1_idx` (`tarea`);

--
-- Indices de la tabla `escuela`
--
ALTER TABLE `escuela`
  ADD PRIMARY KEY (`idEscuela`),
  ADD KEY `fk_Escuela_Nivel1_idx` (`nivel`),
  ADD KEY `fk_Escuela_Area1_idx` (`area`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`idEstado`);

--
-- Indices de la tabla `grado_academico`
--
ALTER TABLE `grado_academico`
  ADD PRIMARY KEY (`idGrado_academico`);

--
-- Indices de la tabla `idioma`
--
ALTER TABLE `idioma`
  ADD PRIMARY KEY (`idIdiomas`);

--
-- Indices de la tabla `invitacion`
--
ALTER TABLE `invitacion`
  ADD PRIMARY KEY (`idInvitacion`),
  ADD KEY `fk_INVITACION_USUARIO_COLABORADOR_PROYECTO1_idx` (`usuario`,`proyecto`);

--
-- Indices de la tabla `nivel`
--
ALTER TABLE `nivel`
  ADD PRIMARY KEY (`idNivel`);

--
-- Indices de la tabla `palabra_clave`
--
ALTER TABLE `palabra_clave`
  ADD PRIMARY KEY (`idPalabrasClave`);

--
-- Indices de la tabla `palabra_clave_has_proyecto`
--
ALTER TABLE `palabra_clave_has_proyecto`
  ADD PRIMARY KEY (`PalabrasClave_idPalabrasClave`,`Proyecto_idProyectos`),
  ADD KEY `fk_PalabrasClave_has_Proyecto_Proyecto1_idx` (`Proyecto_idProyectos`),
  ADD KEY `fk_PalabrasClave_has_Proyecto_PalabrasClave1_idx` (`PalabrasClave_idPalabrasClave`);

--
-- Indices de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD PRIMARY KEY (`idProyecto`),
  ADD KEY `fk_Proyecto_Usuario1_idx` (`coordinador`),
  ADD KEY `fk_Proyecto_TipoProyecto1_idx` (`tipo`),
  ADD KEY `fk_Proyecto_Estado1_idx` (`estado`);

--
-- Indices de la tabla `tarea`
--
ALTER TABLE `tarea`
  ADD PRIMARY KEY (`idTarea`),
  ADD KEY `fk_TAREA_USUARIO_COLABORADOR_PROYECTO1_idx` (`usuario`,`proyecto`);

--
-- Indices de la tabla `tipo_proyecto`
--
ALTER TABLE `tipo_proyecto`
  ADD PRIMARY KEY (`idTipoProyecto`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuarios`),
  ADD KEY `fk_Usuario_Escuela1_idx` (`escuela`),
  ADD KEY `fk_Usuario_Grado_academico1_idx` (`grado`);

--
-- Indices de la tabla `usuario_colaborador_proyecto`
--
ALTER TABLE `usuario_colaborador_proyecto`
  ADD PRIMARY KEY (`Usuario_idUsuarios`,`Proyecto_idProyectos`),
  ADD KEY `fk_Usuario_has_Proyecto_Proyecto1_idx` (`Proyecto_idProyectos`),
  ADD KEY `fk_Usuario_has_Proyecto_Usuario1_idx` (`Usuario_idUsuarios`);

--
-- Indices de la tabla `usuario_has_idomas`
--
ALTER TABLE `usuario_has_idomas`
  ADD PRIMARY KEY (`Usuarios_idUsuarios`,`Idiomas_idIdiomas`),
  ADD KEY `fk_Usuarios_has_Idiomas_Idiomas1_idx` (`Idiomas_idIdiomas`),
  ADD KEY `fk_Usuarios_has_Idiomas_Usuarios1_idx` (`Usuarios_idUsuarios`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `area`
--
ALTER TABLE `area`
  MODIFY `idArea` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `correo`
--
ALTER TABLE `correo`
  MODIFY `idCorreo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
  MODIFY `idDireccion` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `entregable`
--
ALTER TABLE `entregable`
  MODIFY `idEntregable` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `escuela`
--
ALTER TABLE `escuela`
  MODIFY `idEscuela` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `idEstado` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `grado_academico`
--
ALTER TABLE `grado_academico`
  MODIFY `idGrado_academico` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `idioma`
--
ALTER TABLE `idioma`
  MODIFY `idIdiomas` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `invitacion`
--
ALTER TABLE `invitacion`
  MODIFY `idInvitacion` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `nivel`
--
ALTER TABLE `nivel`
  MODIFY `idNivel` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `palabra_clave`
--
ALTER TABLE `palabra_clave`
  MODIFY `idPalabrasClave` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  MODIFY `idProyecto` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tarea`
--
ALTER TABLE `tarea`
  MODIFY `idTarea` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tipo_proyecto`
--
ALTER TABLE `tipo_proyecto`
  MODIFY `idTipoProyecto` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuarios` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `area_has_proyecto`
--
ALTER TABLE `area_has_proyecto`
  ADD CONSTRAINT `fk_Area_has_Proyecto_Area1` FOREIGN KEY (`Area_idArea`) REFERENCES `area` (`idArea`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Area_has_Proyecto_Proyecto1` FOREIGN KEY (`Proyecto_idProyectos`) REFERENCES `proyecto` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `correo`
--
ALTER TABLE `correo`
  ADD CONSTRAINT `fk_Correo_USUARIO1` FOREIGN KEY (`EMISOR`) REFERENCES `usuario` (`idUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Correo_USUARIO2` FOREIGN KEY (`RECEPTOR`) REFERENCES `usuario` (`idUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD CONSTRAINT `fk_DIRECCION_USUARIO1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`idUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `entregable`
--
ALTER TABLE `entregable`
  ADD CONSTRAINT `fk_Entregable_Tarea1` FOREIGN KEY (`tarea`) REFERENCES `tarea` (`idTarea`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `escuela`
--
ALTER TABLE `escuela`
  ADD CONSTRAINT `fk_Escuela_Area1` FOREIGN KEY (`area`) REFERENCES `area` (`idArea`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Escuela_Nivel1` FOREIGN KEY (`nivel`) REFERENCES `nivel` (`idNivel`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `invitacion`
--
ALTER TABLE `invitacion`
  ADD CONSTRAINT `fk_INVITACION_USUARIO_COLABORADOR_PROYECTO1` FOREIGN KEY (`usuario`, `proyecto`) REFERENCES `usuario_colaborador_proyecto` (`Usuario_idUsuarios`, `Proyecto_idProyectos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `palabra_clave_has_proyecto`
--
ALTER TABLE `palabra_clave_has_proyecto`
  ADD CONSTRAINT `fk_PalabrasClave_has_Proyecto_PalabrasClave1` FOREIGN KEY (`PalabrasClave_idPalabrasClave`) REFERENCES `palabra_clave` (`idPalabrasClave`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_PalabrasClave_has_Proyecto_Proyecto1` FOREIGN KEY (`Proyecto_idProyectos`) REFERENCES `proyecto` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD CONSTRAINT `fk_Proyecto_Estado1` FOREIGN KEY (`estado`) REFERENCES `estado` (`idEstado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Proyecto_TipoProyecto1` FOREIGN KEY (`tipo`) REFERENCES `tipo_proyecto` (`idTipoProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Proyecto_Usuario1` FOREIGN KEY (`coordinador`) REFERENCES `usuario` (`idUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tarea`
--
ALTER TABLE `tarea`
  ADD CONSTRAINT `fk_TAREA_USUARIO_COLABORADOR_PROYECTO1` FOREIGN KEY (`usuario`, `proyecto`) REFERENCES `usuario_colaborador_proyecto` (`Usuario_idUsuarios`, `Proyecto_idProyectos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_Usuario_Escuela1` FOREIGN KEY (`escuela`) REFERENCES `escuela` (`idEscuela`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuario_Grado_academico1` FOREIGN KEY (`grado`) REFERENCES `grado_academico` (`idGrado_academico`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario_colaborador_proyecto`
--
ALTER TABLE `usuario_colaborador_proyecto`
  ADD CONSTRAINT `fk_Usuario_has_Proyecto_Proyecto1` FOREIGN KEY (`Proyecto_idProyectos`) REFERENCES `proyecto` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuario_has_Proyecto_Usuario1` FOREIGN KEY (`Usuario_idUsuarios`) REFERENCES `usuario` (`idUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario_has_idomas`
--
ALTER TABLE `usuario_has_idomas`
  ADD CONSTRAINT `fk_Usuarios_has_Idiomas_Idiomas1` FOREIGN KEY (`Idiomas_idIdiomas`) REFERENCES `idioma` (`idIdiomas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuarios_has_Idiomas_Usuarios1` FOREIGN KEY (`Usuarios_idUsuarios`) REFERENCES `usuario` (`idUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
