-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-12-2019 a las 02:47:22
-- Versión del servidor: 10.3.15-MariaDB
-- Versión de PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `intelmath`
--
CREATE DATABASE IF NOT EXISTS `intelmath` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `intelmath`;

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tbl_biblioteca` (IN `idbiblioteca` INT, IN `titulo_p` VARCHAR(100), IN `descripcion_p` VARCHAR(200), IN `tipo_p` VARCHAR(100), IN `usuario_p` VARCHAR(100), IN `opcion` CHAR(10))  begin 
		Case opcion 
			when 'consultar' then 
				select * from tbl_biblioteca where titulo = titulo_p;
			when 'Insertar' then 
            if not exists (select * from tbl_biblioteca where id_biblioteca = idbiblioteca ) then
            insert into  tbl_biblioteca values (idbiblioteca,titulo_p,descripcion_p,tipo_p,usuario_p);
            end if;
            when 'Actualizar' then
            update tbl_biblioteca set titulo = titulo_p , descripcion = descripcion_p, tipo = tipo_p where id_biblioteca=idbiblioteca;
			when 'Eliminar' then
			DELETE FROM tbl_biblioteca WHERE  titulo = titulo_p;
       end case;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tbl_dinamicas` (IN `id_dinamicasP` INT, IN `nombreP` VARCHAR(255), IN `puntajeP` INT, IN `id_usuarioP` INT, IN `id_tipoP` INT, IN `opcion` VARCHAR(15))  NO SQL
begin 
		Case opcion 
			when 'consultar' then 
				select d.nombre as 'Nombre del juego', puntaje, t.nombre 'Tipo de juego' from tbl_dinamicas d, tbl_usuario u, tbl_tipo t where d.id_usuario=u.id_usuario and d.id_tipo=t.id_tipo and d.id_usuario=id_usuarioP;
			when 'Insertar' then
            insert into  tbl_dinamicas values (id_dinamicasP,nombreP,puntajeP,id_usuarioP,id_tipoP);
            
            when 'Actualizar' then
            update tbl_dinamicas set nombre=nombreP, puntaje=puntajeP where id_usuario= id_usuarioP and nombre = nombreP;
			
       end case;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tbl_trivia` (IN `id_triviaP` INT, IN `contenidoP` VARCHAR(255), IN `opcion` CHAR(10))  NO SQL
begin 
		Case opcion 
			when 'consultar' then 
				select * from tbl_trivia where id_trivia = id_triviaP;
			when 'Insertar' then 
            
            insert into  tbl_trivia values (id_triviaP,contenidoP);
            
            when 'Actualizar' then
            update tbl_trivia set contenido = contenidoP  where id_trivia = id_triviaP ;
			when 'Eliminar' then
			DELETE FROM tbl_trivia WHERE  id_trivia = id_triviaP;
       end case;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tbl_usuario` (IN `id_usuarioP` INT, IN `usuarioP` VARCHAR(50), IN `contraseñaP` VARCHAR(50), IN `nombreP` VARCHAR(80), IN `apellidoP` VARCHAR(80), IN `correo_electronicoP` VARCHAR(100), IN `telefonoP` CHAR(15), IN `id_rolP` INT, IN `opcion` CHAR(10))  begin 
		Case opcion 
			when 'validar' then 
				select id_usuario, usuario,contraseña, nombre,apellido, correo_electronico, telefono, id_rol from tbl_usuario where usuario = usuarioP and contraseña=contraseñaP;
			when 'insertar'  then
            insert into  tbl_usuario values (id_usuarioP,usuarioP,contraseñaP,nombreP,apellidoP,correo_electronicoP,telefonoP,id_rolP);
            
            when 'Actualizar' then
            update tbl_usuario set   nombre = nombreP , apellido = apellidoP ,correo_electronico = correo_electronicoP , telefono = telefonoP where usuario = usuarioP;
            when 'contraseña' then
            update tbl_usuario set contraseña = contraseñaP where usuario = usuarioP;
            WHEN 'rol' THEN
            UPDATE tbl_usuario set id_rol = id_rolP WHERE usuario = usuarioP;
       end case;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validar` (IN `usuarioP` VARCHAR(50), IN `contraseñaP` VARCHAR(50))  NO SQL
begin
select id_usuario, usuario, AES_DECRYPT(contraseña,'clave'), nombre,apellido, correo_electronico, telefono, id_rol from tbl_usuario where usuario = usuarioP and AES_DECRYPT(contraseña,'clave')=contraseñaP;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_biblioteca`
--

