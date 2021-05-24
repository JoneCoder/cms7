-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 17, 2020 at 05:51 AM
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
(2, 'Oshit Sutra Dar', 'oshitsd', 'oshitsd@gmail.com', '$2y$10$.gIg9c9y8RXE5A3a2jUgG.1vUZl3wzx2OWPtVqAFZaj2iUz2JU9mC', '01883847733', 'Dhaka', 'upload/profile/a307KCxL9miK9GecRH9cfcHsHG19pULE0v8bujWZ.jpeg', 1, 0, 'a', NULL, '2020-05-20 06:06:40', '2020-06-08 06:33:48'),
(3, 'Bappy Sutra Dar', 'oshitsd', 'oshit@gmail.com', '$2y$10$ChwGECbUeecaazxerIND7eCx809GbERydweF2kaZ/URgdOARP4eKy', '01883847733', 'Feni,Bd', '', 2, 0, 'a', NULL, '2020-05-20 06:06:40', '2020-06-09 04:49:54'),
(4, 'Oshitsd', NULL, 'oshitsd99@gmail.com', '$2y$10$mBlg8uM9vSDfhtppcJFNsuNsk6q6OZdDRS8cJ8H8lUYZQy5PhsIky', '01862534183', 'Dhaka', '', 2, 0, 'a', NULL, '2020-05-27 04:54:12', '2020-06-09 04:50:03'),
(6, 'Admin', NULL, 'admin@gmail.com', '$2y$10$TJhmV1U2n.ap.A5lki6Peu4eD9CBQ.rPfFz9aTz/lYclVpCBB/2Ru', '01883847733', 'Dhaka', NULL, 2, 0, 'a', NULL, '2020-06-09 22:15:45', '2020-06-11 20:54:00');

-- --------------------------------------------------------

--
-- Table structure for table `albums`
--

CREATE TABLE `albums` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `albums`
--

INSERT INTO `albums` (`id`, `slug`, `type`, `name`, `sorting`, `created_at`, `updated_at`) VALUES
(1, '2018', 'Photos', '2018', 1, '2020-06-08 23:32:03', '2020-06-09 04:29:17'),
(2, '2019', 'Photos', '2019', 2, '2020-06-08 23:34:53', '2020-06-08 23:34:53'),
(3, '2020', 'Photos', '2020', 3, '2020-06-08 23:34:59', '2020-06-08 23:34:59'),
(4, 'videos-of-2020', 'Videos', 'Videos of 2020', 1, '2020-06-09 01:39:43', '2020-06-11 23:49:13'),
(5, 'video-2021', 'Videos', 'Video 2021', 2, '2020-06-11 23:41:58', '2020-06-11 23:41:58');

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
  `show_dasboard` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `authorizedmenus`
--

INSERT INTO `authorizedmenus` (`id`, `parent_id`, `dominion_id`, `process_id`, `name`, `params`, `icon`, `route_name`, `guard`, `position`, `show_dasboard`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 1, 'Dashboard', NULL, '<i class=\'fa fa-dashboard\'></i>', 'admin.dashboard', 'admin', 1, 0, '2020-05-26 08:36:35', '2020-06-08 22:37:37'),
(2, NULL, NULL, NULL, 'System Settings', NULL, '<i class=\'fa fa-cogs\'></i>', NULL, 'admin', 50, 0, '2020-05-26 08:58:12', '2020-06-14 06:47:40'),
(3, 2, 2, 9, 'Role', NULL, '<i class=\"fa fa-circle-o text-aqua\"></i>', 'role.index', 'admin', 1, 0, '2020-05-26 09:14:21', '2020-06-08 21:55:04'),
(4, 2, 6, 37, 'Dominion', NULL, '<i class=\"fa fa-circle-o text-aqua\"></i>', 'dominion.index', 'admin', 2, 1, '2020-05-26 09:14:21', '2020-06-14 04:12:17'),
(5, 2, 4, 23, 'Process', NULL, '<i class=\"fa fa-circle-o text-aqua\"></i>', 'process.index', 'admin', 3, 0, '2020-05-26 09:14:21', '2020-05-26 09:14:21'),
(6, 2, 5, 30, 'Permission', NULL, '<i class=\"fa fa-circle-o text-aqua\"></i>', 'permission.index', 'admin', 4, 0, '2020-05-26 09:14:21', '2020-05-26 09:14:21'),
(7, 2, 3, 16, 'Authorized Menu', NULL, '<i class=\"fa fa-circle-o text-aqua\"></i>', 'authorizedmenu.index', 'admin', 5, 1, '2020-05-26 09:14:21', '2020-06-14 06:47:28'),
(8, NULL, 1, 2, 'Admin', NULL, '<i class=\'fa fa-users\'></i>', 'admin.index', 'admin', 20, 0, '2020-05-26 09:14:21', '2020-06-08 22:38:11'),
(9, 2, 7, 44, 'Module Create', NULL, '<i class=\'fa fa-folder\'></i>', 'module.create', 'admin', 8, 1, '2020-05-26 09:14:21', '2020-06-14 04:11:31'),
(14, NULL, NULL, NULL, 'Website', NULL, '<i class=\"fa fa-globe\"></i>', NULL, 'admin', 5, 0, '2020-05-31 23:38:42', '2020-06-08 22:38:30'),
(15, 14, 15, 165, 'Content', NULL, '<i class=\"fa fa-file-text-o text-aqua\"></i>', 'content.content', 'admin', 2, 0, '2020-05-31 23:43:35', '2020-06-09 22:26:48'),
(16, 14, 13, 75, 'Configuration', NULL, '<i class=\"fa fa-cog text-aqua\"></i>', 'configuration.index', 'admin', 1, 1, '2020-06-01 04:15:11', '2020-06-14 04:11:58'),
(17, 15, 15, 90, 'About Us', 'about-us', '<i class=\"fa fa-tasks\"></i>', 'content.create', 'admin', 1, 0, '2020-06-01 04:31:27', '2020-06-11 21:11:07'),
(26, 28, 24, 130, 'Slider', NULL, '<i class=\'fa fa-image\'></i>', 'slider.index', 'admin', 1, 1, '2020-06-08 08:06:40', '2020-06-14 06:45:17'),
(28, 14, 27, 166, 'Gallery / Images', NULL, '<i class=\'fa fa-image text-aqua\'></i>', 'photo.gallery_image', 'admin', 3, 0, '2020-06-08 22:34:49', '2020-06-09 22:26:14'),
(29, 28, 26, 144, 'Album', NULL, '<i class=\'fa fa-tags\'></i>', 'album.index', 'admin', 2, 0, '2020-06-08 23:14:31', '2020-06-09 01:39:15'),
(30, 28, 27, 151, 'Photos', NULL, '<i class=\'fa fa-file-image-o \'></i>', 'photo.index', 'admin', 3, 1, '2020-06-08 23:39:31', '2020-06-14 06:45:30'),
(31, 28, 28, 158, 'Video', NULL, '<i class=\'fa fa-file-video-o\'></i>', 'video.index', 'admin', 4, 0, '2020-06-09 01:21:32', '2020-06-09 01:32:55'),
(32, 14, 29, 167, 'Menu', NULL, '<i class=\'fa fa-bars text-aqua\'></i>', 'menu.index', 'admin', 20, 1, '2020-06-10 06:09:01', '2020-06-14 06:45:43'),
(33, NULL, 30, 175, 'Activity Log', NULL, '<i class=\'fa fa-history\'></i>', 'activityLog.index', 'admin', 25, 1, '2020-06-11 00:22:19', '2020-06-14 04:11:10');

-- --------------------------------------------------------

--
-- Table structure for table `configurations`
--

CREATE TABLE `configurations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_title` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`id`, `slug`, `title`, `description`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'about-us', 'About US', '<p>Loream Ipsum</p>', NULL, 1, '2020-06-14 22:10:50', '2020-06-14 22:10:50');

-- --------------------------------------------------------

--
-- Table structure for table `content_files`
--

