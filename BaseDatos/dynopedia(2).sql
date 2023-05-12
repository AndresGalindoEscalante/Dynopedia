-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 12-05-2023 a las 07:42:31
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `dynopedia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE IF NOT EXISTS `administrador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `nivel` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`id`, `nombre`, `nivel`) VALUES
(1, 'Andres', 1),
(2, 'Javier', 1),
(3, 'Stephen Hawkings', 2),
(6, 'as', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dinosaurios`
--

CREATE TABLE IF NOT EXISTS `dinosaurios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `era` varchar(50) DEFAULT NULL,
  `pagina_id` int(11) DEFAULT NULL,
  `familias_id` int(11) DEFAULT NULL,
  `zonas_id` int(11) DEFAULT NULL,
  `imagen` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pagina_id` (`pagina_id`),
  KEY `familias_id` (`familias_id`),
  KEY `zonas_id` (`zonas_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `dinosaurios`
--

INSERT INTO `dinosaurios` (`id`, `nombre`, `era`, `pagina_id`, `familias_id`, `zonas_id`, `imagen`) VALUES
(1, 'Tyrannosaurus_rex', 'Cretacico', 3, 1, 1, 'Tyrannosaurus_rex.jpg'),
(2, 'Brachiosaurus', 'Jurasico', 3, 2, 1, 'Brachiosaurus.jpg'),
(3, 'Anquilosaurio', 'Cretacico', 3, 3, 1, 'Anquilosaurio.jpg'),
(4, 'Triceratops', 'Cretacico', 3, 4, 1, 'Triceratops.jpg'),
(5, 'Diplodocus', 'Jurasico', 3, 2, 1, 'Diplodocus.jpg'),
(6, 'Alosaurio', 'Jurasico', 3, 3, 1, 'Alosaurio.jpg');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `dinosaurios_pagina`
--
CREATE TABLE IF NOT EXISTS `dinosaurios_pagina` (
`nombre` varchar(50)
,`era` varchar(50)
,`familia` varchar(45)
,`region` varchar(50)
,`imagen` varchar(50)
);
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `familias`
--

CREATE TABLE IF NOT EXISTS `familias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `familias`
--

INSERT INTO `familias` (`id`, `nombre`) VALUES
(1, 'Tyrannosauridae'),
(2, 'Brachiosauridae'),
(3, 'Ankylosauridae'),
(4, 'Ceratopsidae');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagina`
--

CREATE TABLE IF NOT EXISTS `pagina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_creacion` date NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `administrador_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `administrador_id` (`administrador_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `pagina`
--

INSERT INTO `pagina` (`id`, `fecha_creacion`, `tipo`, `administrador_id`) VALUES
(1, '2022-10-11', 'Inicial', 1),
(2, '2022-10-11', 'Formulario', 1),
(3, '2022-10-11', 'Dinosaurios', 1),
(4, '2022-11-25', 'TierList', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_editor`
--

CREATE TABLE IF NOT EXISTS `usuario_editor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `contrasena` varchar(45) NOT NULL,
  `administrador_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `administrador_id` (`administrador_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `usuario_editor`
--

INSERT INTO `usuario_editor` (`id`, `nombre`, `apellido`, `correo`, `contrasena`, `administrador_id`) VALUES
(1, 'Pepe', 'Jimenez', 'pepejimenez@gmail.com', '1234AEIOU', 1),
(2, 'Ibai', 'LLanos', 'gordostreamer@gmail.com', 'BURGER_KING', 1),
(3, 'Cristiano', 'Ronaldo', 'cr7@gmail.com', 'MessiEsMalo', 1),
(4, 'Cristiano', 'Ateo', 'igualhaydios@gmail.com', 'AmenJesusBigBang', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_editor_has_pagina`
--

CREATE TABLE IF NOT EXISTS `usuario_editor_has_pagina` (
  `usuario_editor_id` int(11) DEFAULT NULL,
  `pagina_id` int(11) DEFAULT NULL,
  KEY `usuario_editor_id` (`usuario_editor_id`),
  KEY `pagina_id` (`pagina_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario_editor_has_pagina`
--

INSERT INTO `usuario_editor_has_pagina` (`usuario_editor_id`, `pagina_id`) VALUES
(1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zonas`
--

CREATE TABLE IF NOT EXISTS `zonas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clima` varchar(30) DEFAULT NULL,
  `region` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `zonas`
--

INSERT INTO `zonas` (`id`, `clima`, `region`) VALUES
(1, 'Calido', 'Norteamérica'),
(2, 'Calido', 'Europa'),
(3, 'Calido', 'Asia'),
(4, 'Calido', 'Sudamerica'),
(5, 'Calido', 'Africa'),
(6, 'Calido', 'Australia'),
(7, 'Calido', 'Oceano');

-- --------------------------------------------------------

--
-- Estructura para la vista `dinosaurios_pagina`
--
DROP TABLE IF EXISTS `dinosaurios_pagina`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dinosaurios_pagina` AS select `dinosaurios`.`nombre` AS `nombre`,`dinosaurios`.`era` AS `era`,`familias`.`nombre` AS `familia`,`zonas`.`region` AS `region`,`dinosaurios`.`imagen` AS `imagen` from ((`dinosaurios` join `familias` on((`familias`.`id` = `dinosaurios`.`familias_id`))) join `zonas` on((`zonas`.`id` = `dinosaurios`.`zonas_id`)));

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `dinosaurios`
--
ALTER TABLE `dinosaurios`
  ADD CONSTRAINT `dinosaurios_ibfk_1` FOREIGN KEY (`pagina_id`) REFERENCES `pagina` (`id`),
  ADD CONSTRAINT `dinosaurios_ibfk_2` FOREIGN KEY (`familias_id`) REFERENCES `familias` (`id`),
  ADD CONSTRAINT `dinosaurios_ibfk_3` FOREIGN KEY (`zonas_id`) REFERENCES `zonas` (`id`);

--
-- Filtros para la tabla `pagina`
--
ALTER TABLE `pagina`
  ADD CONSTRAINT `pagina_ibfk_1` FOREIGN KEY (`administrador_id`) REFERENCES `administrador` (`id`);

--
-- Filtros para la tabla `usuario_editor`
--
ALTER TABLE `usuario_editor`
  ADD CONSTRAINT `usuario_editor_ibfk_1` FOREIGN KEY (`administrador_id`) REFERENCES `administrador` (`id`);

--
-- Filtros para la tabla `usuario_editor_has_pagina`
--
ALTER TABLE `usuario_editor_has_pagina`
  ADD CONSTRAINT `usuario_editor_has_pagina_ibfk_1` FOREIGN KEY (`usuario_editor_id`) REFERENCES `usuario_editor` (`id`),
  ADD CONSTRAINT `usuario_editor_has_pagina_ibfk_2` FOREIGN KEY (`pagina_id`) REFERENCES `usuario_editor` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
