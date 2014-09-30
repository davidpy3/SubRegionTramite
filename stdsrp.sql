-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 17-10-2012 a las 18:18:55
-- Versión del servidor: 5.1.41
-- Versión de PHP: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `stdsrp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE IF NOT EXISTS `area` (
  `cod_area` int(11) NOT NULL AUTO_INCREMENT,
  `siglas` varchar(6) DEFAULT NULL,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`cod_area`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcar la base de datos para la tabla `area`
--

INSERT INTO `area` (`cod_area`, `siglas`, `descripcion`) VALUES
(1, 'mps', 'mesa parte'),
(3, 'Sis', 'Sistemas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE IF NOT EXISTS `cargo` (
  `idcargo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cargo` varchar(45) DEFAULT NULL,
  `abrev` varchar(45) DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  PRIMARY KEY (`idcargo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcar la base de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`idcargo`, `nombre_cargo`, `abrev`, `estado`) VALUES
(1, 'jefe', 'jf', 'a'),
(5, 'Secretaria', 'Scr', 'b');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expediente`
--

CREATE TABLE IF NOT EXISTS `expediente` (
  `n_expediente` bigint(20) NOT NULL AUTO_INCREMENT,
  `dni` char(8) DEFAULT NULL,
  `descripcion` longtext,
  PRIMARY KEY (`n_expediente`),
  KEY `dni` (`dni`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcar la base de datos para la tabla `expediente`
--

INSERT INTO `expediente` (`n_expediente`, `dni`, `descripcion`) VALUES
(1, '43537493', 'primer expediente de la sub region con el sistema'),
(3, '45348720', 'mi primer expediente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oficinas`
--

