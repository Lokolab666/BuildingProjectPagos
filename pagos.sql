-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 24, 2022 at 06:19 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pagospendientes`
--

-- --------------------------------------------------------

--
-- Table structure for table `pagos`
--

CREATE TABLE `pagos` (
  `id` bigint(20) NOT NULL,
  `IdPago` varchar(255) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `ValorPagar` int(11) DEFAULT NULL,
  `IdAptoFK` varchar(255) DEFAULT NULL,
  `Descripcion` text DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pagos`
--

INSERT INTO `pagos` (`id`, `IdPago`, `Fecha`, `ValorPagar`, `IdAptoFK`, `Descripcion`, `created_at`, `updated_at`) VALUES
(2, '724-639-5222', '2022-07-20', 125000, '6627217687', 'Pago Julio', '2022-07-19 20:15:41.016311', '2022-07-19 20:15:41.016311'),
(7, '777-887-7777', '2022-06-20', 175000, '0879589702', 'Pago Junio', '2022-07-21 19:22:04.998180', '2022-07-21 19:22:04.998180'),
(8, '666-666-666', '2022-04-20', 150000, '6704820938', 'Pago Abril', '2022-07-22 00:23:06.705256', '2022-07-22 00:23:06.705256'),
(86, '859-887-2845', '2022-07-20', 175000, '0879589702', 'Pago Julio', '2022-07-24 03:16:48.535282', '2022-07-24 03:16:48.535282');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
