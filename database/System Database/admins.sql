-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 27, 2020 at 04:03 PM
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
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` tinyint(4) DEFAULT NULL,
  `block` tinyint(1) NOT NULL DEFAULT 0,
  `status` enum('a','d') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'a',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `username`, `email`, `password`, `mobile`, `address`, `profile`, `role_id`, `block`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Oshit Sutra Dar', 'oshitsd', 'oshitsd@gmail.com', '$2y$10$.gIg9c9y8RXE5A3a2jUgG.1vUZl3wzx2OWPtVqAFZaj2iUz2JU9mC', '01883847733', 'Dhaka, Bangladesh', 'upload/profile/VoltvvvmvfR2JodHIU4A0tqrUe68XXiU24l8EoYx.jpeg', 1, 0, 'a', NULL, '2020-05-20 06:06:40', '2020-05-27 04:26:11'),
(3, 'Bappy Sutra Dar', 'oshitsd', 'oshit@gmail.com', '$2y$10$ChwGECbUeecaazxerIND7eCx809GbERydweF2kaZ/URgdOARP4eKy', '01883847733', 'Dhaka', '', 2, 0, 'a', NULL, '2020-05-20 06:06:40', '2020-05-27 05:06:41'),
(4, 'Oshitsd', NULL, 'oshitsd99@gmail.com', '$2y$10$mBlg8uM9vSDfhtppcJFNsuNsk6q6OZdDRS8cJ8H8lUYZQy5PhsIky', '01862534183', 'Dhaka', '', 2, 0, 'a', NULL, '2020-05-27 04:54:12', '2020-05-27 05:04:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
