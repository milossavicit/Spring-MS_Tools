-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2019 at 06:03 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `it495`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryId` int(11) NOT NULL,
  `name` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryId`, `name`) VALUES
(1, 'Burgija'),
(2, 'Glodalo'),
(3, 'Nareznica'),
(4, 'Listovi za pilu'),
(5, 'Nosac');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customerId` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(256) NOT NULL,
  `companyname` varchar(256) DEFAULT NULL,
  `address` varchar(256) NOT NULL,
  `city` varchar(256) NOT NULL,
  `jmbg_pib` varchar(256) NOT NULL,
  `number` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customerId`, `firstname`, `lastname`, `email`, `companyname`, `address`, `city`, `jmbg_pib`, `number`) VALUES
(1, 'Milos', 'Savic', 'milos@gmail.com', '', 'Krusevacka 22', 'Beograd', '11234576933', '0634756289'),
(2, 'Jovana', 'Jovic', 'jovana@gmail.com', 'Jovana doo', 'Krusevacka 23', 'Bijeljina', '24161738393947367', '0643536720'),
(6, 'Igor', 'Simic', 'igor@gmail.com', '', 'Nemanjina 2', 'Beograd', '44781165899', '0645971359');

-- --------------------------------------------------------

--
-- Table structure for table `machine`
--

CREATE TABLE `machine` (
  `machineId` int(11) NOT NULL,
  `name` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `machine`
--

INSERT INTO `machine` (`machineId`, `name`) VALUES
(1, 'M1'),
(2, 'M2'),
(3, 'M3'),
(4, 'M4');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderId` int(11) NOT NULL,
  `customerId` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `orderdate` varchar(256) NOT NULL,
  `quantity` varchar(50) NOT NULL,
  `price` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderId`, `customerId`, `productId`, `orderdate`, `quantity`, `price`) VALUES
