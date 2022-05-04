-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2022 at 04:31 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.30

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
('admin', '$2a$12$YqYblHqDvvZhM7mvUO9U/.bPQqYr0of37owPFpTv4d.TGX8UuGJlW', NULL, NULL, 1),
('nghi', '$2a$12$jUL/zibsdD8d6Tcoo3PvAulxxFpwFLkqHhBQNUcMaTP6a1yw1Tz4.', NULL, ' 0212003', 1),
('nguyenTanPhat', '$2a$12$lwRjybHrV0sRfhvD.FNcQeQ68zQze9cXbW5jn4XR7D/Wno5mZOq62', NULL, '1911041055', 1),
('NguyenThiHuyen', '$2a$12$bMoopvSm/g.lfImp8zD68.Ej9zhnxLfqon/6mUz84sIVnZy0Lal.6', NULL, ' 0212003', 1),
('NguyenThiNga', '$2a$12$9vxJa6c7JMJ4vBsFNAdV8uxh5l0a1w3g/c.AH4OiYOxRJ4Ra3IVqi', '1911', NULL, 1),
('nguyenVanA', '$2a$12$WWj5aPLuqR7Yx7koH/b77e9MDbyk7TjRhFcX36WQs.OQMxsPrOYGi', NULL, '1912', 1),
('tanPhat', '$2a$12$hsJgE/BK5tQ.3635K130gujN2gaReuypj7kWyHdItoMhWUfPwH6Zm', NULL, '1912', 1);

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
('admin', 'ADMIN'),
('nghi', 'STUDENT'),
('nguyenTanPhat', 'STUDENT'),
('NguyenThiHuyen', 'STUDENT'),
('NguyenThiNga', 'TEACHER'),
('nguyenVanA', 'STUDENT'),
('tanPhat', 'STUDENT');

-- --------------------------------------------------------

--
-- Table structure for table `baitap`
--

