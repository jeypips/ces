-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 18, 2017 at 09:16 AM
-- Server version: 5.7.11
-- PHP Version: 7.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ces`
--

-- --------------------------------------------------------

--
-- Table structure for table `academics`
--

CREATE TABLE `academics` (
  `id_number` int(11) NOT NULL,
  `student_info` int(11) NOT NULL,
  `elem_name` varchar(50) DEFAULT NULL,
  `elem_address` varchar(50) DEFAULT NULL,
  `elem_year` varchar(10) DEFAULT NULL,
  `secondary_name` varchar(50) DEFAULT NULL,
  `secondary_address` varchar(50) DEFAULT NULL,
  `secondary_year` varchar(10) DEFAULT NULL,
  `tertiary_name` varchar(50) DEFAULT NULL,
  `tertiary_address` varchar(50) DEFAULT NULL,
  `tertiary_year` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `account_info`
--

CREATE TABLE `account_info` (
  `account_id` int(11) NOT NULL,
  `account_firstname` varchar(50) NOT NULL,
  `account_lastname` varchar(50) NOT NULL,
  `account_username` varchar(50) NOT NULL,
  `account_password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_info`
--

INSERT INTO `account_info` (`account_id`, `account_firstname`, `account_lastname`, `account_username`, `account_password`) VALUES
(1, 'John Paul', 'Balanon', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `civil_status`
--

CREATE TABLE `civil_status` (
  `civil_status_id` int(11) NOT NULL,
  `civil_status_type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `course_department` varchar(100) NOT NULL,
  `course_code` varchar(50) NOT NULL,
  `course_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_department`, `course_code`, `course_name`) VALUES
(1, 'BSIT', 'IT', 'Information Technology'),
(2, 'Sample', 'sample', 'sample');

-- --------------------------------------------------------

--
-- Table structure for table `parental_infos`
--

CREATE TABLE `parental_infos` (
  `id_number` int(11) NOT NULL,
  `student_info` int(11) NOT NULL,
  `father_name` varchar(50) DEFAULT NULL,
  `father_address` varchar(50) DEFAULT NULL,
  `father_contact_no` varchar(20) DEFAULT NULL,
  `father_occupation` varchar(50) DEFAULT NULL,
  `mother_name` varchar(50) DEFAULT NULL,
  `mother_address` varchar(50) DEFAULT NULL,
  `mother_contact_no` varchar(20) DEFAULT NULL,
  `mother_occupation` varchar(50) DEFAULT NULL,
  `guardian_name` varchar(50) DEFAULT NULL,
  `guardian_address` varchar(50) DEFAULT NULL,
  `guardian_contact_no` varchar(20) DEFAULT NULL,
  `guardian_occupation` varchar(50) DEFAULT NULL,
  `guardian_relation` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `section_id` int(11) NOT NULL,
  `section_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`section_id`, `section_name`) VALUES
(1, 'Alpha'),
(2, 'Bravo'),
(3, 'Charlie');

-- --------------------------------------------------------

--
-- Table structure for table `student_infos`
--

CREATE TABLE `student_infos` (
  `student_id` int(11) NOT NULL,
  `student_lastname` varchar(50) DEFAULT NULL,
  `student_firstname` varchar(50) DEFAULT NULL,
  `student_middlename` varchar(50) DEFAULT NULL,
  `student_contact_no` varchar(20) DEFAULT NULL,
  `student_birthday` date DEFAULT NULL,
  `student_nationality` varchar(20) DEFAULT NULL,
  `student_home_address` varchar(50) DEFAULT NULL,
  `student_bh_address` varchar(50) DEFAULT NULL,
  `student_bh_contact_no` varchar(20) DEFAULT NULL,
  `student_course` int(11) DEFAULT NULL,
  `student_year_level` int(11) DEFAULT NULL,
  `student_section` int(11) DEFAULT NULL,
  `student_sex` varchar(10) DEFAULT NULL,
  `student_birth_place` varchar(50) DEFAULT NULL,
  `student_civil_status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_infos`
--

INSERT INTO `student_infos` (`student_id`, `student_lastname`, `student_firstname`, `student_middlename`, `student_contact_no`, `student_birthday`, `student_nationality`, `student_home_address`, `student_bh_address`, `student_bh_contact_no`, `student_course`, `student_year_level`, `student_section`, `student_sex`, `student_birth_place`, `student_civil_status`) VALUES
(2, 'Balanon', 'John Paul', 'Garcia', NULL, '2017-11-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `subject_id` int(11) NOT NULL,
  `subject_name` varchar(50) NOT NULL,
  `descriptive_title` varchar(50) NOT NULL,
  `year_level` varchar(50) NOT NULL,
  `lecture` int(10) NOT NULL,
  `laboratory` int(10) NOT NULL,
  `units` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`subject_id`, `subject_name`, `descriptive_title`, `year_level`, `lecture`, `laboratory`, `units`) VALUES
(1, 'Math', 'Mathematics', '1992', 1, 2, 3),
(2, 'mt_1', 'Math', '1', 2, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `year_level`
--

CREATE TABLE `year_level` (
  `year_level_id` int(11) NOT NULL,
  `year_level_name` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academics`
--
ALTER TABLE `academics`
  ADD PRIMARY KEY (`id_number`) USING BTREE,
  ADD KEY `student_info` (`student_info`);

--
-- Indexes for table `account_info`
--
ALTER TABLE `account_info`
  ADD PRIMARY KEY (`account_id`);

--
-- Indexes for table `civil_status`
--
ALTER TABLE `civil_status`
  ADD PRIMARY KEY (`civil_status_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `parental_infos`
--
ALTER TABLE `parental_infos`
  ADD PRIMARY KEY (`id_number`) USING BTREE,
  ADD KEY `student_info` (`student_info`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`section_id`);

--
-- Indexes for table `student_infos`
--
ALTER TABLE `student_infos`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `course` (`student_course`),
  ADD KEY `year_level` (`student_year_level`),
  ADD KEY `section` (`student_section`),
  ADD KEY `civil_status` (`student_civil_status`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subject_id`);

--
-- Indexes for table `year_level`
--
ALTER TABLE `year_level`
  ADD PRIMARY KEY (`year_level_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academics`
--
ALTER TABLE `academics`
  MODIFY `id_number` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `account_info`
--
ALTER TABLE `account_info`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `civil_status`
--
ALTER TABLE `civil_status`
  MODIFY `civil_status_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `parental_infos`
--
ALTER TABLE `parental_infos`
  MODIFY `id_number` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `section_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `student_infos`
--
ALTER TABLE `student_infos`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `year_level`
--
ALTER TABLE `year_level`
  MODIFY `year_level_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `academics`
--
ALTER TABLE `academics`
  ADD CONSTRAINT `academics_ibfk_1` FOREIGN KEY (`student_info`) REFERENCES `student_infos` (`student_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `parental_infos`
--
ALTER TABLE `parental_infos`
  ADD CONSTRAINT `parental_infos_ibfk_1` FOREIGN KEY (`student_info`) REFERENCES `student_infos` (`student_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
