-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-05-2023 a las 17:24:31
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
  `nivel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`id`, `nombre`, `nivel`) VALUES
(1, 'Andres', 1),
(2, 'Javier', 1),
(3, 'Stephen Hawkings', 2);

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
  `zonas_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `dinosaurios`
--

INSERT INTO `dinosaurios` (`id`, `nombre`, `era`, `pagina_id`, `familias_id`, `zonas_id`) VALUES
(1, 'Tyrannosaurus_rex', 'Cretacico', 3, 1, 1),
(2, 'Brachiosaurus', 'Jurasico', 3, 2, 1),
(3, 'Anquilosaurio', 'Cretacico', 3, 3, 1),
(4, 'Triceratops', 'Cretacico', 3, 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `familias`
--

CREATE TABLE `familias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

CREATE TABLE `pagina` (
  `id` int(11) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `administrador_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

CREATE TABLE `usuario_editor` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `contrasena` varchar(45) NOT NULL,
  `administrador_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

CREATE TABLE `usuario_editor_has_pagina` (
  `usuario_editor_id` int(11) DEFAULT NULL,
  `pagina_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario_editor_has_pagina`
--

INSERT INTO `usuario_editor_has_pagina` (`usuario_editor_id`, `pagina_id`) VALUES
(2, 2),
(3, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zonas`
--

CREATE TABLE `zonas` (
  `id` int(11) NOT NULL,
  `clima` varchar(30) DEFAULT NULL,
  `region` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Indices de la tabla `pagina`
--
ALTER TABLE `pagina`
  ADD PRIMARY KEY (`id`),
  ADD KEY `administrador_id` (`administrador_id`);

--
-- Indices de la tabla `usuario_editor`
--
ALTER TABLE `usuario_editor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `administrador_id` (`administrador_id`);

--
-- Indices de la tabla `usuario_editor_has_pagina`
--
ALTER TABLE `usuario_editor_has_pagina`
  ADD KEY `usuario_editor_id` (`usuario_editor_id`),
  ADD KEY `pagina_id` (`pagina_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `dinosaurios`
--
ALTER TABLE `dinosaurios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `familias`
--
ALTER TABLE `familias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `pagina`
--
ALTER TABLE `pagina`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuario_editor`
--
ALTER TABLE `usuario_editor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
