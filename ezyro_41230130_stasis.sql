-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql301.ezyro.com
-- Generation Time: Mar 09, 2026 at 04:03 PM
-- Server version: 11.4.10-MariaDB
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ezyro_41230130_stasis`
--

-- --------------------------------------------------------

--
-- Table structure for table `catalog`
--

CREATE TABLE `catalog` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` int(11) DEFAULT 0,
  `type` enum('hat','face','shirt','pants','gear','package') NOT NULL,
  `image_url` text DEFAULT NULL,
  `obj_url` text DEFAULT NULL,
  `texture_url` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_items`
--

CREATE TABLE `catalog_items` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` int(11) DEFAULT 0,
  `type` varchar(50) DEFAULT 'hat',
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `creator_id` int(11) DEFAULT 1,
  `creator_name` varchar(100) DEFAULT 'Stasis',
  `sales` int(11) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `catalog_items`
--

INSERT INTO `catalog_items` (`id`, `name`, `description`, `price`, `type`, `image_url`, `created_at`, `creator_id`, `creator_name`, `sales`) VALUES
(2, '123\'s Chicken Suit', 'We told 123 to wear a suit to the board meeting, and this is what he came in with.', 11, 'hat', '', '2026-03-08 21:01:18', 1, '123', 0);

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

CREATE TABLE `games` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `creator_id` int(11) DEFAULT 1,
  `creator_name` varchar(100) DEFAULT 'Stasis',
  `thumbnail_url` varchar(255) DEFAULT NULL,
  `plays` int(11) DEFAULT 0,
  `favorites` int(11) DEFAULT 0,
  `rating` decimal(2,1) DEFAULT 0.0,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`id`, `name`, `description`, `creator_id`, `creator_name`, `thumbnail_url`, `plays`, `favorites`, `rating`, `created_at`) VALUES
(1, 'test', 'yeah', 1, '123', 'https://www.zakrev.com/images/thumbnails/1c59f46f5c34fc29f60dfb4a2d94fe2ea7ae3132bb732d7c8cd994473ef9c879.png', 0, 0, '0.0', '2026-03-09 04:59:43');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `purchased_at` timestamp NULL DEFAULT current_timestamp(),
  `equipped` tinyint(1) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`user_id`, `item_id`, `purchased_at`, `equipped`) VALUES
(1, 1, '2026-03-08 22:48:14', 0),
(1, 2, '2026-03-08 22:48:52', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `robux` int(11) DEFAULT 0,
  `join_date` timestamp NULL DEFAULT current_timestamp(),
  `last_login` timestamp NULL DEFAULT NULL,
  `avatar_url` text DEFAULT NULL,
  `currency` int(11) DEFAULT 100
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `robux`, `join_date`, `last_login`, `avatar_url`, `currency`) VALUES
(1, '123', '$2y$10$pzoXg6t0hsJoCClGSp5nIutTVW8CXbhZU4rTVStWISAVV3qcNwrNO', '223@gmail.com', 0, '2026-03-08 19:25:57', NULL, NULL, 335),
(2, 'roblox', '$2y$10$GXXvtFTSoHkNIsuFBXCmPuc1T0cGGODe0T0hDVqnTP/MLc/oHmIQO', 'w32@gmail.com', 0, '2026-03-09 19:54:49', NULL, NULL, 100);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `catalog`
--
ALTER TABLE `catalog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `catalog_items`
--
ALTER TABLE `catalog_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`user_id`,`item_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `catalog`
--
ALTER TABLE `catalog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `catalog_items`
--
ALTER TABLE `catalog_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `games`
--
ALTER TABLE `games`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
