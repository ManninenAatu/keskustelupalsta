-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 24, 2022 at 11:11 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `keskustelupalsta`
--

-- --------------------------------------------------------

--
-- Table structure for table `keskustelut`
--

CREATE TABLE `keskustelut` (
  `id` int(11) NOT NULL,
  `otsikko` text COLLATE utf8_swedish_ci NOT NULL,
  `sisalto` text COLLATE utf8_swedish_ci NOT NULL,
  `kirjoittaja` text COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `keskustelut`
--

INSERT INTO `keskustelut` (`id`, `otsikko`, `sisalto`, `kirjoittaja`) VALUES
(1, 'tuleepa lunta', '', 'Anonyymi'),
(2, 'tuleepa lunta paljon', 'Lunta tullut talvena 80cm', 'aatu')


-- --------------------------------------------------------

--
-- Table structure for table `viestit`
--

CREATE TABLE `viestit` (
  `id` int(11) NOT NULL,
  `sisalto` text COLLATE utf8_swedish_ci NOT NULL,
  `kirjoittaja` text COLLATE utf8_swedish_ci NOT NULL,
  `keskustelutId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `viestit`
--

INSERT INTO `viestit` (`id`, `sisalto`, `kirjoittaja`, `keskustelutId`) VALUES
(1, 'jep', 'marko', 1),
(5, 'näin on', 'matti', 2),
(6, 'jep sanoppa muuta', 'minna', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `keskustelut`
--
ALTER TABLE `keskustelut`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `viestit`
--
ALTER TABLE `viestit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `keskustelutId` (`keskustelutId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `keskustelut`
--
ALTER TABLE `keskustelut`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `viestit`
--
ALTER TABLE `viestit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
