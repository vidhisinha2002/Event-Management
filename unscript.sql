-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 29, 2018 at 10:24 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `unscript`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add document', 7, 'add_document'),
(20, 'Can change document', 7, 'change_document'),
(21, 'Can delete document', 7, 'delete_document');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `committee`
--

CREATE TABLE `committee` (
  `cmid` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `pwd` varchar(15) NOT NULL,
  `cname` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `committee`
--

INSERT INTO `committee` (`cmid`, `username`, `pwd`, `cname`) VALUES
(1, 'adm', 'pass', 'vinay'),
(2, '15CE5003C', 'pass', 'CSI '),
(3, '12345', 'pass123', 'TPC');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `cid` int(11) NOT NULL,
  `coname` varchar(30) NOT NULL,
  `ssc` double NOT NULL,
  `hsc` double NOT NULL,
  `avg_ptr` double NOT NULL,
  `live_kt` int(5) NOT NULL DEFAULT '0',
  `dead_kt` int(5) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`cid`, `coname`, `ssc`, `hsc`, `avg_ptr`, `live_kt`, `dead_kt`) VALUES
(1, 'JPMC', 85, 84, 7, 0, 0),
(2, 'ingram', 60, 60, 6, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'Student', 'document');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2018-03-24 10:28:40.239000'),
(2, 'auth', '0001_initial', '2018-03-24 10:28:49.443433'),
(3, 'admin', '0001_initial', '2018-03-24 10:28:51.970237'),
(4, 'admin', '0002_logentry_remove_auto_add', '2018-03-24 10:28:52.060219'),
(5, 'contenttypes', '0002_remove_content_type_name', '2018-03-24 10:28:53.142157'),
(6, 'auth', '0002_alter_permission_name_max_length', '2018-03-24 10:28:54.203461'),
(7, 'auth', '0003_alter_user_email_max_length', '2018-03-24 10:28:55.102213'),
(8, 'auth', '0004_alter_user_username_opts', '2018-03-24 10:28:55.174077'),
(9, 'auth', '0005_alter_user_last_login_null', '2018-03-24 10:28:55.708419'),
(10, 'auth', '0006_require_contenttypes_0002', '2018-03-24 10:28:55.759260'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2018-03-24 10:28:55.822117'),
(12, 'auth', '0008_alter_user_username_max_length', '2018-03-24 10:28:57.881757'),
(13, 'auth', '0009_alter_user_last_name_max_length', '2018-03-24 10:28:59.086933'),
(14, 'sessions', '0001_initial', '2018-03-24 10:28:59.914759'),
(15, 'Student', '0001_initial', '2018-03-24 23:33:31.696778');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('5uvkzdz5id6t5f39hqstwehvlh8ekpk7', 'Y2FjZDA1MGUxMDRiYTFmZTA3OTlkMTJhNTFjODQxNzA0ZmFhYmM3MDp7ImNtaWRfZmsiOjMsInJvbGxubyI6LTEsInllYXIiOiIifQ==', '2018-04-08 05:52:45.147796'),
('70jcbjso4jh2gixc6bv47x6wanw43scr', 'ZjdkNzE4ZGUxYzFjYmE5ZmRhN2Q1NjI2Y2RiZjMzMTA1N2ZmNWQ4MDp7ImNtaWRfZmsiOjIsInJvbGxubyI6IjE1Q0U1MDAzIiwieWVhciI6IkJFLUNTIn0=', '2018-04-08 06:12:00.050797'),
('9ld48k67024mq4frs65iv888zwfjeywx', 'YzI0NjU3OTk2NTA1NjdhZjExNmNlYmRiN2NmMjJmNTFmMTIwNjhkNTp7InJvbGxubyI6LTEsInllYXIiOiIiLCJjbWlkX2ZrIjozfQ==', '2018-04-08 06:11:30.236638'),
('k0dyeve937k9th7qt3n3x2t0uqkjbp3y', 'Y2I1ODgxZTY2YWFjY2Y1YmNiYzg0ODMwOGIwZmIzYzAwNGMwOTMxMzp7InJvbGxubyI6IjE1Q0U1MDAzIiwieWVhciI6IkJFLUNTIn0=', '2018-04-08 06:15:03.417322'),
('kpx6cmqjbjvmctsnbjiox5gv21ba6m86', 'YzI0NjU3OTk2NTA1NjdhZjExNmNlYmRiN2NmMjJmNTFmMTIwNjhkNTp7InJvbGxubyI6LTEsInllYXIiOiIiLCJjbWlkX2ZrIjozfQ==', '2018-04-08 06:11:03.283343'),
('qsje1se390rvriz2a3ljtc9rt8tjxh87', 'Y2ZiZTYwYjQwMjdkOGI0OWU4M2E4MTVmOWJmNTFmN2I3YTdhMWY5NDp7InJvbGxubyI6LTEsInllYXIiOiIiLCJjbWlkX2ZrIjoyfQ==', '2018-04-08 06:15:21.890755'),
('r7i5lzez7e66n4kysng4513joginumfz', 'ZmNmYTU4MDBjNmRmMzUyNTk4NzhlODliNmQ0Nzc3OGVkZmFkODc4YTp7ImNtaWRfZmsiOjEsInJvbGxubyI6IjE0Y2UxMDE3IiwieWVhciI6Ii0ifQ==', '2018-04-08 05:45:08.074291'),
('wo5ddc15b4cki4l8xryc3sh8tqlg6y3d', 'NjMxOTI0NmRmZTM3MDZmODVlMTI3NDNlZTZiYzY5MGI0Njk4NDU5Yzp7InJvbGxubyI6LTEsInllYXIiOiIiLCJ1bmFtZSI6IjE1Q0U1MDAzQyIsImNtaWRfZmsiOjJ9', '2018-04-12 07:33:36.702096'),
('wtsf1sqqnorb264nklvorwcvuaj26a3h', 'M2QxNjc0YjIyZTljMDMwM2RiYmYxZmZiNmNkOGEzZjc1ZWFlZmI4NTp7InJvbGxubyI6LTEsInllYXIiOiIiLCJjbWlkX2ZrIjoxfQ==', '2018-04-08 06:10:09.932359'),
('wvgas79fh83qztziz3lyfygmqmt8vpjx', 'YzI0NjU3OTk2NTA1NjdhZjExNmNlYmRiN2NmMjJmNTFmMTIwNjhkNTp7InJvbGxubyI6LTEsInllYXIiOiIiLCJjbWlkX2ZrIjozfQ==', '2018-04-08 06:14:51.856771'),
('zwe6gyfpoknkkxq88yke6jwwiz29x935', 'NTYwZmYwYzQ3YmViYzNjZDdiYmViYTg5Mzk0Mzk0MmQzYzg5YjVkOTp7ImNtaWRfZmsiOjF9', '2018-04-08 06:14:27.607434');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `eid` int(11) NOT NULL,
  `cmid_fk` int(11) NOT NULL,
  `ename` varchar(30) NOT NULL,
  `description` varchar(40) NOT NULL,
  `date` varchar(15) NOT NULL,
  `from_hr` int(10) NOT NULL,
  `to_hr` int(10) NOT NULL,
  `room_id` int(11) NOT NULL,
  `branch` varchar(30) NOT NULL,
  `target_aud` varchar(10) NOT NULL,
  `amount` int(10) NOT NULL,
  `approve_status` int(11) NOT NULL DEFAULT '0',
  `author` varchar(80) NOT NULL,
  `event_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`eid`, `cmid_fk`, `ename`, `description`, `date`, `from_hr`, `to_hr`, `room_id`, `branch`, `target_aud`, `amount`, `approve_status`, `author`, `event_timestamp`) VALUES
(2, 2, 'Unscript2k18', 'desc', '2018-03-30', 10, 24, 511, 'CS', 'BE', 0, 1, 'sirjar raval', '2018-03-25 05:06:44'),
(8, 2, 'google IO', 'Google I/O is an annual developer confer', '2018-04-28', 10, 24, 651, 'Computer', 'BE', 0, 0, 'siraj raval', '2018-03-28 17:42:25'),
(9, 2, 'code jam', 'Google Code Jam is an international prog', '2018-04-15', 10, 24, 615, 'CS', 'BE', 100, 1, 'siraj raval', '2018-03-28 17:36:49'),
(10, 2, 'bitcamp', 'Bitcamp is a place for exploration. You ', '2018-04-15', 0, 24, 515, 'CS', 'BE', 500, 1, 'sachin jadhav', '2018-03-25 04:38:39'),
(11, 2, 'algo5', 'coding c', '2018-03-30', 10, 21, 416, 'CS', 'BE', 0, 0, 'cdhbjcss', '2018-03-25 05:02:52');

-- --------------------------------------------------------

--
-- Table structure for table `event_student`
--

CREATE TABLE `event_student` (
  `esid` int(11) NOT NULL,
  `eid_fk` int(11) NOT NULL,
  `ename` varchar(30) NOT NULL,
  `rollno_fk` varchar(11) NOT NULL,
  `date_reg` varchar(15) NOT NULL,
  `paid` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `formregister`
--

CREATE TABLE `formregister` (
  `fno` int(11) NOT NULL,
  `eid` int(11) NOT NULL,
  `ename` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `contact` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `formregister`
--

INSERT INTO `formregister` (`fno`, `eid`, `ename`, `name`, `email`, `contact`) VALUES
(1, 7, 'google IO', 'vinay', 'vinayp173@gmail.com', '0'),
(2, 7, 'google IO', '', '', ''),
(3, 8, 'google IO', 'Sachin', 'sbj276@gmail.com', '76664062'),
(4, 9, 'code jam', '', '', ''),
(5, 8, 'google IO', 'vinay', 'vinayp173@gmail.com', '0'),
(6, 8, 'google IO', '', '', ''),
(7, 2, 'Unscript2k18', 'Kiran Kumbhar', 'kiranpk189@gmail.com', '2147483647'),
(8, 2, 'Unscript2k18', '', '', ''),
(9, 2, 'Unscript2k18', 'Pawan Lokapur', 'pawangl555@gmail.com', '2147483647'),
(10, 10, 'bitcamp', '', '', ''),
(11, 11, 'algo5', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `notice`
--

CREATE TABLE `notice` (
  `nid` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(600) NOT NULL,
  `date` varchar(15) NOT NULL,
  `time` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notice`
--

INSERT INTO `notice` (`nid`, `title`, `description`, `date`, `time`) VALUES
(1, 'hackathon', 'come to 513 guys                  ', '23-02-2018', '10am - 12 am'),
(2, 'hackathon', 'come to 513 guys                  ', '23-02-2018', '10am - 12 am'),
(3, 'hackathon', 'unscript                  ', '24-03-2018', '10am - 12 am'),
(4, 'Google IO', 'Google I/O is an annual developer conference held by Google in San Francisco, California. I/O showcases technical in-depth sessions focused on building web, mobile, and enterprise applications with           ', '2018-03-30', '10am - 12 am'),
(5, 'submission of scholarship', 'please, submit your schloarship forms ealiest.                  ', '2018-04-18', '10am - 12 am'),
(6, 'ingram', 'The mail has been sent to all the eligible students.Kindly check the mail', '', ''),
(7, 'ingram', 'The mail has been sent to all the eligible students.Kindly check the mail', '', ''),
(8, 'JPMC', 'The mail has been sent to all the eligible students.Kindly check the mail', '', ''),
(9, 'ingram', 'The mail has been sent to all the eligible students.Kindly check the mail', '', ''),
(10, 'JPMC', 'The mail has been sent to all the eligible students.Kindly check the mail', '', ''),
(11, 'JPMC', 'The mail has been sent to all the eligible students.Kindly check the mail', '', ''),
(12, 'JPMC', 'The mail has been sent to all the eligible students.Kindly check the mail', '', ''),
(13, 'JPMC', 'The mail has been sent to all the eligible students.Kindly check the mail', '', ''),
(14, 'ingram', 'The mail has been sent to all the eligible students.Kindly check the mail', '', ''),
(15, 'ingram', 'The mail has been sent to all the eligible students.Kindly check the mail', '', ''),
(16, 'Mahavir Jayanti', 'Holiday on occasion of mahavir Jayanti                  ', '2018-03-28', '10:10');

-- --------------------------------------------------------

--
-- Table structure for table `offer_letter`
--

CREATE TABLE `offer_letter` (
  `oid` int(11) NOT NULL,
  `roll_no_fk` varchar(11) DEFAULT NULL,
  `company` varchar(30) DEFAULT NULL,
  `date` varchar(15) DEFAULT NULL,
  `doc_name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `offer_letter`
--

INSERT INTO `offer_letter` (`oid`, `roll_no_fk`, `company`, `date`, `doc_name`) VALUES
(4, '15CE5003', 'booting', '2018-03-25', 'BOOTEX.LOG'),
(5, '15CE5008', NULL, NULL, NULL),
(6, '14CE1068', NULL, NULL, NULL),
(7, '14CE1068', 'Fscocitey', '2018-03-25', '65.0.3325.181.manifest'),
(8, '14ce1017', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `rollno` varchar(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `year` varchar(5) NOT NULL,
  `branch` varchar(30) NOT NULL,
  `address` varchar(60) NOT NULL,
  `email` varchar(20) NOT NULL,
  `pwd` varchar(15) NOT NULL,
  `contact` int(10) NOT NULL,
  `dob` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`rollno`, `name`, `year`, `branch`, `address`, `email`, `pwd`, `contact`, `dob`) VALUES
('14ce1017', 'Pawan Lokapur', 'BE', 'CS', 'dombivli', 'pawangl555@gmail.com', 'pawan', 2147483647, '14/09/96'),
('14CE1068', 'Kiran Kumbhar', 'BE', 'CS', 'Shree, Narayan Paradise, Kalyan', 'kiranpk189@gmail.com', 'pass', 2147483647, '1996-09-18'),
('15CE5003', 'vinay', 'BE', 'CS', '403hjbdh', 'vinayp173@gmail.com', 'pass', 0, '15151ds'),
('15CE5008', 'Sachin', 'BE', 'CS', '403,Khadakpada, Kalyan(West)', 'sbj276@gmail.com', 'pass', 76664062, '2018-06-27');

-- --------------------------------------------------------

--
-- Table structure for table `student_academic`
--

CREATE TABLE `student_academic` (
  `ano` int(11) NOT NULL,
  `roll_no_fk` varchar(11) NOT NULL,
  `ssc` double DEFAULT NULL,
  `hsc` double DEFAULT NULL,
  `s1` double DEFAULT NULL,
  `s2` double DEFAULT NULL,
  `s3` double DEFAULT NULL,
  `s4` double DEFAULT NULL,
  `s5` double DEFAULT NULL,
  `s6` double DEFAULT NULL,
  `s7` double DEFAULT NULL,
  `s8` double DEFAULT NULL,
  `objective` varchar(80) DEFAULT NULL,
  `extra` varchar(200) DEFAULT NULL,
  `achievement` varchar(60) DEFAULT NULL,
  `live_kt` int(5) NOT NULL DEFAULT '0',
  `dead_kt` int(5) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_academic`
--

INSERT INTO `student_academic` (`ano`, `roll_no_fk`, `ssc`, `hsc`, `s1`, `s2`, `s3`, `s4`, `s5`, `s6`, `s7`, `s8`, `objective`, `extra`, `achievement`, `live_kt`, `dead_kt`) VALUES
(1, '15CE5003', 86, 86, 9, 9, 9, 9, 9, 9, 9, 9, 'Codering', 'sdajk', 'kjds', 0, 0),
(3, '15CE5008', 82, 82, 9, 9, 9, 9, 9, 9, 9, 9, 'To learn new things ', 'Cricket', 'runners-up of Algorithm3.0, Paper published on ML', 0, 0),
(4, '14CE1068', 92.36, 92.36, 7.7, 8.37, 8.18, 7.67, 7.67, 7.67, 7.72, 0, 'To grow knowledge', 'organizer', 'None', 0, 0),
(5, '14ce1017', 90, 90, 9, 9, 9, 9, 9, 9, 0, 0, 'Be kind', 'badminton', 'oracle certified', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `student_document`
--

CREATE TABLE `student_document` (
  `id` int(11) NOT NULL,
  `docfile` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_document`
--

INSERT INTO `student_document` (`id`, `docfile`) VALUES
(1, 'documents/allDocuments/public/code.txt'),
(2, 'documents/allDocuments/public/code_4pNyhCe.txt'),
(3, 'documents/allDocuments/public/BOOTEX.LOG'),
(4, 'documents/allDocuments/public/65.0.3325.181.manifest');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `committee`
--
ALTER TABLE `committee`
  ADD PRIMARY KEY (`cmid`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`eid`),
  ADD KEY `cmid_fk` (`cmid_fk`);

--
-- Indexes for table `event_student`
--
ALTER TABLE `event_student`
  ADD PRIMARY KEY (`esid`),
  ADD KEY `eid_fk` (`eid_fk`),
  ADD KEY `rollno_fk` (`rollno_fk`);

--
-- Indexes for table `formregister`
--
ALTER TABLE `formregister`
  ADD PRIMARY KEY (`fno`);

--
-- Indexes for table `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`nid`);

--
-- Indexes for table `offer_letter`
--
ALTER TABLE `offer_letter`
  ADD PRIMARY KEY (`oid`),
  ADD KEY `roll_no_fk` (`roll_no_fk`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`rollno`);

--
-- Indexes for table `student_academic`
--
ALTER TABLE `student_academic`
  ADD PRIMARY KEY (`ano`),
  ADD KEY `roll_no_fk` (`roll_no_fk`);

--
-- Indexes for table `student_document`
--
ALTER TABLE `student_document`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `committee`
--
ALTER TABLE `committee`
  MODIFY `cmid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `eid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `event_student`
--
ALTER TABLE `event_student`
  MODIFY `esid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `formregister`
--
ALTER TABLE `formregister`
  MODIFY `fno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `notice`
--
ALTER TABLE `notice`
  MODIFY `nid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `offer_letter`
--
ALTER TABLE `offer_letter`
  MODIFY `oid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `student_academic`
--
ALTER TABLE `student_academic`
  MODIFY `ano` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `student_document`
--
ALTER TABLE `student_document`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`cmid_fk`) REFERENCES `committee` (`cmid`);

--
-- Constraints for table `event_student`
--
ALTER TABLE `event_student`
  ADD CONSTRAINT `event_student_ibfk_1` FOREIGN KEY (`eid_fk`) REFERENCES `events` (`eid`),
  ADD CONSTRAINT `event_student_ibfk_2` FOREIGN KEY (`rollno_fk`) REFERENCES `student` (`rollno`);

--
-- Constraints for table `offer_letter`
--
ALTER TABLE `offer_letter`
  ADD CONSTRAINT `offer_letter_ibfk_1` FOREIGN KEY (`roll_no_fk`) REFERENCES `student` (`rollno`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
