-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2020 at 05:55 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nogor`
--

-- --------------------------------------------------------

--
-- Table structure for table `authorizedmenus`
--

CREATE TABLE `authorizedmenus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `dominion_id` int(11) DEFAULT NULL,
  `process_id` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT ' ',
  `guard` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `position` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `authorizedmenus`
--

INSERT INTO `authorizedmenus` (`id`, `parent_id`, `dominion_id`, `process_id`, `name`, `params`, `icon`, `route_name`, `guard`, `position`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 1, 'Dashboard', NULL, '<i class=\'fa fa-dashboard\'></i>', 'admin.dashboard', 'admin', 1, '2020-05-26 08:36:35', '2020-05-26 08:36:35'),
(2, NULL, NULL, NULL, 'System Settings', NULL, '<i class=\'fa fa-cogs\'></i>', NULL, 'admin', 2, '2020-05-26 08:58:12', '2020-05-26 08:58:12'),
(3, 2, 2, 9, 'Role', NULL, '<i class=\"fa fa-circle-o text-aqua\"></i>', 'role.index', 'admin', 1, '2020-05-26 09:14:21', '2020-05-26 09:14:21'),
(4, 2, 6, 37, 'Dominion', NULL, '<i class=\"fa fa-circle-o text-aqua\"></i>', 'dominion.index', 'admin', 2, '2020-05-26 09:14:21', '2020-05-26 09:14:21'),
(5, 2, 4, 23, 'Process', NULL, '<i class=\"fa fa-circle-o text-aqua\"></i>', 'process.index', 'admin', 3, '2020-05-26 09:14:21', '2020-05-26 09:14:21'),
(6, 2, 5, 30, 'Permission', NULL, '<i class=\"fa fa-circle-o text-aqua\"></i>', 'permission.index', 'admin', 4, '2020-05-26 09:14:21', '2020-05-26 09:14:21'),
(7, 2, 3, 16, 'Authorized Menu', NULL, '<i class=\"fa fa-circle-o text-aqua\"></i>', 'authorizedmenu.index', 'admin', 5, '2020-05-26 09:14:21', '2020-05-26 09:14:21'),
(8, NULL, 1, 2, 'Admin', NULL, '<i class=\'fa fa-users\'></i>', 'admin.index', 'admin', 20, '2020-05-26 09:14:21', '2020-05-26 09:14:21'),
(9, 2, 7, 44, 'Module Create', NULL, '<i class=\'fa fa-folder\'></i>', 'module.create', 'admin', 8, '2020-05-26 09:14:21', '2020-05-26 09:14:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authorizedmenus`
--
ALTER TABLE `authorizedmenus`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authorizedmenus`
--
ALTER TABLE `authorizedmenus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
