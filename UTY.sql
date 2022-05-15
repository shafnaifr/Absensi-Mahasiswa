-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 16, 2022 at 02:22 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `UTY`
--

-- --------------------------------------------------------

--
-- Table structure for table `abs5210411399`
--

CREATE TABLE `abs5210411399` (
  `id` int(11) NOT NULL,
  `matkul` char(50) NOT NULL,
  `p1` varchar(20) DEFAULT NULL,
  `p2` varchar(20) DEFAULT NULL,
  `p3` varchar(20) DEFAULT NULL,
  `p4` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `abs5210411399`
--

INSERT INTO `abs5210411399` (`id`, `matkul`, `p1`, `p2`, `p3`, `p4`) VALUES
(1, 'Algoritma Pemrograman', 'Hadir', 'Hadir', 'Hadir', '');

-- --------------------------------------------------------

--
-- Table structure for table `matkultoken`
--

CREATE TABLE `matkultoken` (
  `id` int(11) NOT NULL,
  `matkul` varchar(50) NOT NULL,
  `pertemuan` int(2) NOT NULL,
  `token` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `matkultoken`
--

INSERT INTO `matkultoken` (`id`, `matkul`, `pertemuan`, `token`) VALUES
(1, 'Algoritma Pemrograman', 1, '1FVESU1TYA'),
(2, 'Algoritma Pemrograman', 2, 'J4AXL6JQTZ'),
(3, 'Algoritma Pemrograman', 3, 'XDHPUS65U7'),
(4, 'Algoritma Pemrograman', 4, 'XDHPUS69KS');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(16) NOT NULL,
  `nama` char(50) NOT NULL,
  `nomorpokok` varchar(10) NOT NULL,
  `jabatan` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `nama`, `nomorpokok`, `jabatan`) VALUES
(1, 'dosen1', 'dosen1', 'Joma', '5210411100', 'dosen'),
(2, '5210411399', 'siswa1', 'Bill', '5210411399', 'mahasiswa'),
(3, '5210411400', 'siswa2', 'Gates', '5210411400', 'mahasiswa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abs5210411399`
--
ALTER TABLE `abs5210411399`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matkultoken`
--
ALTER TABLE `matkultoken`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abs5210411399`
--
ALTER TABLE `abs5210411399`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `matkultoken`
--
ALTER TABLE `matkultoken`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
