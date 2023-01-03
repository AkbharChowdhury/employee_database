-- phpMyAdmin SQL Dump
-- version 3.2.5
-- http://www.phpmyadmin.net
--
-- Host: mysql.cms.gre.ac.uk
-- Generation Time: Oct 24, 2013 at 12:51 PM
-- Server version: 5.5.32
-- PHP Version: 5.5.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mdb_qbank`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `DeptNo` varchar(255) NOT NULL,
  `DeptName` varchar(255) DEFAULT NULL,
  `Manager` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DeptNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`DeptNo`, `DeptName`, `Manager`) VALUES
('D1', 'Accounts', 'E1'),
('D2', 'Stores', 'E2'),
('D3', 'Sales', 'E5');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `EmpNo` varchar(255) NOT NULL,
  `NINo` varchar(255) DEFAULT NULL,
  `Surname` varchar(255) DEFAULT NULL,
  `Firstname` varchar(255) DEFAULT NULL,
  `DeptNo` varchar(255) DEFAULT NULL,
  `Office` varchar(255) DEFAULT NULL,
  `Salary` int(7) DEFAULT NULL,
  PRIMARY KEY (`EmpNo`),
  KEY `DEPARTMENTEMPLOYEE` (`DeptNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`EmpNo`, `NINo`, `Surname`, `Firstname`, `DeptNo`, `Office`, `Salary`) VALUES
('E1', 'NB123456P', 'Smith', 'Fred', 'D1', 'R101', 12345),
('E2', 'NM23456M', 'Smith', 'Jane', 'D1', 'R102', 16456),
('E3', 'NM543234P', 'Brown', 'Jim', 'D2', 'R101', 13456),
('E5', 'NB127654P', 'Green', 'Fred', 'D3', 'R103', 45345);

-- --------------------------------------------------------

--
-- Table structure for table `telephone`
--

CREATE TABLE IF NOT EXISTS `telephone` (
  `EmpNo` varchar(255) DEFAULT NULL,
  `Extension` int(4) DEFAULT NULL,
  KEY `EMPLOYEETELEPHONE` (`EmpNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `telephone`
--

INSERT INTO `telephone` (`EmpNo`, `Extension`) VALUES
('E1', 8111),
('E2', 1111),
('E3', 1231),
('E5', 1231);
