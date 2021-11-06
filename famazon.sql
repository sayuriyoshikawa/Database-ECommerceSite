-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 06, 2021 at 05:54 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `famazon`
--
CREATE DATABASE IF NOT EXISTS `famazon` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `famazon`;

-- --------------------------------------------------------

--
-- Table structure for table `adress`
--

CREATE TABLE `adress` (
  `adressID` int(11) NOT NULL,
  `street` varchar(50) DEFAULT NULL,
  `zipcode` int(11) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `fk_countryID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `adress`
--

INSERT INTO `adress` (`adressID`, `street`, `zipcode`, `city`, `fk_countryID`) VALUES
(1, 'spengergasse', 1050, 'vienna', 1),
(2, 'Mirabellplatz', 5020, 'Salzburg', 1),
(3, 'landsbergerstreet', 80339, 'Munich', 2),
(4, 'badenenersreasse', 8003, 'zurich', 3),
(5, 'vianovara', 198, 'Roma', 4),
(6, 'aaaagasse', 1010, 'vienna', 1),
(7, 'bbbbgasse', 11189, 'Zurich', 3),
(8, 'ccccgasse', 11123, 'Hamburg', 2),
(9, 'ddddgasse', 4090, 'Linz', 1),
(10, 'abas', 80333, 'Roma', 4),
(11, 'merloni', 100, 'Roma', 4),
(12, 'eeeegasse', 10117, 'Berlin', 2);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryID` int(11) NOT NULL,
  `nategory_name` varchar(50) DEFAULT NULL,
  `category_description` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryID`, `nategory_name`, `category_description`) VALUES
(1, 'book', 'Famazon has 3 million books and there are many genre.'),
(2, 'fashion', 'You can enjoy online shopping in fashionable wearing.'),
(3, 'electronics', 'We deliver all electronics for free shipping cost.'),
(4, 'home', 'There are stylish, antique, and useful furniture.');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `companyID` int(11) NOT NULL,
  `company_name` varchar(50) DEFAULT NULL,
  `company_email` varchar(50) DEFAULT NULL,
  `fk_adressID` int(11) DEFAULT NULL,
  `fk_shipmentID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`companyID`, `company_name`, `company_email`, `fk_adressID`, `fk_shipmentID`) VALUES
(1, 'HosecenterA', 'home@gmail.com', 5, 4),
(2, 'HosecenterA', 'home@gmail.com', 5, 1),
(3, 'HosecenterA', 'home@gmail.com', 5, 3),
(4, 'Bookshop', 'book@gmail.com', 4, 4),
(5, 'electronicC', 'elec@gmail.com', 3, 1),
(6, 'electronicC', 'elec@gmail.com', 3, 3),
(7, 'electronicC', 'elec@gmail.com', 3, 2),
(8, 'fashionA', 'fasion@gmail.com', 1, 4),
(9, 'fashionA', 'fasion@gmail.com', 1, 2),
(10, 'fashionA', 'fasion@gmail.com', 1, 1),
(11, 'Furniture', 'furniture@gmal.com', 12, 3),
(12, 'Furniture', 'furniture@gmal.com', 12, 2),
(13, 'Furniture', 'furniture@gmal.com', 12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `countryID` int(11) NOT NULL,
  `country_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`countryID`, `country_name`) VALUES
(1, 'Austria'),
(2, 'Germany'),
(3, 'Switzerland'),
(4, 'Itary');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoiceID` int(11) NOT NULL,
  `fk_paymentID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoiceID`, `fk_paymentID`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `itemID` int(11) NOT NULL,
  `item_name` varchar(50) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `fk_categoryID` int(11) DEFAULT NULL,
  `fk_companyID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`itemID`, `item_name`, `price`, `fk_categoryID`, `fk_companyID`) VALUES
(1, 'Sommer', 10, 1, 4),
(2, 'abc', 8, 1, 4),
(3, 'skirtA', 20, 2, 10),
(4, 'skirtA', 20, 2, 8),
(5, 'muffler', 15, 2, 9),
(6, 'muffler', 15, 2, 8),
(7, 'chairB', 30, 4, 3),
(8, 'chairB', 30, 4, 12),
(9, 'table', 100, 4, 12),
(10, 'table', 100, 4, 2),
(11, 'microwave', 200, 3, 5),
(12, 'coffee machine', 300, 3, 5),
(13, 'cup', 3, 4, 3),
(14, 'desk', 25, 4, 12),
(15, 'story', 10, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `detailID` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_price` float DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `fk_orderID` int(11) DEFAULT NULL,
  `fk_itemID` int(11) DEFAULT NULL,
  `ship_from_date` date DEFAULT NULL,
  `ship_to_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`detailID`, `quantity`, `total_price`, `order_date`, `fk_orderID`, `fk_itemID`, `ship_from_date`, `ship_to_date`) VALUES
(1, 2, 50, '2021-09-01', 4, 2, '2021-09-05', '2021-09-07'),
(2, 3, 6, '2019-10-12', 2, 13, '2020-10-15', '2020-10-20'),
(3, 1, 100, '2021-05-05', 3, 9, '2021-05-06', '2021-05-09'),
(4, 2, 30, '2021-08-12', 4, 6, '2021-08-15', '2021-08-17'),
(5, 3, 60, '2018-08-17', 5, 4, '2018-08-20', '2018-08-24'),
(6, 6, 90, '2018-10-10', 5, 6, '2018-10-13', '2018-10-19'),
(7, 5, 125, '2018-09-11', 5, 14, '2018-09-13', '2018-09-18'),
(8, 2, 200, '2020-01-03', 6, 9, '2020-01-10', '2020-01-15'),
(9, 1, 8, '2021-03-03', 7, 2, '2021-03-05', '2021-03-06'),
(10, 1, 200, '2017-09-03', 8, 11, '2017-09-07', '2017-09-09'),
(11, 1, 3, '2021-11-01', 9, 13, '2021-11-02', '2021-11-05'),
(12, 5, 15, '2021-09-07', 10, 13, '2021-09-10', '2021-09-15'),
(13, 1, 20, '2021-07-04', 11, 4, '2021-07-05', '2021-07-08');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `paymentID` int(11) NOT NULL,
  `fk_userID` int(11) DEFAULT NULL,
  `fk_payment_methodID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`paymentID`, `fk_userID`, `fk_payment_methodID`) VALUES