(5, 2, 3, '08-11-2019 16:11 PM', '19', '12'),
(6, 1, 5, '08-11-2019 18:59 PM', '22', '4'),
(7, 1, 16, '08-11-2019 20:21 PM', '82', '11'),
(8, 2, 3, '08-11-2019 20:58 PM', '20', '33'),
(9, 2, 25, '08-11-2019 20:58 PM', '40', '2'),
(10, 2, 6, '08-11-2019 21:26 PM', '49', '89'),
(11, 2, 21, '08-11-2019 21:28 PM', '49', '67'),
(12, 1, 9, '08-11-2019 21:44 PM', '2', '90'),
(13, 1, 8, '08-11-2019 23:34 PM', '5', '400'),
(14, 1, 4, '08-11-2019 23:43 PM', '2', '4'),
(15, 1, 7, '09-11-2019 12:23 PM', '4', '100'),
(16, 2, 12, '09-11-2019 12:29 PM', '1', '27'),
(17, 1, 3, '09-11-2019 12:31 PM', '1', '11'),
(20, 1, 11, '11-11-2019 16:46 PM', '3', '141'),
(21, 2, 13, '14-11-2019 21:39 PM', '2', '36'),
(22, 1, 11, '16-11-2019 21:01 PM', '2', '94'),
(23, 2, 21, '17-11-2019 14:25 PM', '2', '36'),
(24, 2, 9, '08-12-2019 12:07 PM', '1', '45'),
(25, 6, 3, '08-12-2019 12:11 PM', '1', '11');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productId` int(11) NOT NULL,
  `productname` varchar(256) NOT NULL,
  `price` varchar(50) NOT NULL,
  `quantity` varchar(50) NOT NULL,
  `categoryId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productId`, `productname`, `price`, `quantity`, `categoryId`) VALUES
(1, 'Centrirajuca burgija', '4', '21', 1),
(2, 'Duga centrirajuca burgija', '10', '25', 1),
(3, 'Mikro burgija', '11', '3', 1),
(4, 'Burgija za lim sa cilindricnom drskom', '2', '30', 1),
(5, 'Spiralna burgija sa cilindricnom drskom', '2', '30', 1),
(6, 'Vretenasto glodalo od tvrdog metala', '40', '50', 2),
(7, 'Glodalo od tvrdog metala za grubu obradu', '25', '35', 2),
(8, 'Precizno vretenasto glodalo od tvrdog metala', '80', '40', 2),
(9, 'Polugrubo glodalo HPC', '45', '9', 2),
(10, 'Torusno glodalo od tvrdog metala', '38', '18', 2),
(11, 'Nareznica M1', '47', '25', 3),
(12, 'Nareznica M2', '27', '40', 3),
(13, 'Nareznica M3', '18', '32', 3),
(14, 'Nareznica M4', '18', '23', 3),
(15, 'Nareznica za celike visoke cvrstoce M4', '35', '20', 3),
(16, 'DCLN 95 nosac za izmenjive rezne plocice', '82', '23', 5),
(17, 'MCLN 95 nosac za izmenjive rezne plocice', '72', '41', 5),
(18, 'PCLN 95 nosac za izmenjive rezne plocice', '65', '34', 5),
(19, 'PCBN 75 nosac za izmenjive rezne plocice', '77', '47', 5),
(20, 'PCKN 75 nosac za izmenjive rezne plocice', '77', '41', 5),
(21, 'Metalni listovi za kruznu pilu 20x0,2', '18', '48', 4),
(22, 'Metalni listovi za kruznu pil 20x1,2', '18', '23', 4),
(23, 'Metalni listovi za kruznu pil 20x3', '29', '30', 4),
(24, 'Metalni listovi za kruznu pil 25x1', '17', '12', 4),
(25, 'Listovi kruzne pile od tvrdog metala 20x1', '27', '40', 4),
(26, 'Listovi kruzne pile od tvrdog metala 30x0,5', '21', '41', 4);

-- --------------------------------------------------------

--
-- Table structure for table `production`
--

CREATE TABLE `production` (
  `productionId` int(11) NOT NULL,
  `user` varchar(256) NOT NULL,
  `productId` int(11) NOT NULL,
  `machineId` int(11) NOT NULL,
  `prodStatus` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `production`
--

INSERT INTO `production` (`productionId`, `user`, `productId`, `machineId`, `prodStatus`) VALUES
(1, 'milos', 12, 1, 'Zavrseno'),
(2, 'korisnik', 1, 2, 'Zavrseno'),
(5, 'milos', 4, 3, 'Zavrseno'),
(6, 'milos', 5, 2, 'Zavrseno'),
(16, 'milos', 20, 2, 'Zavrseno'),
(17, 'korisnik', 6, 2, 'Zavrseno'),
(18, 'korisnik', 23, 2, 'Izrada'),
(19, 'milos', 3, 2, 'Zavrseno'),
(20, 'milos', 3, 2, 'Zavrseno'),
(23, 'milos', 3, 2, 'Zavrseno'),
(25, 'milos', 1, 4, 'Zavrseno'),
(26, 'milos', 12, 3, 'Zavrseno'),
(27, 'milos', 14, 2, 'Zavrseno'),
(28, 'milos', 7, 2, 'Izrada'),
(29, 'milos', 3, 3, 'Zavrseno'),
(30, 'milos', 16, 2, 'Priprema'),
(31, 'milos', 23, 2, 'Izrada'),
(32, 'test', 3, 2, 'Zavrseno');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(256) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(256) NOT NULL,
  `profilePic` varchar(256) NOT NULL DEFAULT 'images/user.png',
  `enabled` int(11) NOT NULL DEFAULT 1,
  `role` varchar(20) NOT NULL DEFAULT 'ROLE_USER'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `firstname`, `lastname`, `email`, `profilePic`, `enabled`, `role`) VALUES
(1, 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'Milos', 'Savic', 'admin@gmail.com', 'images/me.png', 1, 'ROLE_ADMIN'),
(2, 'milos', '794b9fecf082d4273ca54046f7b8377bf523240b88566bddbcfbf52194195123', 'Milos', 'Savic', 'milos@gmail.com', 'images/me.png', 1, 'ROLE_USER'),
(3, 'korisnik', '25862b1b6ca0ee21d472a8529a6ab06e1afa5b40a73bf3cedea4a4afdcd63ad7', 'korisnik', 'korisnik', 'korisnik@gmail.com', 'images/user.png', 1, 'ROLE_USER'),
(4, 'test', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', 'Test', 'Test', 'test@gmail.com', 'images/user.png', 1, 'ROLE_USER');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryId`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerId`);

--
-- Indexes for table `machine`
--
ALTER TABLE `machine`
  ADD PRIMARY KEY (`machineId`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderId`),
  ADD KEY `customerkey` (`customerId`),
  ADD KEY `productkey` (`productId`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productId`),
  ADD KEY `categorykey` (`categoryId`);

--
-- Indexes for table `production`
--
ALTER TABLE `production`
  ADD PRIMARY KEY (`productionId`),
  ADD KEY `userkey` (`user`),
  ADD KEY `machinekey` (`machineId`),
  ADD KEY `pproductkey` (`productId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `UK_r43af9ap4edm43mmtq01oddj6` (`username`),
  ADD KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `machine`
--
ALTER TABLE `machine`
  MODIFY `machineId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `productId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `production`
--
ALTER TABLE `production`
  MODIFY `productionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `customerkey` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`) ON DELETE CASCADE,
  ADD CONSTRAINT `productkey` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `categorykey` FOREIGN KEY (`categoryId`) REFERENCES `category` (`categoryId`);

--
-- Constraints for table `production`
--
ALTER TABLE `production`
  ADD CONSTRAINT `machinekey` FOREIGN KEY (`machineId`) REFERENCES `machine` (`machineId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pproductkey` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `userkey` FOREIGN KEY (`user`) REFERENCES `users` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
