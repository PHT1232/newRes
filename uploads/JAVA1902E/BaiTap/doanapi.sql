-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 19, 2022 at 12:21 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `doanapi`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `username` varchar(60) NOT NULL,
  `password` varchar(60) DEFAULT NULL,
  `teacherId` varchar(50) DEFAULT NULL,
  `studentId` varchar(50) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`username`, `password`, `teacherId`, `studentId`, `enabled`) VALUES
('NguyenTanTai', '$2a$12$uW2dzBMe0YdweshT/ZAqWOicX7.B7jAM64auD0GvtBG43N/0RU2Su', '1231', NULL, 1),
('NguyenThiHoang', '$2a$12$uW2dzBMe0YdweshT/ZAqWOicX7.B7jAM64auD0GvtBG43N/0RU2Su', NULL, '0212001', 1),
('NguyenThiNga', '$2a$12$uW2dzBMe0YdweshT/ZAqWOicX7.B7jAM64auD0GvtBG43N/0RU2Su', '1222', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `authorities`
--

CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `authorities`
--

INSERT INTO `authorities` (`username`, `authority`) VALUES
('NguyenTanTai', 'TEACHER'),
('NguyenThiHoang', 'STUDENT'),
('NguyenThiNga', 'TEACHER');

-- --------------------------------------------------------

--
-- Table structure for table `baiTap`
--

CREATE TABLE `baiTap` (
  `id` int(60) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `username` varchar(60) DEFAULT NULL,
  `deadline` varchar(30) DEFAULT NULL,
  `tenBaiTap` varchar(150) DEFAULT NULL,
  `noidungbaitap` varchar(255) DEFAULT NULL,
  `loptinchiid` varchar(50) DEFAULT NULL,
  `lopql` varchar(50) DEFAULT NULL,
  `thangDiem` int(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `baiTap`
--

INSERT INTO `baiTap` (`id`, `name`, `username`, `deadline`, `tenBaiTap`, `noidungbaitap`, `loptinchiid`, `lopql`, `thangDiem`) VALUES
(7, NULL, 'NguyenThiNga', '2022-01-21', 'B??i T???p AI', '<p>Hello, World!</p>', 'JAVA1902E', '', 0),
(8, NULL, 'NguyenThiNga', '2022-01-20', 'Luy???n t???p java', '<p>Hello, World!</p>', 'JAVA1902E', '', 0),
(9, NULL, 'NguyenThiNga', '2022-01-22', 'Luyen thi triet hoc', '<p>Hay ke ten cac nha triet hoc noi tieng</p>', 'XHKH', NULL, 0),
(12, NULL, 'NguyenThiNga', '2022-05-18', 'B??i t???p ng??y 12/5', '<p>C&aacute;c em h&atilde;y t&igrave;m hi???u th&ecirc;m v??? c&aacute;c nh&agrave; tri???t h???c n???i ti???ng c???a Vi???t Nam</p>', 'XHKH', NULL, 80),
(13, NULL, 'NguyenThiNga', '2022-05-25', 'B??i t???p object', '<p>C&aacute;c em v??? h&atilde;y t&igrave;m hi???u th&ecirc;m v??? ?????i t?????ng trong java nh&eacute;</p>', 'JAVA1902E', NULL, 100),
(14, NULL, 'NguyenThiNga', '2022-05-20', 'B??i t???p jsp', '<p>C&aacute;c em v??? nghi&ecirc;n c???u th&ecirc;m v??? jsp nh&eacute;</p>', 'JAVA1902E', NULL, 50);

-- --------------------------------------------------------

--
-- Table structure for table `bangcap`
--

CREATE TABLE `bangcap` (
  `id` int(11) NOT NULL,
  `TenBangCap` varchar(50) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bangcap`
--

INSERT INTO `bangcap` (`id`, `TenBangCap`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'C??? nh??n', NULL, '2022-05-11 08:07:23', '2022-05-12 08:34:37');

-- --------------------------------------------------------

--
-- Table structure for table `chamdiem`
--

CREATE TABLE `chamdiem` (
  `id` int(60) NOT NULL,
  `diem` int(100) DEFAULT NULL,
  `thangDiem` int(30) NOT NULL,
  `baitapId` int(60) DEFAULT NULL,
  `studentId` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chamdiem`
--

INSERT INTO `chamdiem` (`id`, `diem`, `thangDiem`, `baitapId`, `studentId`) VALUES
(1, 50, 0, 7, '1912'),
(2, 66, 0, 8, '1912');

-- --------------------------------------------------------

--
-- Table structure for table `danghoc`
--

CREATE TABLE `danghoc` (
  `id` int(40) NOT NULL,
  `classid` varchar(50) NOT NULL,
  `idMon` varchar(50) DEFAULT NULL,
  `idTeacher` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `danghoc`
--

INSERT INTO `danghoc` (`id`, `classid`, `idMon`, `idTeacher`) VALUES
(2, 'C5', 'XHCN', '1911'),
(4, 'C2', 'CNJV', '1911'),
(5, 'C4', 'CNJV', '1930'),
(6, 'C5', 'THCS', '1930');

-- --------------------------------------------------------

--
-- Table structure for table `dkTinChi`
--

CREATE TABLE `dkTinChi` (
  `id` int(11) NOT NULL,
  `maSV` varchar(50) DEFAULT NULL,
  `idLopTC` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `created_by` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dkTinChi`
--

INSERT INTO `dkTinChi` (`id`, `maSV`, `idLopTC`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, '0212001', 'JAVA1902E', 0, NULL, '2022-05-08 15:32:35', '2022-05-10 09:42:12');

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(60) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `baiTapId` int(60) DEFAULT NULL,
  `nopBaiTapId` int(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `filename`, `baiTapId`, `nopBaiTapId`) VALUES
(3, 'Chuong 4.pdf', 7, 0),
(4, 'Chuong 2.pdf', 7, 0),
(8, '?????-c????ng-Tr??-tu???-nh??n-t???o-2020-2021.pdf', 0, 1),
(9, 'Chuong 3.pdf', 0, 1),
(10, 'JAVA1902E_Nhom 4.rar', 0, 2),
(11, 'GraphicEQ.txt', 0, 2),
(12, 'JAVA1902E_Nhom 4.rar', 8, 0),
(13, '240_Nguy???n T???n Ph??t_Tr?? tu??? nh??n t???o.pdf', 0, 3),
(14, '243_Nguy???n T???n Ph??t_L???p tr??nh h?????ng ?????i t?????ng.pdf', 0, 3),
(17, 'Screenshot from 2022-05-12 10.12.11.png', 12, 0),
(18, 'Screenshot from 2022-05-12 09.55.47.png', 12, 0),
(19, '188_Nguy???n T???n Ph??t_An to??n v?? b???o m???t h??? th???ng th??ng tin.docx', 13, 0),
(20, '200_NguyenQuangTruong.docx', 13, 0),
(21, '200_NguyenQuangTruong.docx', 14, 0);

-- --------------------------------------------------------

--
-- Table structure for table `giangVien`
--

CREATE TABLE `giangVien` (
  `mgv` varchar(50) NOT NULL,
  `tenGV` varchar(80) DEFAULT NULL,
  `idkhoa` varchar(50) DEFAULT NULL,
  `idBangCap` int(11) DEFAULT NULL,
  `quequan` varchar(60) DEFAULT NULL,
  `avatar` varchar(60) DEFAULT NULL,
  `STATUS` int(1) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `giangVien`
--

INSERT INTO `giangVien` (`mgv`, `tenGV`, `idkhoa`, `idBangCap`, `quequan`, `avatar`, `STATUS`, `birthday`, `created_by`, `created_at`, `updated_at`) VALUES
('1222', 'Nguy???n Th??? Nga', 'cntt', 1, 'H?? N???i', NULL, 1, '1992-05-07 01:09:53', NULL, '2022-05-06 18:09:33', '2022-05-09 10:45:21'),
('1231', 'Nguyen Tan Tai', 'CNTT', 1, 'Ha Noi', NULL, 1, '1980-09-12 00:00:00', NULL, '2022-05-11 08:08:24', '2022-05-11 08:08:24');

-- --------------------------------------------------------

--
-- Table structure for table `giaovien`
--

CREATE TABLE `giaovien` (
  `id` varchar(50) NOT NULL,
  `name` varchar(70) DEFAULT NULL,
  `age` int(50) DEFAULT NULL,
  `address` varchar(80) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `sdt` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `giaovien`
--

INSERT INTO `giaovien` (`id`, `name`, `age`, `address`, `picture`, `sdt`) VALUES
('1222', 'Nguy???n Th??? B', 40, 'H?? N???i, Nguy??n H???ng', NULL, '0922211113'),
('1911', 'Nguy???n Th??? Nga', 28, 'C???u Gi???y', NULL, '0899922222'),
('1930', 'Nguy???n C??ng A', 20, 'S??? 30 Ba ????nh, H?? N???i', NULL, '0955561122');

-- --------------------------------------------------------

--
-- Table structure for table `khoa`
--

CREATE TABLE `khoa` (
  `id` varchar(50) NOT NULL DEFAULT '',
  `tenKhoa` varchar(60) DEFAULT NULL,
  `STATUS` int(1) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `khoa`
--

INSERT INTO `khoa` (`id`, `tenKhoa`, `STATUS`, `created_by`, `created_at`, `updated_at`) VALUES
('CNTT', 'C??ng ngh??? th??ng tin', 1, NULL, '2022-05-06 18:58:52', '2022-05-06 18:58:53'),
('THTG', 'Tri???t h???c th??? gi???i', 1, NULL, '2022-05-11 07:50:25', '2022-05-12 08:36:02');

-- --------------------------------------------------------

--
-- Table structure for table `khoahoc`
--

CREATE TABLE `khoahoc` (
  `id` varchar(50) NOT NULL DEFAULT 'AUTO_INCREMENT',
  `TenKhoa` varchar(50) DEFAULT '0',
  `status` int(11) DEFAULT 0,
  `created_by` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `lichhoc`
--

CREATE TABLE `lichhoc` (
  `id` int(11) NOT NULL,
  `idLopTC` varchar(50) DEFAULT NULL,
  `NgayBatDau` datetime DEFAULT NULL,
  `NgayKetThuc` datetime DEFAULT NULL,
  `GioHoc` time DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `lienket`
--

CREATE TABLE `lienket` (
  `id` int(255) NOT NULL,
  `lienket` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `lophoc`
--

CREATE TABLE `lophoc` (
  `id` varchar(50) NOT NULL,
  `name` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lophoc`
--

INSERT INTO `lophoc` (`id`, `name`) VALUES
('C2', 'DH9C2'),
('C4', 'DH9C4'),
('C5', 'DH9C5'),
('C6', 'DH9C6'),
('C7', 'DH9C7');

-- --------------------------------------------------------

--
-- Table structure for table `lopql`
--

CREATE TABLE `lopql` (
  `id` varchar(50) NOT NULL DEFAULT '',
  `tenLop` varchar(60) DEFAULT NULL,
  `khoaHoc` varchar(50) DEFAULT NULL,
  `khoa` varchar(50) DEFAULT NULL,
  `MGV` varchar(60) DEFAULT NULL,
  `STATUS` int(1) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lopql`
--

INSERT INTO `lopql` (`id`, `tenLop`, `khoaHoc`, `khoa`, `MGV`, `STATUS`, `created_by`, `created_at`, `updated_at`) VALUES
('DH9C5', '?????i H???c 9C5', 'CNTT', NULL, '1222', 1, NULL, '2022-05-08 14:47:44', '2022-05-08 14:47:57');

-- --------------------------------------------------------

--
-- Table structure for table `loptinchi`
--

CREATE TABLE `loptinchi` (
  `id` varchar(50) NOT NULL DEFAULT 'AUTO_INCREMENT',
  `TenLopTC` varchar(50) DEFAULT NULL,
  `idKhoa` varchar(50) DEFAULT NULL,
  `idKhoaHoc` varchar(50) DEFAULT NULL,
  `idMon` varchar(50) DEFAULT NULL,
  `MaGV` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT -1,
  `created_by` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `loptinchi`
--

INSERT INTO `loptinchi` (`id`, `TenLopTC`, `idKhoa`, `idKhoaHoc`, `idMon`, `MaGV`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
('JAVA1022', 'Lop java 1022', 'CNTT', NULL, 'CNJV', '1231', 1, NULL, '2022-05-11 08:11:04', '2022-05-11 08:11:04'),
('JAVA1902E', 'L???p JAVA 1902E', 'CNTT', NULL, 'CNJV', '1222', 1, NULL, '2022-05-06 18:59:41', '2022-05-06 19:00:39'),
('XHKH', 'X?? h???i ch??? ngh??a', 'THTG', NULL, 'MLIN', '1222', 1, NULL, '2022-05-11 07:53:03', '2022-05-12 08:34:20');

-- --------------------------------------------------------

--
-- Table structure for table `mon`
--

CREATE TABLE `mon` (
  `id` varchar(50) NOT NULL DEFAULT '',
  `tenMon` varchar(60) DEFAULT NULL,
  `idkhoa` varchar(50) DEFAULT NULL,
  `soTinChi` int(30) DEFAULT NULL,
  `soTietHoc` int(30) DEFAULT NULL,
  `STATUS` int(1) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mon`
--

INSERT INTO `mon` (`id`, `tenMon`, `idkhoa`, `soTinChi`, `soTietHoc`, `STATUS`, `created_by`, `created_at`, `updated_at`) VALUES
('CNJV', 'C??ng ngh??? java', 'CNTT', 3, 12, 1, NULL, '2022-05-06 18:58:07', '2022-05-06 18:58:26'),
('MLIN', 'Mac Lenin', 'THTG', 3, 16, 1, NULL, '2022-05-11 07:52:03', '2022-05-11 07:52:03');

-- --------------------------------------------------------

--
-- Table structure for table `monhoc`
--

CREATE TABLE `monhoc` (
  `id` varchar(155) DEFAULT NULL,
  `monName` varchar(155) DEFAULT NULL,
  `classId` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `monhoc`
--

INSERT INTO `monhoc` (`id`, `monName`, `classId`) VALUES
('XHCN', 'X?? h???i ch??? ngh??a', 'C5'),
('CNJV', 'C??ng ngh??? java', NULL),
('THCS', 'Tin h???c c?? s???', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sinhvien`
--

CREATE TABLE `sinhvien` (
  `id` varchar(50) NOT NULL,
  `name` varchar(70) DEFAULT NULL,
  `age` int(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `sdt` varchar(20) DEFAULT NULL,
  `classid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sinhvien`
--

INSERT INTO `sinhvien` (`id`, `name`, `age`, `address`, `picture`, `sdt`, `classid`) VALUES
(' 0212003', 'Nguy???n Thanh C?????ng', 21, '5B Ng???c H??, ph?????ng ?????i C???n ', NULL, '0933442123', 'C5'),
('0212001', 'Nguy???n V??nh An', 20, '53 Linh Lang, ph?????ng C???ng V??? ', NULL, '033123234', 'C2'),
('0212002', 'Nguy??n Thanh B??nh', 20, '189 H???ng H??, ph?????ng Ph??c X?? ', NULL, '0934547578', 'C2'),
('0212004', ' Nguy???n Qu???c Duy', 23, '37 C???u Gi???y, ph?????ng Quan Hoa ', NULL, '092223124', 'C5'),
('0241060128', 'Nguy???n Minh Ch??n', 23, '4B Nguy???n Thi???n Thu???t, H??ng B???c ', NULL, '024 3928 4055 ', 'C4'),
('0241060138', 'Nguy???n Minh M?????i', 21, '177 Tam Trinh ( 2 L??nh Nam), ph?????ng Mai ?????ng ', NULL, '024 3862 8797 ', 'C4'),
('0241060148', 'Nguy???n Minh M?????i M???t', 23, 'Ph??? N???, X?? Trung Gi?? ', NULL, '024 3884 0360 ', 'C4'),
('0241060158', 'Nguy???n Minh M?????i Hai', 24, '231 T??n Mai, ph?????ng T??n Mai ', NULL, '024 3864 2702 ', 'C4'),
('0241060168', 'Nguy???n Minh M?????i Ba', 24, '461 Tr????ng ?????nh, ph?????ng T??n Mai ', NULL, '024 3864 1973 ', 'C4'),
('0241060178', 'Nguy???n Minh M?????i B???n', 22, 'Khu ???? th??? m???i ?????n L??? Ho??ng V??n Th???, qu???n Ho??ng Mai ', NULL, '024 3633 1767', 'C6'),
('0241060218', 'Nguy???n Minh M???t', 23, '126 ?????i La, ph?????ng ?????ng T??m ', NULL, '024 3869 7831', 'C5'),
('0241060318', 'Nguy???n Minh Hai', 20, '6 Tr???n Cao V??n, Ph??? Hu??? ', NULL, '024 3976 2191', 'C2'),
('0241060418', 'Nguy???n Minh Ba', 20, '79 Hu???, Ng?? Th?? Nh???m ', NULL, '024 3943 6172 ', 'C2'),
('0241060518', 'Nguy???n Minh B???n', 30, 'S??? 459 B???ch Mai, ph?????ng Tr????ng ?????nh  ', NULL, '024 3863 3023', 'C2'),
('0241060618', 'Nguy???n Minh N??m', 22, '5 ?????ng M??c, ph?????ng ????ng M??c ', NULL, '024 3972 5828 ', 'C2'),
('0241060718', 'Nguy???n Minh S??u', 23, '2 Y??n B??i 1, ph?????ng Ph??? Hu???  ', NULL, '024 3821 5044 ', 'C2'),
('0241060818', 'Nguy???n Minh B???y', 20, '???????ng ?????ng Xu??n, ph?????ng ?????ng Xu??n', NULL, '024 3825 7832 ', 'C4'),
('0241060918', 'Nguy???n Minh T??m', 23, '4B Nguy???n Thi???n Thu???t, H??ng B???c ', NULL, '024 3928 4055 ', 'C4'),
('0241060978', 'Nguy???n Minh M?????i N??m', 23, '464 ??u C??, ph?????ng Ph?? Th?????ng ', NULL, '024 3719 8243 ', 'C6'),
('0311001', 'Phan Tu???n Anh', 21, '24 Ngh??a T??n, ph?????ng Ngh??a T??n ', NULL, '024 3791 2763', 'C5'),
('0311002', 'Hu???nh Thanh Sang', 22, '14 Nguy???n Nh?? ?????, ph?????ng V??n Mi???u ', NULL, '024 3732 3450 ', 'C5'),
('1222', 'Nguy???n Th??? B', 30, 'S??? 7 Ba ????nh, Th??nh C??ng', NULL, '09222111333', 'C5'),
('123', 'Ph??t T???n Nguy???n', 21, 's??? nh?? 17 ng?? 7 nguy??n h???ng, th??nh c??ng', NULL, '0966085995', 'C6'),
('1911041055', 'Nguy???n T???n Ph??t', 18, 'H?? n???i', NULL, '0966085995', 'C5'),
('1911061044', 'Nguy???n T???n Ph??t', 20, 'H?? n???i', NULL, '09660850995', 'C5'),
('1912', 'Nguy???n V??n A', 20, 'H?? N???i', NULL, '099994444', 'C2');

-- --------------------------------------------------------

--
-- Table structure for table `sinhvien2`
--

CREATE TABLE `sinhvien2` (
  `msv` varchar(50) NOT NULL,
  `tensv` varchar(50) DEFAULT NULL,
  `idkhoahoc` varchar(50) DEFAULT NULL,
  `idkhoa` varchar(50) DEFAULT NULL,
  `quequan` varchar(50) DEFAULT NULL,
  `avatar` varchar(50) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `birthday` varchar(50) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sinhvien2`
--

INSERT INTO `sinhvien2` (`msv`, `tensv`, `idkhoahoc`, `idkhoa`, `quequan`, `avatar`, `STATUS`, `birthday`, `created_by`, `created_at`, `updated_at`) VALUES
('0212001', 'Nguy???n Th??? Ho??ng', NULL, 'CNTT', '53 Linh Lang, ph?????ng C???ng V??? ', NULL, 1, '19-08-2000', NULL, '2022-05-07 02:02:22', '2022-05-07 02:02:24');

-- --------------------------------------------------------

--
-- Table structure for table `studentBaiTap`
--

CREATE TABLE `studentBaiTap` (
  `id` int(60) NOT NULL,
  `username` varchar(60) DEFAULT NULL,
  `baiTapId` int(60) DEFAULT NULL,
  `lienket` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `studentBaiTap`
--

INSERT INTO `studentBaiTap` (`id`, `username`, `baiTapId`, `lienket`) VALUES
(1, 'tanPhat', 7, 'https://google.com'),
(2, 'NguyenThiHuyen', 7, ''),
(3, 'tanPhat', 8, '');

-- --------------------------------------------------------

--
-- Table structure for table `svlopql`
--

CREATE TABLE `svlopql` (
  `id` int(20) NOT NULL,
  `MASV` varchar(60) DEFAULT NULL,
  `maLopQL` varchar(50) DEFAULT NULL,
  `STATUS` int(1) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `svlopql`
--

INSERT INTO `svlopql` (`id`, `MASV`, `maLopQL`, `STATUS`, `created_by`, `created_at`, `updated_at`) VALUES
(0, '0212001', 'DH9C5\r\n', 1, NULL, '2022-05-06 19:04:11', '2022-05-09 10:19:02');

-- --------------------------------------------------------

--
-- Table structure for table `tailieuhoc`
--

CREATE TABLE `tailieuhoc` (
  `id` int(11) NOT NULL,
  `idLopTC` varchar(50) NOT NULL DEFAULT '',
  `TenFile` varchar(50) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_by` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(20) NOT NULL,
  `username` varchar(60) DEFAULT NULL,
  `PASSWORD` varchar(70) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `STATUS` int(1) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`username`),
  ADD KEY `teacherId` (`teacherId`),
  ADD KEY `studentId` (`studentId`);

--
-- Indexes for table `authorities`
--
ALTER TABLE `authorities`
  ADD UNIQUE KEY `ix_auth_username` (`username`,`authority`);

--
-- Indexes for table `baiTap`
--
ALTER TABLE `baiTap`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bangcap`
--
ALTER TABLE `bangcap`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chamdiem`
--
ALTER TABLE `chamdiem`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `danghoc`
--
ALTER TABLE `danghoc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classId` (`idMon`),
  ADD KEY `idTeacher` (`idTeacher`);

--
-- Indexes for table `dkTinChi`
--
ALTER TABLE `dkTinChi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `giangVien`
--
ALTER TABLE `giangVien`
  ADD PRIMARY KEY (`mgv`);

--
-- Indexes for table `giaovien`
--
ALTER TABLE `giaovien`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `khoa`
--
ALTER TABLE `khoa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `khoahoc`
--
ALTER TABLE `khoahoc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lichhoc`
--
ALTER TABLE `lichhoc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lienket`
--
ALTER TABLE `lienket`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lophoc`
--
ALTER TABLE `lophoc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lopql`
--
ALTER TABLE `lopql`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loptinchi`
--
ALTER TABLE `loptinchi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mon`
--
ALTER TABLE `mon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sinhvien`
--
ALTER TABLE `sinhvien`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sinhvien2`
--
ALTER TABLE `sinhvien2`
  ADD PRIMARY KEY (`msv`);

--
-- Indexes for table `studentBaiTap`
--
ALTER TABLE `studentBaiTap`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `svlopql`
--
ALTER TABLE `svlopql`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tailieuhoc`
--
ALTER TABLE `tailieuhoc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `baiTap`
--
ALTER TABLE `baiTap`
  MODIFY `id` int(60) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `bangcap`
--
ALTER TABLE `bangcap`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `chamdiem`
--
ALTER TABLE `chamdiem`
  MODIFY `id` int(60) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `danghoc`
--
ALTER TABLE `danghoc`
  MODIFY `id` int(40) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `dkTinChi`
--
ALTER TABLE `dkTinChi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(60) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `lichhoc`
--
ALTER TABLE `lichhoc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `studentBaiTap`
--
ALTER TABLE `studentBaiTap`
  MODIFY `id` int(60) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tailieuhoc`
--
ALTER TABLE `tailieuhoc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `FK_account_giangvien` FOREIGN KEY (`teacherId`) REFERENCES `giangVien` (`mgv`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_account_sinhvien2` FOREIGN KEY (`studentId`) REFERENCES `sinhvien2` (`msv`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `authorities`
--
ALTER TABLE `authorities`
  ADD CONSTRAINT `fk_authorities_users` FOREIGN KEY (`username`) REFERENCES `account` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