(1, 2, 3),
(2, 12, 3),
(3, 15, 1),
(4, 13, 2),
(5, 1, 1),
(6, 6, 1),
(7, 8, 4),
(8, 11, 4),
(9, 5, 4),
(10, 13, 4);

-- --------------------------------------------------------

--
-- Table structure for table `payment_method`
--

CREATE TABLE `payment_method` (
  `payment_methodID` int(11) NOT NULL,
  `method` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_method`
--

INSERT INTO `payment_method` (`payment_methodID`, `method`) VALUES
(1, 'credit card'),
(2, 'paypal'),
(3, 'apple pay'),
(4, 'debit card');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `reviewID` int(11) NOT NULL,
  `document` varchar(1000) DEFAULT NULL,
  `fk_oderID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`reviewID`, `document`, `fk_oderID`) VALUES
(1, 'Good', 1),
(2, 'Not bad', 2),
(3, 'useful', 3),
(4, 'convinient', 4);

-- --------------------------------------------------------

--
-- Table structure for table `shipment`
--

CREATE TABLE `shipment` (
  `shipmentID` int(11) NOT NULL,
  `shipment_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shipment`
--

INSERT INTO `shipment` (`shipmentID`, `shipment_name`) VALUES
(1, 'Express'),
(2, 'Yamato delivery'),
(3, 'Ship A'),
(4, 'airline B');

-- --------------------------------------------------------

--
-- Table structure for table `user_account`
--

CREATE TABLE `user_account` (
  `userID` int(11) NOT NULL,
  `fName` varchar(50) DEFAULT NULL,
  `lName` varchar(50) DEFAULT NULL,
  `birthDate` date DEFAULT NULL,
  `userpassword` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `fk_adressID` int(11) DEFAULT NULL,
  `house_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_account`
--

INSERT INTO `user_account` (`userID`, `fName`, `lName`, `birthDate`, `userpassword`, `email`, `fk_adressID`, `house_number`) VALUES
(1, 'Sayuri', 'Yoshikawa', '1999-01-21', 'aaa', 'sayuri@a.com', 1, 27),
(2, 'Ai', 'Kawata', '1999-05-05', 'bbb', 'ai@a.com', 1, 26),
(3, 'Yui', 'Yamada', '1970-12-13', 'ccc', 'yui@a.com', 4, 5),
(4, 'Yuya', 'Kawaguchi', '1982-03-03', 'ddd', 'd@a.com', 8, 23),
(5, 'Saki', 'Sasaki', '1998-03-07', 'eee', 'e@a.com', 5, 555),
(6, 'Ryuto', 'Kawanishi', '1970-04-21', 'fff', 'f@a.com', 11, 56),
(7, 'Kohei', 'Hoshi', '1982-10-11', 'ggg', 'g@a.com', 9, 10),
(8, 'Aki', 'Tani', '1865-08-09', 'hhh', 'h@a.com', 9, 12),
(9, 'Yoshino', 'Isozaki', '1990-03-09', 'iii', 'i@a.com', 4, 9),
(10, 'Itsuki', 'Tanioka', '1993-04-06', 'jjj', 'j@a.com', 9, 21),
(11, 'Yoshiki', 'Ura', '2003-06-05', 'kkk', 'k@a.com', 9, 33),
(12, 'Kana', 'Isozaki', '2001-03-25', 'lll', 'l@a.com', 10, 12),
(13, 'Rio', 'Nakata', '2000-09-12', 'mmm', 'm@a.com', 1, 10),
(14, 'Taro', 'Ishikawa', '1987-09-15', 'nnn', 'n@a.com', 3, 12),
(15, 'Kota', 'Kura', '1890-04-23', 'ooo', 'o@a.com', 11, 8);

-- --------------------------------------------------------

--
-- Table structure for table `user_order`
--

CREATE TABLE `user_order` (
  `orderID` int(11) NOT NULL,
  `fk_userID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_order`
--

INSERT INTO `user_order` (`orderID`, `fk_userID`) VALUES
(10, 1),
(11, 1),
(1, 2),
(8, 5),
(12, 6),
(5, 7),
(6, 7),
(2, 8),
(3, 10),
(4, 12),
(9, 13),
(13, 14),
(7, 15),
(14, 15);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adress`
--
ALTER TABLE `adress`
  ADD PRIMARY KEY (`adressID`),
  ADD KEY `fk_countryID` (`fk_countryID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryID`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`companyID`),
  ADD KEY `fk_shipmentID` (`fk_shipmentID`),
  ADD KEY `fk_adressID` (`fk_adressID`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`countryID`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoiceID`),
  ADD KEY `fk_paymentID` (`fk_paymentID`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`itemID`),
  ADD KEY `fk_categoryID` (`fk_categoryID`),
  ADD KEY `fk_companyID` (`fk_companyID`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`detailID`),
  ADD KEY `fk_orderID` (`fk_orderID`),
  ADD KEY `fk_itemID` (`fk_itemID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentID`),
  ADD KEY `fk_userID` (`fk_userID`),
  ADD KEY `fk_payment_methodID` (`fk_payment_methodID`);

--
-- Indexes for table `payment_method`
--
ALTER TABLE `payment_method`
  ADD PRIMARY KEY (`payment_methodID`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`reviewID`),
  ADD KEY `fk_oderID` (`fk_oderID`);

--
-- Indexes for table `shipment`
--
ALTER TABLE `shipment`
  ADD PRIMARY KEY (`shipmentID`);

--
-- Indexes for table `user_account`
--
ALTER TABLE `user_account`
  ADD PRIMARY KEY (`userID`),
  ADD KEY `fk_adressID` (`fk_adressID`);

--
-- Indexes for table `user_order`
--
ALTER TABLE `user_order`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `fk_userID` (`fk_userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adress`
--
ALTER TABLE `adress`
  MODIFY `adressID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `companyID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `countryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoiceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `itemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `detailID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `paymentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `payment_method`
--
ALTER TABLE `payment_method`
  MODIFY `payment_methodID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `reviewID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `shipment`
--
ALTER TABLE `shipment`
  MODIFY `shipmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_account`
--
ALTER TABLE `user_account`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user_order`
--
ALTER TABLE `user_order`
  MODIFY `orderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adress`
--
ALTER TABLE `adress`
  ADD CONSTRAINT `adress_ibfk_1` FOREIGN KEY (`fk_countryID`) REFERENCES `country` (`countryID`);

--
-- Constraints for table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_ibfk_1` FOREIGN KEY (`fk_shipmentID`) REFERENCES `shipment` (`shipmentID`),
  ADD CONSTRAINT `company_ibfk_2` FOREIGN KEY (`fk_adressID`) REFERENCES `adress` (`adressID`);

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`fk_paymentID`) REFERENCES `payment` (`paymentID`);

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`fk_categoryID`) REFERENCES `category` (`categoryID`),
  ADD CONSTRAINT `item_ibfk_2` FOREIGN KEY (`fk_companyID`) REFERENCES `company` (`companyID`);

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`fk_orderID`) REFERENCES `user_order` (`orderID`),
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`fk_itemID`) REFERENCES `item` (`itemID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`fk_userID`) REFERENCES `user_account` (`userID`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`fk_payment_methodID`) REFERENCES `payment_method` (`payment_methodID`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`fk_oderID`) REFERENCES `user_order` (`orderID`);

--
-- Constraints for table `user_account`
--
ALTER TABLE `user_account`
  ADD CONSTRAINT `user_account_ibfk_1` FOREIGN KEY (`fk_adressID`) REFERENCES `adress` (`adressID`);

--
-- Constraints for table `user_order`
--
ALTER TABLE `user_order`
  ADD CONSTRAINT `user_order_ibfk_1` FOREIGN KEY (`fk_userID`) REFERENCES `user_account` (`userID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
