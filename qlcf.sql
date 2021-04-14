-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 14, 2021 lúc 06:42 AM
-- Phiên bản máy phục vụ: 10.4.6-MariaDB
-- Phiên bản PHP: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `qlcf`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `catorder`
--

CREATE TABLE `catorder` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `catorder`
--

INSERT INTO `catorder` (`Id`, `Name`) VALUES
(1, 'Tại Quầy'),
(2, 'Ship'),
(3, 'Mang đi');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `catuser`
--

CREATE TABLE `catuser` (
  `Id` int(11) NOT NULL,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `catuser`
--

INSERT INTO `catuser` (`Id`, `Name`) VALUES
(1, 'Administrator'),
(2, 'Admin'),
(3, 'Nhân viên'),
(4, 'Khách hàng'),
(5, 'Tạp nham');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `MenuID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Name` text COLLATE utf8_unicode_ci NOT NULL,
  `Quantum` int(11) NOT NULL,
  `CreateDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `comment`
--

INSERT INTO `comment` (`id`, `MenuID`, `UserID`, `Name`, `Quantum`, `CreateDate`) VALUES
(1, 5, 1, 'Hay', 1, '2021-04-05 08:39:06'),
(2, 5, 1, 'Ngon', 1, '2021-04-05 10:43:03'),
(3, 5, 1, 'Ngon', 1, '2021-04-05 10:44:27'),
(4, 5, 1, 'Tuyệt Quá', 1, '2021-04-05 10:45:38'),
(5, 5, 1, 'Tuyệt Quá', 1, '2021-04-05 10:45:46'),
(6, 5, 1, 'Tuyệt Quá', 1, '2021-04-05 10:45:51'),
(7, 5, 1, 'Giá rẻ quá', 1, '2021-04-05 10:52:05'),
(8, 7, 1, 'Trà ngon', 1, '2021-04-08 10:10:32'),
(9, 2, 1, '', 1, '2021-04-08 10:27:18');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `favourite`
--

CREATE TABLE `favourite` (
  `Id` int(11) NOT NULL,
  `MenuID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Quantum` int(11) NOT NULL,
  `CreateDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `favourite`
--

INSERT INTO `favourite` (`Id`, `MenuID`, `UserID`, `Name`, `Quantum`, `CreateDate`) VALUES
(11, 6, 1, 'like', 1, '2021-04-05 12:37:03'),
(12, 5, 1, 'like', 1, '2021-04-05 12:37:26'),
(15, 7, 1, 'like', 1, '2021-04-08 17:10:23'),
(16, 5, 8, 'like', 2, '2021-04-08 22:13:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `OrderProductID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` int(3) NOT NULL,
  `Price` decimal(10,0) NOT NULL,
  `CreateDate` datetime NOT NULL DEFAULT current_timestamp(),
  `LastUpdate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `item`
--

INSERT INTO `item` (`id`, `OrderProductID`, `ProductID`, `Quantity`, `Price`, `CreateDate`, `LastUpdate`) VALUES
(1, 11, 2, 1, '19000', '2021-04-04 20:28:35', '2021-04-04 20:28:35'),
(2, 13, 2, 1, '19000', '2021-04-05 18:49:53', '2021-04-05 18:49:53'),
(3, 15, 5, 1, '23000', '2021-04-05 19:27:47', '2021-04-05 19:27:47'),
(4, 17, 5, 1, '23000', '2021-04-05 21:28:48', '2021-04-05 21:28:48'),
(5, 19, 6, 1, '23000', '2021-04-05 21:50:29', '2021-04-05 21:50:29'),
(6, 21, 6, 1, '23000', '2021-04-05 21:57:49', '2021-04-05 21:57:49'),
(7, 23, 1, 1, '21000', '2021-04-05 22:06:34', '2021-04-05 22:06:34'),
(8, 25, 6, 1, '23000', '2021-04-05 22:36:21', '2021-04-05 22:36:21'),
(9, 27, 6, 1, '23000', '2021-04-08 11:27:44', '2021-04-08 11:27:44');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menu`
--

CREATE TABLE `menu` (
  `Id` int(11) NOT NULL,
  `Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ParentID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `menu`
--

INSERT INTO `menu` (`Id`, `Name`, `ParentID`) VALUES
(1, 'Cà Phê', 0),
(2, 'Cà Phê Sữa', 1),
(3, 'Cà Phê Phin Đen', 1),
(4, 'Trà', 0),
(5, 'Trà Ô Long', 4),
(6, 'Trà Đào', 4),
(7, 'Trà Nho', 4),
(8, 'Trà Chanh', 4),
(9, 'Trà Đen', 4),
(11, 'Trà Chanh Xí muội', 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderproduct`
--

CREATE TABLE `orderproduct` (
  `Id` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Total` decimal(10,0) NOT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT 0,
  `CreateDate` datetime NOT NULL DEFAULT current_timestamp(),
  `LastUpdate` datetime NOT NULL DEFAULT current_timestamp(),
  `CatOrder` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orderproduct`
--

INSERT INTO `orderproduct` (`Id`, `UserID`, `Total`, `Status`, `CreateDate`, `LastUpdate`, `CatOrder`) VALUES
(4, 1, '19000', 0, '2021-04-04 11:16:42', '2021-04-04 11:16:42', 1),
(5, 8, '23000', 0, '2021-04-04 11:17:31', '2021-04-04 11:17:31', 1),
(6, 1, '23000', 0, '2021-04-04 11:19:40', '2021-04-04 11:19:40', 1),
(7, 1, '19000', 0, '2021-04-04 20:15:05', '2021-04-04 20:15:05', 1),
(8, 1, '23000', 0, '2021-04-04 20:17:32', '2021-04-04 20:17:32', 1),
(9, 1, '23000', 0, '2021-04-04 20:20:25', '2021-04-04 20:20:25', 1),
(10, 1, '23000', 0, '2021-04-04 20:21:23', '2021-04-04 20:21:23', 1),
(11, 1, '19000', 0, '2021-04-04 20:28:35', '2021-04-04 20:28:35', 1),
(12, 1, '19000', 0, '2021-04-04 20:28:35', '2021-04-04 20:28:35', 1),
(13, 1, '19000', 0, '2021-04-05 18:49:52', '2021-04-05 18:49:52', 1),
(14, 1, '19000', 0, '2021-04-05 18:49:53', '2021-04-05 18:49:53', 1),
(15, 1, '23000', 0, '2021-04-05 19:27:47', '2021-04-05 19:27:47', 1),
(16, 1, '23000', 0, '2021-04-05 19:27:47', '2021-04-05 19:27:47', 1),
(17, 1, '23000', 0, '2021-04-05 21:28:47', '2021-04-05 21:28:47', 1),
(18, 1, '23000', 0, '2021-04-05 21:28:48', '2021-04-05 21:28:48', 1),
(19, 1, '23000', 0, '2021-04-05 21:50:28', '2021-04-05 21:50:28', 2),
(20, 1, '23000', 0, '2021-04-05 21:50:28', '2021-04-05 21:50:28', 2),
(21, 1, '23000', 0, '2021-04-05 21:57:49', '2021-04-05 21:57:49', 2),
(22, 1, '23000', 0, '2021-04-05 21:57:49', '2021-04-05 21:57:49', 2),
(23, 1, '21000', 0, '2021-04-05 22:06:34', '2021-04-05 22:06:34', 1),
(24, 1, '21000', 0, '2021-04-05 22:06:34', '2021-04-05 22:06:34', 1),
(25, 1, '42000', 0, '2021-04-05 22:36:21', '2021-04-05 22:36:21', 2),
(26, 1, '42000', 0, '2021-04-05 22:36:21', '2021-04-05 22:36:21', 2),
(27, 8, '46000', 0, '2021-04-08 11:27:43', '2021-04-08 11:27:43', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permission`
--

CREATE TABLE `permission` (
  `Id` int(11) NOT NULL,
  `CatUserID` int(11) NOT NULL,
  `AddPer` tinyint(1) NOT NULL DEFAULT 0,
  `EditPer` tinyint(1) NOT NULL DEFAULT 0,
  `DelPer` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `permission`
--

INSERT INTO `permission` (`Id`, `CatUserID`, `AddPer`, `EditPer`, `DelPer`) VALUES
(1, 1, 1, 1, 1),
(2, 2, 1, 1, 1),
(3, 3, 1, 1, 1),
(4, 4, 0, 0, 0),
(5, 5, 0, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `Id` int(11) NOT NULL,
  `MenuID` int(11) NOT NULL,
  `Image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Price` decimal(10,0) NOT NULL DEFAULT 0,
  `Detail` text COLLATE utf8_unicode_ci NOT NULL,
  `Description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CreateDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`Id`, `MenuID`, `Image`, `Price`, `Detail`, `Description`, `CreateDate`) VALUES
(1, 2, '', '23000', '<p><strong>ca-phe-sua-123 - chi tiết</strong></p>\r\n', 'ca-phe-sua-123- mô tả', '2021-04-01 05:12:36'),
(2, 3, '', '19000', '<p>c&agrave; ph&ecirc; đen</p>\r\n', 'Cà phê nguyên chất', '2021-04-01 05:12:36'),
(5, 5, '', '23000', '<p><strong>Tr&agrave; &Ocirc; Long nguy&ecirc;n chất</strong></p>\r\n', 'Trà Ô Long nguyên chất', '2021-04-01 05:26:35'),
(6, 7, '', '23000', '<p>Tr&agrave; Nho nguy&ecirc;n chất</p>\r\n', 'Trà Nho nguyên chất', '2021-04-03 08:28:45'),
(7, 9, '', '29000', '<p>Chi tiết ....Tr&agrave; Đen nguy&ecirc;n chất</p>\r\n', 'Trà Đen nguyên chất', '2021-04-07 03:59:06'),
(8, 1, '', '19000', 'Việt Nam tự hào sở hữu một di sản văn hóa cà phê giàu có, và \'Phin\' chính là linh hồn, là nét văn hóa thưởng thức cà phê đã ăn sâu vào tiềm thức biết bao người Việt. Cà phê rang xay được chiết xuất chậm rãi từng giọt một thông qua dụng cụ lọc bằng kim loại có tên là \'Phin\', cũng giống như thể hiện sự sâu sắc trong từng suy nghĩ và chân thành trong những mối quan hệ hiện hữu. Bạn có thể tùy thích lựa chọn uống nóng hoặc dùng chung với đá, có hoặc không có sữa đặc. Highlands Coffee tự hào phục vụ cà phê Việt theo cách truyền thống của người Việt.', 'Việt Nam tự hào sở hữu một di sản văn hóa cà phê giàu có, và \'Phin\' chính là linh hồn, là nét văn hóa thưởng thức cà phê đã ăn sâu vào tiềm thức biết bao người Việt. Cà phê rang xay được chiết xuất chậm rãi từng giọt một thông qua dụng cụ lọc bằng kim loạ', '2021-04-09 01:04:00'),
(9, 4, '', '23000', 'Hương vị tự nhiên, thơm ngon của Trà Việt với phong cách hiện đại tại Highlands Coffee sẽ giúp bạn gợi mở vị giác của bản thân và tận hưởng một cảm giác thật khoan khoái, tươi mới.', 'Hương vị tự nhiên, thơm ngon của Trà Việt với phong cách hiện đại tại Highlands Coffee sẽ giúp bạn gợi mở vị giác của bản thân và tận hưởng một cảm giác thật khoan khoái, tươi mới.', '2021-04-09 01:04:50');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rate`
--

CREATE TABLE `rate` (
  `Id` int(11) NOT NULL,
  `MenuID` int(11) NOT NULL,
  `Name` int(2) NOT NULL,
  `QuanTum` int(11) NOT NULL,
  `TotalRating` float NOT NULL,
  `UserID` int(11) NOT NULL,
  `CreateDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `rate`
--

INSERT INTO `rate` (`Id`, `MenuID`, `Name`, `QuanTum`, `TotalRating`, `UserID`, `CreateDate`) VALUES
(1, 6, 4, 4, 4, 8, '2021-04-08 07:32:15'),
(2, 6, 5, 9, 4.5, 1, '2021-04-08 09:54:10'),
(8, 5, 4, 13, 4.33, 8, '2021-04-08 15:10:32'),
(9, 7, 5, 18, 4.5, 8, '2021-04-08 15:14:08'),
(10, 5, 4, 22, 4.4, 1, '2021-04-08 15:17:51'),
(11, 2, 5, 27, 4.5, 1, '2021-04-08 15:19:10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `Id` int(11) NOT NULL,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Pass` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Phone` int(10) DEFAULT NULL,
  `Email` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `Address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CatUserID` int(11) NOT NULL DEFAULT 4
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`Id`, `Name`, `Pass`, `Phone`, `Email`, `Address`, `CatUserID`) VALUES
(1, 'Lê Đức Nam', '123', 797207493, 'leducnam1805@gmail.com', 'Quảng Nam', 1),
(3, 'duc', '123', 79720749, 'duc@gmail.com', 'Tra My', 4),
(8, 'Nguyễn Quốc Huy', '123', 389276829, 'nstamky24h@gmail.com', 'Đà Nẵng', 4),
(9, 'Lê Đức Nam', '123', NULL, 'leducnam18051@gmail.com', NULL, 4);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `catorder`
--
ALTER TABLE `catorder`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `catuser`
--
ALTER TABLE `catuser`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `MenuID` (`MenuID`),
  ADD KEY `UserID` (`UserID`);

--
-- Chỉ mục cho bảng `favourite`
--
ALTER TABLE `favourite`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `MenuID` (`MenuID`),
  ADD KEY `UserID` (`UserID`);

--
-- Chỉ mục cho bảng `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_ibfk_1` (`OrderProductID`),
  ADD KEY `item_ibfk_2` (`ProductID`);

--
-- Chỉ mục cho bảng `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `orderproduct`
--
ALTER TABLE `orderproduct`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `catorder` (`CatOrder`);

--
-- Chỉ mục cho bảng `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `CatUserID` (`CatUserID`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `product_ibfk_1` (`MenuID`);

--
-- Chỉ mục cho bảng `rate`
--
ALTER TABLE `rate`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `MenuID` (`MenuID`),
  ADD KEY `UserID` (`UserID`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `user_ibfk_1` (`CatUserID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `catorder`
--
ALTER TABLE `catorder`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `catuser`
--
ALTER TABLE `catuser`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `favourite`
--
ALTER TABLE `favourite`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `menu`
--
ALTER TABLE `menu`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `orderproduct`
--
ALTER TABLE `orderproduct`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `permission`
--
ALTER TABLE `permission`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `rate`
--
ALTER TABLE `rate`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`MenuID`) REFERENCES `menu` (`Id`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`Id`);

--
-- Các ràng buộc cho bảng `favourite`
--
ALTER TABLE `favourite`
  ADD CONSTRAINT `favourite_ibfk_1` FOREIGN KEY (`MenuID`) REFERENCES `menu` (`Id`),
  ADD CONSTRAINT `favourite_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`Id`);

--
-- Các ràng buộc cho bảng `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`OrderProductID`) REFERENCES `orderproduct` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `item_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `orderproduct`
--
ALTER TABLE `orderproduct`
  ADD CONSTRAINT `orderproduct_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`Id`),
  ADD CONSTRAINT `orderproduct_ibfk_2` FOREIGN KEY (`catorder`) REFERENCES `catorder` (`Id`);

--
-- Các ràng buộc cho bảng `permission`
--
ALTER TABLE `permission`
  ADD CONSTRAINT `permission_ibfk_1` FOREIGN KEY (`CatUserID`) REFERENCES `catuser` (`Id`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`MenuID`) REFERENCES `menu` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `rate`
--
ALTER TABLE `rate`
  ADD CONSTRAINT `rate_ibfk_1` FOREIGN KEY (`MenuID`) REFERENCES `menu` (`Id`),
  ADD CONSTRAINT `rate_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`Id`);

--
-- Các ràng buộc cho bảng `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`CatUserID`) REFERENCES `catuser` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