CREATE TABLE `baitap` (
  `id` int(60) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `username` varchar(60) DEFAULT NULL,
  `deadline` varchar(30) DEFAULT NULL,
  `tenBaiTap` varchar(150) DEFAULT NULL,
  `noidungbaitap` varchar(255) DEFAULT NULL,
  `classID` varchar(50) DEFAULT NULL,
  `monhocID` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `baitap`
--

INSERT INTO `baitap` (`id`, `name`, `username`, `deadline`, `tenBaiTap`, `noidungbaitap`, `classID`, `monhocID`) VALUES
(7, NULL, 'NguyenThiNga', '2022-01-21', 'Bài Tập AI', '<p>Hello, World!</p>', 'C5', 'XHCN'),
(8, NULL, 'NguyenThiNga', '2022-01-20', 'Luyện tập java', '<p>Hello, World!</p>', 'C2', 'CNJV');

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

-- --------------------------------------------------------

--
-- Table structure for table `chamdiem`
--

CREATE TABLE `chamdiem` (
  `id` int(60) NOT NULL,
  `diem` int(100) DEFAULT NULL,
  `baitapId` int(60) DEFAULT NULL,
  `studentId` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chamdiem`
--

INSERT INTO `chamdiem` (`id`, `diem`, `baitapId`, `studentId`) VALUES
(1, 50, 7, '1912'),
(2, 66, 8, '1912');

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
-- Table structure for table `dktinchi`
--

CREATE TABLE `dktinchi` (
  `id` int(11) NOT NULL,
  `maSV` varchar(50) DEFAULT NULL,
  `idLopTC` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `created_by` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(8, 'Đề-cương-Trí-tuệ-nhân-tạo-2020-2021.pdf', 0, 1),
(9, 'Chuong 3.pdf', 0, 1),
(10, 'JAVA1902E_Nhom 4.rar', 0, 2),
(11, 'GraphicEQ.txt', 0, 2),
(12, 'JAVA1902E_Nhom 4.rar', 8, 0),
(13, '240_Nguyễn Tấn Phát_Trí tuệ nhân tạo.pdf', 0, 3),
(14, '243_Nguyễn Tấn Phát_Lập trình hướng đối tượng.pdf', 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `giangvien`
--

CREATE TABLE `giangvien` (
  `id` int(20) NOT NULL,
  `mgv` varchar(60) DEFAULT NULL,
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
('1222', 'Nguyễn Thị B', 40, 'Hà Nội, Nguyên Hồng', NULL, '0922211113'),
('1911', 'Nguyễn Thị Nga', 28, 'Cầu Giấy', NULL, '0899922222'),
('1930', 'Nguyễn Công A', 20, 'Số 30 Ba Đình, Hà Nội', NULL, '0955561122');

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
  `idLopTC` int(11) DEFAULT 0,
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
  `khoaHoc` int(20) DEFAULT NULL,
  `khoa` int(20) DEFAULT NULL,
  `MGV` varchar(60) DEFAULT NULL,
  `STATUS` int(1) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
('XHCN', 'Xã hội chủ nghĩa', 'C5'),
('CNJV', 'Công nghệ java', NULL),
('THCS', 'Tin học cơ sở', NULL);

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
(' 0212003', 'Nguyễn Thanh Cường', 21, '5B Ngọc Hà, phường Đội Cấn ', NULL, '0933442123', 'C5'),
('0212001', 'Nguyễn Vĩnh An', 20, '53 Linh Lang, phường Cống Vị ', NULL, '033123234', 'C2'),
('0212002', 'Nguyên Thanh Bình', 20, '189 Hồng Hà, phường Phúc Xá ', NULL, '0934547578', 'C2'),
('0212004', ' Nguyễn Quốc Duy', 23, '37 Cầu Giấy, phường Quan Hoa ', NULL, '092223124', 'C5'),
('0241060128', 'Nguyễn Minh Chín', 23, '4B Nguyễn Thiện Thuật, Hàng Bạc ', NULL, '024 3928 4055 ', 'C4'),
('0241060138', 'Nguyễn Minh Mýời', 21, '177 Tam Trinh ( 2 Lĩnh Nam), phường Mai Động ', NULL, '024 3862 8797 ', 'C4'),
('0241060148', 'Nguyễn Minh Mýời Một', 23, 'Phố Nỉ, Xã Trung Giã ', NULL, '024 3884 0360 ', 'C4'),
('0241060158', 'Nguyễn Minh Mýời Hai', 24, '231 Tân Mai, phường Tân Mai ', NULL, '024 3864 2702 ', 'C4'),
('0241060168', 'Nguyễn Minh Mýời Ba', 24, '461 Trương Định, phường Tân Mai ', NULL, '024 3864 1973 ', 'C4'),
('0241060178', 'Nguyễn Minh Mýời Bốn', 22, 'Khu đô thị mới Đền Lừ Hoàng Văn Thụ, quận Hoàng Mai ', NULL, '024 3633 1767', 'C6'),
('0241060218', 'Nguyễn Minh Một', 23, '126 Đại La, phường Đồng Tâm ', NULL, '024 3869 7831', 'C5'),
('0241060318', 'Nguyễn Minh Hai', 20, '6 Trần Cao Vân, Phố Huế ', NULL, '024 3976 2191', 'C2'),
('0241060418', 'Nguyễn Minh Ba', 20, '79 Huế, Ngô Thì Nhậm ', NULL, '024 3943 6172 ', 'C2'),
('0241060518', 'Nguyễn Minh Bốn', 30, 'Số 459 Bạch Mai, phường Trương Định  ', NULL, '024 3863 3023', 'C2'),
('0241060618', 'Nguyễn Minh Nãm', 22, '5 Đống Mác, phường Đông Mác ', NULL, '024 3972 5828 ', 'C2'),
('0241060718', 'Nguyễn Minh Sáu', 23, '2 Yên Bái 1, phường Phố Huế  ', NULL, '024 3821 5044 ', 'C2'),
('0241060818', 'Nguyễn Minh Bảy', 20, 'Đường Đồng Xuân, phường Đồng Xuân', NULL, '024 3825 7832 ', 'C4'),
('0241060918', 'Nguyễn Minh Tám', 23, '4B Nguyễn Thiện Thuật, Hàng Bạc ', NULL, '024 3928 4055 ', 'C4'),
('0241060978', 'Nguyễn Minh Mýời Nãm', 23, '464 Âu Cơ, phường Phú Thượng ', NULL, '024 3719 8243 ', 'C6'),
('0311001', 'Phan Tuấn Anh', 21, '24 Nghĩa Tân, phường Nghĩa Tân ', NULL, '024 3791 2763', 'C5'),
('0311002', 'Huỳnh Thanh Sang', 22, '14 Nguyễn Như Đổ, phường Văn Miếu ', NULL, '024 3732 3450 ', 'C5'),
('1222', 'Nguyễn Thị B', 30, 'Số 7 Ba đình, Thành Công', NULL, '09222111333', 'C5'),
('123', 'Phát Tấn Nguyễn', 21, 'số nhà 17 ngõ 7 nguyên hồng, thành công', NULL, '0966085995', 'C6'),
('1911041055', 'Nguyễn Tấn Phát', 18, 'Hà nội', NULL, '0966085995', 'C5'),
('1911061044', 'Nguyễn Tấn Phát', 20, 'Hà nội', NULL, '09660850995', 'C5'),
('1912', 'Nguyễn Văn A', 20, 'Hà Nội', NULL, '099994444', 'C2');

-- --------------------------------------------------------

--
-- Table structure for table `sinhvien2`
--

CREATE TABLE `sinhvien2` (
  `id` varchar(50) DEFAULT NULL,
  `msv` varchar(50) DEFAULT NULL,
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

-- --------------------------------------------------------

--
-- Table structure for table `studentbaitap`
--

CREATE TABLE `studentbaitap` (
  `id` int(60) NOT NULL,
  `username` varchar(60) DEFAULT NULL,
  `baiTapId` int(60) DEFAULT NULL,
  `lienket` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `studentbaitap`
--

INSERT INTO `studentbaitap` (`id`, `username`, `baiTapId`, `lienket`) VALUES
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
-- Indexes for table `baitap`
--
ALTER TABLE `baitap`
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
-- Indexes for table `dktinchi`
--
ALTER TABLE `dktinchi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `giangvien`
--
ALTER TABLE `giangvien`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `studentbaitap`
--
ALTER TABLE `studentbaitap`
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
-- AUTO_INCREMENT for table `baitap`
--
ALTER TABLE `baitap`
  MODIFY `id` int(60) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `bangcap`
--
ALTER TABLE `bangcap`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `dktinchi`
--
ALTER TABLE `dktinchi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(60) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `lichhoc`
--
ALTER TABLE `lichhoc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `studentbaitap`
--
ALTER TABLE `studentbaitap`
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
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`teacherId`) REFERENCES `giaovien` (`id`),
  ADD CONSTRAINT `account_ibfk_2` FOREIGN KEY (`studentId`) REFERENCES `sinhvien` (`id`);

--
-- Constraints for table `authorities`
--
ALTER TABLE `authorities`
  ADD CONSTRAINT `fk_authorities_users` FOREIGN KEY (`username`) REFERENCES `account` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
