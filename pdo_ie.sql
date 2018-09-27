-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 25, 2018 at 01:25 PM
-- Server version: 5.7.23-0ubuntu0.18.04.1
-- PHP Version: 7.1.20-1+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pdo_ie`
--

-- --------------------------------------------------------

--
-- Table structure for table `attended`
--

CREATE TABLE `attended` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attended`
--

INSERT INTO `attended` (`id`, `user_id`, `event_id`) VALUES
(1, 73, 16),
(2, 73, 18),
(5, 76, 16),
(4, 76, 29),
(6, 84, 18),
(7, 85, 18),
(8, 86, 29),
(9, 87, 30),
(15, 93, 30),
(16, 94, 30),
(17, 95, 30),
(18, 96, 30),
(19, 97, 30),
(47, 98, 16),
(20, 98, 30),
(21, 99, 30),
(22, 100, 30),
(23, 101, 30),
(24, 102, 18),
(25, 103, 18),
(26, 104, 18),
(27, 105, 18),
(35, 106, 16),
(28, 106, 18),
(30, 108, 18),
(31, 109, 18),
(32, 110, 18),
(33, 111, 16),
(34, 112, 16),
(36, 113, 16),
(38, 114, 16),
(39, 115, 16),
(40, 116, 16),
(41, 117, 16),
(42, 118, 16),
(43, 119, 16),
(44, 120, 16),
(45, 121, 16),
(46, 122, 16),
(48, 123, 16),
(50, 124, 16),
(51, 125, 16),
(52, 126, 16),
(53, 127, 16),
(54, 128, 16),
(55, 129, 16),
(56, 130, 16),
(57, 131, 16),
(58, 132, 16),
(59, 133, 16),
(60, 134, 16),
(61, 135, 16),
(62, 136, 16);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `event_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `event_name`) VALUES
(16, 'First'),
(30, 'Fourth'),
(18, 'Second'),
(29, 'Third');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`) VALUES
(73, 'Akshay', 'Akshayrathod9@gmail.com'),
(74, 'Walter', 'Walterwhite@gmail.com'),
(75, 'Elliot', 'Elliotalderson@gmail.com'),
(76, 'Sherlock', 'sherlock@gmail.com'),
(78, 'John Waston', 'johnwatson@gmail.com'),
(79, 'Saul Goodman', 'bettercallsaul@gmail.com'),
(80, 'Kim Wexler', 'Kimwexler@gmail.com'),
(84, 'Nacho Varga', 'nachovarga@gmail.com'),
(85, 'Tuco Salamanca', 'Tuco@gmail.com'),
(86, 'Hector Salamanca', 'donhector@gmail.com'),
(87, 'Gustavo Frings', 'lospolos@gmail.com'),
(93, 'Carmen', 'german@wallstreetreporter.com'),
(94, 'Peter', 'jproche@bechtel.com'),
(95, 'David', 'Doctorhog@aol.com'),
(96, 'Lawrence', 'sam104@juno.com'),
(97, 'Robert', 'robert.doyel@thomson.com'),
(98, 'joseph', 'joseph.caire@us.army.mil'),
(99, 'Gary', 'gary@gzt.com.au'),
(100, 'Everett', 'ecurry@gmail.com'),
(101, 'Robert', 'rfo@bismarckgroup.com'),
(102, 'Paul', 'pmglaser1@vzavenue.net'),
(103, 'Nghia', 'Ladiese@aol.com'),
(104, 'Hanlie', 'booysenh@foreign.gov.za'),
(105, 'Lavy', 'abramovl@ix.netcom.com'),
(106, 'Thomas', 'urufudo@msn.com'),
(108, 'Dyke', 'dmessinger@powercurbers.com'),
(109, 'joe', 'jhines161042MI@comcast.net'),
(110, 'Barry', 'bazlou@wanadoo.es'),
(111, 'Sidney', 'sfattedad@wcb.bc.ca'),
(112, 'JC', 'jcahagen@telusplanet.net'),
(113, 'Thomas', 'tj@seaple.icc.ne.jp'),
(114, 'Johnm', 'vistasjy@adelphia.net'),
(115, 'Jim', 'kendal_ja@yahoo.com'),
(116, 'Martin', 'm.e.corell@att.net'),
(117, 'Bill', 'emmowfe@yahoo.com'),
(118, 'Tanja', 'Tanja.Curtis@302.peterson.af.mil'),
(119, 'Stephen', 'stephen.h.hunt@intel.com'),
(120, 'Byron', 'tigr10@optonline.net'),
(121, 'Joyce', 'jryder100@yahoo.com'),
(122, 'Heeb Yung', 'heebyung@maqimm.co.kr'),
(123, 'Joseph', 'joseph.hoon@bankofamerica.com'),
(124, 'Michael', 'mcloughlin@ameritel.net'),
(125, 'Tilia', 'tilia.joshua@us.army.mil'),
(126, 'Denise', 'seasonsfarms@infoave.net'),
(127, 'Winthrop', 'warobins@gmail.com'),
(128, 'Allen', 'allenjsimpson@prodigy.net'),
(129, 'Liz', 'elizfischer@yahoo.com'),
(130, 'Thomas', ''),
(131, 'Carla', 'carla.zimmer@usdoj.gov'),
(132, 'Marti', 'mcbride@npra.org'),
(133, 'Mark', 'baur@hp.com'),
(134, 'Don', 'dongalliers@aol.com'),
(135, 'Ron', 'schafer@aol.com'),
(136, 'Akshay ', 'akshay@tuscantouche.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attended`
--
ALTER TABLE `attended`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `constr_ID` (`user_id`,`event_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `event_name` (`event_name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attended`
--
ALTER TABLE `attended`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
