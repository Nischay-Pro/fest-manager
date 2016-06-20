-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 27, 2016 at 05:44 PM
-- Server version: 5.5.47-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pearl_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `accomodation`
--

CREATE TABLE IF NOT EXISTS `accomodation` (
  `Pearl_Id` varchar(10) NOT NULL,
  `StartDate` varchar(15) NOT NULL,
  `EndDate` varchar(15) NOT NULL,
  `NoofDays` int(11) NOT NULL,
  `Bhavan` varchar(10) NOT NULL,
  `Cost` int(11) NOT NULL,
  `Refund` int(11) NOT NULL,
  `Updated_At` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Pearl_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accomodation`
--


-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` int(1) NOT NULL,
  `admin_password` varchar(60) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--



-- --------------------------------------------------------

--
-- Table structure for table `bitsian`
--

CREATE TABLE IF NOT EXISTS `bitsian` (
  `pearl_id` varchar(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` bigint(15) DEFAULT NULL,
  `college` varchar(50) NOT NULL DEFAULT 'Bits Hyderabad',
  PRIMARY KEY (`pearl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bitsian`
--

-- --------------------------------------------------------

--
-- Table structure for table `controlz_credentials`
--

CREATE TABLE IF NOT EXISTS `controlz_credentials` (
  `controlz_id` int(11) NOT NULL,
  `controlz_pass` varchar(20) NOT NULL,
  `member_name` varchar(20) NOT NULL,
  PRIMARY KEY (`controlz_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `controlz_credentials`
--


-- --------------------------------------------------------

--
-- Table structure for table `dosh_credentials`
--

CREATE TABLE IF NOT EXISTS `dosh_credentials` (
  `team_id` int(11) NOT NULL,
  `team_captain` varchar(30) NOT NULL,
  `team_pass` varchar(30) NOT NULL,
  `reg_collect` int(11) NOT NULL,
  `accom_collect` int(11) NOT NULL,
  PRIMARY KEY (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dosh_credentials`
--

-- --------------------------------------------------------

--
-- Table structure for table `event_credentials`
--

CREATE TABLE IF NOT EXISTS `event_credentials` (
  `organiser_id` int(11) NOT NULL,
  `Bits_ID` varchar(10) NOT NULL,
  `password` varchar(30) NOT NULL,
  `uploader_name` varchar(30) NOT NULL,
  `club_name` varchar(30) NOT NULL,
  `club` int(3) NOT NULL,
  PRIMARY KEY (`organiser_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event_credentials`
--

-- --------------------------------------------------------

--
-- Table structure for table `event_details`
--

CREATE TABLE IF NOT EXISTS `event_details` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `Event_id` int(10) NOT NULL,
  `Event_date` varchar(20) NOT NULL,
  `Event_venue` varchar(30) NOT NULL,
  `Roundname` varchar(100) NOT NULL,
  `updated_at` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_details_ibfk_1` (`Event_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=58 ;

--
-- Dumping data for table `event_details`
--



-- --------------------------------------------------------

--
-- Table structure for table `event_participants`
--

CREATE TABLE IF NOT EXISTS `event_participants` (
  `event_id` int(15) NOT NULL,
  `pearl_id` varchar(15) NOT NULL,
  `uploaded_by` int(11) NOT NULL,
  `updated_at` varchar(15) NOT NULL,
  `round_at` int(11) NOT NULL,
  `delete` int(1) NOT NULL,
  PRIMARY KEY (`pearl_id`,`event_id`),
  KEY `event_participants_ibfk_1` (`event_id`),
  KEY `event_participants_ibfk_2` (`uploaded_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event_participants`
--


-- --------------------------------------------------------

--
-- Table structure for table `group_details`
--

CREATE TABLE IF NOT EXISTS `group_details` (
  `group_id` int(7) NOT NULL,
  `group_name` varchar(50) NOT NULL,
  `event_id` int(10) NOT NULL,
  `round_at` int(2) NOT NULL,
  `uploaded_by` int(11) NOT NULL,
  `updated_at` varchar(20) NOT NULL,
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `u_group_details` (`group_name`,`event_id`),
  KEY `group_details_ibfk_1` (`event_id`),
  KEY `group_details_ibfk_2` (`uploaded_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_details`
--



-- --------------------------------------------------------

--
-- Table structure for table `group_members`
--

CREATE TABLE IF NOT EXISTS `group_members` (
  `pearl_id` varchar(15) NOT NULL,
  `group_id` int(7) NOT NULL,
  `event_id` int(15) NOT NULL,
  PRIMARY KEY (`pearl_id`,`event_id`),
  KEY `fk_event_id` (`event_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_members`
--



-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
  `notif_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `message` varchar(2000) NOT NULL,
  `updated_at` varchar(15) NOT NULL,
  PRIMARY KEY (`notif_id`),
  KEY `event_id` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pearl_events`
--

CREATE TABLE IF NOT EXISTS `pearl_events` (
  `event_id` int(15) NOT NULL,
  `event_name` varchar(50) NOT NULL,
  `paid` int(1) NOT NULL,
  `organiser_id` int(11) NOT NULL,
  `club` int(3) NOT NULL,
  PRIMARY KEY (`event_id`),
  KEY `organiser_id` (`organiser_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pearl_events`
--

INSERT INTO `pearl_events` (`event_id`, `event_name`, `paid`, `organiser_id`, `club`) VALUES
(-1, 'General', 0, 999, 0),
(1, 'Retrospective', 0, 1, 1),
(2, 'Photog Race', 0, 1, 1),
(3, 'Showcase', 0, 1, 1),
(4, 'Guess What', 0, 1, 1),
(5, 'Photog Story', 0, 1, 1),
(6, 'Advanced Photoshop', 0, 1, 1),
(7, 'Basics of Photography', 0, 1, 1),
(8, 'Terpsichore', 0, 2, 2),
(9, 'Soul O', 0, 2, 2),
(10, 'Abhivyaktika', 0, 2, 2),
(11, 'Waste Smart', 0, 3, 3),
(12, 'Lucifered', 0, 3, 3),
(13, 'Inferno', 0, 3, 3),
(14, 'Satanism', 0, 3, 3),
(15, 'The Goat of Mendes', 0, 3, 3),
(16, 'Natyashastra', 0, 4, 4),
(17, 'Nukkad Natak', 0, 4, 4),
(18, 'Mono-Acting', 0, 4, 4),
(19, 'Screw em Up', 0, 4, 4),
(20, 'Youth Mahasabha', 0, 5, 5),
(21, 'Abhivyakti', 0, 5, 5),
(22, 'Hass-le-zara', 0, 5, 5),
(23, 'Antakshri', 0, 5, 5),
(24, 'Caption It', 0, 6, 6),
(25, 'Football Manager', 0, 6, 6),
(26, 'OP-ED', 0, 6, 6),
(27, 'Video Journalist', 0, 6, 6),
(28, 'General Quiz', 0, 7, 7),
(29, 'Sports Quiz', 0, 7, 7),
(30, 'Mela Quiz', 0, 7, 7),
(31, 'Biz-Tech Quiz', 0, 7, 7),
(32, 'India Quiz', 0, 7, 7),
(33, 'Farewell Quiz', 0, 7, 7),
(34, 'Midnight AV Quiz', 0, 7, 7),
(35, 'Stunt Mania', 0, 8, 8),
(36, 'Imitation Game', 0, 8, 8),
(37, 'Martial Arts Workshop', 0, 8, 8),
(38, 'Kaleidoscope', 0, 9, 9),
(39, 'Cos-Play', 0, 9, 9),
(40, 'Spoiler Alert', 0, 9, 9),
(41, 'Minute Snippet', 0, 9, 9),
(42, 'Sync in', 0, 10, 10),
(43, 'Ma', 0, 10, 10),
(44, 'Comic Stick', 0, 10, 10),
(45, 'Dark Digital Art', 0, 10, 10),
(46, 'Evil Ciphers', 0, 10, 10),
(47, 'Fx ed', 0, 10, 10),
(48, 'Indiana Tones', 0, 11, 11),
(49, 'Gandhaara', 0, 11, 11),
(50, 'Pearl Jam', 0, 11, 11),
(51, 'Jhankaar', 0, 11, 11),
(52, 'Score-D', 0, 11, 11),
(53, 'Jam', 0, 12, 12),
(54, 'Shipwrecked', 0, 12, 12),
(55, 'THE BIG FIGHT', 0, 12, 12),
(56, 'PERSPECTIVE', 0, 12, 12),
(57, 'SHERLOCKED', 0, 12, 12),
(58, 'WRITING EVENT', 0, 12, 12),
(59, 'Open outcry', 0, 13, 13),
(60, 'Shot In The Dark', 0, 13, 13),
(61, 'Minimalist', 0, 14, 14),
(62, 'Words to Design', 0, 14, 14),
(63, 'Sigilum', 0, 14, 14),
(64, 'Aspire Talks', 0, 15, 15),
(65, 'OffBeat', 0, 15, 15),
(100, 'Ground Reality', 0, 16, 16),
(101, 'Till Deaf Do We Part', 0, 11, 11),
(102, 'Miss Diva', 0, 17, 17),
(103, 'Glitterati', 0, 17, 17),
(104, 'War of Djs', 0, 17, 17),
(105, 'Fraglore CS GO', 0, 17, 17),
(106, 'Managers Dilemma', 0, 16, 16),
(107, 'Fraglore Fifa', 0, 17, 17),
(108, 'Fraglore DOTA', 0, 17, 17),
(109, 'Fraglore COD', 0, 17, 17);

-- --------------------------------------------------------

--
-- Table structure for table `reg_16`
--

CREATE TABLE IF NOT EXISTS `reg_16` (
  `Sno` int(11) NOT NULL,
  `P_Id` text NOT NULL,
  `name` text NOT NULL,
  `college` text NOT NULL,
  `city` text NOT NULL,
  `phone` text NOT NULL,
  `email` text NOT NULL,
  PRIMARY KEY (`Sno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE IF NOT EXISTS `rooms` (
  `floor_id` varchar(4) NOT NULL,
  `seats_left` int(3) NOT NULL,
  PRIMARY KEY (`floor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`floor_id`, `seats_left`) VALUES
('G1', 9),
('G2', 32),
('G3', 37),
('K1', 17),
('K2', 34),
('K3', 27),
('M0', 34),
('M1', 34),
('M2', 34),
('M3', 34),
('MM1', 33),
('MM2', 23),
('MM3', 20),
('MM4', 32),
('S1', 37),
('S2', 37),
('S3', 37),
('V0', 37),
('V1', 37),
('V2', 37),
('V3', 32);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `pearl_id` varchar(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `college` varchar(50) NOT NULL,
  `phone` bigint(15) NOT NULL,
  `reg` int(1) NOT NULL,
  `accom` int(1) NOT NULL,
  `id_reg` int(11) DEFAULT NULL,
  PRIMARY KEY (`pearl_id`),
  KEY `users_ibfk_1` (`id_reg`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

-- --------------------------------------------------------

--
-- Table structure for table `user_token`
--

CREATE TABLE IF NOT EXISTS `user_token` (
  `token` varchar(250) NOT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`token`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accomodation`
--
ALTER TABLE `accomodation`
  ADD CONSTRAINT `accomodation_ibfk_1` FOREIGN KEY (`Pearl_Id`) REFERENCES `users` (`pearl_id`);

--
-- Constraints for table `event_details`
--
ALTER TABLE `event_details`
  ADD CONSTRAINT `event_details_ibfk_1` FOREIGN KEY (`Event_id`) REFERENCES `pearl_events` (`event_id`);

--
-- Constraints for table `event_participants`
--
ALTER TABLE `event_participants`
  ADD CONSTRAINT `event_participants_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `pearl_events` (`event_id`),
  ADD CONSTRAINT `event_participants_ibfk_2` FOREIGN KEY (`uploaded_by`) REFERENCES `event_credentials` (`organiser_id`),
  ADD CONSTRAINT `event_participants_ibfk_3` FOREIGN KEY (`pearl_id`) REFERENCES `users` (`pearl_id`);

--
-- Constraints for table `group_details`
--
ALTER TABLE `group_details`
  ADD CONSTRAINT `group_details_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `pearl_events` (`event_id`),
  ADD CONSTRAINT `group_details_ibfk_2` FOREIGN KEY (`uploaded_by`) REFERENCES `event_credentials` (`organiser_id`);

--
-- Constraints for table `group_members`
--
ALTER TABLE `group_members`
  ADD CONSTRAINT `fk_event_id` FOREIGN KEY (`event_id`) REFERENCES `pearl_events` (`event_id`),
  ADD CONSTRAINT `fk_pearl_id` FOREIGN KEY (`pearl_id`) REFERENCES `users` (`pearl_id`),
  ADD CONSTRAINT `group_members_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `group_details` (`group_id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event_details` (`Event_id`);

--
-- Constraints for table `pearl_events`
--
ALTER TABLE `pearl_events`
  ADD CONSTRAINT `pearl_events_ibfk_1` FOREIGN KEY (`organiser_id`) REFERENCES `event_credentials` (`organiser_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_reg`) REFERENCES `dosh_credentials` (`team_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
