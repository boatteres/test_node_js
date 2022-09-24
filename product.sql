-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 24, 2022 at 12:46 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `product`
--

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `ID` int(11) NOT NULL,
  `name_cus` varchar(45) NOT NULL,
  `address` varchar(255) NOT NULL,
  `member_id` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`ID`, `name_cus`, `address`, `member_id`) VALUES
(1, 'java', '171 bangkok', '1001'),
(2, 'now', '182 thailand', '1002');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `ID` int(11) NOT NULL,
  `member_id` varchar(45) NOT NULL,
  `doc_no` varchar(45) NOT NULL,
  `date_sale` date NOT NULL,
  `sale_status` varchar(255) NOT NULL,
  `is_cancle` int(11) NOT NULL,
  `address` varchar(45) NOT NULL,
  `product_code` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`ID`, `member_id`, `doc_no`, `date_sale`, `sale_status`, `is_cancle`, `address`, `product_code`) VALUES
(1, '1001', 'A0001', '0000-00-00', 'paid', 0, '171 bangkok', '1001'),
(2, '1002', 'A0002', '0000-00-00', 'paid', 0, '182 thailand', '1002'),
(3, '1001', 'A0003', '0000-00-00', 'placed_order', 0, '171 bangkok', '1002'),
(4, '1001', 'A0004', '0000-00-00', 'out of shipping', 0, '171 bangkok', '1012'),
(5, '1001', 'A0005', '0000-00-00', 'placed_order', 0, '171 bangkok', '1013'),
(6, '1002', 'A0006', '0000-00-00', 'complete', 0, '182 thailand', '1005');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `ID` int(11) NOT NULL,
  `member_id` varchar(45) NOT NULL,
  `name_cus` varchar(45) DEFAULT NULL,
  `doc_no` varchar(45) NOT NULL,
  `product_code` varchar(45) NOT NULL,
  `size` varchar(45) NOT NULL,
  `price` int(11) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`ID`, `member_id`, `name_cus`, `doc_no`, `product_code`, `size`, `price`, `address`) VALUES
(1, '1001', 'java', 'A0001', '1001', 'XS', 400, '171 bangkok'),
(26, '1002', 'now', 'A0002', '1002', 'XS', 290, '182 thailand'),
(27, '1001', 'java', 'A0003', '1002', 'XS', 400, '171 bangkok'),
(28, '1001', 'java', 'A0004', '1012', 'XL', 430, '171 bangkok'),
(29, '1001', 'java', 'A0005', '1013', 'L', 430, '171 bangkok'),
(30, '1002', 'now', 'A0006', '1005', 'M', 290, '182 thailand');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ID` int(11) NOT NULL,
  `product_code` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `style_id` int(11) NOT NULL,
  `size` varchar(45) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ID`, `product_code`, `name`, `gender`, `style_id`, `size`, `price`) VALUES
(1, '1001', 't-shirt', 'men', 1, 'M', 420),
(2, '1002', 't-shirt', 'men', 1, 'S', 400),
(3, '1003', 't-shirt', 'men', 1, 'L', 430),
(4, '1004', 't-shirt', 'men', 1, 'XS', 400),
(5, '1005', 't-shirt', 'men', 2, 'XL', 430),
(6, '1006', 't-shirt', 'women', 2, 'XS', 290),
(7, '1007', 't-shirt', 'women', 2, 'S', 290),
(8, '1008', 't-shirt', 'women', 2, 'M', 290),
(9, '1009', 't-shirt', 'women', 3, 'L', 320),
(10, '1010', 't-shirt', 'women', 3, 'XL', 320),
(11, '1011', 't-shirt', 'women', 3, 'XS', 290),
(12, '1012', 't-shirt', 'women', 3, 'S', 290),
(13, '1013', 't-shirt', 'women', 3, 'M', 290),
(14, '1014', 't-shirt', 'women', 3, 'L', 320),
(15, '1015', 't-shirt', 'women', 3, 'XL', 320);

-- --------------------------------------------------------

--
-- Table structure for table `style`
--

CREATE TABLE `style` (
  `ID` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `style`
--

INSERT INTO `style` (`ID`, `type_id`, `name`) VALUES
(1, 1, 'red'),
(2, 1, 'black'),
(3, 1, 'green');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `ID` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`ID`, `name`) VALUES
(1, 'Plain color'),
(2, 'Patterns'),
(3, 'Figures');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `style`
--
ALTER TABLE `style`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `style`
--
ALTER TABLE `style`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