CREATE TABLE `content_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `content_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dominions`
--

CREATE TABLE `dominions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dominions`
--

INSERT INTO `dominions` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '2020-05-26 08:30:20', '2020-05-26 08:30:20'),
(2, 'Role', '2020-05-26 08:40:41', '2020-05-26 08:40:41'),
(3, 'Authorized Menu', '2020-05-26 08:40:48', '2020-05-26 08:40:48'),
(4, 'Process', '2020-05-26 08:40:56', '2020-05-26 08:40:56'),
(5, 'Permission', '2020-05-26 08:41:03', '2020-05-26 08:41:03'),
(6, 'Dominion', '2020-05-26 09:03:25', '2020-05-26 09:03:25'),
(7, 'Module', '2020-05-26 09:03:25', '2020-05-26 09:03:25'),
(13, 'Configuration', '2020-06-01 03:35:08', '2020-06-01 03:35:08'),
(15, 'Content', '2020-06-01 04:28:22', '2020-06-01 04:28:22'),
(24, 'Slider', '2020-06-08 08:06:40', '2020-06-08 08:06:40'),
(26, 'Album', '2020-06-08 23:14:31', '2020-06-08 23:14:31'),
(27, 'Photo', '2020-06-08 23:39:31', '2020-06-08 23:39:31'),
(28, 'Video', '2020-06-09 01:21:32', '2020-06-09 01:21:32'),
(29, 'Menu', '2020-06-10 06:09:01', '2020-06-10 06:09:01'),
(30, 'ActivityLog', '2020-06-11 00:34:13', '2020-06-11 04:08:35');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `content_id` int(11) DEFAULT NULL,
  `menu_look_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `params` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('a','d') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'a',
  `sorting` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `parent_id`, `content_id`, `menu_look_type`, `type`, `url`, `position`, `title`, `slug`, `params`, `status`, `sorting`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'normal', 'content', NULL, 'header', 'About Us', 'about-us', NULL, 'a', 1, '2020-06-14 22:20:20', '2020-06-14 22:20:20'),
