-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2020 at 07:48 PM
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
-- Table structure for table `processes`
--

CREATE TABLE `processes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dominion_id` int(11) NOT NULL,
  `guard` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `processes`
--

INSERT INTO `processes` (`id`, `dominion_id`, `guard`, `name`, `route_name`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'Dashboard', 'admin.dashboard', '2020-05-26 08:36:35', '2020-05-26 08:36:35'),
(2, 1, 'admin', 'Index', 'admin.index', '2020-05-26 08:47:52', '2020-05-26 08:47:52'),
(3, 1, 'admin', 'Create', 'admin.create', '2020-05-26 08:47:52', '2020-05-26 08:47:52'),
(4, 1, 'admin', 'Store', 'admin.store', '2020-05-26 08:47:52', '2020-05-26 08:47:52'),
(5, 1, 'admin', 'Show', 'admin.show', '2020-05-26 08:47:52', '2020-05-26 08:47:52'),
(6, 1, 'admin', 'Edit', 'admin.edit', '2020-05-26 08:47:52', '2020-05-26 08:47:52'),
(7, 1, 'admin', 'Update', 'admin.update', '2020-05-26 08:47:52', '2020-05-26 08:47:52'),
(8, 1, 'admin', 'Destroy', 'admin.destroy', '2020-05-26 08:47:52', '2020-05-26 08:47:52'),
(9, 2, 'admin', 'Index', 'role.index', '2020-05-26 08:48:20', '2020-05-26 08:48:20'),
(10, 2, 'admin', 'Create', 'role.create', '2020-05-26 08:48:20', '2020-05-26 08:48:20'),
(11, 2, 'admin', 'Store', 'role.store', '2020-05-26 08:48:20', '2020-05-26 08:48:20'),
(12, 2, 'admin', 'Show', 'role.show', '2020-05-26 08:48:20', '2020-05-26 08:48:20'),
(13, 2, 'admin', 'Edit', 'role.edit', '2020-05-26 08:48:20', '2020-05-26 08:48:20'),
(14, 2, 'admin', 'Update', 'role.update', '2020-05-26 08:48:20', '2020-05-26 08:48:20'),
(15, 2, 'admin', 'Destroy', 'role.destroy', '2020-05-26 08:48:20', '2020-05-26 08:48:20'),
(16, 3, 'admin', 'Index', 'authorizedmenu.index', '2020-05-26 08:49:12', '2020-05-26 08:49:12'),
(17, 3, 'admin', 'Create', 'authorizedmenu.create', '2020-05-26 08:49:12', '2020-05-26 08:49:12'),
(18, 3, 'admin', 'Store', 'authorizedmenu.store', '2020-05-26 08:49:12', '2020-05-26 08:49:12'),
(19, 3, 'admin', 'Show', 'authorizedmenu.show', '2020-05-26 08:49:12', '2020-05-26 08:49:12'),
(20, 3, 'admin', 'Edit', 'authorizedmenu.edit', '2020-05-26 08:49:12', '2020-05-26 08:49:12'),
(21, 3, 'admin', 'Update', 'authorizedmenu.update', '2020-05-26 08:49:12', '2020-05-26 08:49:12'),
(22, 3, 'admin', 'Destroy', 'authorizedmenu.destroy', '2020-05-26 08:49:12', '2020-05-26 08:49:12'),
(23, 4, 'admin', 'Index', 'process.index', '2020-05-26 08:49:49', '2020-05-26 08:49:49'),
(24, 4, 'admin', 'Create', 'process.create', '2020-05-26 08:49:49', '2020-05-26 08:49:49'),
(25, 4, 'admin', 'Store', 'process.store', '2020-05-26 08:49:49', '2020-05-26 08:49:49'),
(26, 4, 'admin', 'Show', 'process.show', '2020-05-26 08:49:49', '2020-05-26 08:49:49'),
(27, 4, 'admin', 'Edit', 'process.edit', '2020-05-26 08:49:49', '2020-05-26 08:49:49'),
(28, 4, 'admin', 'Update', 'process.update', '2020-05-26 08:49:49', '2020-05-26 08:49:49'),
(29, 4, 'admin', 'Destroy', 'process.destroy', '2020-05-26 08:49:49', '2020-05-26 08:49:49'),
(30, 5, 'admin', 'Index', 'permission.index', '2020-05-26 08:50:09', '2020-05-26 08:50:09'),
(31, 5, 'admin', 'Create', 'permission.create', '2020-05-26 08:50:09', '2020-05-26 08:50:09'),
(32, 5, 'admin', 'Store', 'permission.store', '2020-05-26 08:50:09', '2020-05-26 08:50:09'),
(33, 5, 'admin', 'Show', 'permission.show', '2020-05-26 08:50:09', '2020-05-26 08:50:09'),
(34, 5, 'admin', 'Edit', 'permission.edit', '2020-05-26 08:50:09', '2020-05-26 08:50:09'),
(35, 5, 'admin', 'Update', 'permission.update', '2020-05-26 08:50:09', '2020-05-26 08:50:09'),
(36, 5, 'admin', 'Destroy', 'permission.destroy', '2020-05-26 08:50:09', '2020-05-26 08:50:09'),
(37, 6, 'admin', 'Index', 'dominion.index', '2020-05-26 09:03:46', '2020-05-26 09:03:46'),
(38, 6, 'admin', 'Create', 'dominion.create', '2020-05-26 09:03:46', '2020-05-26 09:03:46'),
(39, 6, 'admin', 'Store', 'dominion.store', '2020-05-26 09:03:46', '2020-05-26 09:03:46'),
(40, 6, 'admin', 'Show', 'dominion.show', '2020-05-26 09:03:46', '2020-05-26 09:03:46'),
(41, 6, 'admin', 'Edit', 'dominion.edit', '2020-05-26 09:03:46', '2020-05-26 09:03:46'),
(42, 6, 'admin', 'Update', 'dominion.update', '2020-05-26 09:03:46', '2020-05-26 09:03:46'),
(43, 6, 'admin', 'Destroy', 'dominion.destroy', '2020-05-26 09:03:46', '2020-05-26 09:03:46'),
(44, 7, 'admin', 'Index', 'module.index', '2020-05-26 09:03:46', '2020-05-26 09:03:46'),
(45, 7, 'admin', 'Create', 'module.create', '2020-05-26 09:03:46', '2020-05-26 09:03:46'),
(46, 7, 'admin', 'Check Model', 'module.check', '2020-05-26 09:03:46', '2020-05-26 09:03:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `processes`
--
ALTER TABLE `processes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `processes`
--
ALTER TABLE `processes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
