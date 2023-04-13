-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 13, 2023 at 12:16 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `immunify`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `pVacinatedPerson` (`c_id` INT(11))   begin
select * from person
where status='p-vacinated'
and center_id=c_id;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `rejectedPerson` (`c_id` INT(11))   begin
select * from person
where status='rejected'
and center_id=c_id;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `scheduledPerson` (`c_id` INT(11))   begin 
select * from person
where status = "scheduled"
and center_id=c_id;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `vacinatedPerson` (`c_id` INT(11))   begin
select * from person
where status='vacinated'
and center_id=c_id;
end$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `noDoses` (`id` INT(11)) RETURNS INT(11)  begin
declare retVal int(11) default 0;
select doses into retVal from vaccine where v_id = id;

return retVal;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ID` int(255) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`ID`, `username`, `password`) VALUES
(2, 'admin', 'password');

-- --------------------------------------------------------

--
-- Table structure for table `center`
--

CREATE TABLE `center` (
  `center_id` int(11) NOT NULL,
  `name` longtext DEFAULT NULL,
  `shortname` varchar(30) NOT NULL,
  `area` varchar(30) DEFAULT NULL,
  `queueList` bigint(20) DEFAULT 0,
  `city` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `center`
--

INSERT INTO `center` (`center_id`, `name`, `shortname`, `area`, `queueList`, `city`) VALUES
(1, 'AIIMS Delhi', 'AIIMS-Del', 'Safdarjung', 100, 'Delhi'),
(2, 'Apollo Hospital Chennai', 'Apollo-Chen', 'Greams Road', 150, 'Chennai'),
(3, 'Fortis Hospital Mumbai', 'Fortis-Mum', 'Mulund West', 200, 'Mumbai'),
(4, 'Max Super Speciality Hospital, Gurgaon', 'Max-Gur', 'Sushant Lok Phase I', 250, 'Gurgaon'),
(5, 'Tata Memorial Hospital, Mumbai', 'TMH-Mum', 'Parel', 150, 'Mumbai'),
(6, 'Post Graduate Institute of Medical Education and Research, Chandigarh', 'PGIMER-Chd', 'Sector 12', 300, 'Chandigarh'),
(7, 'Indraprastha Apollo Hospital, New Delhi', 'IAH-Del', 'Sarita Vihar', 200, 'Delhi'),
(8, 'Kokilaben Dhirubhai Ambani Hospital, Mumbai', 'KDAH-Mum', 'Four Bungalows', 250, 'Mumbai'),
(9, 'Medanta-The Medicity, Gurgaon', 'Medanta-Gur', 'Sector 38', 300, 'Gurgaon'),
(10, 'Christian Medical College and Hospital, Vellore', 'CMC-Vel', 'Ida Scudder Road', 150, 'Vellore');

-- --------------------------------------------------------

--
-- Table structure for table `paramedics`
--

CREATE TABLE `paramedics` (
  `para_id` int(11) NOT NULL,
  `uname` varchar(100) NOT NULL,
  `psw` varchar(100) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `mname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `sex` varchar(12) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `haddress` varchar(255) NOT NULL,
  `city` varchar(50) NOT NULL,
  `hstate` varchar(50) NOT NULL,
  `pincode` int(6) NOT NULL,
  `cnic` varchar(13) NOT NULL,
  `center_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `paramedics`
--

INSERT INTO `paramedics` (`para_id`, `uname`, `psw`, `fname`, `mname`, `lname`, `sex`, `email`, `mobile`, `haddress`, `city`, `hstate`, `pincode`, `cnic`, `center_id`) VALUES
(1, 'employee', 'password', 'Demo', 'For', 'Test', 'other', 'demo@demo.com', '9876543210', 'Demo Address', 'Demo City', 'Demo State', 123456, '1730111111111', 1),
(3, 'AR', 'admin', 'AR', 'Aditya', 'Sharma', 'male', 'maali@gmail.com', '1234123412', 'xxxxxxx', 'xxxxx', 'xxxx', 0, '17301xxxxx', 2);

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `ID` int(255) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `mname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `sex` varchar(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `haddress` varchar(255) NOT NULL,
  `city` varchar(50) NOT NULL,
  `hstate` varchar(50) NOT NULL,
  `pincode` int(6) NOT NULL,
  `dob` date NOT NULL,
  `dov` date NOT NULL,
  `bg` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'scheduled',
  `cnic` varchar(13) DEFAULT NULL,
  `doneDoses` int(11) DEFAULT 0,
  `doses` int(11) DEFAULT NULL,
  `center_id` int(11) DEFAULT NULL,
  `v_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`ID`, `fname`, `mname`, `lname`, `sex`, `email`, `mobile`, `haddress`, `city`, `hstate`, `pincode`, `dob`, `dov`, `bg`, `status`, `cnic`, `doneDoses`, `doses`, `center_id`, `v_id`) VALUES
(31, 'Neha', 'Kumar', 'Singh', 'female', 'neha.kumar@gmail.com', '9876543210', 'A-2, Shanti Nagar', 'Mumbai', 'Maharashtra', 400043, '1990-06-12', '2021-08-18', 'B-', 'scheduled', '123456789012', 0, 1, 4, 1),
(32, 'Rahul', 'Singh', 'Yadav', 'male', 'rahul.singh@gmail.com', '9988776655', '10, Ravi Nagar', 'Delhi', 'Delhi', 110034, '1985-11-25', '2021-08-12', 'O+', 'p-vaccinated', '234567890123', 1, 2, 4, 1),
(33, 'Sneha', 'Sharma', 'Mishra', 'female', 'sneha.sharma@gmail.com', '9876543210', 'B-12, Rohini', 'Delhi', 'Delhi', 110085, '1995-03-02', '2021-08-15', 'AB+', 'vaccinated', '345678901234', 2, 2, 3, 7),
(34, 'Rohit', 'Kumar', 'Jain', 'male', 'rohit.jain@gmail.com', '9988776655', '203, Raj Nagar', 'Jaipur', 'Rajasthan', 302019, '1992-08-18', '2021-08-14', 'A-', 'scheduled', '456789012345', 0, 1, 1, 2),
(35, 'Priya', 'Gupta', 'Sharma', 'female', 'priya.gupta@gmail.com', '9876543210', 'C-23, Shanti Niketan', 'New Delhi', 'Delhi', 110021, '1988-12-30', '2021-08-18', 'B+', 'vaccinated', '567890123456', 2, 2, 2, 6),
(36, 'Dreaming', '', 'Doer', 'male', 'doerdreaming@gmail.com', '1234123412', 'Hyderabad', 'Hyderabad', 'UK', 123456, '2023-04-15', '2023-04-17', 'O+', 'scheduled', '1234', 0, NULL, 1, NULL),
(37, 'Atharva', '', 'Gadekar', 'male', 'atharvagadekar@gmail.com', '09324238121', 'Room Number 5669, Boys Hostel 5, IIIT Allahabad, Jhalwa', 'Allahabad', 'Uttar Pradesh', 211012, '2023-04-20', '2023-04-30', 'O+', 'scheduled', '12345', 0, NULL, 4, NULL),
(38, 'Atharva', '', 'Gadekar', 'male', 'atharvagadekar@gmail.com', '09324238121', 'Room Number 5669, Boys Hostel 5, IIIT Allahabad, Jhalwa', 'Allahabad', 'Uttar Pradesh', 211012, '2023-04-20', '2023-04-30', 'O+', 'scheduled', '12345', 0, NULL, 4, NULL),
(39, 'Aditya', '', 'Sharma', 'male', 'maali@gmail.com', '9324238121', '005, New Sonal Building, Beside DNS Bank', 'Dombivli', 'Maharashtra', 421203, '2023-04-11', '2023-04-28', 'O-', 'scheduled', '2154846', 0, NULL, 8, NULL),
(40, 'Aditya', '', 'Sharma', 'male', 'maali@gmail.com', '9324238121', '005, New Sonal Building, Beside DNS Bank', 'Dombivli', 'Maharashtra', 421203, '2023-04-11', '2023-04-28', 'O-', 'scheduled', '2154846', 0, NULL, 8, NULL),
(41, 'Saishree', '', 'Kouda', 'female', 'saishree@gmail.com', '9324238526', '005, New Sonal Building, Beside DNS Bank', 'Dombivli', 'Maharashtra', 421203, '2023-04-06', '2023-04-22', 'O+', 'scheduled', '656882', 0, NULL, 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `storage`
--

CREATE TABLE `storage` (
  `center_id` int(11) NOT NULL,
  `v_id` int(11) NOT NULL,
  `amount` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `storage`
--

INSERT INTO `storage` (`center_id`, `v_id`, `amount`) VALUES
(1, 1, 50000),
(1, 2, 50000),
(1, 3, 50000),
(1, 4, 50000),
(1, 5, 10000),
(1, 6, 500),
(1, 7, 500000),
(2, 1, 0),
(2, 2, 100),
(2, 3, 100),
(2, 4, 10000),
(2, 5, 10000),
(2, 6, 10000),
(2, 7, 50000);

-- --------------------------------------------------------

--
-- Table structure for table `vaccine`
--

CREATE TABLE `vaccine` (
  `v_id` int(11) NOT NULL,
  `vName` varchar(50) DEFAULT NULL,
  `doses` int(11) NOT NULL,
  `inter` int(11) DEFAULT 0,
  `info` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vaccine`
--

INSERT INTO `vaccine` (`v_id`, `vName`, `doses`, `inter`, `info`) VALUES
(1, 'Astra Zeneca', 2, 0, NULL),
(2, 'Sputnik', 1, 0, NULL),
(3, 'Cansino', 1, 0, NULL),
(4, 'Sinovac', 2, 0, NULL),
(5, 'Phizer', 2, 0, NULL),
(6, 'Cynopharm', 2, 0, NULL),
(7, 'Moderna', 2, 0, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `center`
--
ALTER TABLE `center`
  ADD PRIMARY KEY (`center_id`);

--
-- Indexes for table `paramedics`
--
ALTER TABLE `paramedics`
  ADD PRIMARY KEY (`para_id`),
  ADD KEY `center_id` (`center_id`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `center_id` (`center_id`),
  ADD KEY `v_id` (`v_id`);

--
-- Indexes for table `storage`
--
ALTER TABLE `storage`
  ADD PRIMARY KEY (`center_id`,`v_id`),
  ADD KEY `v_id` (`v_id`);

--
-- Indexes for table `vaccine`
--
ALTER TABLE `vaccine`
  ADD PRIMARY KEY (`v_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `center`
--
ALTER TABLE `center`
  MODIFY `center_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `vaccine`
--
ALTER TABLE `vaccine`
  MODIFY `v_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `paramedics`
--
ALTER TABLE `paramedics`
  ADD CONSTRAINT `paramedics_ibfk_1` FOREIGN KEY (`center_id`) REFERENCES `center` (`center_id`);

--
-- Constraints for table `person`
--
ALTER TABLE `person`
  ADD CONSTRAINT `person_ibfk_1` FOREIGN KEY (`center_id`) REFERENCES `center` (`center_id`),
  ADD CONSTRAINT `person_ibfk_2` FOREIGN KEY (`v_id`) REFERENCES `vaccine` (`v_id`);

--
-- Constraints for table `storage`
--
ALTER TABLE `storage`
  ADD CONSTRAINT `storage_ibfk_1` FOREIGN KEY (`center_id`) REFERENCES `center` (`center_id`),
  ADD CONSTRAINT `storage_ibfk_2` FOREIGN KEY (`v_id`) REFERENCES `vaccine` (`v_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