(2, 1, 1, 'normal', 'content', NULL, 'header', 'About Navy', 'about-navy', NULL, 'a', 2, '2020-06-14 22:45:54', '2020-06-14 22:45:54'),
(3, 1, 1, 'normal', 'content', NULL, 'header', 'Chairman Message', 'chairman-message', NULL, 'a', 3, '2020-06-14 22:50:06', '2020-06-14 22:53:53');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_08_23_191426_create_admins_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(8, '2020_05_25_170403_create_my_routes_table', 2),
(12, '2020_05_26_071839_create_roles_table', 3),
(13, '2020_05_27_135131_create_settings_table', 4),
(14, '2020_05_27_145615_create_settings_table', 5),
(16, '2020_06_01_102821_create_contents_table', 7),
(17, '2020_06_02_044523_create_content_files_table', 7),
(21, '2020_06_07_095513_create_testings_table', 8),
(23, '2020_06_08_140638_create_sliders_table', 9),
(25, '2020_06_09_051430_create_albums_table', 11),
(27, '2020_06_09_072128_create_videos_table', 13),
(29, '2020_06_09_053929_create_photos_table', 14),
(32, '2014_10_12_000000_create_users_table', 17),
(35, '2020_06_01_101148_create_configurations_table', 19),
(40, '2020_06_10_120859_create_menus_table', 21);

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
(6, 'Backend', 'Admin', 'admin', 'backend', 'AdminController', '2020-05-26 01:18:40', '2020-05-26 01:18:40'),
(9, 'Backend\\Website', 'Configuration', 'configuration', 'backend', 'ConfigurationController', '2020-06-01 02:44:52', '2020-06-01 02:44:52'),
(16, 'Backend\\Gallery', 'Slider', 'slider', 'backend', 'SliderController', '2020-06-08 08:06:40', '2020-06-08 08:06:40'),
(18, 'Backend\\Gallery', 'Album', 'album', 'backend', 'AlbumController', '2020-06-08 23:14:31', '2020-06-08 23:14:31'),
(19, 'Backend\\Gallery', 'Photo', 'photo', 'backend', 'PhotoController', '2020-06-08 23:39:30', '2020-06-08 23:39:30'),
(20, 'Backend\\Gallery', 'Video', 'video', 'backend', 'VideoController', '2020-06-09 01:21:32', '2020-06-09 01:21:32'),
(21, 'Backend\\Website', 'Menu', 'menu', 'backend', 'MenuController', '2020-06-10 06:09:01', '2020-06-10 06:09:01');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '[{\"id\":158,\"dominion_id\":28,\"guard\":\"admin\",\"name\":\"Index\",\"route_name\":\"video.index\",\"created_at\":\"2020-06-09T07:21:32.000000Z\",\"updated_at\":\"2020-06-09T07:21:32.000000Z\"},{\"id\":159,\"dominion_id\":28,\"guard\":\"admin\",\"name\":\"Create\",\"route_name\":\"video.create\",\"created_at\":\"2020-06-09T07:21:32.000000Z\",\"updated_at\":\"2020-06-09T07:21:32.000000Z\"},{\"id\":160,\"dominion_id\":28,\"guard\":\"admin\",\"name\":\"Store\",\"route_name\":\"video.store\",\"created_at\":\"2020-06-09T07:21:32.000000Z\",\"updated_at\":\"2020-06-09T07:21:32.000000Z\"},{\"id\":161,\"dominion_id\":28,\"guard\":\"admin\",\"name\":\"Show\",\"route_name\":\"video.show\",\"created_at\":\"2020-06-09T07:21:32.000000Z\",\"updated_at\":\"2020-06-09T07:21:32.000000Z\"},{\"id\":162,\"dominion_id\":28,\"guard\":\"admin\",\"name\":\"Edit\",\"route_name\":\"video.edit\",\"created_at\":\"2020-06-09T07:21:32.000000Z\",\"updated_at\":\"2020-06-09T07:21:32.000000Z\"},{\"id\":163,\"dominion_id\":28,\"guard\":\"admin\",\"name\":\"Update\",\"route_name\":\"video.update\",\"created_at\":\"2020-06-09T07:21:32.000000Z\",\"updated_at\":\"2020-06-09T07:21:32.000000Z\"},{\"id\":164,\"dominion_id\":28,\"guard\":\"admin\",\"name\":\"Destroy\",\"route_name\":\"video.destroy\",\"created_at\":\"2020-06-09T07:21:32.000000Z\",\"updated_at\":\"2020-06-09T07:21:32.000000Z\"},{\"id\":151,\"dominion_id\":27,\"guard\":\"admin\",\"name\":\"Index\",\"route_name\":\"photo.index\",\"created_at\":\"2020-06-09T05:39:31.000000Z\",\"updated_at\":\"2020-06-09T05:39:31.000000Z\"},{\"id\":152,\"dominion_id\":27,\"guard\":\"admin\",\"name\":\"Create\",\"route_name\":\"photo.create\",\"created_at\":\"2020-06-09T05:39:31.000000Z\",\"updated_at\":\"2020-06-09T05:39:31.000000Z\"},{\"id\":153,\"dominion_id\":27,\"guard\":\"admin\",\"name\":\"Store\",\"route_name\":\"photo.store\",\"created_at\":\"2020-06-09T05:39:31.000000Z\",\"updated_at\":\"2020-06-09T05:39:31.000000Z\"},{\"id\":154,\"dominion_id\":27,\"guard\":\"admin\",\"name\":\"Show\",\"route_name\":\"photo.show\",\"created_at\":\"2020-06-09T05:39:31.000000Z\",\"updated_at\":\"2020-06-09T05:39:31.000000Z\"},{\"id\":155,\"dominion_id\":27,\"guard\":\"admin\",\"name\":\"Edit\",\"route_name\":\"photo.edit\",\"created_at\":\"2020-06-09T05:39:31.000000Z\",\"updated_at\":\"2020-06-09T05:39:31.000000Z\"},{\"id\":156,\"dominion_id\":27,\"guard\":\"admin\",\"name\":\"Update\",\"route_name\":\"photo.update\",\"created_at\":\"2020-06-09T05:39:31.000000Z\",\"updated_at\":\"2020-06-09T05:39:31.000000Z\"},{\"id\":157,\"dominion_id\":27,\"guard\":\"admin\",\"name\":\"Destroy\",\"route_name\":\"photo.destroy\",\"created_at\":\"2020-06-09T05:39:31.000000Z\",\"updated_at\":\"2020-06-09T05:39:31.000000Z\"},{\"id\":166,\"dominion_id\":27,\"guard\":\"admin\",\"name\":\"Gallery_image\",\"route_name\":\"photo.gallery_image\",\"created_at\":\"2020-06-10T04:20:51.000000Z\",\"updated_at\":\"2020-06-10T04:20:51.000000Z\"},{\"id\":144,\"dominion_id\":26,\"guard\":\"admin\",\"name\":\"Index\",\"route_name\":\"album.index\",\"created_at\":\"2020-06-09T05:14:31.000000Z\",\"updated_at\":\"2020-06-09T05:14:31.000000Z\"},{\"id\":145,\"dominion_id\":26,\"guard\":\"admin\",\"name\":\"Create\",\"route_name\":\"album.create\",\"created_at\":\"2020-06-09T05:14:31.000000Z\",\"updated_at\":\"2020-06-09T05:14:31.000000Z\"},{\"id\":146,\"dominion_id\":26,\"guard\":\"admin\",\"name\":\"Store\",\"route_name\":\"album.store\",\"created_at\":\"2020-06-09T05:14:31.000000Z\",\"updated_at\":\"2020-06-09T05:14:31.000000Z\"},{\"id\":147,\"dominion_id\":26,\"guard\":\"admin\",\"name\":\"Show\",\"route_name\":\"album.show\",\"created_at\":\"2020-06-09T05:14:31.000000Z\",\"updated_at\":\"2020-06-09T05:14:31.000000Z\"},{\"id\":148,\"dominion_id\":26,\"guard\":\"admin\",\"name\":\"Edit\",\"route_name\":\"album.edit\",\"created_at\":\"2020-06-09T05:14:31.000000Z\",\"updated_at\":\"2020-06-09T05:14:31.000000Z\"},{\"id\":149,\"dominion_id\":26,\"guard\":\"admin\",\"name\":\"Update\",\"route_name\":\"album.update\",\"created_at\":\"2020-06-09T05:14:31.000000Z\",\"updated_at\":\"2020-06-09T05:14:31.000000Z\"},{\"id\":150,\"dominion_id\":26,\"guard\":\"admin\",\"name\":\"Destroy\",\"route_name\":\"album.destroy\",\"created_at\":\"2020-06-09T05:14:31.000000Z\",\"updated_at\":\"2020-06-09T05:14:31.000000Z\"},{\"id\":130,\"dominion_id\":24,\"guard\":\"admin\",\"name\":\"Index\",\"route_name\":\"slider.index\",\"created_at\":\"2020-06-08T14:06:40.000000Z\",\"updated_at\":\"2020-06-08T14:06:40.000000Z\"},{\"id\":131,\"dominion_id\":24,\"guard\":\"admin\",\"name\":\"Create\",\"route_name\":\"slider.create\",\"created_at\":\"2020-06-08T14:06:40.000000Z\",\"updated_at\":\"2020-06-08T14:06:40.000000Z\"},{\"id\":132,\"dominion_id\":24,\"guard\":\"admin\",\"name\":\"Store\",\"route_name\":\"slider.store\",\"created_at\":\"2020-06-08T14:06:40.000000Z\",\"updated_at\":\"2020-06-08T14:06:40.000000Z\"},{\"id\":133,\"dominion_id\":24,\"guard\":\"admin\",\"name\":\"Show\",\"route_name\":\"slider.show\",\"created_at\":\"2020-06-08T14:06:40.000000Z\",\"updated_at\":\"2020-06-08T14:06:40.000000Z\"},{\"id\":134,\"dominion_id\":24,\"guard\":\"admin\",\"name\":\"Edit\",\"route_name\":\"slider.edit\",\"created_at\":\"2020-06-08T14:06:40.000000Z\",\"updated_at\":\"2020-06-08T14:06:40.000000Z\"},{\"id\":135,\"dominion_id\":24,\"guard\":\"admin\",\"name\":\"Update\",\"route_name\":\"slider.update\",\"created_at\":\"2020-06-08T14:06:40.000000Z\",\"updated_at\":\"2020-06-08T14:06:40.000000Z\"},{\"id\":136,\"dominion_id\":24,\"guard\":\"admin\",\"name\":\"Destroy\",\"route_name\":\"slider.destroy\",\"created_at\":\"2020-06-08T14:06:40.000000Z\",\"updated_at\":\"2020-06-08T14:06:40.000000Z\"},{\"id\":89,\"dominion_id\":15,\"guard\":\"admin\",\"name\":\"Index\",\"route_name\":\"content.index\",\"created_at\":\"2020-06-01T10:28:22.000000Z\",\"updated_at\":\"2020-06-01T10:28:22.000000Z\"},{\"id\":90,\"dominion_id\":15,\"guard\":\"admin\",\"name\":\"Create\",\"route_name\":\"content.create\",\"created_at\":\"2020-06-01T10:28:22.000000Z\",\"updated_at\":\"2020-06-01T10:28:22.000000Z\"},{\"id\":91,\"dominion_id\":15,\"guard\":\"admin\",\"name\":\"Store\",\"route_name\":\"content.store\",\"created_at\":\"2020-06-01T10:28:22.000000Z\",\"updated_at\":\"2020-06-01T10:28:22.000000Z\"},{\"id\":92,\"dominion_id\":15,\"guard\":\"admin\",\"name\":\"Show\",\"route_name\":\"content.show\",\"created_at\":\"2020-06-01T10:28:22.000000Z\",\"updated_at\":\"2020-06-01T10:28:22.000000Z\"},{\"id\":93,\"dominion_id\":15,\"guard\":\"admin\",\"name\":\"Edit\",\"route_name\":\"content.edit\",\"created_at\":\"2020-06-01T10:28:22.000000Z\",\"updated_at\":\"2020-06-01T10:28:22.000000Z\"},{\"id\":94,\"dominion_id\":15,\"guard\":\"admin\",\"name\":\"Update\",\"route_name\":\"content.update\",\"created_at\":\"2020-06-01T10:28:22.000000Z\",\"updated_at\":\"2020-06-01T10:28:22.000000Z\"},{\"id\":95,\"dominion_id\":15,\"guard\":\"admin\",\"name\":\"Destroy\",\"route_name\":\"content.destroy\",\"created_at\":\"2020-06-01T10:28:22.000000Z\",\"updated_at\":\"2020-06-01T10:28:22.000000Z\"},{\"id\":97,\"dominion_id\":15,\"guard\":\"admin\",\"name\":\"File\",\"route_name\":\"content.file\",\"created_at\":\"2020-06-02T04:33:20.000000Z\",\"updated_at\":\"2020-06-02T04:33:20.000000Z\"},{\"id\":98,\"dominion_id\":15,\"guard\":\"admin\",\"name\":\"StoreFile\",\"route_name\":\"content.storeFile\",\"created_at\":\"2020-06-03T08:04:08.000000Z\",\"updated_at\":\"2020-06-03T08:04:08.000000Z\"},{\"id\":165,\"dominion_id\":15,\"guard\":\"admin\",\"name\":\"Content\",\"route_name\":\"content.content\",\"created_at\":\"2020-06-10T04:20:21.000000Z\",\"updated_at\":\"2020-06-10T04:20:21.000000Z\"},{\"id\":75,\"dominion_id\":13,\"guard\":\"admin\",\"name\":\"Index\",\"route_name\":\"configuration.index\",\"created_at\":\"2020-06-01T09:35:08.000000Z\",\"updated_at\":\"2020-06-01T09:35:08.000000Z\"},{\"id\":76,\"dominion_id\":13,\"guard\":\"admin\",\"name\":\"Create\",\"route_name\":\"configuration.create\",\"created_at\":\"2020-06-01T09:35:08.000000Z\",\"updated_at\":\"2020-06-01T09:35:08.000000Z\"},{\"id\":77,\"dominion_id\":13,\"guard\":\"admin\",\"name\":\"Store\",\"route_name\":\"configuration.store\",\"created_at\":\"2020-06-01T09:35:08.000000Z\",\"updated_at\":\"2020-06-01T09:35:08.000000Z\"},{\"id\":78,\"dominion_id\":13,\"guard\":\"admin\",\"name\":\"Show\",\"route_name\":\"configuration.show\",\"created_at\":\"2020-06-01T09:35:08.000000Z\",\"updated_at\":\"2020-06-01T09:35:08.000000Z\"},{\"id\":79,\"dominion_id\":13,\"guard\":\"admin\",\"name\":\"Edit\",\"route_name\":\"configuration.edit\",\"created_at\":\"2020-06-01T09:35:08.000000Z\",\"updated_at\":\"2020-06-01T09:35:08.000000Z\"},{\"id\":80,\"dominion_id\":13,\"guard\":\"admin\",\"name\":\"Update\",\"route_name\":\"configuration.update\",\"created_at\":\"2020-06-01T09:35:08.000000Z\",\"updated_at\":\"2020-06-01T09:35:08.000000Z\"},{\"id\":81,\"dominion_id\":13,\"guard\":\"admin\",\"name\":\"Destroy\",\"route_name\":\"configuration.destroy\",\"created_at\":\"2020-06-01T09:35:08.000000Z\",\"updated_at\":\"2020-06-01T09:35:08.000000Z\"},{\"id\":44,\"dominion_id\":7,\"guard\":\"admin\",\"name\":\"Index\",\"route_name\":\"module.index\",\"created_at\":\"2020-05-26T15:03:46.000000Z\",\"updated_at\":\"2020-05-26T15:03:46.000000Z\"},{\"id\":45,\"dominion_id\":7,\"guard\":\"admin\",\"name\":\"Create\",\"route_name\":\"module.create\",\"created_at\":\"2020-05-26T15:03:46.000000Z\",\"updated_at\":\"2020-05-26T15:03:46.000000Z\"},{\"id\":46,\"dominion_id\":7,\"guard\":\"admin\",\"name\":\"Check Model\",\"route_name\":\"module.check\",\"created_at\":\"2020-05-26T15:03:46.000000Z\",\"updated_at\":\"2020-05-26T15:03:46.000000Z\"},{\"id\":37,\"dominion_id\":6,\"guard\":\"admin\",\"name\":\"Index\",\"route_name\":\"dominion.index\",\"created_at\":\"2020-05-26T15:03:46.000000Z\",\"updated_at\":\"2020-05-26T15:03:46.000000Z\"},{\"id\":38,\"dominion_id\":6,\"guard\":\"admin\",\"name\":\"Create\",\"route_name\":\"dominion.create\",\"created_at\":\"2020-05-26T15:03:46.000000Z\",\"updated_at\":\"2020-05-26T15:03:46.000000Z\"},{\"id\":39,\"dominion_id\":6,\"guard\":\"admin\",\"name\":\"Store\",\"route_name\":\"dominion.store\",\"created_at\":\"2020-05-26T15:03:46.000000Z\",\"updated_at\":\"2020-05-26T15:03:46.000000Z\"},{\"id\":40,\"dominion_id\":6,\"guard\":\"admin\",\"name\":\"Show\",\"route_name\":\"dominion.show\",\"created_at\":\"2020-05-26T15:03:46.000000Z\",\"updated_at\":\"2020-05-26T15:03:46.000000Z\"},{\"id\":41,\"dominion_id\":6,\"guard\":\"admin\",\"name\":\"Edit\",\"route_name\":\"dominion.edit\",\"created_at\":\"2020-05-26T15:03:46.000000Z\",\"updated_at\":\"2020-05-26T15:03:46.000000Z\"},{\"id\":42,\"dominion_id\":6,\"guard\":\"admin\",\"name\":\"Update\",\"route_name\":\"dominion.update\",\"created_at\":\"2020-05-26T15:03:46.000000Z\",\"updated_at\":\"2020-05-26T15:03:46.000000Z\"},{\"id\":43,\"dominion_id\":6,\"guard\":\"admin\",\"name\":\"Destroy\",\"route_name\":\"dominion.destroy\",\"created_at\":\"2020-05-26T15:03:46.000000Z\",\"updated_at\":\"2020-05-26T15:03:46.000000Z\"},{\"id\":30,\"dominion_id\":5,\"guard\":\"admin\",\"name\":\"Index\",\"route_name\":\"permission.index\",\"created_at\":\"2020-05-26T14:50:09.000000Z\",\"updated_at\":\"2020-05-26T14:50:09.000000Z\"},{\"id\":31,\"dominion_id\":5,\"guard\":\"admin\",\"name\":\"Create\",\"route_name\":\"permission.create\",\"created_at\":\"2020-05-26T14:50:09.000000Z\",\"updated_at\":\"2020-05-26T14:50:09.000000Z\"},{\"id\":32,\"dominion_id\":5,\"guard\":\"admin\",\"name\":\"Store\",\"route_name\":\"permission.store\",\"created_at\":\"2020-05-26T14:50:09.000000Z\",\"updated_at\":\"2020-05-26T14:50:09.000000Z\"},{\"id\":33,\"dominion_id\":5,\"guard\":\"admin\",\"name\":\"Show\",\"route_name\":\"permission.show\",\"created_at\":\"2020-05-26T14:50:09.000000Z\",\"updated_at\":\"2020-05-26T14:50:09.000000Z\"},{\"id\":34,\"dominion_id\":5,\"guard\":\"admin\",\"name\":\"Edit\",\"route_name\":\"permission.edit\",\"created_at\":\"2020-05-26T14:50:09.000000Z\",\"updated_at\":\"2020-05-26T14:50:09.000000Z\"},{\"id\":35,\"dominion_id\":5,\"guard\":\"admin\",\"name\":\"Update\",\"route_name\":\"permission.update\",\"created_at\":\"2020-05-26T14:50:09.000000Z\",\"updated_at\":\"2020-05-26T14:50:09.000000Z\"},{\"id\":36,\"dominion_id\":5,\"guard\":\"admin\",\"name\":\"Destroy\",\"route_name\":\"permission.destroy\",\"created_at\":\"2020-05-26T14:50:09.000000Z\",\"updated_at\":\"2020-05-26T14:50:09.000000Z\"},{\"id\":23,\"dominion_id\":4,\"guard\":\"admin\",\"name\":\"Index\",\"route_name\":\"process.index\",\"created_at\":\"2020-05-26T14:49:49.000000Z\",\"updated_at\":\"2020-05-26T14:49:49.000000Z\"},{\"id\":24,\"dominion_id\":4,\"guard\":\"admin\",\"name\":\"Create\",\"route_name\":\"process.create\",\"created_at\":\"2020-05-26T14:49:49.000000Z\",\"updated_at\":\"2020-05-26T14:49:49.000000Z\"},{\"id\":25,\"dominion_id\":4,\"guard\":\"admin\",\"name\":\"Store\",\"route_name\":\"process.store\",\"created_at\":\"2020-05-26T14:49:49.000000Z\",\"updated_at\":\"2020-05-26T14:49:49.000000Z\"},{\"id\":26,\"dominion_id\":4,\"guard\":\"admin\",\"name\":\"Show\",\"route_name\":\"process.show\",\"created_at\":\"2020-05-26T14:49:49.000000Z\",\"updated_at\":\"2020-05-26T14:49:49.000000Z\"},{\"id\":27,\"dominion_id\":4,\"guard\":\"admin\",\"name\":\"Edit\",\"route_name\":\"process.edit\",\"created_at\":\"2020-05-26T14:49:49.000000Z\",\"updated_at\":\"2020-05-26T14:49:49.000000Z\"},{\"id\":28,\"dominion_id\":4,\"guard\":\"admin\",\"name\":\"Update\",\"route_name\":\"process.update\",\"created_at\":\"2020-05-26T14:49:49.000000Z\",\"updated_at\":\"2020-05-26T14:49:49.000000Z\"},{\"id\":29,\"dominion_id\":4,\"guard\":\"admin\",\"name\":\"Destroy\",\"route_name\":\"process.destroy\",\"created_at\":\"2020-05-26T14:49:49.000000Z\",\"updated_at\":\"2020-05-26T14:49:49.000000Z\"},{\"id\":16,\"dominion_id\":3,\"guard\":\"admin\",\"name\":\"Index\",\"route_name\":\"authorizedmenu.index\",\"created_at\":\"2020-05-26T14:49:12.000000Z\",\"updated_at\":\"2020-05-26T14:49:12.000000Z\"},{\"id\":17,\"dominion_id\":3,\"guard\":\"admin\",\"name\":\"Create\",\"route_name\":\"authorizedmenu.create\",\"created_at\":\"2020-05-26T14:49:12.000000Z\",\"updated_at\":\"2020-05-26T14:49:12.000000Z\"},{\"id\":18,\"dominion_id\":3,\"guard\":\"admin\",\"name\":\"Store\",\"route_name\":\"authorizedmenu.store\",\"created_at\":\"2020-05-26T14:49:12.000000Z\",\"updated_at\":\"2020-05-26T14:49:12.000000Z\"},{\"id\":19,\"dominion_id\":3,\"guard\":\"admin\",\"name\":\"Show\",\"route_name\":\"authorizedmenu.show\",\"created_at\":\"2020-05-26T14:49:12.000000Z\",\"updated_at\":\"2020-05-26T14:49:12.000000Z\"},{\"id\":20,\"dominion_id\":3,\"guard\":\"admin\",\"name\":\"Edit\",\"route_name\":\"authorizedmenu.edit\",\"created_at\":\"2020-05-26T14:49:12.000000Z\",\"updated_at\":\"2020-05-26T14:49:12.000000Z\"},{\"id\":21,\"dominion_id\":3,\"guard\":\"admin\",\"name\":\"Update\",\"route_name\":\"authorizedmenu.update\",\"created_at\":\"2020-05-26T14:49:12.000000Z\",\"updated_at\":\"2020-05-26T14:49:12.000000Z\"},{\"id\":22,\"dominion_id\":3,\"guard\":\"admin\",\"name\":\"Destroy\",\"route_name\":\"authorizedmenu.destroy\",\"created_at\":\"2020-05-26T14:49:12.000000Z\",\"updated_at\":\"2020-05-26T14:49:12.000000Z\"},{\"id\":9,\"dominion_id\":2,\"guard\":\"admin\",\"name\":\"Index\",\"route_name\":\"role.index\",\"created_at\":\"2020-05-26T14:48:20.000000Z\",\"updated_at\":\"2020-05-26T14:48:20.000000Z\"},{\"id\":10,\"dominion_id\":2,\"guard\":\"admin\",\"name\":\"Create\",\"route_name\":\"role.create\",\"created_at\":\"2020-05-26T14:48:20.000000Z\",\"updated_at\":\"2020-05-26T14:48:20.000000Z\"},{\"id\":11,\"dominion_id\":2,\"guard\":\"admin\",\"name\":\"Store\",\"route_name\":\"role.store\",\"created_at\":\"2020-05-26T14:48:20.000000Z\",\"updated_at\":\"2020-05-26T14:48:20.000000Z\"},{\"id\":12,\"dominion_id\":2,\"guard\":\"admin\",\"name\":\"Show\",\"route_name\":\"role.show\",\"created_at\":\"2020-05-26T14:48:20.000000Z\",\"updated_at\":\"2020-05-26T14:48:20.000000Z\"},{\"id\":13,\"dominion_id\":2,\"guard\":\"admin\",\"name\":\"Edit\",\"route_name\":\"role.edit\",\"created_at\":\"2020-05-26T14:48:20.000000Z\",\"updated_at\":\"2020-05-26T14:48:20.000000Z\"},{\"id\":14,\"dominion_id\":2,\"guard\":\"admin\",\"name\":\"Update\",\"route_name\":\"role.update\",\"created_at\":\"2020-05-26T14:48:20.000000Z\",\"updated_at\":\"2020-05-26T14:48:20.000000Z\"},{\"id\":15,\"dominion_id\":2,\"guard\":\"admin\",\"name\":\"Destroy\",\"route_name\":\"role.destroy\",\"created_at\":\"2020-05-26T14:48:20.000000Z\",\"updated_at\":\"2020-05-26T14:48:20.000000Z\"},{\"id\":1,\"dominion_id\":1,\"guard\":\"admin\",\"name\":\"Dashboard\",\"route_name\":\"admin.dashboard\",\"created_at\":\"2020-05-26T14:36:35.000000Z\",\"updated_at\":\"2020-05-26T14:36:35.000000Z\"},{\"id\":2,\"dominion_id\":1,\"guard\":\"admin\",\"name\":\"Index\",\"route_name\":\"admin.index\",\"created_at\":\"2020-05-26T14:47:52.000000Z\",\"updated_at\":\"2020-05-26T14:47:52.000000Z\"},{\"id\":3,\"dominion_id\":1,\"guard\":\"admin\",\"name\":\"Create\",\"route_name\":\"admin.create\",\"created_at\":\"2020-05-26T14:47:52.000000Z\",\"updated_at\":\"2020-05-26T14:47:52.000000Z\"},{\"id\":4,\"dominion_id\":1,\"guard\":\"admin\",\"name\":\"Store\",\"route_name\":\"admin.store\",\"created_at\":\"2020-05-26T14:47:52.000000Z\",\"updated_at\":\"2020-05-26T14:47:52.000000Z\"},{\"id\":5,\"dominion_id\":1,\"guard\":\"admin\",\"name\":\"Show\",\"route_name\":\"admin.show\",\"created_at\":\"2020-05-26T14:47:52.000000Z\",\"updated_at\":\"2020-05-26T14:47:52.000000Z\"},{\"id\":6,\"dominion_id\":1,\"guard\":\"admin\",\"name\":\"Edit\",\"route_name\":\"admin.edit\",\"created_at\":\"2020-05-26T14:47:52.000000Z\",\"updated_at\":\"2020-05-26T14:47:52.000000Z\"},{\"id\":7,\"dominion_id\":1,\"guard\":\"admin\",\"name\":\"Update\",\"route_name\":\"admin.update\",\"created_at\":\"2020-05-26T14:47:52.000000Z\",\"updated_at\":\"2020-05-26T14:47:52.000000Z\"},{\"id\":8,\"dominion_id\":1,\"guard\":\"admin\",\"name\":\"Destroy\",\"route_name\":\"admin.destroy\",\"created_at\":\"2020-05-26T14:47:52.000000Z\",\"updated_at\":\"2020-05-26T14:47:52.000000Z\"},{\"dominion_id\":29,\"name\":\"Index\",\"route_name\":\"menu.index\",\"updated_at\":\"2020-06-10T12:09:01.000000Z\",\"created_at\":\"2020-06-10T12:09:01.000000Z\",\"id\":167,\"guard\":\"admin\"},{\"dominion_id\":29,\"name\":\"Create\",\"route_name\":\"menu.create\",\"updated_at\":\"2020-06-10T12:09:01.000000Z\",\"created_at\":\"2020-06-10T12:09:01.000000Z\",\"id\":168,\"guard\":\"admin\"},{\"dominion_id\":29,\"name\":\"Store\",\"route_name\":\"menu.store\",\"updated_at\":\"2020-06-10T12:09:01.000000Z\",\"created_at\":\"2020-06-10T12:09:01.000000Z\",\"id\":169,\"guard\":\"admin\"},{\"dominion_id\":29,\"name\":\"Show\",\"route_name\":\"menu.show\",\"updated_at\":\"2020-06-10T12:09:01.000000Z\",\"created_at\":\"2020-06-10T12:09:01.000000Z\",\"id\":170,\"guard\":\"admin\"},{\"dominion_id\":29,\"name\":\"Edit\",\"route_name\":\"menu.edit\",\"updated_at\":\"2020-06-10T12:09:01.000000Z\",\"created_at\":\"2020-06-10T12:09:01.000000Z\",\"id\":171,\"guard\":\"admin\"},{\"dominion_id\":29,\"name\":\"Update\",\"route_name\":\"menu.update\",\"updated_at\":\"2020-06-10T12:09:01.000000Z\",\"created_at\":\"2020-06-10T12:09:01.000000Z\",\"id\":172,\"guard\":\"admin\"},{\"dominion_id\":29,\"name\":\"Destroy\",\"route_name\":\"menu.destroy\",\"updated_at\":\"2020-06-10T12:09:01.000000Z\",\"created_at\":\"2020-06-10T12:09:01.000000Z\",\"id\":173,\"guard\":\"admin\"},{\"id\":174,\"dominion_id\":1,\"guard\":\"admin\",\"name\":\"ActivityLog\",\"route_name\":\"admin.activityLog\",\"created_at\":\"2020-06-11T06:05:55.000000Z\",\"updated_at\":\"2020-06-11T06:05:55.000000Z\"},{\"id\":175,\"dominion_id\":30,\"guard\":\"admin\",\"name\":\"Index\",\"route_name\":\"activityLog.index\",\"created_at\":\"2020-06-11T06:35:14.000000Z\",\"updated_at\":\"2020-06-11T06:35:14.000000Z\"},{\"id\":176,\"dominion_id\":30,\"guard\":\"admin\",\"name\":\"Show\",\"route_name\":\"activityLog.show\",\"created_at\":\"2020-06-11T06:35:14.000000Z\",\"updated_at\":\"2020-06-11T06:35:14.000000Z\"},{\"id\":177,\"dominion_id\":30,\"guard\":\"admin\",\"name\":\"Destroy\",\"route_name\":\"activityLog.destroy\",\"created_at\":\"2020-06-11T06:35:14.000000Z\",\"updated_at\":\"2020-06-11T06:35:14.000000Z\"},{\"dominion_id\":31,\"name\":\"Index\",\"route_name\":\"testing.index\",\"updated_at\":\"2020-06-11T17:34:22.000000Z\",\"created_at\":\"2020-06-11T17:34:22.000000Z\",\"id\":178,\"guard\":\"admin\"},{\"dominion_id\":31,\"name\":\"Create\",\"route_name\":\"testing.create\",\"updated_at\":\"2020-06-11T17:34:22.000000Z\",\"created_at\":\"2020-06-11T17:34:22.000000Z\",\"id\":179,\"guard\":\"admin\"},{\"dominion_id\":31,\"name\":\"Store\",\"route_name\":\"testing.store\",\"updated_at\":\"2020-06-11T17:34:22.000000Z\",\"created_at\":\"2020-06-11T17:34:22.000000Z\",\"id\":180,\"guard\":\"admin\"},{\"dominion_id\":31,\"name\":\"Show\",\"route_name\":\"testing.show\",\"updated_at\":\"2020-06-11T17:34:22.000000Z\",\"created_at\":\"2020-06-11T17:34:22.000000Z\",\"id\":181,\"guard\":\"admin\"},{\"dominion_id\":31,\"name\":\"Edit\",\"route_name\":\"testing.edit\",\"updated_at\":\"2020-06-11T17:34:22.000000Z\",\"created_at\":\"2020-06-11T17:34:22.000000Z\",\"id\":182,\"guard\":\"admin\"},{\"dominion_id\":31,\"name\":\"Update\",\"route_name\":\"testing.update\",\"updated_at\":\"2020-06-11T17:34:22.000000Z\",\"created_at\":\"2020-06-11T17:34:22.000000Z\",\"id\":183,\"guard\":\"admin\"},{\"dominion_id\":31,\"name\":\"Destroy\",\"route_name\":\"testing.destroy\",\"updated_at\":\"2020-06-11T17:34:22.000000Z\",\"created_at\":\"2020-06-11T17:34:22.000000Z\",\"id\":184,\"guard\":\"admin\"},{\"id\":185,\"dominion_id\":30,\"guard\":\"admin\",\"name\":\"AllRead\",\"route_name\":\"activityLog.allRead\",\"created_at\":\"2020-06-13T04:25:00.000000Z\",\"updated_at\":\"2020-06-13T04:25:00.000000Z\"},{\"dominion_id\":32,\"name\":\"Index\",\"route_name\":\"testing.index\",\"updated_at\":\"2020-06-13T08:58:22.000000Z\",\"created_at\":\"2020-06-13T08:58:22.000000Z\",\"id\":186,\"guard\":\"admin\"},{\"dominion_id\":32,\"name\":\"Create\",\"route_name\":\"testing.create\",\"updated_at\":\"2020-06-13T08:58:22.000000Z\",\"created_at\":\"2020-06-13T08:58:22.000000Z\",\"id\":187,\"guard\":\"admin\"},{\"dominion_id\":32,\"name\":\"Store\",\"route_name\":\"testing.store\",\"updated_at\":\"2020-06-13T08:58:22.000000Z\",\"created_at\":\"2020-06-13T08:58:22.000000Z\",\"id\":188,\"guard\":\"admin\"},{\"dominion_id\":32,\"name\":\"Show\",\"route_name\":\"testing.show\",\"updated_at\":\"2020-06-13T08:58:22.000000Z\",\"created_at\":\"2020-06-13T08:58:22.000000Z\",\"id\":189,\"guard\":\"admin\"},{\"dominion_id\":32,\"name\":\"Edit\",\"route_name\":\"testing.edit\",\"updated_at\":\"2020-06-13T08:58:22.000000Z\",\"created_at\":\"2020-06-13T08:58:22.000000Z\",\"id\":190,\"guard\":\"admin\"},{\"dominion_id\":32,\"name\":\"Update\",\"route_name\":\"testing.update\",\"updated_at\":\"2020-06-13T08:58:23.000000Z\",\"created_at\":\"2020-06-13T08:58:23.000000Z\",\"id\":191,\"guard\":\"admin\"},{\"dominion_id\":32,\"name\":\"Destroy\",\"route_name\":\"testing.destroy\",\"updated_at\":\"2020-06-13T08:58:23.000000Z\",\"created_at\":\"2020-06-13T08:58:23.000000Z\",\"id\":192,\"guard\":\"admin\"},{\"dominion_id\":33,\"name\":\"Index\",\"route_name\":\"testing.index\",\"updated_at\":\"2020-06-13T09:37:24.000000Z\",\"created_at\":\"2020-06-13T09:37:24.000000Z\",\"id\":193,\"guard\":\"admin\"},{\"dominion_id\":33,\"name\":\"Create\",\"route_name\":\"testing.create\",\"updated_at\":\"2020-06-13T09:37:24.000000Z\",\"created_at\":\"2020-06-13T09:37:24.000000Z\",\"id\":194,\"guard\":\"admin\"},{\"dominion_id\":33,\"name\":\"Store\",\"route_name\":\"testing.store\",\"updated_at\":\"2020-06-13T09:37:25.000000Z\",\"created_at\":\"2020-06-13T09:37:25.000000Z\",\"id\":195,\"guard\":\"admin\"},{\"dominion_id\":33,\"name\":\"Show\",\"route_name\":\"testing.show\",\"updated_at\":\"2020-06-13T09:37:25.000000Z\",\"created_at\":\"2020-06-13T09:37:25.000000Z\",\"id\":196,\"guard\":\"admin\"},{\"dominion_id\":33,\"name\":\"Edit\",\"route_name\":\"testing.edit\",\"updated_at\":\"2020-06-13T09:37:25.000000Z\",\"created_at\":\"2020-06-13T09:37:25.000000Z\",\"id\":197,\"guard\":\"admin\"},{\"dominion_id\":33,\"name\":\"Update\",\"route_name\":\"testing.update\",\"updated_at\":\"2020-06-13T09:37:25.000000Z\",\"created_at\":\"2020-06-13T09:37:25.000000Z\",\"id\":198,\"guard\":\"admin\"},{\"dominion_id\":33,\"name\":\"Destroy\",\"route_name\":\"testing.destroy\",\"updated_at\":\"2020-06-13T09:37:25.000000Z\",\"created_at\":\"2020-06-13T09:37:25.000000Z\",\"id\":199,\"guard\":\"admin\"}]', 1, '2020-05-26 08:36:35', '2020-06-13 03:37:25'),
(2, '[{\"id\":1,\"dominion_id\":1,\"guard\":\"admin\",\"name\":\"Dashboard\",\"route_name\":\"admin.dashboard\",\"created_at\":\"2020-05-26T14:36:35.000000Z\",\"updated_at\":\"2020-05-26T14:36:35.000000Z\"},{\"id\":37,\"dominion_id\":6,\"guard\":\"admin\",\"name\":\"Index\",\"route_name\":\"dominion.index\",\"created_at\":\"2020-05-26T15:03:46.000000Z\",\"updated_at\":\"2020-05-26T15:03:46.000000Z\"},{\"id\":41,\"dominion_id\":6,\"guard\":\"admin\",\"name\":\"Edit\",\"route_name\":\"dominion.edit\",\"created_at\":\"2020-05-26T15:03:46.000000Z\",\"updated_at\":\"2020-05-26T15:03:46.000000Z\"},{\"id\":42,\"dominion_id\":6,\"guard\":\"admin\",\"name\":\"Update\",\"route_name\":\"dominion.update\",\"created_at\":\"2020-05-26T15:03:46.000000Z\",\"updated_at\":\"2020-05-26T15:03:46.000000Z\"},{\"id\":38,\"dominion_id\":6,\"guard\":\"admin\",\"name\":\"Create\",\"route_name\":\"dominion.create\",\"created_at\":\"2020-05-26T15:03:46.000000Z\",\"updated_at\":\"2020-05-26T15:03:46.000000Z\"},{\"id\":39,\"dominion_id\":6,\"guard\":\"admin\",\"name\":\"Store\",\"route_name\":\"dominion.store\",\"created_at\":\"2020-05-26T15:03:46.000000Z\",\"updated_at\":\"2020-05-26T15:03:46.000000Z\"},{\"id\":43,\"dominion_id\":6,\"guard\":\"admin\",\"name\":\"Destroy\",\"route_name\":\"dominion.destroy\",\"created_at\":\"2020-05-26T15:03:46.000000Z\",\"updated_at\":\"2020-05-26T15:03:46.000000Z\"},{\"id\":40,\"dominion_id\":6,\"guard\":\"admin\",\"name\":\"Show\",\"route_name\":\"dominion.show\",\"created_at\":\"2020-05-26T15:03:46.000000Z\",\"updated_at\":\"2020-05-26T15:03:46.000000Z\"},{\"id\":158,\"dominion_id\":28,\"guard\":\"admin\",\"name\":\"Index\",\"route_name\":\"video.index\",\"created_at\":\"2020-06-09T07:21:32.000000Z\",\"updated_at\":\"2020-06-09T07:21:32.000000Z\"},{\"id\":166,\"dominion_id\":27,\"guard\":\"admin\",\"name\":\"Gallery_image\",\"route_name\":\"photo.gallery_image\",\"created_at\":\"2020-06-10T04:20:51.000000Z\",\"updated_at\":\"2020-06-10T04:20:51.000000Z\"},{\"id\":151,\"dominion_id\":27,\"guard\":\"admin\",\"name\":\"Index\",\"route_name\":\"photo.index\",\"created_at\":\"2020-06-09T05:39:31.000000Z\",\"updated_at\":\"2020-06-09T05:39:31.000000Z\"},{\"id\":159,\"dominion_id\":28,\"guard\":\"admin\",\"name\":\"Create\",\"route_name\":\"video.create\",\"created_at\":\"2020-06-09T07:21:32.000000Z\",\"updated_at\":\"2020-06-09T07:21:32.000000Z\"},{\"id\":5,\"dominion_id\":1,\"guard\":\"admin\",\"name\":\"Show\",\"route_name\":\"admin.show\",\"created_at\":\"2020-05-26T14:47:52.000000Z\",\"updated_at\":\"2020-05-26T14:47:52.000000Z\"}]', 2, '2020-05-27 06:25:33', '2020-06-11 20:41:20');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Model\\Admin', 2, 'my-token', '5587b4eeda4e290bd47855d08384d3f7d6c60a146091f47403be80590049f275', '[\"*\"]', '2020-05-20 07:45:55', '2020-05-20 06:07:09', '2020-05-20 07:45:55'),
(2, 'App\\Model\\Admin', 2, 'my-token', 'b7db727c9e92f5a8d55a4cb04b423fe7075902311d93ce2e77c61b165064a56f', '[\"*\"]', NULL, '2020-05-20 06:25:06', '2020-05-20 06:25:06'),
(3, 'App\\Model\\Admin', 2, 'my-token', 'c5eb047ec2f1547d49d9d0fb543276604927a27d2572a15d5148c064860be03d', '[\"*\"]', NULL, '2020-05-20 08:02:02', '2020-05-20 08:02:02'),
(4, 'App\\Model\\Admin', 2, 'my-token', '4b2f5957d7726c36ae4bc6e80d8e6bbf98b58f0e704a1c5535dcfcedcfcee300', '[\"*\"]', NULL, '2020-05-20 08:02:38', '2020-05-20 08:02:38'),
(5, 'App\\Model\\Admin', 2, 'my-token', '3f238f7245649ff221ee7cb83a7d871c0041525af1ee95fa5a28e4057132760f', '[\"*\"]', NULL, '2020-05-20 08:03:18', '2020-05-20 08:03:18'),
(6, 'App\\Model\\Admin', 2, 'my-token', 'efa7bbfa6fbdfef5ebce25dd2b538b87ae3ceb1471615fc8fe33c9b33a4ce6bd', '[\"*\"]', NULL, '2020-05-20 08:03:55', '2020-05-20 08:03:55'),
(7, 'App\\Model\\Admin', 2, 'my-token', '7a7b0ae7a8e5a6e8d67a74dd34c4b9f67d8b994c1809d78d9c084af8c8412ff0', '[\"*\"]', NULL, '2020-05-20 08:04:20', '2020-05-20 08:04:20'),
(8, 'App\\Model\\Admin', 2, 'my-token', '3f42c351c1101d4d3d4b32b7a7d24bd927e7ce6b657b670ee1f0bc17b84a08e6', '[\"*\"]', NULL, '2020-05-20 08:05:57', '2020-05-20 08:05:57'),
(9, 'App\\Model\\Admin', 2, 'my-token', '158765434031a2d4e2bd348ae543e8c0337f2d693252618a881c03a818b20dc5', '[\"*\"]', NULL, '2020-05-20 08:06:14', '2020-05-20 08:06:14'),
(10, 'App\\Model\\Admin', 2, 'my-token', '6ed900fa35837951e5e87bc0230a4a618c69ddfdb397990079f4ec74718c1519', '[\"*\"]', NULL, '2020-05-20 08:13:14', '2020-05-20 08:13:14');

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `album_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(46, 7, 'admin', 'Check Model', 'module.check', '2020-05-26 09:03:46', '2020-05-26 09:03:46'),
(75, 13, 'admin', 'Index', 'configuration.index', '2020-06-01 03:35:08', '2020-06-01 03:35:08'),
(76, 13, 'admin', 'Create', 'configuration.create', '2020-06-01 03:35:08', '2020-06-01 03:35:08'),
(77, 13, 'admin', 'Store', 'configuration.store', '2020-06-01 03:35:08', '2020-06-01 03:35:08'),
(78, 13, 'admin', 'Show', 'configuration.show', '2020-06-01 03:35:08', '2020-06-01 03:35:08'),
(79, 13, 'admin', 'Edit', 'configuration.edit', '2020-06-01 03:35:08', '2020-06-01 03:35:08'),
(80, 13, 'admin', 'Update', 'configuration.update', '2020-06-01 03:35:08', '2020-06-01 03:35:08'),
(81, 13, 'admin', 'Destroy', 'configuration.destroy', '2020-06-01 03:35:08', '2020-06-01 03:35:08'),
(89, 15, 'admin', 'Index', 'content.index', '2020-06-01 04:28:22', '2020-06-01 04:28:22'),
(90, 15, 'admin', 'Create', 'content.create', '2020-06-01 04:28:22', '2020-06-01 04:28:22'),
(91, 15, 'admin', 'Store', 'content.store', '2020-06-01 04:28:22', '2020-06-01 04:28:22'),
(92, 15, 'admin', 'Show', 'content.show', '2020-06-01 04:28:22', '2020-06-01 04:28:22'),
(93, 15, 'admin', 'Edit', 'content.edit', '2020-06-01 04:28:22', '2020-06-01 04:28:22'),
(94, 15, 'admin', 'Update', 'content.update', '2020-06-01 04:28:22', '2020-06-01 04:28:22'),
(95, 15, 'admin', 'Destroy', 'content.destroy', '2020-06-01 04:28:22', '2020-06-01 04:28:22'),
(97, 15, 'admin', 'File', 'content.file', '2020-06-01 22:33:20', '2020-06-01 22:33:20'),
(98, 15, 'admin', 'StoreFile', 'content.storeFile', '2020-06-03 02:04:08', '2020-06-03 02:04:08'),
(130, 24, 'admin', 'Index', 'slider.index', '2020-06-08 08:06:40', '2020-06-08 08:06:40'),
(131, 24, 'admin', 'Create', 'slider.create', '2020-06-08 08:06:40', '2020-06-08 08:06:40'),
(132, 24, 'admin', 'Store', 'slider.store', '2020-06-08 08:06:40', '2020-06-08 08:06:40'),
(133, 24, 'admin', 'Show', 'slider.show', '2020-06-08 08:06:40', '2020-06-08 08:06:40'),
(134, 24, 'admin', 'Edit', 'slider.edit', '2020-06-08 08:06:40', '2020-06-08 08:06:40'),
(135, 24, 'admin', 'Update', 'slider.update', '2020-06-08 08:06:40', '2020-06-08 08:06:40'),
(136, 24, 'admin', 'Destroy', 'slider.destroy', '2020-06-08 08:06:40', '2020-06-08 08:06:40'),
(144, 26, 'admin', 'Index', 'album.index', '2020-06-08 23:14:31', '2020-06-08 23:14:31'),
(145, 26, 'admin', 'Create', 'album.create', '2020-06-08 23:14:31', '2020-06-08 23:14:31'),
(146, 26, 'admin', 'Store', 'album.store', '2020-06-08 23:14:31', '2020-06-08 23:14:31'),
(147, 26, 'admin', 'Show', 'album.show', '2020-06-08 23:14:31', '2020-06-08 23:14:31'),
(148, 26, 'admin', 'Edit', 'album.edit', '2020-06-08 23:14:31', '2020-06-08 23:14:31'),
(149, 26, 'admin', 'Update', 'album.update', '2020-06-08 23:14:31', '2020-06-08 23:14:31'),
(150, 26, 'admin', 'Destroy', 'album.destroy', '2020-06-08 23:14:31', '2020-06-08 23:14:31'),
(151, 27, 'admin', 'Index', 'photo.index', '2020-06-08 23:39:31', '2020-06-08 23:39:31'),
(152, 27, 'admin', 'Create', 'photo.create', '2020-06-08 23:39:31', '2020-06-08 23:39:31'),
(153, 27, 'admin', 'Store', 'photo.store', '2020-06-08 23:39:31', '2020-06-08 23:39:31'),
(154, 27, 'admin', 'Show', 'photo.show', '2020-06-08 23:39:31', '2020-06-08 23:39:31'),
(155, 27, 'admin', 'Edit', 'photo.edit', '2020-06-08 23:39:31', '2020-06-08 23:39:31'),
(156, 27, 'admin', 'Update', 'photo.update', '2020-06-08 23:39:31', '2020-06-08 23:39:31'),
(157, 27, 'admin', 'Destroy', 'photo.destroy', '2020-06-08 23:39:31', '2020-06-08 23:39:31'),
(158, 28, 'admin', 'Index', 'video.index', '2020-06-09 01:21:32', '2020-06-09 01:21:32'),
(159, 28, 'admin', 'Create', 'video.create', '2020-06-09 01:21:32', '2020-06-09 01:21:32'),
(160, 28, 'admin', 'Store', 'video.store', '2020-06-09 01:21:32', '2020-06-09 01:21:32'),
(161, 28, 'admin', 'Show', 'video.show', '2020-06-09 01:21:32', '2020-06-09 01:21:32'),
(162, 28, 'admin', 'Edit', 'video.edit', '2020-06-09 01:21:32', '2020-06-09 01:21:32'),
(163, 28, 'admin', 'Update', 'video.update', '2020-06-09 01:21:32', '2020-06-09 01:21:32'),
(164, 28, 'admin', 'Destroy', 'video.destroy', '2020-06-09 01:21:32', '2020-06-09 01:21:32'),
(165, 15, 'admin', 'Content', 'content.content', '2020-06-09 22:20:21', '2020-06-09 22:20:21'),
(166, 27, 'admin', 'Gallery_image', 'photo.gallery_image', '2020-06-09 22:20:51', '2020-06-09 22:20:51'),
(167, 29, 'admin', 'Index', 'menu.index', '2020-06-10 06:09:01', '2020-06-10 06:09:01'),
(168, 29, 'admin', 'Create', 'menu.create', '2020-06-10 06:09:01', '2020-06-10 06:09:01'),
(169, 29, 'admin', 'Store', 'menu.store', '2020-06-10 06:09:01', '2020-06-10 06:09:01'),
(170, 29, 'admin', 'Show', 'menu.show', '2020-06-10 06:09:01', '2020-06-10 06:09:01'),
(171, 29, 'admin', 'Edit', 'menu.edit', '2020-06-10 06:09:01', '2020-06-10 06:09:01'),
(172, 29, 'admin', 'Update', 'menu.update', '2020-06-10 06:09:01', '2020-06-10 06:09:01'),
(173, 29, 'admin', 'Destroy', 'menu.destroy', '2020-06-10 06:09:01', '2020-06-10 06:09:01'),
(175, 30, 'admin', 'Index', 'activityLog.index', '2020-06-11 00:35:14', '2020-06-11 00:35:14'),
(176, 30, 'admin', 'Show', 'activityLog.show', '2020-06-11 00:35:14', '2020-06-11 00:35:14'),
(177, 30, 'admin', 'Destroy', 'activityLog.destroy', '2020-06-11 00:35:14', '2020-06-11 00:35:14'),
(185, 30, 'admin', 'AllRead', 'activityLog.allRead', '2020-06-12 22:25:00', '2020-06-12 22:25:00');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'admin', '2020-05-26 08:21:18', '2020-05-26 08:21:18'),
(2, 'Admin', 'admin', '2020-05-27 00:04:51', '2020-06-11 02:25:08'),
(4, 'Modarator', 'admin', '2020-06-11 03:13:11', '2020-06-14 06:25:09');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `created_at`, `updated_at`) VALUES
(2, 'Lets Try Again Update', '2020-05-27 09:01:40', '2020-05-27 09:01:54'),
(3, 'New one', '2020-05-27 09:02:07', '2020-05-27 09:02:07');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` tinyint(4) NOT NULL DEFAULT 0,
  `status` enum('a','d') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'a',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `title`, `slider`, `description`, `url`, `sorting`, `status`, `created_at`, `updated_at`) VALUES
