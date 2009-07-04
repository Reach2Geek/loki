-- phpMyAdmin SQL Dump
-- version 3.0.0-alpha
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 04, 2009 at 09:08 PM
-- Server version: 5.0.67
-- PHP Version: 5.2.6-2ubuntu4.2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `judge`
--

-- --------------------------------------------------------

--
-- Table structure for table `compile_table`
--

DROP TABLE IF EXISTS `compile_table`;
CREATE TABLE IF NOT EXISTS `compile_table` (
  `problemid` smallint(6) NOT NULL,
  `userid` mediumint(9) NOT NULL,
  `source` varchar(256) NOT NULL,
  `tokenid` bigint(20) NOT NULL,
  `checked` smallint(6) NOT NULL,
  KEY `userid` (`userid`),
  KEY `tokenid` (`tokenid`),
  KEY `problemid` (`problemid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `compile_table`
--


-- --------------------------------------------------------

--
-- Table structure for table `exec_table`
--

DROP TABLE IF EXISTS `exec_table`;
CREATE TABLE IF NOT EXISTS `exec_table` (
  `problemid` smallint(6) NOT NULL,
  `userid` mediumint(9) NOT NULL,
  `tokenid` bigint(20) NOT NULL,
  `file` varchar(256) NOT NULL,
  KEY `problemid` (`problemid`),
  KEY `userid` (`userid`),
  KEY `tokenid` (`tokenid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exec_table`
--


-- --------------------------------------------------------

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
CREATE TABLE IF NOT EXISTS `history` (
  `userid` mediumint(9) NOT NULL,
  `tokenid` bigint(20) NOT NULL,
  `time` float NOT NULL,
  `score` int(11) NOT NULL default '0',
  KEY `userid` (`userid`,`tokenid`),
  KEY `tokenid` (`tokenid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `history`
--


-- --------------------------------------------------------

--
-- Table structure for table `problem`
--

DROP TABLE IF EXISTS `problem`;
CREATE TABLE IF NOT EXISTS `problem` (
  `problemid` smallint(6) NOT NULL,
  `title` text NOT NULL,
  PRIMARY KEY  (`problemid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `problem`
--

INSERT INTO `problem` (`problemid`, `title`) VALUES
(1, 'Problem'),
(2, 'Problem'),
(3, 'Problem'),
(4, 'Problem'),
(5, 'Problem');

-- --------------------------------------------------------

--
-- Table structure for table `success_record`
--

DROP TABLE IF EXISTS `success_record`;
CREATE TABLE IF NOT EXISTS `success_record` (
  `userid` mediumint(9) NOT NULL,
  `problemid` smallint(6) NOT NULL,
  `success` tinyint(1) NOT NULL default '0',
  `success_source` varchar(256) default NULL,
  KEY `userid` (`userid`),
  KEY `problemid` (`problemid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `success_record`
--


-- --------------------------------------------------------

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE IF NOT EXISTS `userinfo` (
  `userid` mediumint(9) NOT NULL auto_increment,
  `username` varchar(32) NOT NULL,
  `email` text NOT NULL,
  PRIMARY KEY  (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=2 ;

--
-- Dumping data for table `userinfo`
--

INSERT INTO `userinfo` (`userid`, `username`, `email`) VALUES
(1, 'anomit', 'anomit.ghosh@gmail.com');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `compile_table`
--
ALTER TABLE `compile_table`
  ADD CONSTRAINT `compile_table_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `userinfo` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compile_table_ibfk_2` FOREIGN KEY (`problemid`) REFERENCES `problem` (`problemid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `userinfo` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `history_ibfk_2` FOREIGN KEY (`tokenid`) REFERENCES `compile_table` (`tokenid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `success_record`
--
ALTER TABLE `success_record`
  ADD CONSTRAINT `success_record_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `userinfo` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `success_record_ibfk_2` FOREIGN KEY (`problemid`) REFERENCES `problem` (`problemid`) ON DELETE CASCADE ON UPDATE CASCADE;