CREATE TABLE IF NOT EXISTS `oficinas` (
  `cod_oficina` int(11) NOT NULL AUTO_INCREMENT,
  `cod_area` int(11) DEFAULT NULL,
  `abrev` varchar(10) DEFAULT NULL,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`cod_oficina`),
  KEY `cod_area` (`cod_area`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcar la base de datos para la tabla `oficinas`
--

INSERT INTO `oficinas` (`cod_oficina`, `cod_area`, `abrev`, `descripcion`) VALUES
(1, 1, 'mp', 'oficina numero 1'),
(3, 3, 'DTI', 'Desarrollo de Tecnologico e Informatico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE IF NOT EXISTS `personal` (
  `DNI` char(8) NOT NULL,
  `cod_oficina` int(11) DEFAULT NULL,
  `idcargo` int(11) DEFAULT NULL,
  `usuario_sis` char(12) DEFAULT NULL,
  `pass_sis` varchar(12) DEFAULT NULL,
  `apellidop` varchar(45) DEFAULT NULL,
  `apellidom` varchar(45) DEFAULT NULL,
  `nombres` varchar(45) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `domicilio` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  `tip_usu` char(2) NOT NULL,
  PRIMARY KEY (`DNI`),
  KEY `cod_oficina` (`cod_oficina`),
  KEY `idcargo` (`idcargo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `personal`
--

INSERT INTO `personal` (`DNI`, `cod_oficina`, `idcargo`, `usuario_sis`, `pass_sis`, `apellidop`, `apellidom`, `nombres`, `fecha_nac`, `sexo`, `telefono`, `domicilio`, `email`, `estado`, `tip_usu`) VALUES
('20348720', 1, 1, 'mesaPartes', '123', 'matinez', 'cachai', 'jhonatan', '1970-09-23', 'M', '675090', 'su casa', 'jhonatan_12@hotmail.com', 'b', 'mp'),
('45348720', 3, 1, 'admin', '1234', 'aguirre', 'loyola', 'javier david', '1970-08-08', 'M', '456738', 'su casa', 'soygay@hotmail.com', 'a', 'ad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_tramite`
--

CREATE TABLE IF NOT EXISTS `tipo_tramite` (
  `idTipo_tramite` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `abrev` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipo_tramite`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `tipo_tramite`
--

INSERT INTO `tipo_tramite` (`idTipo_tramite`, `nombre`, `abrev`) VALUES
(1, 'oficio', 'of'),
(2, 'cartas', 'cts');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tramite`
--

CREATE TABLE IF NOT EXISTS `tramite` (
  `n_tramite` int(11) NOT NULL AUTO_INCREMENT,
  `tip_tram` int(11) DEFAULT NULL,
  `n_expediente` bigint(20) DEFAULT NULL,
  `a_eje` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `asunto` varchar(45) DEFAULT NULL,
  `referencia` varchar(45) DEFAULT NULL,
  `detalle` varchar(45) DEFAULT NULL,
  `observaciones` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`n_tramite`),
  KEY `n_expediente` (`n_expediente`),
  KEY `tip_tram` (`tip_tram`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `tramite`
--

INSERT INTO `tramite` (`n_tramite`, `tip_tram`, `n_expediente`, `a_eje`, `fecha`, `asunto`, `referencia`, `detalle`, `observaciones`) VALUES
(1, 1, 1, 2012, '2012-06-06', 'no lo seeeeee', 'a su casa', 'no lo veo', 'nadaaaaaa'),
(2, 1, 1, 2012, '2012-06-06', 'suuuuuuuuuuuuuu', 'naaddddddddddddd', 'de      er', 'ques');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tramite_mov`
--

CREATE TABLE IF NOT EXISTS `tramite_mov` (
  `trami` int(11) DEFAULT NULL,
  `cod_oficina` int(11) DEFAULT NULL,
  `fecha_envio` date DEFAULT NULL,
  `fecha_recepcion` date DEFAULT NULL,
  `prioridad` char(20) DEFAULT NULL,
  `a_eje` char(4) DEFAULT NULL,
  `estado` char(1) NOT NULL,
  KEY `cod_oficina` (`cod_oficina`),
  KEY `trami` (`trami`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `tramite_mov`
--

INSERT INTO `tramite_mov` (`trami`, `cod_oficina`, `fecha_envio`, `fecha_recepcion`, `prioridad`, `a_eje`, `estado`) VALUES
(2, 1, '2012-06-04', '2012-06-21', 'urgente', '2011', 'p'),
(1, 1, '2012-06-21', '2012-06-21', 'ninguna', '2012', 'e'),
(1, 1, '2012-05-21', '2012-05-21', 'urgente', '2012', 'p');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `DNI` char(8) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `login` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`DNI`, `nombre`, `apellidos`, `login`, `password`) VALUES
('43537493', 'marufin', 'contreras', 'chavi', 'chivo'),
('45348720', 'luis miguel', 'contreras marrufo', 'luis', '123');

--
-- Filtros para las tablas descargadas (dump)
--

--
-- Filtros para la tabla `expediente`
--
ALTER TABLE `expediente`
  ADD CONSTRAINT `expediente_ibfk_1` FOREIGN KEY (`dni`) REFERENCES `usuario` (`DNI`);

--
-- Filtros para la tabla `oficinas`
--
ALTER TABLE `oficinas`
  ADD CONSTRAINT `oficinas_ibfk_1` FOREIGN KEY (`cod_area`) REFERENCES `area` (`cod_area`);

--
-- Filtros para la tabla `personal`
--
ALTER TABLE `personal`
  ADD CONSTRAINT `personal_ibfk_1` FOREIGN KEY (`cod_oficina`) REFERENCES `oficinas` (`cod_oficina`),
  ADD CONSTRAINT `personal_ibfk_2` FOREIGN KEY (`idcargo`) REFERENCES `cargo` (`idcargo`);

--
-- Filtros para la tabla `tramite`
--
ALTER TABLE `tramite`
  ADD CONSTRAINT `tramite_ibfk_1` FOREIGN KEY (`n_expediente`) REFERENCES `expediente` (`n_expediente`),
  ADD CONSTRAINT `tramite_ibfk_2` FOREIGN KEY (`tip_tram`) REFERENCES `tipo_tramite` (`idTipo_tramite`);

--
-- Filtros para la tabla `tramite_mov`
--
ALTER TABLE `tramite_mov`
  ADD CONSTRAINT `tramite_mov_ibfk_1` FOREIGN KEY (`cod_oficina`) REFERENCES `oficinas` (`cod_oficina`),
  ADD CONSTRAINT `tramite_mov_ibfk_2` FOREIGN KEY (`trami`) REFERENCES `tramite` (`n_tramite`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
