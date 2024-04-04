-- Create the database
CREATE DATABASE IF NOT EXISTS garbage;

-- Use the database
USE garbage;

-- Table structure for table `bills`
CREATE TABLE IF NOT EXISTS `bills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerid` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `servedby` varchar(200) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insert data into `bills`
INSERT INTO `bills` (`customerid`, `amount`, `quantity`, `servedby`, `date`) VALUES
(1, 25, 3, 'GB003', '2021-05-23 08:29:37'),
(2, 5, 1, 'GB003', '2021-05-23 08:29:42'),
(2, 1800, 18, 'GB003', '2021-05-23 08:56:21');

-- Table structure for table `customer`
CREATE TABLE IF NOT EXISTS `customer` (
  `customerid` int(11) NOT NULL AUTO_INCREMENT,
  `customername` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `region` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`customerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insert data into `customer`
INSERT INTO `customer` (`customername`, `phone`, `email`, `region`, `password`, `date`) VALUES
('Rashid Omar', '232700123546', 'rashid@gmail.com', 'FreeTown', '1234', '2021-05-22 10:37:11'),
('Nelson Havi', '232712456987', 'nelson@gmail.com', 'FreeTown', '1234', '2021-05-22 10:37:11'),
('John White', '254700000111', 'john@gmail.com', 'Moyamba', '1234', '2021-05-24 18:04:55');

-- Table structure for table `employees`
CREATE TABLE IF NOT EXISTS `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(200) NOT NULL,
  `surname` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `workstation` varchar(200) NOT NULL,
  `position` varchar(200) NOT NULL,
  `empno` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `addedby` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insert data into `employees`
INSERT INTO `employees` (`fname`, `surname`, `phone`, `workstation`, `position`, `empno`, `password`, `addedby`, `status`, `date`) VALUES
('Nelson', 'Chinedu', '23276123450', 'Freetown', 'Admin', 'GB001', '1234', 'GB001', 'Active', '2021-05-21 21:01:23'),
('Chidima', 'Wesly', '232700711233', 'Moyamba', 'Admin', 'GB002', '1234', 'GB001', 'Active', '2021-05-22 17:24:57'),
('Mary', 'Jackson', '232705687233', 'Freetown', 'Employee', 'GB003', '1234', 'GB001', 'Active', '2021-05-23 06:21:09');

-- Table structure for table `payment`
CREATE TABLE IF NOT EXISTS `payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerid` int(11) NOT NULL,
  `refno` varchar(200) NOT NULL,
  `amount` int(11) NOT NULL,
  `serverby` varchar(200) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insert data into `payment`
INSERT INTO `payment` (`customerid`, `refno`, `amount`, `serverby`, `date`) VALUES
(1, 'RCT001', 5, 'Nelson', '2021-05-22 10:39:49'),
(1, 'RCT002', 5, 'Nelson', '2021-05-22 10:39:49'),
(2, 'RCT003', 1, 'Nelson', '2021-05-22 12:03:02'),
(2, 'RCT004', 1004, 'GB001', '2021-05-24 20:01:12');

-- Table structure for table `region`
CREATE TABLE IF NOT EXISTS `region` (
  `regionid` int(11) NOT NULL AUTO_INCREMENT,
  `regionname` varchar(200) NOT NULL,
  `addedby` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`regionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insert data into `region`
INSERT INTO `region` (`regionname`, `addedby`, `status`, `date`) VALUES
('Freetown', 'GB001', 'Inactive', '2021-05-22 09:30:22'),
('Moyamba', 'GB001', 'Active', '2021-05-22 17:01:18');