(2, 'BASIS Photos of 2019', 'upload/slider/wv0eDBXl9ZYnRxSIBPUHU8YoSGcFZlTZoQ4B6Qmp.jpeg', NULL, NULL, 1, 'a', '2020-06-11 23:41:31', '2020-06-11 23:41:31');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Nia Zulauf', 'marianna20@example.org', '2020-06-10 22:51:40', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '24l2g8VBDi', '2020-06-10 22:51:40', '2020-06-10 22:51:40'),
(2, 'Neha Rau III', 'hlind@example.com', '2020-06-10 22:51:40', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'JZA2qX9rWz', '2020-06-10 22:51:41', '2020-06-10 22:51:41');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `album_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `album_id`, `title`, `url`, `sorting`, `created_at`, `updated_at`) VALUES
(1, 4, 'BASIS Photos of 2019', 'http://aspiring-gaming.pro/', 1, '2020-06-09 01:42:08', '2020-06-09 01:44:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `authorizedmenus`
--
ALTER TABLE `authorizedmenus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `configurations`
--
ALTER TABLE `configurations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `content_files`
--
ALTER TABLE `content_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `content_files_content_id_foreign` (`content_id`);

--
-- Indexes for table `dominions`
--
ALTER TABLE `dominions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `my_routes`
--
ALTER TABLE `my_routes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `photos_album_id_foreign` (`album_id`);

--
-- Indexes for table `processes`
--
ALTER TABLE `processes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `videos_album_id_foreign` (`album_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `albums`
--
ALTER TABLE `albums`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `authorizedmenus`
--
ALTER TABLE `authorizedmenus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `configurations`
--
ALTER TABLE `configurations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `content_files`
--
ALTER TABLE `content_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dominions`
--
ALTER TABLE `dominions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `my_routes`
--
ALTER TABLE `my_routes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `processes`
--
ALTER TABLE `processes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `content_files`
--
ALTER TABLE `content_files`
  ADD CONSTRAINT `content_files_content_id_foreign` FOREIGN KEY (`content_id`) REFERENCES `contents` (`id`);

--
-- Constraints for table `photos`
--
ALTER TABLE `photos`
  ADD CONSTRAINT `photos_album_id_foreign` FOREIGN KEY (`album_id`) REFERENCES `albums` (`id`);

--
-- Constraints for table `videos`
--
ALTER TABLE `videos`
  ADD CONSTRAINT `videos_album_id_foreign` FOREIGN KEY (`album_id`) REFERENCES `albums` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
