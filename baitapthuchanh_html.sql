-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 08, 2018 at 03:18 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `baitapthuchanh_html`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(15) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_by` int(15) NOT NULL,
  `created_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_by`, `created_time`) VALUES
(1, 'Drinks', 4, '0000-00-00 00:00:00'),
(2, 'Food', 2, '0000-00-00 00:00:00'),
(3, 'Desert', 2, '2018-10-30 15:33:09'),
(11, 'Noodles', 3, '2018-11-01 14:00:37'),
(12, 'Teokbokki', 3, '2018-11-01 14:00:46'),
(13, 'Gimbab', 3, '2018-11-01 14:01:05'),
(14, 'Pie', 3, '2018-11-06 09:55:02'),
(15, 'Jelly', 4, '2018-11-08 08:20:08');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(15) NOT NULL,
  `cate_id` int(15) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `content` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `cate_id`, `name`, `description`, `content`, `created_by`, `created_time`) VALUES
(2, 2, 'Ga ran', 'Cach lam ga chien', 'Ga tam bot ran chien gion', 4, '2018-11-01 14:23:08'),
(4, 1, 'nuoc cam', 'uong nuoc cam', 'cam ep', 4, '2018-11-01 14:26:35'),
(5, 3, 'banh bong lan trung muoi', 'cach lam banh bong lan trung muoi', 'bot my, trung muoi, sua', 4, '2018-11-01 15:28:53'),
(6, 13, 'gimbab chien', 'dia chi ban gimbab chien', 'Giang Vo, Ngoc Khanh ...', 4, '2018-11-01 15:30:23'),
(8, 11, 'dfj', 'dfhrtu', 'dfjtru', 4, '2018-11-01 15:55:37'),
(9, 3, 'sss', 'sss', 'ss', 4, '2018-11-01 15:59:11'),
(10, 3, 'name2', '2222', '222', 4, '2018-11-01 15:59:55'),
(11, 3, '222', 'Æ°', 'Ãª', 4, '2018-11-01 16:00:49');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(15) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `created_time`) VALUES
(1, 'anna', 'a70f9e38ff015afaa9ab0aacabee2e13', '0000-00-00 00:00:00'),
(2, 'van', '999999', '0000-00-00 00:00:00'),
(3, 'Nguyenfff', '222222', '0000-00-00 00:00:00'),
(4, 'ThanhVan', '654321', '0000-00-00 00:00:00'),
(9, 'Vanvanvan', 'zxcvbn', '0000-00-00 00:00:00'),
(12, 'ntv', '123456', '2018-11-06 11:00:00'),
(13, 'admin', 'admin00', '2018-11-06 11:08:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`,`name`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `cate_id` (`cate_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`,`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`cate_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
