-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2020 at 05:56 PM
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
-- Table structure for table `my_routes`
--

CREATE TABLE `my_routes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `namespace` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Backend',
  `name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'backend',
  `controller` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `my_routes`
--

INSERT INTO `my_routes` (`id`, `namespace`, `name`, `path`, `type`, `controller`, `created_at`, `updated_at`) VALUES
(1, 'Backend\\Menu', 'Role', 'role', 'backend', 'RoleController', '2020-05-26 01:18:40', '2020-05-26 01:18:40'),
(2, 'Backend\\Menu', 'Permission', 'permission', 'backend', 'PermissionController', '2020-05-26 01:18:40', '2020-05-26 01:18:40'),
(3, 'Backend\\Menu', 'Process', 'process', 'backend', 'ProcessController', '2020-05-26 01:18:40', '2020-05-26 01:18:40'),
(4, 'Backend\\Menu', 'Dominion', 'dominion', 'backend', 'DominionController', '2020-05-26 01:18:40', '2020-05-26 01:18:40'),
(5, 'Backend\\Menu', 'Authorizedmenu', 'authorizedmenu', 'backend', 'AuthorizedmenuController', '2020-05-26 01:18:40', '2020-05-26 01:18:40'),
(6, 'Backend', 'Admin', 'admin', 'backend', 'AdminController', '2020-05-26 01:18:40', '2020-05-26 01:18:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `my_routes`
--
ALTER TABLE `my_routes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `my_routes`
--
ALTER TABLE `my_routes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
