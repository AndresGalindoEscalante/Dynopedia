-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-05-2023 a las 13:17:02
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dynopedia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `contraseña` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`id`, `nombre`, `apellido`, `correo`, `contraseña`) VALUES
(1, 'Andres', 'Galindo', 'Andres@andres.com', '12345'),
(2, 'Javier', 'Paz', 'javier@javier.com', '12345'),
(3, 'Stephen', 'Hawkings', 'Stephen@stephen.com', '12345');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dinosaurios`
--

CREATE TABLE `dinosaurios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `era` varchar(50) DEFAULT NULL,
  `pagina_id` int(11) DEFAULT NULL,
  `familias_id` int(11) DEFAULT NULL,
  `zonas_id` int(11) DEFAULT NULL,
  `imagen` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `dinosaurios`
--

INSERT INTO `dinosaurios` (`id`, `nombre`, `era`, `pagina_id`, `familias_id`, `zonas_id`, `imagen`) VALUES
(1, 'Tyrannosaurus_rex', 'Cretacico', 3, 1, 2, 'Tyrannosaurus_rex.jpg '),
(2, 'Brachiosaurus', 'Jurasico', 3, 2, 1, 'Brachiosaurus.jpg'),
(3, 'Anquilosaurio', 'Cretacico', 3, 3, 1, 'Anquilosaurio.jpg'),
(4, 'Triceratops', 'Cretacico', 3, 4, 1, 'Triceratops.jpg'),
(5, 'Diplodocus', 'Jurasico', 3, 2, 1, 'Diplodocus.jpg'),
(6, 'Alosaurio', 'Jurasico', 3, 3, 1, 'Alosaurio.jpg');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `dinosaurios_pagina`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `dinosaurios_pagina` (
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

CREATE TABLE `familias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `contrasena` varchar(50) NOT NULL,
  `rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `apellido`, `correo`, `contrasena`, `rol`) VALUES
(1, 'Pepe', 'Jimenez', 'pepejimenez@gmail.com', '1234AEIOU', 1),
(2, 'Ibai', 'Llanos', 'streamer@gmail.com', 'Ibai1234', 1),
(3, 'Cristiano', 'Ronaldo', 'cr7@gmail.com', 'MessiEsMalo', 1),
(6, 'Lola', 'Noguera', 'lola@gmail.com', 'Lola1234', 1),
(7, 'Andres', 'Galindo', 'andres@andres.com', '12345', 2),
(8, 'Javier', 'Paz', 'javier@gmail.com', '12345', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zonas`
--

CREATE TABLE `zonas` (
  `id` int(11) NOT NULL,
  `clima` varchar(30) DEFAULT NULL,
  `region` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dinosaurios_pagina`  AS SELECT `dinosaurios`.`nombre` AS `nombre`, `dinosaurios`.`era` AS `era`, `familias`.`nombre` AS `familia`, `zonas`.`region` AS `region`, `dinosaurios`.`imagen` AS `imagen` FROM ((`dinosaurios` join `familias` on(`familias`.`id` = `dinosaurios`.`familias_id`)) join `zonas` on(`zonas`.`id` = `dinosaurios`.`zonas_id`)) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `dinosaurios`
--
ALTER TABLE `dinosaurios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pagina_id` (`pagina_id`),
  ADD KEY `familias_id` (`familias_id`),
  ADD KEY `zonas_id` (`zonas_id`);

--
-- Indices de la tabla `familias`
--
ALTER TABLE `familias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `zonas`
--
ALTER TABLE `zonas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `dinosaurios`
--
ALTER TABLE `dinosaurios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `familias`
--
ALTER TABLE `familias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `zonas`
--
ALTER TABLE `zonas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
