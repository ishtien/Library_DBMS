-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2020 at 09:40 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `csie_library`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `book_id` int(11) NOT NULL,
  `book_name` varchar(50) NOT NULL,
  `author` varchar(20) NOT NULL,
  `import_date` date NOT NULL,
  `position` varchar(20) NOT NULL,
  `book_category` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`book_id`, `book_name`, `author`, `import_date`, `position`, `book_category`) VALUES
(1, 'To Kill a Mockingbird', 'Harper Lee', '2020-05-15', '000-000-001', 'literature'),
(2, '1984', 'George Orwell', '2020-05-22', '000-000-002', 'literature'),
(3, 'Harry Potter and the Philosopher’s Stone', 'J.K. Rowling', '2020-05-02', '000-000-003', 'fantasy'),
(4, 'The Lord of the Rings', 'J.R.R. Tolkien', '2020-05-11', '000-004-004', 'fantasy'),
(5, 'The Great Gatsby', 'F. Scott Fitzgerald', '2020-05-05', '000-000-003', 'literature'),
(6, 'Pride and Prejudice', 'Jane Austen', '2020-05-15', '000-000-005', 'literature'),
(7, 'The Diary Of A Young Girl', 'Anne Frank', '2020-05-07', '000-005-004', 'biography'),
(8, 'The Book Thief', 'Markus Zusak', '2020-04-08', '000-000-004', 'novel'),
(9, 'The Hobbit', 'J.R.R. Tolkien', '2020-03-12', '000-006-004', 'fantasy'),
(10, 'Little Women', 'Louisa May Alcott', '2020-05-11', '000-000-005', 'literature');

-- --------------------------------------------------------

--
-- Table structure for table `borrow_book`
--

CREATE TABLE `borrow_book` (
  `book_id` int(11) NOT NULL,
  `reader_id` int(11) NOT NULL,
  `borrow_date` date NOT NULL,
  `return_date` date DEFAULT NULL,
  `is_returned` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `borrow_book`
--

INSERT INTO `borrow_book` (`book_id`, `reader_id`, `borrow_date`, `return_date`, `is_returned`) VALUES
(1, 1, '2020-05-27', NULL, 0),
(2, 1, '2020-05-27', NULL, 0),
(3, 2, '2020-05-25', NULL, 0),
(4, 2, '2020-05-25', NULL, 0),
(5, 2, '2020-05-26', NULL, 0),
(6, 3, '2020-05-08', '2020-05-22', 1),
(7, 4, '2020-05-14', '2020-05-26', 1),
(8, 5, '2020-05-20', NULL, 0),
(9, 6, '2020-05-19', NULL, 0),
(10, 10, '2020-05-13', '2020-05-21', 1);

-- --------------------------------------------------------

--
-- Table structure for table `borrow_venue`
--

CREATE TABLE `borrow_venue` (
  `reader_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `meeting_room_id` int(11) NOT NULL,
  `borrow_date` date NOT NULL,
  `return_date` date DEFAULT NULL,
  `is_returned` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `borrow_venue`
--

INSERT INTO `borrow_venue` (`reader_id`, `employee_id`, `meeting_room_id`, `borrow_date`, `return_date`, `is_returned`) VALUES
(1, 2, 5, '2020-05-08', '2020-05-08', 1),
(1, 7, 5, '2020-05-09', '2020-05-09', 1),
(2, 5, 7, '2020-05-01', '2020-05-01', 1),
(3, 6, 9, '2020-05-28', NULL, 0),
(4, 8, 6, '2020-05-28', NULL, 0),
(5, 10, 3, '2020-05-27', '2020-05-27', 1),
(6, 2, 1, '2020-05-26', '2020-05-26', 1),
(7, 5, 10, '2020-05-23', '2020-05-23', 1),
(8, 1, 2, '2020-05-27', '2020-05-27', 1),
(10, 3, 5, '2020-05-28', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(70) NOT NULL,
  `office` varchar(20) NOT NULL,
  `department_phone` varchar(10) NOT NULL,
  `manager_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`department_id`, `department_name`, `office`, `department_phone`, `manager_id`) VALUES
(1, 'librarianship development division', '65601', '035754575', 1),
(2, 'collection development and bibliography management division', '65602', '036759485', 2),
(3, 'knowledge services division', '65603', '035869483', 3),
(4, 'special collections division', '65604', '035643567', 4),
(5, 'digital knowledge system division', '65605', '035765434', 5),
(6, 'international cooperation division', '65606', '035765675', 6),
(7, 'general affairs and secretariat office', '65607', '035730567', 7),
(8, 'personnel office', '65607', '035730567', 8),
(9, 'civil service ethics office', '65608', '035654345', 9),
(10, 'accounting office', '65608', '035654345', 10);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `employee_name` varchar(20) NOT NULL,
  `employee_phone` varchar(10) NOT NULL,
  `employee_sex` varchar(10) NOT NULL,
  `employee_salary` int(11) NOT NULL,
  `employee_address` varchar(100) NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `employee_name`, `employee_phone`, `employee_sex`, `employee_salary`, `employee_address`, `department_id`) VALUES
