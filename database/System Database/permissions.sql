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
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `permissions` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `permissions`, `role_id`, `created_at`, `updated_at`) VALUES
(1, '[{\"id\":1,\"dominion_id\":1,\"guard\":\"admin\",\"name\":\"Dashboard\",\"route_name\":\"admin.dashboard\",\"created_at\":\"2020-05-26T14:36:35.000000Z\",\"updated_at\":\"2020-05-26T14:36:35.000000Z\"},{\"id\":2,\"dominion_id\":1,\"guard\":\"admin\",\"name\":\"Index\",\"route_name\":\"admin.index\",\"created_at\":\"2020-05-26T14:47:52.000000Z\",\"updated_at\":\"2020-05-26T14:47:52.000000Z\"},{\"id\":3,\"dominion_id\":1,\"guard\":\"admin\",\"name\":\"Create\",\"route_name\":\"admin.create\",\"created_at\":\"2020-05-26T14:47:52.000000Z\",\"updated_at\":\"2020-05-26T14:47:52.000000Z\"},{\"id\":4,\"dominion_id\":1,\"guard\":\"admin\",\"name\":\"Store\",\"route_name\":\"admin.store\",\"created_at\":\"2020-05-26T14:47:52.000000Z\",\"updated_at\":\"2020-05-26T14:47:52.000000Z\"},{\"id\":5,\"dominion_id\":1,\"guard\":\"admin\",\"name\":\"Show\",\"route_name\":\"admin.show\",\"created_at\":\"2020-05-26T14:47:52.000000Z\",\"updated_at\":\"2020-05-26T14:47:52.000000Z\"},{\"id\":6,\"dominion_id\":1,\"guard\":\"admin\",\"name\":\"Edit\",\"route_name\":\"admin.edit\",\"created_at\":\"2020-05-26T14:47:52.000000Z\",\"updated_at\":\"2020-05-26T14:47:52.000000Z\"},{\"id\":7,\"dominion_id\":1,\"guard\":\"admin\",\"name\":\"Update\",\"route_name\":\"admin.update\",\"created_at\":\"2020-05-26T14:47:52.000000Z\",\"updated_at\":\"2020-05-26T14:47:52.000000Z\"},{\"id\":8,\"dominion_id\":1,\"guard\":\"admin\",\"name\":\"Destroy\",\"route_name\":\"admin.destroy\",\"created_at\":\"2020-05-26T14:47:52.000000Z\",\"updated_at\":\"2020-05-26T14:47:52.000000Z\"},{\"id\":9,\"dominion_id\":2,\"guard\":\"admin\",\"name\":\"Index\",\"route_name\":\"role.index\",\"created_at\":\"2020-05-26T14:48:20.000000Z\",\"updated_at\":\"2020-05-26T14:48:20.000000Z\"},{\"id\":10,\"dominion_id\":2,\"guard\":\"admin\",\"name\":\"Create\",\"route_name\":\"role.create\",\"created_at\":\"2020-05-26T14:48:20.000000Z\",\"updated_at\":\"2020-05-26T14:48:20.000000Z\"},{\"id\":11,\"dominion_id\":2,\"guard\":\"admin\",\"name\":\"Store\",\"route_name\":\"role.store\",\"created_at\":\"2020-05-26T14:48:20.000000Z\",\"updated_at\":\"2020-05-26T14:48:20.000000Z\"},{\"id\":12,\"dominion_id\":2,\"guard\":\"admin\",\"name\":\"Show\",\"route_name\":\"role.show\",\"created_at\":\"2020-05-26T14:48:20.000000Z\",\"updated_at\":\"2020-05-26T14:48:20.000000Z\"},{\"id\":13,\"dominion_id\":2,\"guard\":\"admin\",\"name\":\"Edit\",\"route_name\":\"role.edit\",\"created_at\":\"2020-05-26T14:48:20.000000Z\",\"updated_at\":\"2020-05-26T14:48:20.000000Z\"},{\"id\":14,\"dominion_id\":2,\"guard\":\"admin\",\"name\":\"Update\",\"route_name\":\"role.update\",\"created_at\":\"2020-05-26T14:48:20.000000Z\",\"updated_at\":\"2020-05-26T14:48:20.000000Z\"},{\"id\":15,\"dominion_id\":2,\"guard\":\"admin\",\"name\":\"Destroy\",\"route_name\":\"role.destroy\",\"created_at\":\"2020-05-26T14:48:20.000000Z\",\"updated_at\":\"2020-05-26T14:48:20.000000Z\"},{\"id\":16,\"dominion_id\":3,\"guard\":\"admin\",\"name\":\"Index\",\"route_name\":\"authorizedmenu.index\",\"created_at\":\"2020-05-26T14:49:12.000000Z\",\"updated_at\":\"2020-05-26T14:49:12.000000Z\"},{\"id\":17,\"dominion_id\":3,\"guard\":\"admin\",\"name\":\"Create\",\"route_name\":\"authorizedmenu.create\",\"created_at\":\"2020-05-26T14:49:12.000000Z\",\"updated_at\":\"2020-05-26T14:49:12.000000Z\"},{\"id\":18,\"dominion_id\":3,\"guard\":\"admin\",\"name\":\"Store\",\"route_name\":\"authorizedmenu.store\",\"created_at\":\"2020-05-26T14:49:12.000000Z\",\"updated_at\":\"2020-05-26T14:49:12.000000Z\"},{\"id\":19,\"dominion_id\":3,\"guard\":\"admin\",\"name\":\"Show\",\"route_name\":\"authorizedmenu.show\",\"created_at\":\"2020-05-26T14:49:12.000000Z\",\"updated_at\":\"2020-05-26T14:49:12.000000Z\"},{\"id\":20,\"dominion_id\":3,\"guard\":\"admin\",\"name\":\"Edit\",\"route_name\":\"authorizedmenu.edit\",\"created_at\":\"2020-05-26T14:49:12.000000Z\",\"updated_at\":\"2020-05-26T14:49:12.000000Z\"},{\"id\":21,\"dominion_id\":3,\"guard\":\"admin\",\"name\":\"Update\",\"route_name\":\"authorizedmenu.update\",\"created_at\":\"2020-05-26T14:49:12.000000Z\",\"updated_at\":\"2020-05-26T14:49:12.000000Z\"},{\"id\":22,\"dominion_id\":3,\"guard\":\"admin\",\"name\":\"Destroy\",\"route_name\":\"authorizedmenu.destroy\",\"created_at\":\"2020-05-26T14:49:12.000000Z\",\"updated_at\":\"2020-05-26T14:49:12.000000Z\"},{\"id\":23,\"dominion_id\":4,\"guard\":\"admin\",\"name\":\"Index\",\"route_name\":\"process.index\",\"created_at\":\"2020-05-26T14:49:49.000000Z\",\"updated_at\":\"2020-05-26T14:49:49.000000Z\"},{\"id\":24,\"dominion_id\":4,\"guard\":\"admin\",\"name\":\"Create\",\"route_name\":\"process.create\",\"created_at\":\"2020-05-26T14:49:49.000000Z\",\"updated_at\":\"2020-05-26T14:49:49.000000Z\"},{\"id\":25,\"dominion_id\":4,\"guard\":\"admin\",\"name\":\"Store\",\"route_name\":\"process.store\",\"created_at\":\"2020-05-26T14:49:49.000000Z\",\"updated_at\":\"2020-05-26T14:49:49.000000Z\"},{\"id\":26,\"dominion_id\":4,\"guard\":\"admin\",\"name\":\"Show\",\"route_name\":\"process.show\",\"created_at\":\"2020-05-26T14:49:49.000000Z\",\"updated_at\":\"2020-05-26T14:49:49.000000Z\"},{\"id\":27,\"dominion_id\":4,\"guard\":\"admin\",\"name\":\"Edit\",\"route_name\":\"process.edit\",\"created_at\":\"2020-05-26T14:49:49.000000Z\",\"updated_at\":\"2020-05-26T14:49:49.000000Z\"},{\"id\":28,\"dominion_id\":4,\"guard\":\"admin\",\"name\":\"Update\",\"route_name\":\"process.update\",\"created_at\":\"2020-05-26T14:49:49.000000Z\",\"updated_at\":\"2020-05-26T14:49:49.000000Z\"},{\"id\":29,\"dominion_id\":4,\"guard\":\"admin\",\"name\":\"Destroy\",\"route_name\":\"process.destroy\",\"created_at\":\"2020-05-26T14:49:49.000000Z\",\"updated_at\":\"2020-05-26T14:49:49.000000Z\"},{\"id\":30,\"dominion_id\":5,\"guard\":\"admin\",\"name\":\"Index\",\"route_name\":\"permission.index\",\"created_at\":\"2020-05-26T14:50:09.000000Z\",\"updated_at\":\"2020-05-26T14:50:09.000000Z\"},{\"id\":31,\"dominion_id\":5,\"guard\":\"admin\",\"name\":\"Create\",\"route_name\":\"permission.create\",\"created_at\":\"2020-05-26T14:50:09.000000Z\",\"updated_at\":\"2020-05-26T14:50:09.000000Z\"},{\"id\":32,\"dominion_id\":5,\"guard\":\"admin\",\"name\":\"Store\",\"route_name\":\"permission.store\",\"created_at\":\"2020-05-26T14:50:09.000000Z\",\"updated_at\":\"2020-05-26T14:50:09.000000Z\"},{\"id\":33,\"dominion_id\":5,\"guard\":\"admin\",\"name\":\"Show\",\"route_name\":\"permission.show\",\"created_at\":\"2020-05-26T14:50:09.000000Z\",\"updated_at\":\"2020-05-26T14:50:09.000000Z\"},{\"id\":34,\"dominion_id\":5,\"guard\":\"admin\",\"name\":\"Edit\",\"route_name\":\"permission.edit\",\"created_at\":\"2020-05-26T14:50:09.000000Z\",\"updated_at\":\"2020-05-26T14:50:09.000000Z\"},{\"id\":35,\"dominion_id\":5,\"guard\":\"admin\",\"name\":\"Update\",\"route_name\":\"permission.update\",\"created_at\":\"2020-05-26T14:50:09.000000Z\",\"updated_at\":\"2020-05-26T14:50:09.000000Z\"},{\"id\":36,\"dominion_id\":5,\"guard\":\"admin\",\"name\":\"Destroy\",\"route_name\":\"permission.destroy\",\"created_at\":\"2020-05-26T14:50:09.000000Z\",\"updated_at\":\"2020-05-26T14:50:09.000000Z\"},{\"id\":37,\"dominion_id\":6,\"guard\":\"admin\",\"name\":\"Index\",\"route_name\":\"dominion.index\",\"created_at\":\"2020-05-26T15:03:46.000000Z\",\"updated_at\":\"2020-05-26T15:03:46.000000Z\"},{\"id\":38,\"dominion_id\":6,\"guard\":\"admin\",\"name\":\"Create\",\"route_name\":\"dominion.create\",\"created_at\":\"2020-05-26T15:03:46.000000Z\",\"updated_at\":\"2020-05-26T15:03:46.000000Z\"},{\"id\":39,\"dominion_id\":6,\"guard\":\"admin\",\"name\":\"Store\",\"route_name\":\"dominion.store\",\"created_at\":\"2020-05-26T15:03:46.000000Z\",\"updated_at\":\"2020-05-26T15:03:46.000000Z\"},{\"id\":40,\"dominion_id\":6,\"guard\":\"admin\",\"name\":\"Show\",\"route_name\":\"dominion.show\",\"created_at\":\"2020-05-26T15:03:46.000000Z\",\"updated_at\":\"2020-05-26T15:03:46.000000Z\"},{\"id\":41,\"dominion_id\":6,\"guard\":\"admin\",\"name\":\"Edit\",\"route_name\":\"dominion.edit\",\"created_at\":\"2020-05-26T15:03:46.000000Z\",\"updated_at\":\"2020-05-26T15:03:46.000000Z\"},{\"id\":42,\"dominion_id\":6,\"guard\":\"admin\",\"name\":\"Update\",\"route_name\":\"dominion.update\",\"created_at\":\"2020-05-26T15:03:46.000000Z\",\"updated_at\":\"2020-05-26T15:03:46.000000Z\"},{\"id\":43,\"dominion_id\":6,\"guard\":\"admin\",\"name\":\"Destroy\",\"route_name\":\"dominion.destroy\",\"created_at\":\"2020-05-26T15:03:46.000000Z\",\"updated_at\":\"2020-05-26T15:03:46.000000Z\"},{\"id\":44,\"dominion_id\":7,\"guard\":\"admin\",\"name\":\"Index\",\"route_name\":\"module.index\",\"created_at\":\"2020-05-26T15:03:46.000000Z\",\"updated_at\":\"2020-05-26T15:03:46.000000Z\"},{\"id\":45,\"dominion_id\":7,\"guard\":\"admin\",\"name\":\"Create\",\"route_name\":\"module.create\",\"created_at\":\"2020-05-26T15:03:46.000000Z\",\"updated_at\":\"2020-05-26T15:03:46.000000Z\"},{\"id\":46,\"dominion_id\":7,\"guard\":\"admin\",\"name\":\"Check Model\",\"route_name\":\"module.check\",\"created_at\":\"2020-05-26T15:03:46.000000Z\",\"updated_at\":\"2020-05-26T15:03:46.000000Z\"}]', 1, '2020-05-26 08:36:35', '2020-05-26 11:48:07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