CREATE TABLE `tbl_biblioteca` (
  `id_biblioteca` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `tipo` int(11) DEFAULT NULL,
  `usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_biblioteca`
--

INSERT INTO `tbl_biblioteca` (`id_biblioteca`, `titulo`, `descripcion`, `tipo`, `usuario`) VALUES
(6, 'Pure', 'Mendoza', 3, 2),
(7, 'Lul', 'afredo', 3, 3),
(8, 'Operadores', 'Shidos', 4, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_dinamicas`
--

CREATE TABLE `tbl_dinamicas` (
  `id_dinamicas` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `puntaje` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_tipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_dinamicas`
--

INSERT INTO `tbl_dinamicas` (`id_dinamicas`, `nombre`, `puntaje`, `id_usuario`, `id_tipo`) VALUES
(1, '2048', 109, 1, 3),
(2, 'Puzzle', 109, 2, 4),
(3, '2048', 109, 3, 3),
(4, 'Puzzle', 109, 4, 4),
(5, '2048', 109, 5, 3),
(6, 'Puzzle', 109, 6, 4),
(7, '2048', 109, 7, 3),
(8, 'Puzzle', 109, 8, 4),
(9, '2048', 109, 9, 3),
(10, 'Puzzle', 109, 10, 4),
(11, '2048', 5196, 2, 3),
(12, 'Simon', 3, 11, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_rol`
--

CREATE TABLE `tbl_rol` (
  `id_rol` int(11) NOT NULL,
  `rol` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_rol`
--

INSERT INTO `tbl_rol` (`id_rol`, `rol`) VALUES
(1, 'Aprendiz'),
(2, 'Administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_temas`
--

CREATE TABLE `tbl_temas` (
  `id_temas` int(11) NOT NULL,
  `tema` varchar(100) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `id_biblioteca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipo`
--

CREATE TABLE `tbl_tipo` (
  `id_tipo` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_tipo`
--

INSERT INTO `tbl_tipo` (`id_tipo`, `nombre`) VALUES
(3, 'Razonamiento Matematico'),
(4, 'Razonamiento Logico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_trivia`
--

CREATE TABLE `tbl_trivia` (
  `id_trivia` int(11) NOT NULL,
  `contenido` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_trivia`
--

INSERT INTO `tbl_trivia` (`id_trivia`, `contenido`) VALUES
(1, 'Mejora tus habilidades al practicar a diario '),
(2, 'Comprende el mundo de las matemáticas gracias a nuestros grandes datos que tenemos en la biblioteca'),
(3, 'Tu lógica mejora tu razonamiento'),
(4, 'Sabias que jugando uno puedo aprender, entra a dinámicas y averígualo por tu mismo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuario`
--

CREATE TABLE `tbl_usuario` (
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `contraseña` varchar(50) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `apellido` varchar(80) NOT NULL,
  `correo_electronico` varchar(100) NOT NULL,
  `telefono` char(10) DEFAULT NULL,
  `id_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_usuario`
--

INSERT INTO `tbl_usuario` (`id_usuario`, `usuario`, `contraseña`, `nombre`, `apellido`, `correo_electronico`, `telefono`, `id_rol`) VALUES
(1, 'mary21', '1234hola', 'Mary', 'Ohara', 'marys212131@gmail.com', '123456789', 1),
(2, 'Riko21', 'rIKO21', 'riko', 'Sakurauchi ', 'riko212131@gmail.com', '  12345678', 2),
(3, 'You21', '1234hola', 'you', 'watanabe', 'you212131@gmail.com', '123456789', 1),
(4, 'maru21', '1234hola', 'Hanamaru', 'kunikida', 'zura212131@gmail.com', '123456789', 2),
(5, 'delfin21', '1234hola', 'kanan', 'matsuura', 'kanan212131@gmail.com', '123456789', 2),
(6, 'mandarina21', '1234hola', 'chika', 'tagami', 'chikachi212131@gmail.com', '123456789', 1),
(7, 'muu21', '1234hola', 'nozomi', 'tojo', 'nozomi212131@gmail.com', '123456789', 1),
(8, 'yohane21', '1234hola', 'yoshiko21', 'Thushima', 'yohane212131@gmail.com', '123456789', 2),
(9, 'dia', '1234hola', 'dia', 'kurosawa', 'dia212131@gmail.com', '123456789', 1),
(10, 'ruby', '1234hola', 'ruby', 'kurosawa', 'ruby212131@gmail.com', '123456789', 2),
(11, 'johned', 'johned1209', 'john', 'mendoza', 'joedmeda@gmail.com', '3192695690', 2),
(12, 'jskd', 'öûÑ5O™eÒ³Öm‚T', 'john', 'mendoza', 'correo@correo.com', '3211234321', 1),
(13, 'prueba', '-+½UgHaÿÐ¼[u³™Õ', 'prueba', 'prueba', 'prueba', '1234567890', 1),
(14, 'MAKMA', 'maicol1234', 'maicol', 'martinez', 'beltrangjuan@gmail.com', '3007690166', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_biblioteca`
--
ALTER TABLE `tbl_biblioteca`
  ADD PRIMARY KEY (`id_biblioteca`),
  ADD KEY `tipo` (`tipo`),
  ADD KEY `usuario` (`usuario`);

--
-- Indices de la tabla `tbl_dinamicas`
--
ALTER TABLE `tbl_dinamicas`
  ADD PRIMARY KEY (`id_dinamicas`),
  ADD KEY `tbl_dinamicas_ibfk_1` (`id_usuario`);

--
-- Indices de la tabla `tbl_rol`
--
ALTER TABLE `tbl_rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `tbl_temas`
--
ALTER TABLE `tbl_temas`
  ADD PRIMARY KEY (`id_temas`),
  ADD KEY `id_biblioteca` (`id_biblioteca`);

--
-- Indices de la tabla `tbl_tipo`
--
ALTER TABLE `tbl_tipo`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Indices de la tabla `tbl_trivia`
--
ALTER TABLE `tbl_trivia`
  ADD PRIMARY KEY (`id_trivia`);

--
-- Indices de la tabla `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `usuario` (`usuario`),
  ADD KEY `tbl_usuario_ibfk_1` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_biblioteca`
--
ALTER TABLE `tbl_biblioteca`
  MODIFY `id_biblioteca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tbl_dinamicas`
--
ALTER TABLE `tbl_dinamicas`
  MODIFY `id_dinamicas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `tbl_rol`
--
ALTER TABLE `tbl_rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbl_temas`
--
ALTER TABLE `tbl_temas`
  MODIFY `id_temas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_tipo`
--
ALTER TABLE `tbl_tipo`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tbl_trivia`
--
ALTER TABLE `tbl_trivia`
  MODIFY `id_trivia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_biblioteca`
--
ALTER TABLE `tbl_biblioteca`
  ADD CONSTRAINT `tbl_biblioteca_ibfk_1` FOREIGN KEY (`tipo`) REFERENCES `tbl_tipo` (`id_tipo`),
  ADD CONSTRAINT `tbl_biblioteca_ibfk_2` FOREIGN KEY (`usuario`) REFERENCES `tbl_usuario` (`id_usuario`);

--
-- Filtros para la tabla `tbl_dinamicas`
--
ALTER TABLE `tbl_dinamicas`
  ADD CONSTRAINT `tbl_dinamicas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `tbl_usuario` (`id_usuario`);

--
-- Filtros para la tabla `tbl_temas`
--
ALTER TABLE `tbl_temas`
  ADD CONSTRAINT `tbl_temas_ibfk_1` FOREIGN KEY (`id_biblioteca`) REFERENCES `tbl_biblioteca` (`id_biblioteca`);

--
-- Filtros para la tabla `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  ADD CONSTRAINT `tbl_usuario_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `tbl_rol` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
