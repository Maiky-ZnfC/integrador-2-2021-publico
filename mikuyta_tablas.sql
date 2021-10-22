-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-10-2021 a las 02:17:58
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mikuyta`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `AdministradorCod` int(11) NOT NULL,
  `UsuarioCod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprador`
--

CREATE TABLE `comprador` (
  `CompradorCod` int(11) NOT NULL,
  `UsuarioCod` int(11) NOT NULL,
  `Celular` int(11) NOT NULL,
  `Correo` varchar(60) NOT NULL,
  `FechaNacimiento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallepedido`
--

CREATE TABLE `detallepedido` (
  `PedidoCod` int(11) NOT NULL,
  `ProductoCod` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `PagoCod` int(11) NOT NULL,
  `TipoPagoCod` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Moneda` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `PedidoCod` int(11) NOT NULL,
  `VendedorCod` int(11) NOT NULL,
  `CompradorCod` int(11) NOT NULL,
  `TipoPedidoCod` int(11) NOT NULL,
  `PagoCod` int(11) NOT NULL,
  `Fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidomesa`
--

CREATE TABLE `pedidomesa` (
  `PedidoMesaCod` int(11) NOT NULL,
  `TipoPedidoCod` int(11) NOT NULL,
  `NumeroMesa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `ProductoCod` int(11) NOT NULL,
  `Descripcion` varchar(60) NOT NULL,
  `Precio` decimal(5,2) NOT NULL,
  `Stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repartidor`
--

CREATE TABLE `repartidor` (
  `RepartidorCod` int(11) NOT NULL,
  `Nombre` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reparto`
--

CREATE TABLE `reparto` (
  `RepartoCod` int(11) NOT NULL,
  `TipoPedidoCod` int(11) NOT NULL,
  `RepartidorCod` int(11) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `HoraSalida` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `ReservaCod` int(11) NOT NULL,
  `TipoPedidoCod` int(11) NOT NULL,
  `FechaPedido` date NOT NULL,
  `FechaReserva` date NOT NULL,
  `CantidadPersonas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipopago`
--

CREATE TABLE `tipopago` (
  `TipoPagoCod` int(11) NOT NULL,
  `Descripcion` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipopedido`
--

CREATE TABLE `tipopedido` (
  `TipoPedidoCod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `UsuarioCod` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `NombreUsuario` varchar(60) NOT NULL,
  `Contrasena` varchar(60) NOT NULL,
  `FechaRegistro` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedor`
--

CREATE TABLE `vendedor` (
  `VendedorCod` int(11) NOT NULL,
  `UsuarioCod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`AdministradorCod`),
  ADD KEY `UsuarioCod` (`UsuarioCod`);

--
-- Indices de la tabla `comprador`
--
ALTER TABLE `comprador`
  ADD PRIMARY KEY (`CompradorCod`),
  ADD KEY `UsuarioCod` (`UsuarioCod`);

--
-- Indices de la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  ADD PRIMARY KEY (`PedidoCod`,`ProductoCod`),
  ADD KEY `ProductoCod` (`ProductoCod`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`PagoCod`),
  ADD KEY `TipoPagoCod` (`TipoPagoCod`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`PedidoCod`),
  ADD KEY `VendedorCod` (`VendedorCod`),
  ADD KEY `CompradorCod` (`CompradorCod`),
  ADD KEY `TipoPedidoCod` (`TipoPedidoCod`),
  ADD KEY `PagoCod` (`PagoCod`);

--
-- Indices de la tabla `pedidomesa`
--
ALTER TABLE `pedidomesa`
  ADD PRIMARY KEY (`PedidoMesaCod`),
  ADD KEY `TipoPedidoCod` (`TipoPedidoCod`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`ProductoCod`);

--
-- Indices de la tabla `repartidor`
--
ALTER TABLE `repartidor`
  ADD PRIMARY KEY (`RepartidorCod`);

--
-- Indices de la tabla `reparto`
--
ALTER TABLE `reparto`
  ADD PRIMARY KEY (`RepartoCod`),
  ADD KEY `TipoPedidoCod` (`TipoPedidoCod`),
  ADD KEY `RepartidorCod` (`RepartidorCod`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`ReservaCod`),
  ADD KEY `TipoPedidoCod` (`TipoPedidoCod`);

--
-- Indices de la tabla `tipopago`
--
ALTER TABLE `tipopago`
  ADD PRIMARY KEY (`TipoPagoCod`);

--
-- Indices de la tabla `tipopedido`
--
ALTER TABLE `tipopedido`
  ADD PRIMARY KEY (`TipoPedidoCod`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`UsuarioCod`);

--
-- Indices de la tabla `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`VendedorCod`),
  ADD KEY `UsuarioCod` (`UsuarioCod`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `AdministradorCod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comprador`
--
ALTER TABLE `comprador`
  MODIFY `CompradorCod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `PagoCod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `PedidoCod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidomesa`
--
ALTER TABLE `pedidomesa`
  MODIFY `PedidoMesaCod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `ProductoCod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `repartidor`
--
ALTER TABLE `repartidor`
  MODIFY `RepartidorCod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reparto`
--
ALTER TABLE `reparto`
  MODIFY `RepartoCod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reserva`
--
ALTER TABLE `reserva`
  MODIFY `ReservaCod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipopago`
--
ALTER TABLE `tipopago`
  MODIFY `TipoPagoCod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipopedido`
--
ALTER TABLE `tipopedido`
  MODIFY `TipoPedidoCod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `UsuarioCod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `vendedor`
--
ALTER TABLE `vendedor`
  MODIFY `VendedorCod` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD CONSTRAINT `administrador_ibfk_1` FOREIGN KEY (`UsuarioCod`) REFERENCES `usuario` (`UsuarioCod`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `comprador`
--
ALTER TABLE `comprador`
  ADD CONSTRAINT `comprador_ibfk_1` FOREIGN KEY (`UsuarioCod`) REFERENCES `usuario` (`UsuarioCod`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  ADD CONSTRAINT `detallepedido_ibfk_1` FOREIGN KEY (`PedidoCod`) REFERENCES `pedido` (`PedidoCod`) ON UPDATE CASCADE,
  ADD CONSTRAINT `detallepedido_ibfk_2` FOREIGN KEY (`ProductoCod`) REFERENCES `producto` (`ProductoCod`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`TipoPagoCod`) REFERENCES `tipopago` (`TipoPagoCod`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`VendedorCod`) REFERENCES `vendedor` (`VendedorCod`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`CompradorCod`) REFERENCES `comprador` (`CompradorCod`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pedido_ibfk_3` FOREIGN KEY (`TipoPedidoCod`) REFERENCES `tipopedido` (`TipoPedidoCod`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pedido_ibfk_4` FOREIGN KEY (`PagoCod`) REFERENCES `pago` (`PagoCod`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedidomesa`
--
ALTER TABLE `pedidomesa`
  ADD CONSTRAINT `pedidomesa_ibfk_1` FOREIGN KEY (`TipoPedidoCod`) REFERENCES `tipopedido` (`TipoPedidoCod`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `reparto`
--
ALTER TABLE `reparto`
  ADD CONSTRAINT `reparto_ibfk_1` FOREIGN KEY (`TipoPedidoCod`) REFERENCES `tipopedido` (`TipoPedidoCod`) ON UPDATE CASCADE,
  ADD CONSTRAINT `reparto_ibfk_2` FOREIGN KEY (`RepartidorCod`) REFERENCES `repartidor` (`RepartidorCod`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`TipoPedidoCod`) REFERENCES `tipopedido` (`TipoPedidoCod`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `vendedor`
--
ALTER TABLE `vendedor`
  ADD CONSTRAINT `vendedor_ibfk_1` FOREIGN KEY (`UsuarioCod`) REFERENCES `usuario` (`UsuarioCod`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
