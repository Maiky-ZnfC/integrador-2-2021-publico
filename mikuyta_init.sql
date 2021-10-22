--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`AdministradorCod`, `UsuarioCod`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Volcado de datos para la tabla `comprador`
--

INSERT INTO `comprador` (`CompradorCod`, `UsuarioCod`, `Celular`, `Correo`, `FechaNacimiento`) VALUES
(1, 2, 987654321, 'example@gmail.com', '2000-10-04');

-- --------------------------------------------------------

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`ProductoCod`, `Descripcion`, `Precio`, `Stock`) VALUES
(1, 'Zapatos', '20.00', 4),
(2, 'Polos', '10.00', 20),
(3, 'Poleras', '15.00', 18),
(4, 'Zapatillas', '20.00', 5);

-- --------------------------------------------------------

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`UsuarioCod`, `Nombre`, `NombreUsuario`, `Contrasena`, `FechaRegistro`) VALUES
(1, 'Administrador', 'admin', 'admin', '2021-10-21'),
(2, 'User1', 'user1', 'user1', '2021-10-21'),
(3, 'Ventas1', 'ventas1', 'ventas1', '2021-10-21');

-- --------------------------------------------------------

--
-- Volcado de datos para la tabla `vendedor`
--

INSERT INTO `vendedor` (`VendedorCod`, `UsuarioCod`) VALUES
(1, 3);