-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-12-2015 a las 18:00:08
-- Versión del servidor: 5.6.24
-- Versión de PHP: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `tt`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `AREA`
--

CREATE TABLE IF NOT EXISTS `AREA` (
  `idArea` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `AREA`
--

INSERT INTO `AREA` (`idArea`, `nombre`) VALUES
(1, 'Ingeniería y Ciencias Físico Matemáticas'),
(2, 'Ciencias Sociales y Administrativas'),
(3, 'Ciencias Médico Biológicas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `AREA_HAS_PROYECTO`
--

CREATE TABLE IF NOT EXISTS `AREA_HAS_PROYECTO` (
  `Area_idArea` int(11) NOT NULL,
  `Proyecto_idProyectos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `AREA_HAS_PROYECTO`
--

INSERT INTO `AREA_HAS_PROYECTO` (`Area_idArea`, `Proyecto_idProyectos`) VALUES
(1, 1),
(2, 2),
(3, 3),
(1, 4),
(2, 5),
(3, 6),
(1, 7),
(2, 8),
(3, 9),
(1, 10),
(2, 11),
(3, 12),
(1, 13),
(1, 14),
(1, 15),
(3, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(2, 23),
(3, 24),
(1, 25),
(3, 26),
(2, 27),
(1, 28),
(2, 29),
(2, 30),
(1, 31),
(1, 32),
(1, 33),
(1, 34),
(1, 35),
(3, 36);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CORREO`
--

CREATE TABLE IF NOT EXISTS `CORREO` (
  `idCorreo` int(11) NOT NULL,
  `Asunto` varchar(45) DEFAULT NULL,
  `contenido` tinytext NOT NULL,
  `EMISOR` int(11) NOT NULL,
  `RECEPTOR` int(11) NOT NULL,
  `fecha_hora` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `CORREO`
--

INSERT INTO `CORREO` (`idCorreo`, `Asunto`, `contenido`, `EMISOR`, `RECEPTOR`, `fecha_hora`) VALUES
(1, 'Pendiente 3', 'No has terminado, apresurate', 1, 8, '2015-11-09 21:03:26'),
(2, 'hola', 'cómo estás?', 8, 1, '2015-11-09 21:03:23'),
(3, 'Documento incompleto', 'Termina tu documento lo antes', 8, 1, '2015-11-09 21:20:49'),
(4, 'Sin asunto', '...', 1, 8, '2015-11-09 21:21:24'),
(5, 'Saludos', 'Que tal ?', 2, 1, '2015-11-17 23:49:44'),
(6, 'Información importante', 'hola como estas????', 1, 2, '2015-11-17 23:54:19'),
(7, 'Verifica datos', 'tienes que verificar', 8, 1, '2015-11-30 20:31:19'),
(8, 'Avance de PROYECTO', 'este CORREO es informativo', 8, 9, '2015-12-01 20:47:48'),
(9, 'Hola invitado', 'que tal?', 2, 9, '2015-12-01 20:48:23'),
(10, 'Avance ?', 'Y tu avance?', 2, 9, '2015-12-01 20:49:12'),
(11, 'Corregir estadisticas', 'corregir tus estadisticas', 8, 9, '2015-12-02 08:37:36'),
(12, 'Cita a las 9', 'te espero', 2, 9, '2015-12-02 08:38:17'),
(13, 'Compra de papeleria', 'Te deposite', 2, 9, '2015-12-02 21:26:53'),
(14, 'Proyecto de Gestión', 'Hola como estas?', 1, 15, '2015-12-03 00:16:27'),
(15, 'Saludos...', 'Me gustaria saber...', 1, 3, '2015-12-03 00:19:42'),
(16, 'Saludos', 'Bien gracias', 2, 1, '2015-12-03 00:36:18'),
(17, 'Saludos', 'Como estas?', 2, 3, '2015-12-03 00:36:52'),
(18, 'Documento', 'Hola, sobre el documento', 2, 4, '2015-12-03 00:37:42'),
(19, 'Si?', 'Dime de que?', 3, 1, '2015-12-03 00:43:33'),
(20, 'Si?', 'Bien gracias', 3, 2, '2015-12-03 00:44:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `DIRECCION`
--

CREATE TABLE IF NOT EXISTS `DIRECCION` (
  `idDireccion` int(11) NOT NULL,
  `calle` varchar(45) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `colonia` varchar(45) DEFAULT NULL,
  `ESTADO` varchar(45) DEFAULT NULL,
  `USUARIO` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `DIRECCION`
--

INSERT INTO `DIRECCION` (`idDireccion`, `calle`, `numero`, `colonia`, `ESTADO`, `USUARIO`) VALUES
(1, 'TGFD', 32132, '123213', '123312', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ENTREGABLE`
--

CREATE TABLE IF NOT EXISTS `ENTREGABLE` (
  `idEntregable` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `TAREA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ESCUELA`
--

CREATE TABLE IF NOT EXISTS `ESCUELA` (
  `idEscuela` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `abreviacion` varchar(45) DEFAULT NULL,
  `NIVEL` int(11) NOT NULL,
  `AREA` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ESCUELA`
--

INSERT INTO `ESCUELA` (`idEscuela`, `nombre`, `abreviacion`, `NIVEL`, `AREA`) VALUES
(1, 'Centro de Estudios Científicos y Tecnológicos', 'CECYT 1', 1, 1),
(2, 'Centro de Estudios Científicos y Tecnológicos', 'CECYT 2', 1, 1),
(3, 'Centro de Estudios Científicos y Tecnológicos', 'CECYT 3', 1, 1),
(4, 'Centro de Estudios Científicos y Tecnológicos', 'CECYT 4', 1, 1),
(5, 'Centro de Estudios Científicos y Tecnológicos', 'CECYT 5', 1, 2),
(6, 'Centro de Estudios Científicos y Tecnológicos', 'CECYT 6', 1, 3),
(7, 'Centro de Estudios Científicos y Tecnológicos', 'CECYT 7', 1, 1),
(8, 'Centro de Estudios Científicos y Tecnológicos', 'CECYT 8', 1, 1),
(9, 'Centro de Estudios Científicos y Tecnológicos', 'CECYT 9', 1, 1),
(10, 'Centro de Estudios Científicos y Tecnológicos', 'CECYT 10', 1, 3),
(11, 'Centro de Estudios Científicos y Tecnológicos', 'CECYT 11', 1, 1),
(12, 'Centro de Estudios Científicos y Tecnológicos', 'CECYT 12', 1, 2),
(13, 'Centro de Estudios Científicos y Tecnológicos', 'CECYT 13', 1, 2),
(14, 'Centro de Estudios Científicos y Tecnológicos', 'CECYT 14', 1, 2),
(15, 'Centro de Estudios Científicos y Tecnológicos', 'CECYT 15', 1, 3),
(16, 'Centro Interdisciplinario de Ciencias de la S', 'CICS', 2, 3),
(17, 'Centro Interdisciplinario de Ciencias de la S', 'CICS', 2, 3),
(18, 'Escuela Nacional de Ciencias Biológicas Unida', 'ENCB', 2, 3),
(19, 'Escuela Nacional de Ciencias Biológicas Unida', 'ENCB', 2, 3),
(20, 'Escuela Nacional de Medicina y Homeopatía (EN', 'ENMH', 2, 3),
(21, 'Escuela Superior de Comercio y Administración', 'ESCA', 2, 2),
(22, 'Escuela Superior de Comercio y Administración', 'ESCA', 2, 2),
(23, 'Escuela Superior de Cómputo (ESCOM) ', 'ESCOM', 2, 1),
(24, 'Escuela Superior de Economía (ESE)', 'ESE', 2, 2),
(25, 'Escuela Superior De Enfermería Y Obstetricia ', 'ESEO', 2, 3),
(26, 'Escuela Superior de Física y Matemáticas (ESF', 'ESFM', 2, 1),
(27, 'Escuela Superior de Ingeniería Mecánica y Elé', 'ESIME', 2, 1),
(28, 'Escuela Superior de Ingeniería Mecánica y Elé', 'ESIME', 2, 1),
(29, 'Escuela Superior de Ingeniería Mecánica y Elé', 'ESIME', 2, 1),
(30, 'Escuela Superior de Ingeniería Mecánica y Elé', 'ESIME', 2, 1),
(31, 'Escuela Superior de Ingeniería Química e Indu', 'ESIQIE', 2, 1),
(32, 'Escuela Superior de Ingeniería Textil (ESIT)', 'ESIT', 2, 1),
(33, 'Escuela Superior de Ingeniería y Arquitectura', 'ESIA', 2, 1),
(34, 'Escuela Superior de Ingeniería y Arquitectura', 'ESIA', 2, 1),
(35, 'Escuela Superior de Ingeniería y Arquitectura', 'ESIA', 2, 1),
(36, 'Escuela Superior de Medicina (ESM)', 'ESM', 2, 3),
(37, 'Escuela Superior de Turismo (EST)', 'EST', 2, 2),
(38, 'Unidad Profesional Interdisciplinaria de Biot', 'UPIBI', 2, 1),
(39, 'Unidad Profesional Interdisciplinaria de Inge', 'UPIIZ', 2, 1),
(40, 'Unidad Profesional Interdisciplinaria de Inge', 'UPIICSA', 2, 1),
(41, 'Unidad Profesional Interdisciplinaria en Inge', 'UPIIG', 2, 1),
(42, 'Unidad Profesional Interdisciplinaria en Inge', 'UPIITA', 2, 1),
(90, 'Unidad Profesional Interdisciplinaria en Inge', 'UPIITA', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ESTADO`
--

CREATE TABLE IF NOT EXISTS `ESTADO` (
  `idEstado` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ESTADO`
--

INSERT INTO `ESTADO` (`idEstado`, `nombre`) VALUES
(1, 'En proceso'),
(2, 'Concluido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `GRADO_ACADEMICO`
--

CREATE TABLE IF NOT EXISTS `GRADO_ACADEMICO` (
  `idGrado_academico` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `GRADO_ACADEMICO`
--

INSERT INTO `GRADO_ACADEMICO` (`idGrado_academico`, `nombre`) VALUES
(1, 'Medio Superior'),
(2, 'Superior'),
(3, 'Posgrado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `IDIOMA`
--

CREATE TABLE IF NOT EXISTS `IDIOMA` (
  `idIdiomas` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `IDIOMA`
--

INSERT INTO `IDIOMA` (`idIdiomas`, `nombre`) VALUES
(1, 'ALEMAN');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `INVITACION`
--

CREATE TABLE IF NOT EXISTS `INVITACION` (
  `idInvitacion` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `USUARIO` int(11) NOT NULL,
  `PROYECTO` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `INVITACION`
--

INSERT INTO `INVITACION` (`idInvitacion`, `fecha`, `ESTADO`, `USUARIO`, `PROYECTO`) VALUES
(1, '2015-10-16', 1, 1, 5),
(2, '2015-10-16', 1, 1, 5),
(3, '2015-10-16', 2, 1, 5),
(4, '2015-10-19', 2, 1, 6),
(5, '2015-10-19', 1, 9, 6),
(6, '2015-11-16', 2, 9, 9),
(7, '2015-11-30', 2, 1, 8),
(8, '2015-12-01', 2, 9, 7),
(9, '2015-12-01', 2, 8, 10),
(10, '2015-12-03', 1, 2, 2),
(11, '2015-12-03', 1, 3, 3),
(12, '2015-12-03', 1, 4, 1),
(13, '2015-12-03', 1, 1, 4),
(14, '2015-12-03', 1, 1, 5),
(15, '2015-12-03', 1, 3, 6),
(16, '2015-12-03', 2, 3, 5),
(17, '2015-12-03', 1, 4, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `NIVEL`
--

CREATE TABLE IF NOT EXISTS `NIVEL` (
  `idNivel` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `NIVEL`
--

INSERT INTO `NIVEL` (`idNivel`, `nombre`) VALUES
(1, 'Medio Superior'),
(2, 'Superior');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PALABRA_CLAVE`
--

CREATE TABLE IF NOT EXISTS `PALABRA_CLAVE` (
  `idPalabrasClave` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PALABRA_CLAVE_HAS_PROYECTO`
--

CREATE TABLE IF NOT EXISTS `PALABRA_CLAVE_HAS_PROYECTO` (
  `PalabrasClave_idPalabrasClave` int(11) NOT NULL,
  `Proyecto_idProyectos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PROYECTO`
--

CREATE TABLE IF NOT EXISTS `PROYECTO` (
  `idProyecto` int(11) NOT NULL,
  `nombre` varchar(150) DEFAULT NULL,
  `descripcion` longtext,
  `fechaInicio` date DEFAULT NULL,
  `fechaFin` date DEFAULT NULL,
  `privado` tinyint(1) DEFAULT '0',
  `avance` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  `ESTADO` int(11) NOT NULL,
  `coordinador` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `PROYECTO`
--

INSERT INTO `PROYECTO` (`idProyecto`, `nombre`, `descripcion`, `fechaInicio`, `fechaFin`, `privado`, `avance`, `tipo`, `ESTADO`, `coordinador`) VALUES
(1, 'Sistema Gestor de Tramites escolares', 'El siguiente sistema gestor de tramites escolares tiene como fin adquirir informacion y agilizar procesos', '2013-12-12', '2014-12-12', NULL, 47, 1, 1, 1),
(2, 'Sistema de Informacion Corporativa ', 'El siguiente PROYECTO satisface necesidades para los almacenes donde...', '2013-09-10', '2014-10-16', NULL, 80, 1, 1, 1),
(3, 'Sistema Automatizado Para el Control Difuso d', 'El sistema para los cultivos hidronicos representa gran avance para...', '2013-09-09', '2014-09-05', NULL, 10, 1, 1, 1),
(4, 'Software de Restauracin de Imgenes\n', 'Es un sistema para la restauración de imagenes donde se pueden editar', '2014-09-05', '2015-09-09', NULL, 2, 1, 1, 2),
(5, 'Sistema de Búsqueda de información ', 'un PROYECTO de búsquedas  donde facilmente se accede a información de ESCUELA', '2014-10-15', '2015-01-30', NULL, 0, 1, 1, 2),
(6, 'Gestor y Gobernador de Laboratorios de Cmputo', 'Es una herramienta indispensable para la gestion de laboratorios', '2014-10-19', '2015-10-21', NULL, 11, 1, 1, 2),
(7, 'Sistema de Administracin y Control de Inventarios de Activos de Cmputo ', 'Es un sistema de administración y control de inventarios donde se busca la gestion de...', '2013-11-10', '2014-01-11', 1, 89, 2, 1, 3),
(8, '\nMuseo de Papiroflexia Virtual', 'Es un sistema para el museo de papiroflexia virtual donde se busca la administracion del mismo', '2013-11-23', '2014-11-17', 1, 45, 1, 1, 3),
(9, 'Sistema de Servicios Integrales para la Comunidad Escom', 'Es un sistema de servicios integrales, donde se busca como objetivo principal...', '2014-01-18', '2014-11-20', 1, 34, 4, 1, 4),
(10, 'Sistema de Control de Gestin del Flujo de informacin para la delegacin Gustav A. Made', 'Es un PROYECTO enfocado a la delegación para mejorar el servicio', '2014-05-02', '2015-02-02', NULL, 0, 1, 2, 5),
(11, 'Sistema para el Diagnstico de Cancer (Cervix) empleando fluorescencia laser', 'Sistema en apoyo al AREA Cervix para diagnosticar cancer en pacientes ...', '2014-11-30', '2015-11-30', NULL, 0, 1, 1, 6),
(12, 'Sistema de Control de Potencia de un Vehiculo', 'Sistema de control de potencia nos ayuda a saber el...', '2013-08-30', '2014-11-28', NULL, 0, 2, 2, 6),
(13, 'Compresión Fractal de Imagenes\r\n', 'Es un sistema de compresión de imagenes para el apoyo a trabajadores de....', '2014-11-03', '2015-11-03', 0, 20, 2, 2, 7),
(14, 'Analisis y trazado de rutas viales en tiempo real', 'Es un sistema de análisis y trazado de rutas viales en tiempo real ... ', '2014-11-03', '2015-11-03', 0, 48, 3, 1, 7),
(15, 'Sistema Prototipo para la Administracin de Contenido Electrnicos en Sitios Web', 'Sistema que pretende la administración de contenidos electrónicos en la web ', '2014-11-03', '2015-11-03', 0, 48, 4, 1, 8),
(16, 'Sistemas de Interfaces Grficas para dispositivos mviles y aplicaciones de PC', 'Es un sistemas de Interfaces Gráficas para dispositivos móviles y aplicaciones de PC para el apoyo al área de ...\r\n', '2014-11-03', '2015-11-03', 0, 50, 5, 1, 9),
(17, 'Sistema de Comunicación Empresarila Voz sobre IP', 'Es un Sistema de Comunicación Empresarial Voz sobre IP para el apoyo a la administración general de la empresa X\r\n', '2014-11-03', '2015-11-03', 0, 89, 5, 1, 9),
(18, 'Sistema Informativo Web para un Aeropuerto', 'Es un sistema informativo Web para un Aeropuerto para agilizar procesos y administrar recursos.', '2014-11-03', '2015-11-03', 0, 20, 7, 1, 10),
(19, 'Simulador de Aprendizaje de Manejo para Transporte Automotriz', 'Es un sistema Simulador de Aprendizaje de Manejo para Transporte Automotriz y para agilizar procesos mediante...', '2014-11-03', '2015-11-03', 0, 33, 6, 1, 10),
(20, '\r\nSistematizacin del Archivo de la Base de Datos Nominal de Institucin de Servicios Periciales de la PGR', 'Es un sistema para la PGR de administración de archivos criminales y apoyo al área ', '2014-11-03', '2015-11-03', 0, 44, 7, 1, 11),
(21, 'Sistema de Segmentacin de Materia Blanca en Imgenes Cerebrales por Resonancia Mgnetica', 'Proyecto o sistema de Segmentacin de Materia Blanca en Imgenes Cerebrales por Resonancia Mgnetica', '2014-11-03', '2015-11-03', 0, 15, 8, 1, 11),
(22, 'Sistema de Informacin para Bases de Datos Distribuidas aplicado a una Plantilla de Personal\r\n', 'Sistema diseñado con plantilla principal para bases de datos', '2014-11-03', '2015-11-03', 0, 77, 6, 1, 12),
(23, 'Sistema Interno de Apoyo, Seguimiento y Vinculacin de Egresados de ESCOM', 'Es un sistema cuyo objetivo es brindar seguimiento a los egresados de la ESCOM para formular estadísticas', '2012-11-03', '2014-11-03', 0, 24, 5, 1, 13),
(24, 'Mundo Artificial Basado en Sistemas Evolutivos', 'Es un sistema cuyo nombre es Mundo Artificial Basado en Sistemas Evolutivos, para el apoyo a la educación en todos los NIVELes...', '2014-11-03', '2015-11-03', 0, 9, 4, 1, 13),
(25, 'Sistema de Diagnstico del Grado de Movilidad en Extremidades en Personas con Paralisis Cerebral o Traumatismo', 'Es un sistema de Diagnstico del Grado de Movilidad en Extremidades en Personas con Paralisis Cerebral o Traumatismo para el apoyo a...', '2013-11-03', '2014-11-03', 0, 30, 4, 1, 14),
(26, 'Videojuego Fnix Racing', 'Es un vídeojuego para gusto personal y fabricado por estudiantes y docentes. ', '2014-11-03', '2015-11-03', 0, 45, 3, 1, 14),
(27, 'Interfaz de Comunicacin a traves de la Computadora entre Personas Sordomudas y Personas Oyentes', 'Es una interfaz para que a través de la computadora se obtengan....', '2014-11-03', '2015-11-03', 0, 25, 3, 1, 15),
(28, 'Software para la Administracin de Recursos y Control de Alumnos para el Departamento de Control Escolar en el Cenlex Santo Toms', 'Es un Software para la Administracin de Recursos y Control de Alumnos para el Departamento de Control Escolar en el Cenlex Santo Toms para el apoyo administrativo.', '2014-11-03', '2015-11-03', 0, 29, 2, 1, 16),
(29, 'Sistema para el estudio de la dinmica de Cicatrizacin de lceras crnicas tratadas por campos electromagnticos de ultra baja frecuencia', 'Es un Sistema para el estudio de la dinmica de Cicatrizacin de lceras crnicas tratadas por campos electromagnticos de ultra baja frecuencia', '2014-11-03', '2015-11-03', 0, 80, 2, 1, 16),
(30, 'Aplicacin de la Ingeniera de Software para el sistema de ventas Web de la empresa de fabricacin Racks y Gabinetes Especializados S.A. de C.V.', 'Es un sistema hecho a la medida para la empresa antes señalada y administración de la misma', '2014-11-03', '2015-11-03', 0, 48, 2, 1, 17),
(31, '\r\nSoftware y Hardware para el posicionamiento semiautmatico de un telescopio por medo de una montura ecuatorial para estrellas y planetas especificado', 'Es un Software y Hardware para el posicionamiento semiautmatico de un telescopio por medo de una montura ecuatorial para estrellas y planetas especificados por el USUARIO medio en un computadora', '2014-11-03', '2015-11-03', 0, 50, 1, 1, 18),
(32, '\r\nSistema de Administracin y consulta para la direccin general de educacin tecnolgica y agropecuaria (DGETA)', 'Es un Sistema de Administración y consulta para la dirección general de educación tecnológica y agropecuaria (DGETA)', '2014-11-03', '2015-11-03', 0, 45, 1, 1, 18),
(33, 'Sistemas de publicacin y acceso a material didctico en linea SPAMDL', 'Es un Sistemas de publicación y acceso a material didáctico en linea SPAMDL\r\n', '2013-11-03', '2014-11-03', 0, 22, 1, 1, 19),
(34, 'Propuesta de un mecanismo de descarga y ligado dinmico de componentes Web desde el buscador Web', 'Es una Propuesta de un mecanismo de descarga y ligado dinmico de componentes Web desde el buscador Web', '2014-11-03', '2015-11-03', 0, 77, 2, 1, 19),
(35, 'HERRAMIENTAS CASE: para el Diseo de Sistemas de Informacin Orientada a Objetos', 'Es una HERRAMIENTA CASE: para el Diseo de Sistemas de Informacin Orientada a Objetos', '2014-11-03', '2015-11-03', 0, 20, 1, 1, 20),
(36, 'Desarrollo de un Osciloscopio de almacenamiento digital con interfaz', 'Es un sistema para el almacenamiento digital de interfaces a través de un osciloscopio.', '2014-11-03', '2015-11-03', 0, 21, 3, 1, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TAREA`
--

CREATE TABLE IF NOT EXISTS `TAREA` (
  `idTAREA` int(11) NOT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  `descripcion` longtext,
  `avance` int(11) DEFAULT NULL,
  `fechaEntrega` date DEFAULT NULL,
  `USUARIO` int(11) NOT NULL,
  `PROYECTO` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `TAREA`
--

INSERT INTO `TAREA` (`idTAREA`, `titulo`, `ESTADO`, `descripcion`, `avance`, `fechaEntrega`, `USUARIO`, `PROYECTO`) VALUES
(1, 'Creación de interfaz', 1, 'Crear la interfaz necesaria para el desarrollo principal', 20, '2015-10-19', 9, 6),
(2, 'Minuta del día', 1, 'Redactar minuta del día', 10, '2015-10-19', 9, 6),
(3, 'Documentar caso 1', 1, 'Documentar primer caso de uso', 55, '2015-10-19', 9, 6),
(4, 'Aplicar algoritmo 10', 1, 'Codificar el algoritmo 10', 1, '2015-10-19', 1, 6),
(5, 'Crear notaciones ', 1, 'Crear la notaciones mencionadas', 67, '2014-11-10', 1, 5),
(6, 'Modificar vista 4', 1, 'La vista 4 tiene que ser modificada', 45, '2014-11-03', 2, 8),
(7, 'Organizar papeles de trabajo', 1, 'Ordenar los papeles de trabajo', 1, '2015-12-01', 2, 8),
(8, 'Mostrar USUARIOs ', 1, 'Listar los USUARIOs del sistema', 1, '2015-12-01', 2, 8),
(9, 'Corregir caso de uso 20', 1, 'Corregir el caso de uso en ...', 1, '2015-12-02', 2, 8),
(10, 'Caso de uso 5', 1, 'Implementar el caso de uso 5', 47, '2015-12-03', 4, 1),
(11, 'Documentar caso de uso 16', 1, 'Favor de documentar el caso de uso 16', 24, '2015-12-03', 1, 4),
(12, 'Implementar las entrevistas necesarias', 1, 'Implementar todas las entrevistas propuestas', 10, '2015-12-03', 9, 4),
(13, 'Consultar libros', 1, 'Definir libros a utilizar para el desarrollo', 14, '2015-12-03', 5, 4),
(14, 'Imprimir pruebas', 1, 'Imprimir la documentación de pruebas.', 76, '2015-12-03', 5, 4),
(15, 'Documentar', 1, 'Documentar los avances del caso de uso 2', 1, '2015-12-03', 9, 7),
(16, 'Prueba 1', 1, 'Realizar pruebas neuvas', 1, '2015-12-03', 2, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TIPO_PROYECTO`
--

CREATE TABLE IF NOT EXISTS `TIPO_PROYECTO` (
  `idTipoProyecto` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `TIPO_PROYECTO`
--

INSERT INTO `TIPO_PROYECTO` (`idTipoProyecto`, `nombre`) VALUES
(1, 'Multidisciplinario'),
(2, 'Programa Especial'),
(3, 'Propuesta de estudio'),
(4, 'Proyecto individual'),
(5, 'Proyecto de Red'),
(6, 'Proyecto de innovación'),
(7, 'Trabajo Terminal'),
(8, 'Otros');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `USUARIO`
--

CREATE TABLE IF NOT EXISTS `USUARIO` (
  `idUsuarios` int(11) NOT NULL,
  `nombreUsuario` varchar(45) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `nombres` varchar(45) DEFAULT NULL,
  `aPaterno` varchar(45) DEFAULT NULL,
  `aMaterno` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `ESTADOCivil` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `sexo` varchar(45) DEFAULT NULL,
  `fechaIngresoIPN` date DEFAULT NULL,
  `Evaluacion` int(11) NOT NULL,
  `ESCUELA` int(11) NOT NULL,
  `grado` int(11) NOT NULL,
  `activo` bit(1) DEFAULT NULL,
  `rol` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `USUARIO`
--

INSERT INTO `USUARIO` (`idUsuarios`, `nombreUsuario`, `password`, `nombres`, `aPaterno`, `aMaterno`, `email`, `fechaNacimiento`, `ESTADOCivil`, `telefono`, `sexo`, `fechaIngresoIPN`, `Evaluacion`, `ESCUELA`, `grado`, `activo`, `rol`) VALUES
(1, 'Manuel', '123', 'Manuel', 'Garcia', 'Tirado', 'a@a.com', '1981-10-10', 'Soltero', '5530271655', 'Masculino', '2015-10-10', 11, 90, 1, b'1', 'ROLE_ADMIN'),
(2, 'Giova', '123', 'Giovanni', 'R.', 'Tellez', 'gio_rt@hotmail.com', '1989-11-09', 'Soltero', '5532065600', 'Masculino', '2010-11-26', 8, 23, 2, b'1', 'ROLE_ADMIN'),
(3, 'Jos ', '123', 'Jose Leonardo', 'Cid', 'Fabila', 'jofa@hotmail.com', '1983-11-02', 'Soltero', '5512345678', 'Masculino', '1982-11-01', 8, 2, 1, b'1', 'ROLE_ADMIN'),
(4, 'Eddy', '123', 'Eddy', 'Navarrete', 'Pealver', 'edynav@hotmail.com', '1980-12-12', 'Casado', '5534567890', 'Masculino', '1980-11-11', 10, 3, 2, b'1', 'ROLE_ADMIN'),
(5, 'Julio', '123', 'Julio Cesar', 'Martinez', 'Garcia', 'julice@hotmail.com', '1983-11-02', 'Soltero', '5590785634', 'Masculino', '2010-06-16', 8, 4, 3, b'1', 'ROLE_ADMIN'),
(6, 'Ricardo', '123', 'Ricardo', 'Osornio', 'Ulloa', 'ricarulo@hotmail.com', '1980-12-12', 'Casado', '5590785634', 'Masculino', '2010-11-26', 8, 6, 3, b'1', 'ROLE_ADMIN'),
(7, 'Nayeli', '123', 'Nayeli', 'Cruz', 'Velazquez', 'nacruz@hotmail.com', '1980-12-12', 'Soltero', '5589674523', 'Femenino', '2010-11-26', 8, 7, 2, b'1', 'ROLE_ADMIN'),
(8, 'lalo', '123', 'Eduardo', 'Martinez', 'Rendon', 'edu@gmail.com', '2015-10-15', 'Casado', '5530271655', 'Femenino', '2015-10-30', 10, 90, 1, b'1', 'ROLE_ADMIN'),
(9, 'david', '123', 'David', 'Florez', 'Cruz', 'davidd@gmail.com', '1982-10-19', 'Casado', '015530271655', 'Femenino', '2015-10-23', 10, 90, 1, b'1', 'ROLE_ADMIN'),
(10, 'Winfield', '123', 'Maria', 'Winfield', 'W', 'winf@gmail.com', '1976-12-26', 'Casado', '5512121212', 'Femenino', '2008-12-25', 10, 23, 2, b'1', 'ROLE_ADMIN'),
(11, 'Galicia', '123', 'Guillermo', 'Ruiz', 'Galicia', 'galiciag@hotmail.com', '1980-09-09', 'Soltero', '5512345678', 'Masculino', '2000-10-10', 10, 26, 2, b'1', 'ROLE_ADMIN'),
(12, 'Raul', '123', 'Raul', 'Acevedo', 'Infante', 'raulace@hotmail.com', '1983-11-02', 'Casado', '5589674523', 'Masculino', '2010-11-26', 8, 9, 1, b'1', ''),
(13, 'Edgar', '123', 'Edgar', 'Gonzalez', 'Arcos', 'edgargon@hotmail.com', '1983-11-02', 'Soltero', '5589674523', 'Masculino', '2010-10-30', 9, 25, 2, b'1', 'ROLE_ADMIN'),
(14, 'Laza', '123', 'Lazaro', 'Hernandez ', 'Camao', 'lazhdz@hotmail.com', '1980-12-12', 'Casado', '5567564567', 'Masculino', '2010-06-16', 7, 26, 2, b'1', 'ROLE_ADMIN'),
(15, 'AlejaJas', '123', 'Alejandro', 'Jasso', 'Fuentes', 'alejass@hotmail.com', '1980-12-12', 'Casado', '5567564567', 'Masculino', '2010-06-16', 9, 28, 3, b'1', 'ROLE_ADMIN'),
(16, 'Oscar', '123', 'Oscar Alberto', 'Martinez', 'Acevedo', 'oscamart@hotmail.com', '1983-11-02', 'Casado', '5590785634', 'Masculino', '2010-11-26', 10, 30, 3, b'1', 'ROLE_ADMIN'),
(17, 'Mara', '123', 'Mara Paola', 'Neri', 'Ortiz', 'marapa@hotmail.com', '1990-11-03', 'Soltero', '5590785634', 'Femenino', '2010-06-16', 10, 38, 1, b'1', 'ROLE_ADMIN'),
(18, 'Zule', '123', 'Zulema', 'Acacio', 'Valds', 'zuleaca@hotmail.com', '1980-12-12', 'Casado', '5534567890', 'Femenino', '2010-11-26', 9, 34, 2, b'1', 'ROLE_ADMIN'),
(19, 'Joss', '123', 'Joss Antonio', 'Ortiz', 'Remirez', 'josanto@hotmail.com', '1983-11-02', 'Casado', '5567564567', 'Masculino', '2010-11-26', 10, 39, 2, b'1', 'ROLE_ADMIN'),
(20, 'Hector ', '123', 'Hector ', 'Hidalgo', 'Cardenaz', 'hecthid@hotmail.com', '1983-11-02', 'Soltero', '5589674523', 'Masculino', '2010-11-26', 9, 42, 3, b'1', 'ROLE_ADMIN');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `USUARIO_COLABORADOR_PROYECTO`
--

CREATE TABLE IF NOT EXISTS `USUARIO_COLABORADOR_PROYECTO` (
  `Usuario_idUsuarios` int(11) NOT NULL,
  `Proyecto_idProyectos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `USUARIO_COLABORADOR_PROYECTO`
--

INSERT INTO `USUARIO_COLABORADOR_PROYECTO` (`Usuario_idUsuarios`, `Proyecto_idProyectos`) VALUES
(4, 1),
(2, 2),
(3, 3),
(1, 4),
(5, 4),
(9, 4),
(1, 5),
(3, 5),
(4, 5),
(1, 6),
(3, 6),
(9, 6),
(1, 7),
(2, 7),
(9, 7),
(1, 8),
(2, 8),
(9, 9),
(8, 10),
(3, 11),
(4, 12),
(5, 13),
(1, 14),
(6, 14),
(7, 15),
(8, 16),
(9, 17),
(10, 18),
(11, 19),
(12, 20),
(13, 21),
(14, 22),
(15, 23),
(16, 24),
(17, 25),
(18, 26),
(19, 30),
(20, 31),
(2, 32),
(3, 33),
(4, 34),
(5, 35),
(6, 36);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `USUARIO_HAS_IDIOMAS`
--

CREATE TABLE IF NOT EXISTS `USUARIO_HAS_IDIOMAS` (
  `Usuarios_idUsuarios` int(11) NOT NULL,
  `Idiomas_idIdiomas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `AREA`
--
ALTER TABLE `AREA`
  ADD PRIMARY KEY (`idArea`);

--
-- Indices de la tabla `AREA_HAS_PROYECTO`
--
ALTER TABLE `AREA_HAS_PROYECTO`
  ADD PRIMARY KEY (`Area_idArea`,`Proyecto_idProyectos`), ADD KEY `fk_Area_HAS_Proyecto_Proyecto1_idx` (`Proyecto_idProyectos`), ADD KEY `fk_Area_HAS_Proyecto_Area1_idx` (`Area_idArea`);

--
-- Indices de la tabla `CORREO`
--
ALTER TABLE `CORREO`
  ADD PRIMARY KEY (`idCorreo`), ADD KEY `fk_Correo_USUARIO1_idx` (`EMISOR`), ADD KEY `fk_Correo_USUARIO2_idx` (`RECEPTOR`);

--
-- Indices de la tabla `DIRECCION`
--
ALTER TABLE `DIRECCION`
  ADD PRIMARY KEY (`idDireccion`), ADD KEY `fk_DIRECCION_USUARIO1_idx` (`USUARIO`);

--
-- Indices de la tabla `ENTREGABLE`
--
ALTER TABLE `ENTREGABLE`
  ADD PRIMARY KEY (`idEntregable`), ADD KEY `fk_Entregable_TAREA1_idx` (`TAREA`);

--
-- Indices de la tabla `ESCUELA`
--
ALTER TABLE `ESCUELA`
  ADD PRIMARY KEY (`idEscuela`), ADD KEY `fk_Escuela_Nivel1_idx` (`NIVEL`), ADD KEY `fk_Escuela_Area1_idx` (`AREA`);

--
-- Indices de la tabla `ESTADO`
--
ALTER TABLE `ESTADO`
  ADD PRIMARY KEY (`idEstado`);

--
-- Indices de la tabla `GRADO_ACADEMICO`
--
ALTER TABLE `GRADO_ACADEMICO`
  ADD PRIMARY KEY (`idGrado_academico`);

--
-- Indices de la tabla `IDIOMA`
--
ALTER TABLE `IDIOMA`
  ADD PRIMARY KEY (`idIdiomas`);

--
-- Indices de la tabla `INVITACION`
--
ALTER TABLE `INVITACION`
  ADD PRIMARY KEY (`idInvitacion`), ADD KEY `fk_INVITACION_USUARIO_COLABORADOR_PROYECTO1_idx` (`USUARIO`,`PROYECTO`);

--
-- Indices de la tabla `NIVEL`
--
ALTER TABLE `NIVEL`
  ADD PRIMARY KEY (`idNivel`);

--
-- Indices de la tabla `PALABRA_CLAVE`
--
ALTER TABLE `PALABRA_CLAVE`
  ADD PRIMARY KEY (`idPalabrasClave`);

--
-- Indices de la tabla `PALABRA_CLAVE_HAS_PROYECTO`
--
ALTER TABLE `PALABRA_CLAVE_HAS_PROYECTO`
  ADD PRIMARY KEY (`PalabrasClave_idPalabrasClave`,`Proyecto_idProyectos`), ADD KEY `fk_PalabrasClave_HAS_Proyecto_Proyecto1_idx` (`Proyecto_idProyectos`), ADD KEY `fk_PalabrasClave_HAS_Proyecto_PalabrasClave1_idx` (`PalabrasClave_idPalabrasClave`);

--
-- Indices de la tabla `PROYECTO`
--
ALTER TABLE `PROYECTO`
  ADD PRIMARY KEY (`idProyecto`), ADD KEY `fk_Proyecto_Usuario1_idx` (`coordinador`), ADD KEY `fk_Proyecto_TipoProyecto1_idx` (`tipo`), ADD KEY `fk_Proyecto_Estado1_idx` (`ESTADO`);

--
-- Indices de la tabla `TAREA`
--
ALTER TABLE `TAREA`
  ADD PRIMARY KEY (`idTAREA`), ADD KEY `fk_TAREA_USUARIO_COLABORADOR_PROYECTO1_idx` (`USUARIO`,`PROYECTO`);

--
-- Indices de la tabla `TIPO_PROYECTO`
--
ALTER TABLE `TIPO_PROYECTO`
  ADD PRIMARY KEY (`idTipoProyecto`);

--
-- Indices de la tabla `USUARIO`
--
ALTER TABLE `USUARIO`
  ADD PRIMARY KEY (`idUsuarios`), ADD UNIQUE KEY `email` (`email`), ADD KEY `fk_Usuario_Escuela1_idx` (`ESCUELA`), ADD KEY `fk_Usuario_Grado_academico1_idx` (`grado`);

--
-- Indices de la tabla `USUARIO_COLABORADOR_PROYECTO`
--
ALTER TABLE `USUARIO_COLABORADOR_PROYECTO`
  ADD PRIMARY KEY (`Usuario_idUsuarios`,`Proyecto_idProyectos`), ADD KEY `fk_Usuario_HAS_Proyecto_Proyecto1_idx` (`Proyecto_idProyectos`), ADD KEY `fk_Usuario_HAS_Proyecto_Usuario1_idx` (`Usuario_idUsuarios`);

--
-- Indices de la tabla `USUARIO_HAS_IDIOMAS`
--
ALTER TABLE `USUARIO_HAS_IDIOMAS`
  ADD PRIMARY KEY (`Usuarios_idUsuarios`,`Idiomas_idIdiomas`), ADD KEY `fk_Usuarios_HAS_Idiomas_Idiomas1_idx` (`Idiomas_idIdiomas`), ADD KEY `fk_Usuarios_HAS_Idiomas_Usuarios1_idx` (`Usuarios_idUsuarios`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `AREA`
--
ALTER TABLE `AREA`
  MODIFY `idArea` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `CORREO`
--
ALTER TABLE `CORREO`
  MODIFY `idCorreo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT de la tabla `DIRECCION`
--
ALTER TABLE `DIRECCION`
  MODIFY `idDireccion` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `ENTREGABLE`
--
ALTER TABLE `ENTREGABLE`
  MODIFY `idEntregable` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `ESCUELA`
--
ALTER TABLE `ESCUELA`
  MODIFY `idEscuela` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=91;
--
-- AUTO_INCREMENT de la tabla `ESTADO`
--
ALTER TABLE `ESTADO`
  MODIFY `idEstado` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `GRADO_ACADEMICO`
--
ALTER TABLE `GRADO_ACADEMICO`
  MODIFY `idGrado_academico` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `IDIOMA`
--
ALTER TABLE `IDIOMA`
  MODIFY `idIdiomas` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `INVITACION`
--
ALTER TABLE `INVITACION`
  MODIFY `idInvitacion` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT de la tabla `NIVEL`
--
ALTER TABLE `NIVEL`
  MODIFY `idNivel` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `PALABRA_CLAVE`
--
ALTER TABLE `PALABRA_CLAVE`
  MODIFY `idPalabrasClave` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `PROYECTO`
--
ALTER TABLE `PROYECTO`
  MODIFY `idProyecto` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT de la tabla `TAREA`
--
ALTER TABLE `TAREA`
  MODIFY `idTAREA` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `TIPO_PROYECTO`
--
ALTER TABLE `TIPO_PROYECTO`
  MODIFY `idTipoProyecto` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `USUARIO`
--
ALTER TABLE `USUARIO`
  MODIFY `idUsuarios` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `AREA_HAS_PROYECTO`
--
ALTER TABLE `AREA_HAS_PROYECTO`
ADD CONSTRAINT `fk_Area_HAS_Proyecto_Area1` FOREIGN KEY (`Area_idArea`) REFERENCES `AREA` (`idArea`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Area_HAS_Proyecto_Proyecto1` FOREIGN KEY (`Proyecto_idProyectos`) REFERENCES `PROYECTO` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `CORREO`
--
ALTER TABLE `CORREO`
ADD CONSTRAINT `fk_Correo_USUARIO1` FOREIGN KEY (`EMISOR`) REFERENCES `USUARIO` (`idUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Correo_USUARIO2` FOREIGN KEY (`RECEPTOR`) REFERENCES `USUARIO` (`idUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `DIRECCION`
--
ALTER TABLE `DIRECCION`
ADD CONSTRAINT `fk_DIRECCION_USUARIO1` FOREIGN KEY (`USUARIO`) REFERENCES `USUARIO` (`idUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ENTREGABLE`
--
ALTER TABLE `ENTREGABLE`
ADD CONSTRAINT `fk_Entregable_TAREA1` FOREIGN KEY (`TAREA`) REFERENCES `TAREA` (`idTAREA`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ESCUELA`
--
ALTER TABLE `ESCUELA`
ADD CONSTRAINT `fk_Escuela_Area1` FOREIGN KEY (`AREA`) REFERENCES `AREA` (`idArea`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Escuela_Nivel1` FOREIGN KEY (`NIVEL`) REFERENCES `NIVEL` (`idNivel`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `INVITACION`
--
ALTER TABLE `INVITACION`
ADD CONSTRAINT `fk_INVITACION_USUARIO_COLABORADOR_PROYECTO1` FOREIGN KEY (`USUARIO`, `PROYECTO`) REFERENCES `USUARIO_COLABORADOR_PROYECTO` (`Usuario_idUsuarios`, `Proyecto_idProyectos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `PALABRA_CLAVE_HAS_PROYECTO`
--
ALTER TABLE `PALABRA_CLAVE_HAS_PROYECTO`
ADD CONSTRAINT `fk_PalabrasClave_HAS_Proyecto_PalabrasClave1` FOREIGN KEY (`PalabrasClave_idPalabrasClave`) REFERENCES `PALABRA_CLAVE` (`idPalabrasClave`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_PalabrasClave_HAS_Proyecto_Proyecto1` FOREIGN KEY (`Proyecto_idProyectos`) REFERENCES `PROYECTO` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `PROYECTO`
--
ALTER TABLE `PROYECTO`
ADD CONSTRAINT `fk_Proyecto_Estado1` FOREIGN KEY (`ESTADO`) REFERENCES `ESTADO` (`idEstado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Proyecto_TipoProyecto1` FOREIGN KEY (`tipo`) REFERENCES `TIPO_PROYECTO` (`idTipoProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Proyecto_Usuario1` FOREIGN KEY (`coordinador`) REFERENCES `USUARIO` (`idUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `TAREA`
--
ALTER TABLE `TAREA`
ADD CONSTRAINT `fk_TAREA_USUARIO_COLABORADOR_PROYECTO1` FOREIGN KEY (`USUARIO`, `PROYECTO`) REFERENCES `USUARIO_COLABORADOR_PROYECTO` (`Usuario_idUsuarios`, `Proyecto_idProyectos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `USUARIO`
--
ALTER TABLE `USUARIO`
ADD CONSTRAINT `fk_Usuario_Escuela1` FOREIGN KEY (`ESCUELA`) REFERENCES `ESCUELA` (`idEscuela`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Usuario_Grado_academico1` FOREIGN KEY (`grado`) REFERENCES `GRADO_ACADEMICO` (`idGrado_academico`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `USUARIO_COLABORADOR_PROYECTO`
--
ALTER TABLE `USUARIO_COLABORADOR_PROYECTO`
ADD CONSTRAINT `fk_Usuario_HAS_Proyecto_Proyecto1` FOREIGN KEY (`Proyecto_idProyectos`) REFERENCES `PROYECTO` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Usuario_HAS_Proyecto_Usuario1` FOREIGN KEY (`Usuario_idUsuarios`) REFERENCES `USUARIO` (`idUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `USUARIO_HAS_IDIOMAS`
--
ALTER TABLE `USUARIO_HAS_IDIOMAS`
ADD CONSTRAINT `fk_Usuarios_HAS_Idiomas_Idiomas1` FOREIGN KEY (`Idiomas_idIdiomas`) REFERENCES `IDIOMA` (`idIdiomas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Usuarios_HAS_Idiomas_Usuarios1` FOREIGN KEY (`Usuarios_idUsuarios`) REFERENCES `USUARIO` (`idUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