(1, 'Eric Feng', '0988794565', 'male', 30000, 'No. 4, Wenhua 3rd St., East Dist., Tainan City 701, Taiwan (R.O.C.)', 1),
(2, 'Ellie Yu', '0988794532', 'female', 35000, '1F., No. 8-3, Daren St., West Central Dist., Tainan City 700, Taiwan (R.O.C)', 2),
(3, 'Chloe Hsu', '0948594900', 'female', 39000, '1F., No. 8-3, Gongyuan Rd., West Central Dist., Tainan City 700, Taiwan(R.O.C)', 3),
(4, 'Sandy Kung', '0955933055', 'female', 33000, '1F., No. 10-8, Xixian St., West Central Dist., Tainan City 700, Taiwan (R.O.C.)', 4),
(5, 'Ben Bai', '0988759687', 'male', 34000, 'No. 10-24, Chenggong Rd., West Central Dist., Tainan City 700, Taiwan (R.O.C.)', 5),
(6, 'Ray Peng', '0977685965', 'male', 32000, 'No. 105, Sec. 1, Yongfu Rd., West Central Dist., Tainan City 700, Taiwan (R.O.C.)', 6),
(7, 'Ken Lu', '0978958685', 'male', 40000, 'No. 44, Daping Rd., Anping Dist., Tainan City 708, Taiwan (R.O.C.)', 7),
(8, 'Katie Miao', '0980774224', 'female', 42000, 'No. 32, Dongxing Rd., East Dist., Tainan City 701, Taiwan (R.O.C.)', 8),
(9, 'Tiger Ma', '0988794054', 'male', 56000, 'No. 199, Sec. W., Dongning Rd., East Dist., Tainan City 701, Taiwan (R.O.C.)', 9),
(10, 'Betty Kuo', '0980768594', 'female', 63000, 'No. 23, Chongming 22nd St., East Dist., Tainan City 701, Taiwan (R.O.C.)', 10);

-- --------------------------------------------------------

--
-- Table structure for table `meeting_room`
--

CREATE TABLE `meeting_room` (
  `meeting_room_id` int(11) NOT NULL,
  `capacity` int(11) NOT NULL,
  `projector` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `meeting_room`
--

INSERT INTO `meeting_room` (`meeting_room_id`, `capacity`, `projector`) VALUES
(1, 2, 0),
(2, 2, 0),
(3, 4, 0),
(4, 4, 1),
(5, 4, 1),
(6, 6, 0),
(7, 6, 1),
(8, 8, 1),
(9, 10, 1),
(10, 12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `reader`
--

CREATE TABLE `reader` (
  `reader_id` int(11) NOT NULL,
  `reader_name` varchar(20) NOT NULL,
  `register_date` date NOT NULL,
  `reader_sex` varchar(10) NOT NULL,
  `reader_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reader`
--

INSERT INTO `reader` (`reader_id`, `reader_name`, `register_date`, `reader_sex`, `reader_status`) VALUES
(1, 'Ish Tien', '2020-01-08', 'female', 'student'),
(2, 'Timmy Wang', '2020-05-06', 'female', 'professor'),
(3, 'Tom Lee', '2020-05-04', 'male', 'student'),
(4, 'Nick Wu', '2020-04-01', 'male', 'alumni'),
(5, 'Dawn Lee', '2019-09-11', 'female', 'student'),
(6, 'Alan Hsieh', '2019-07-25', 'male', 'student'),
(7, 'Bob Chung', '2020-04-20', 'male', 'professor'),
(8, 'Alex Chen', '2020-01-01', 'male', 'alumni'),
(9, 'Vivian Ann', '2019-10-08', 'female', 'student'),
(10, 'Jorden Lin', '2020-05-02', 'male', 'student');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `borrow_book`
--
ALTER TABLE `borrow_book`
  ADD PRIMARY KEY (`book_id`,`reader_id`,`borrow_date`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `reader_id` (`reader_id`);

--
-- Indexes for table `borrow_venue`
--
ALTER TABLE `borrow_venue`
  ADD PRIMARY KEY (`reader_id`,`employee_id`,`meeting_room_id`,`borrow_date`),
  ADD KEY `reader_id` (`reader_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `meeting_room_id` (`meeting_room_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_id`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `manager_id` (`manager_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `meeting_room`
--
ALTER TABLE `meeting_room`
  ADD PRIMARY KEY (`meeting_room_id`);

--
-- Indexes for table `reader`
--
ALTER TABLE `reader`
  ADD PRIMARY KEY (`reader_id`),
  ADD KEY `reader_id` (`reader_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `meeting_room`
--
ALTER TABLE `meeting_room`
  MODIFY `meeting_room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `reader`
--
ALTER TABLE `reader`
  MODIFY `reader_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `borrow_book`
--
ALTER TABLE `borrow_book`
  ADD CONSTRAINT `borrow_book_ibfk_1` FOREIGN KEY (`reader_id`) REFERENCES `reader` (`reader_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrow_book_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `borrow_venue`
--
ALTER TABLE `borrow_venue`
  ADD CONSTRAINT `borrow_venue_ibfk_1` FOREIGN KEY (`reader_id`) REFERENCES `reader` (`reader_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrow_venue_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrow_venue_ibfk_3` FOREIGN KEY (`meeting_room_id`) REFERENCES `meeting_room` (`meeting_room_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`manager_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
