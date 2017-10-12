-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 11, 2017 at 01:41 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bangiayversion2`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `tongTienGioHang` (`idgiohang` INT(11))  BEGIN
	DECLARE tongbd INT DEFAULT 0;
    DECLARE tongkm INT DEFAULT 0;
	set tongbd = tongbd + (SELECT sum(so_luong*gia_ban_dau)
						FROM chitietgiohang ct,giohang gh,sanpham sp
						WHERE ct.id_gio_hang = gh.id_gio_hang and ct.id_san_pham = sp.id_san_pham and gh.id_gio_hang=idgiohang AND sp.san_pham_khuyen_mai=0);
	set tongkm = tongkm + (SELECT sum(so_luong*gia_khuyen_mai)
						FROM chitietgiohang ct,giohang gh,sanpham sp
						WHERE ct.id_gio_hang = gh.id_gio_hang and ct.id_san_pham = sp.id_san_pham and gh.id_gio_hang=idgiohang AND sp.san_pham_khuyen_mai=1);
                        
	select (tongbd+tongkm);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `baocao`
--

CREATE TABLE `baocao` (
  `id_bao_cao` int(11) NOT NULL,
  `id_san_pham` int(11) NOT NULL,
  `ten_san_pham` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ngay` date NOT NULL,
  `so_luong` int(11) NOT NULL,
  `doanh_thu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `baocao`
--

INSERT INTO `baocao` (`id_bao_cao`, `id_san_pham`, `ten_san_pham`, `ngay`, `so_luong`, `doanh_thu`) VALUES
(8, 5, 'Converse hà lan loại 2', '2016-09-06', 1, 2000),
(9, 6, 'Converse châu âu', '2015-12-06', 1, 200000),
(10, 9, 'Puma hàn quốc', '2017-06-06', 1, 2000),
(11, 25, 'Sản phẩm puma 1', '2017-09-06', 11, 1100000),
(12, 25, 'Sản phẩm puma 1', '2017-09-06', 1, 100000),
(13, 25, 'Sản phẩm puma 1', '2017-09-06', 1, 100000),
(14, 25, 'Sản phẩm puma 1', '2014-09-06', 2, 200000),
(15, 2, 'Puma đức', '2017-09-07', 2, 1998000),
(16, 25, 'Sản phẩm puma 1', '2017-09-06', 1, 100000),
(17, 5, 'Converse hà lan loại 2', '2017-09-09', 1, 2000),
(18, 25, 'Sản phẩm puma 1', '2017-09-10', 6, 600000),
(19, 24, 'sản phẩm mới1', '2017-09-10', 1, 269000);

-- --------------------------------------------------------

--
-- Table structure for table `binhluan`
--

CREATE TABLE `binhluan` (
  `id_binh_luan` int(11) NOT NULL,
  `id_nguoi_dung` int(11) NOT NULL,
  `noi_dung_binh_luan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_san_pham` int(11) NOT NULL,
  `thoi_gian_tao` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ngay_tao` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `binhluan`
--

INSERT INTO `binhluan` (`id_binh_luan`, `id_nguoi_dung`, `noi_dung_binh_luan`, `id_san_pham`, `thoi_gian_tao`, `ngay_tao`) VALUES
(11, 1, 'Hàng ngon', 15, '09:12:12', '2017-09-07'),
(13, 1, 'Giày này nhìn chất quá', 25, '09:12:38', '2017-09-07'),
(16, 1, 'Đã dùng và thấy ok phết', 2, '09:13:16', '2017-09-07'),
(17, 1, 'Giày này chuẩn luôn còn gì', 2, '16:53:57', '2017-09-09'),
(18, 1, 'Mình mới mua giày này hôm kia, thấy giá rẻ so với các cửa hàng khác', 2, '16:54:25', '2017-09-09'),
(19, 1, 'Sản phẩm chất', 4, '16:54:52', '2017-09-09'),
(20, 1, 'Hàng ổn ok phết', 4, '16:55:00', '2017-09-09'),
(21, 1, 'Khi nào mới có hàng về nữa vậy ad', 4, '16:55:16', '2017-09-09');

-- --------------------------------------------------------

--
-- Table structure for table `chitietdonhang`
--

CREATE TABLE `chitietdonhang` (
  `id_don_hang` int(11) NOT NULL,
  `id_san_pham` int(11) NOT NULL,
  `ctdh_so_luong` int(11) NOT NULL,
  `gia_dat_hang` int(100) NOT NULL,
  `thanh_tien` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chitietdonhang`
--

INSERT INTO `chitietdonhang` (`id_don_hang`, `id_san_pham`, `ctdh_so_luong`, `gia_dat_hang`, `thanh_tien`) VALUES
(69, 4, 10, 99999, 999990),
(87, 5, 1, 2000, 2000),
(87, 6, 1, 200000, 200000),
(87, 9, 1, 2000, 2000),
(88, 25, 11, 100000, 1100000),
(89, 25, 1, 100000, 100000),
(90, 25, 1, 100000, 100000),
(91, 25, 2, 100000, 200000),
(92, 25, 1, 100000, 100000),
(93, 2, 2, 999000, 1998000),
(94, 5, 1, 2000, 2000),
(95, 4, 1, 12000, 12000),
(96, 25, 6, 100000, 600000),
(97, 24, 1, 269000, 269000),
(97, 25, 1, 100000, 100000),
(98, 24, 1, 269000, 269000),
(99, 9, 10, 1199, 11990),
(100, 2, 1, 999000, 999000),
(100, 3, 1, 12000, 12000);

-- --------------------------------------------------------

--
-- Table structure for table `donhang`
--

CREATE TABLE `donhang` (
  `id_don_hang` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tai_khoan` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ten_khach_hang` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `so_dien_thoai_khach_hang` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_khach_hang` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ngay_dat_hang` date NOT NULL,
  `dia_chi_khach_hang` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ten_nguoi_nhan` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_nguoi_nhan` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `so_dien_thoai_nguoi_nhan` int(20) NOT NULL,
  `dia_chi_nguoi_nhan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `thue_GTGT` int(100) NOT NULL,
  `tong_tien` int(100) NOT NULL,
  `trang_thai` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `donhang`
--

INSERT INTO `donhang` (`id_don_hang`, `code`, `tai_khoan`, `ten_khach_hang`, `so_dien_thoai_khach_hang`, `email_khach_hang`, `ngay_dat_hang`, `dia_chi_khach_hang`, `ten_nguoi_nhan`, `email_nguoi_nhan`, `so_dien_thoai_nguoi_nhan`, `dia_chi_nguoi_nhan`, `thue_GTGT`, `tong_tien`, `trang_thai`) VALUES
(69, '0430a10be7a725dbffa51409f4d1f778', 'doanvandoana8@gmail.com', 'Đoàn Văn Đoàn', '966746080', 'doanvandoana8@gmail.com', '2017-08-31', 'Kí túc xá khu B', 'Đoàn Văn ĐOàn', '2@gmail.com', 2132513, 'đa', 99999, 1099989, 'da_giao_dich'),
(87, 'a432e3f12c1620b22cc25aff68deccab', 'doanvandoana8@gmail.com', 'Đoàn Văn Đoàn', '966746080', 'doanvandoana8@gmail.com', '2017-09-06', 'Thủ đức, Thành phố Hồ chí Minh', 'Trần Minh Tú', 'van@gmail.com', 123456789, 'da', 20400, 224400, 'da_giao_dich'),
(88, 'f694da3081963cd51ade09eda2cc1b20', 'doanvandoana8@gmail.com', 'Đoàn Văn Đoàn', '966746080', 'doanvandoana8@gmail.com', '2017-09-06', 'Thủ đức, Thành phố Hồ chí Minh', 'Trần Minh Tú', 'van@gmail.com', 123456789, '.l,', 110000, 1210000, 'da_giao_dich'),
(89, '9c20a0ad5acdfaa92ee11f193cbb4a76', 'doanvandoana8@gmail.com', 'Đoàn Văn Đoàn', '966746080', 'doanvandoana8@gmail.com', '2017-09-06', 'Thủ đức, Thành phố Hồ chí Minh', 'Trần Minh Tú', 'van@gmail.com', 123456789, 'jh', 10000, 110000, 'da_giao_dich'),
(90, 'b867e88760d5bd197091eb95a773098f', 'doanvandoana8@gmail.com', 'Đoàn Văn Đoàn', '966746080', 'doanvandoana8@gmail.com', '2017-09-06', 'Thủ đức, Thành phố Hồ chí Minh', 'Trần Minh Tú', 'van@gmail.com', 123456789, 'đa', 10000, 110000, 'da_giao_dich'),
(91, '614e82157757c0c0ff2e0dee1b4be0b8', 'doanvandoana8@gmail.com', 'Đoàn Văn Đoàn', '966746080', 'doanvandoana8@gmail.com', '2017-09-06', 'Thủ đức, Thành phố Hồ chí Minh', 'Trần Minh Tú', 'van@gmail.com', 2132513, 'vghj', 20000, 220000, 'da_giao_dich'),
(92, 'da56062650ba6f181308e1cc9b7acd4b', 'doanvandoana8@gmail.com', 'Đoàn Văn Đoàn', '966746080', 'doanvandoana8@gmail.com', '2017-09-06', 'Thủ đức, Thành phố Hồ chí Minh', 'Trần Minh Tú', 'van@gmail.com', 123456789, '2', 10000, 110000, 'da_giao_dich'),
(93, '1b1f28d24ae22a642c1b3c5ada49e124', 'doanvandoana8@gmail.com', 'Đoàn Văn Đoàn', '966746080', 'doanvandoana8@gmail.com', '2017-09-07', 'Thủ đức, Thành phố Hồ chí Minh', 'Trần Minh Tú', 'van@gmail.com', 123456789, 'hàng B', 199800, 2197800, 'da_giao_dich'),
(94, 'a55d194e50953b3e879064d48f7d342b', 'doanvandoana8@gmail.com', 'Đoàn Văn Đoàn', '0966746080', 'doanvandoana8@gmail.com', '2017-09-09', 'Thủ đức, Thành phố Hồ chí Minh', 'Trần Minh Tú', 'tu@gmail.com', 123456789, 'Khu B', 200, 2200, 'da_giao_dich'),
(95, '59e173802aff784b0b7ca44dfaac8a45', 'doanvandoana8@gmail.com', 'Đoàn Văn Đoàn', '0966746080', 'doanvandoana8@gmail.com', '2017-09-09', 'Thủ đức, Thành phố Hồ chí Minh', 'Đoàn Văn ĐOàn', 'a@gmail.com', 123456789, 'Khu A', 1200, 13200, 'dang_cho'),
(96, 'f1673de2d7e002f86870dd8155ee904b', 'doanvandoana8@gmail.com', 'Đoàn Văn Đoàn', '0966746080', 'doanvandoana8@gmail.com', '2017-09-10', 'Thủ đức, Thành phố Hồ chí Minh', 'Đoàn Văn ĐOàn', 'van@gmail.com', 123456789, 'KTX Khu B', 60000, 660000, 'da_giao_dich'),
(97, '1e41f9f20fb7c15e2f6268d0a00e81f1', 'doanvandoana8@gmail.com', 'Đoàn Văn Đoàn', '0966746080', 'doanvandoana8@gmail.com', '2017-09-10', 'Thủ đức, Thành phố Hồ chí Minh', 'Trần Minh Tú', 'van@gmail.com', 123456789, 'KTX A', 36900, 405900, 'da_xu_li'),
(98, 'cb3af86fa3a20f3d9c5ba28d64e225c5', 'doanvandoana8@gmail.com', 'Đoàn Văn Đoàn', '0966746080', 'doanvandoana8@gmail.com', '2017-09-10', 'Thủ đức, Thành phố Hồ chí Minh', 'Trần Minh Tú', 'da@gmail.com', 123456789, 'KTX A', 26900, 295900, 'da_giao_dich'),
(99, 'b2297eff779d3dbd5535601c949cf44c', 'doanvandoana8@gmail.com', 'Đoàn Văn Đoàn', '0966746080', 'doanvandoana8@gmail.com', '2017-09-10', 'Thủ đức, Thành phố Hồ chí Minh', 'Đoàn Văn ĐOàn', 'tu@gmail.com', 123456789, 'KTX A', 1199, 13189, 'da_xu_li'),
(100, '82ec4324369e9a3021cf282538c22639', '', 'Đoàn Văn Đoàn', '0123456789', 'doanvandoana8@gmail.com', '2017-10-11', 'KTX B', 'Trần Thành Văn', 'van@gmail.com', 123456654, 'KTX A', 101100, 1112100, 'da_xu_li');

-- --------------------------------------------------------

--
-- Table structure for table `gioithieu`
--

CREATE TABLE `gioithieu` (
  `id_gioi_thieu` int(11) NOT NULL,
  `logo_trang_chu` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `trang_chu` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `trang_con` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gioithieu`
--

INSERT INTO `gioithieu` (`id_gioi_thieu`, `logo_trang_chu`, `trang_chu`, `trang_con`) VALUES
(1, '<p><span style=\"font-size:16px\"><span style=\"color:#000000\"><span style=\"font-family:Courier New,Courier,monospace\">Cung cấp ra thị trường rất nhiều sản phẩm gi&agrave;y chất lượng, mẫu m&atilde; đa dạng, style mới nhất... mang đến cho Qu&yacute; Kh&aacute;ch H&agrave;ng cảm gi&aacute;c mạnh mẽ, tự tin, c&aacute; t&iacute;nh v&agrave; thanh lịch.</span></span></span></p>\r\n', '<p><span style=\"font-size:16px\"><span style=\"font-family:Courier New,Courier,monospace\">Ch&uacute;ng t&ocirc;i cung cấp c&aacute;c loại gi&agrave;y đa dạng từ 100K đến 5000K để đ&aacute;p ứng mọi nhu cầu của kh&aacute;ch h&agrave;ng từ đơn giản đến phức tạp. H&atilde;y tham khảo Bảng gi&aacute; website &amp; Chức năng website để biết th&ecirc;m th&ocirc;ng tin về c&aacute;c g&oacute;i dịch vụ của ch&uacute;ng t&ocirc;i. SHOES SHOP đ&atilde; phục vụ hơn 1,000 kh&aacute;ch h&agrave;ng trong nước v&agrave; quốc tế. Rất h&acirc;n hạnh phục vụ Qu&yacute; kh&aacute;ch!</span></span></p>\r\n', '<p style=\"text-align:center\"><span style=\"color:#d35400\"><strong>CH&Agrave;O MỪNG BẠN ĐẾN VỚI SHOES SHOP</strong></span></p>\r\n\r\n<p style=\"text-align:center\"><span style=\"color:#d35400\"><strong>SHOP B&Aacute;N GI&Agrave;Y ONLINE CHẤT LƯỢNG CAO TẠI VIỆT NAM</strong></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"color:#d35400\"><strong>Giới thiệu về shoes shop</strong></span></p>\r\n\r\n<p>Chuy&ecirc;n ph&acirc;n phối c&aacute;c loại gi&agrave;y cao cấp h&agrave;ng đầu tại việt nam.</p>\r\n\r\n<p>Tại SHOES SHOP&nbsp;&nbsp;kh&aacute;ch h&agrave;ng c&oacute; thể t&igrave;m th&ocirc;ng tin của tất cả c&aacute;c sản phẩm nhanh ch&oacute;ng, th&ocirc;ng tin kỹ thuật của sản phẩm được m&ocirc; tả đầy đủ, c&oacute; gi&aacute; cả r&otilde; r&agrave;ng.</p>\r\n\r\n<p>H&agrave;ng h&oacute;a v&agrave; nh&agrave; cung cấp được kiểm duyệt nhằm đảm bảo chất lượng, gi&aacute; cả canh tranh v&agrave; đ&aacute;p ứng nhanh nhu cầu của kh&aacute;ch h&agrave;ng.</p>\r\n\r\n<p><span style=\"color:#d35400\"><strong>Th&ocirc;ng tin li&ecirc;n hệ</strong></span></p>\r\n\r\n<p><span style=\"font-size:16px\"><span style=\"font-family:Courier New,Courier,monospace\">Shoes shop.</span></span></p>\r\n\r\n<p>K&iacute; t&uacute;c x&aacute; khu B ĐHQG Tp Hồ Ch&iacute; Minh</p>\r\n\r\n<p>Thủ đức - Việt Nam</p>\r\n\r\n<p>Mobile: +84 966 746 080</p>\r\n\r\n<p>Email: 14520168@gm.uit.edu.vn</p>\r\n\r\n<p>&nbsp;</p>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `lienhe`
--

CREATE TABLE `lienhe` (
  `id_lien_he` int(20) NOT NULL,
  `ho_ten` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chu_de` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `noi_dung_lien_he` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phan_hoi_cho_khach_hang` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ngay_tao` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lienhe`
--

INSERT INTO `lienhe` (`id_lien_he`, `ho_ten`, `email`, `chu_de`, `noi_dung_lien_he`, `phan_hoi_cho_khach_hang`, `ngay_tao`) VALUES
(4, 'Đoàn văn Đoàn', 'doanvandoana8@gmail.com', 'Hàng nike', 'Tôi muốn mua thêm một suất 100 giày, khi nào có thì shop báo tôi với', 'Chúng tôi sẽ thông báo cho bạn khi có hàng nhập về, Bạn có thể liên hệ 0966746080 để được hỗ trợ trực tiếp.', '2017-08-16'),
(8, 'Từ vạn thuận', 'tuvanthuan1996@gmail.com', 'Giày mới', 'Tôi muốn mua thêm 100 đôi giày mới nữa', 'Chúng tôi không có nhập về nhiều như vậy, nếu muốn bạn có thể gọi đt cho chúng tôi để trao đổi trực tiếp', '2017-09-03'),
(9, 'Đoàn Văn Đoàn', '14520168@gm.uit.edu.vn', 'Mua giày Nike', 'Hiện tại tôi đã đặt giày với shop nhưng chưa thấy xử lí gì cả, shop trả lời nhanh giùm với', 'Chào bạn, chúng tôi đang cố gắng khắc phục sự cố này, xin lỗi bạn', '2017-09-10'),
(10, 'Đoàn Văn Đoàn', '14520168@gm.uit.edu.vn', 'Giao hàng trễ', 'Bữa nay shop giao hàng trễ quá, gì mà tới 11h khuya mới giao hàng là sao', 'Hiện tại chúng tôi đang thiếu nguồn nhân lực, rất mong quý khách thông cảm', '2017-09-10'),
(11, 'Trần Văn Tí', 'doanvandoana8@gmail.com', 'Sản phẩm hết hàng', 'Sản phẩm abc đã hết hàng, tôi muốn đặt thêm 2 đôi giày nữa, shop có thể đáp ứng được không', 'Hiện tại chúng tôi chưa nhập hàng về, khi nào nhập chúng tôi sẽ báo lại cho quý khách', '2017-10-11');

-- --------------------------------------------------------

--
-- Table structure for table `loaisanpham`
--

CREATE TABLE `loaisanpham` (
  `id_loai_san_pham` int(50) NOT NULL,
  `ten_loai_san_pham` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ngay_tao` date NOT NULL,
  `nguoi_tao` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ngay_cap_nhat` date NOT NULL,
  `nguoi_cap_nhat` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loaisanpham`
--

INSERT INTO `loaisanpham` (`id_loai_san_pham`, `ten_loai_san_pham`, `ngay_tao`, `nguoi_tao`, `ngay_cap_nhat`, `nguoi_cap_nhat`) VALUES
(1, 'Nike', '2017-08-02', 'Đoàn Văn Đoàn', '2017-09-04', 'Đoàn Văn Đoàn'),
(2, 'Adidas', '2017-08-02', 'Đoàn Văn Đoàn', '2017-08-03', 'Trần Thành Văn'),
(3, 'Converse', '2017-08-02', 'Đoàn Văn Đoàn', '2017-09-04', 'Đoàn Văn Đoàn'),
(4, 'Vans', '2017-08-02', 'Đoàn Văn Đoàn', '2017-09-04', 'Đoàn Văn Đoàn'),
(5, 'Puma', '2017-08-02', 'Đoàn Văn Đoàn', '2017-08-03', 'Trần Thành Văn');

-- --------------------------------------------------------

--
-- Table structure for table `nguoidung`
--

CREATE TABLE `nguoidung` (
  `id_nguoi_dung` int(11) NOT NULL,
  `tai_khoan` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ho_ten` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `anh_nguoi_dung` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gioi_tinh` tinyint(4) NOT NULL,
  `so_dien_thoai` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mat_khau` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` tinyint(2) NOT NULL,
  `dia_chi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `nguoidung`
--

INSERT INTO `nguoidung` (`id_nguoi_dung`, `tai_khoan`, `ho_ten`, `anh_nguoi_dung`, `gioi_tinh`, `so_dien_thoai`, `mat_khau`, `level`, `dia_chi`, `code`) VALUES
(1, 'doanvandoana8@gmail.com', 'Đoàn Văn Đoàn', '0f0b7fbbea026a0c31a7ca421837d791.png', 1, '966746080', 'c4ca4238a0b923820dcc509a6f75849b', 2, 'Thủ đức, Thành phố Hồ chí Minh', '4bb5f2f99f95e6f43600b4a234301fc0'),
(2, 'tranthanhvan@gmail.com', 'Trần thành văn', 'gallery2.jpg', 1, '0966746080', 'c4ca4238a0b923820dcc509a6f75849b', 1, 'Kí túc xá khu B', ''),
(16, 'doan@gmail.com', 'Đoàn văn Đoàn', '', 1, '0966746080', 'c4ca4238a0b923820dcc509a6f75849b', 1, 'Buôn ma lắc', ''),
(17, 'van@gmail.com', 'Trần Thành Văn', '', 1, '0966746080', 'c4ca4238a0b923820dcc509a6f75849b', 0, 'Thái thịnh', 'fe8d5ff77f8d67c9f92319cd6eff84df'),
(18, 'myhanh@gmail.com', 'Mỹ Hạnh', '', 0, '0966746080', 'c4ca4238a0b923820dcc509a6f75849b', 1, 'Kon tum', ''),
(19, 'vanbp@gmail.com', 'Văn', '', 0, '0966746080', 'c4ca4238a0b923820dcc509a6f75849b', 0, 'Bình phước', ''),
(20, 'minhnguyen@gmail.com', 'Văn Minh Nguyên', '', 1, '0966746080', 'c4ca4238a0b923820dcc509a6f75849b', 0, 'Nguyên BMT', ''),
(21, 'tranthanh@gmail.com', 'Văn Bình phước', '', 1, '0966746080', 'c4ca4238a0b923820dcc509a6f75849b', 0, 'Bình phước', 'code'),
(24, '14520168@gm.uit.edu.vn', 'Đoàn Văn ĐOàn', 'd57cb4e461097e29a38857e266bc2ab0.png', 1, '0966746080', 'c4ca4238a0b923820dcc509a6f75849b', 1, 'KTX B', ''),
(25, 'doanvandoana8uit@gmail.com', '', '', 0, '', 'e10adc3949ba59abbe56e057f20f883e', 1, '', '79f13937d1a31d37aad2ad703866c0bf');

-- --------------------------------------------------------

--
-- Table structure for table `sanpham`
--

CREATE TABLE `sanpham` (
  `id_san_pham` int(11) NOT NULL,
  `ten_san_pham` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_loai_san_pham` int(50) NOT NULL,
  `anh_san_pham` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thong_tin` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `san_pham_khuyen_mai` tinyint(4) NOT NULL,
  `kinh_doanh` tinyint(4) NOT NULL,
  `gia_ban_dau` int(11) NOT NULL,
  `gia_khuyen_mai` int(11) NOT NULL,
  `ngay_dang` date NOT NULL,
  `size` int(11) NOT NULL,
  `so_luong` int(11) NOT NULL,
  `so_luot_mua` int(11) NOT NULL,
  `thoi_gian_cap_nhat_KM` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sanpham`
--

INSERT INTO `sanpham` (`id_san_pham`, `ten_san_pham`, `id_loai_san_pham`, `anh_san_pham`, `thong_tin`, `san_pham_khuyen_mai`, `kinh_doanh`, `gia_ban_dau`, `gia_khuyen_mai`, `ngay_dang`, `size`, `so_luong`, `so_luot_mua`, `thoi_gian_cap_nhat_KM`) VALUES
(2, 'Puma đức', 5, '05ef69dcc026e1cf15e0ba56308ef7ae.jpg', '<p><span style=\"font-family:Courier New,Courier,monospace\">Đ&acirc;y l&agrave; gi&agrave;y puma đức</span></p>\r\n', 1, 1, 1200000, 999000, '2017-08-01', 32, 8, 6, '2017-09-07 14:48:51'),
(3, 'Adidas hà lan', 2, 'a2712969db382b88fd5789a57fa6953f.jpg', 'Đây là thông tin giày Adidas hà lan', 1, 1, 12000, 12000, '2017-08-01', 30, 10, 5, '0000-00-00'),
(4, 'Adidas châu mĩ', 2, 'Adidas Tubular Shadow Olive.png', 'Đây là thông tin giày Adidas châu mĩ', 1, 1, 12000, 12000, '2017-08-01', 30, 10, 5, '0000-00-00'),
(5, 'Converse hà lan loại 2', 3, 'adidas-nmd-r1-primeknit-white-black-by1911-1.jpg', 'Đây là thông tin giày Converse hà lan loại 2', 0, 1, 2000, 1500, '2017-08-10', 30, 9, 6, '0000-00-00'),
(6, 'Converse châu âu', 3, 'adidas-nmd-xr1-primeknit-olive-bb2375-1.JPG', '<p>Đ&acirc;y l&agrave; th&ocirc;ng tin gi&agrave;y Converse ch&acirc;u &acirc;u</p>\r\n', 1, 1, 200000, 168000, '2017-08-10', 31, 1, 5, '2017-09-07'),
(9, 'Puma hàn quốc', 5, 'Air Jordan 1 Retro High OG _22 Banned _22_avt.jpg', 'Đây là thông tin giày Puma hàn quốc', 1, 1, 2000, 1199, '2017-08-10', 30, 10, 5, '2017-09-07 14:35:28'),
(10, 'Puma đức', 5, 'air-jordan-1-retro-high-og-mens-shoe.jpg', 'Đây là thông tin giày Puma đức', 0, 1, 20000, 20000, '2017-08-10', 30, 10, 5, '0000-00-00'),
(11, 'Nike hàng chính hãng', 1, '957fe8a572c6acd152daa2f542dd65de.jpg', '<p>Đ&acirc;y l&agrave; th&ocirc;ng tin gi&agrave;y nike one on one</p>\r\n', 1, 1, 256000, 10000, '2017-08-01', 35, 11, 5, '2017-09-07'),
(14, 'Adidas mĩ', 2, '2086ce38d500abd55936fe09cf5dc6f1.jpg', 'Đây là thông tin giày Adidas hà lan', 1, 1, 12000, 12000, '2017-08-01', 30, 10, 5, '0000-00-00'),
(15, 'Adidas châu á', 2, '8ead61c52892c3762279a221aed8ccb9.jpg', 'Đây là thông tin giày Adidas hà lan', 1, 1, 12000, 12000, '2017-08-13', 32, 0, 5, '0000-00-00'),
(19, 'Adidas lan', 2, '3f8909e0f6eefb6ce17f0571c7b4aae4.jpg', 'Đây là thông tin giày Adidas hà lan', 1, 1, 12000, 12000, '2017-08-01', 35, 10, 5, '0000-00-00'),
(23, 'Sản phẩm test thêm', 4, 'dbd20aaf9666d5dac180486a0a953873.png', '<p>Đ&acirc;y l&agrave; sản phẩm test chức năng th&ecirc;m sản phẩm mới</p>\r\n', 0, 0, 100000, 0, '2017-09-04', 32, 9, 0, '0000-00-00'),
(24, 'sản phẩm mới1', 1, '5448f519a6475a2fc060dc5a09412bb8.jpg', '<p>Sản phẩm mới</p>\r\n', 1, 1, 320000, 269000, '2017-09-04', 31, 0, 1, '2017-09-07 14:35:15'),
(25, 'Sản phẩm puma 1', 5, 'ee92d373211e52bf29f3e8415cfede79.png', '<p>Đ&acirc;y l&agrave; thử nghiệm th&ecirc;m sản phẩm gi&agrave;y puma</p>\r\n', 0, 1, 100000, 0, '2017-09-06', 32, 0, 4, '0000-00-00'),
(26, 'Nike 01', 1, '25fb829f2df23993b69fbf6a3fde0b09.jpg', '<p>Đ&acirc;y l&agrave; mẫu gi&agrave;y nike001</p>\r\n', 0, 0, 250000, 0, '2017-09-11', 32, 10, 0, ''),
(27, 'Nike 01', 1, '5dd6aabf3dab70e26ebdddd26ce19cdd.jpg', '<p>Đ&acirc;y l&agrave; Nike 01 size 30</p>\r\n', 0, 0, 250000, 0, '2017-09-11', 20, 1, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `thongtinlienhe`
--

CREATE TABLE `thongtinlienhe` (
  `id` int(11) NOT NULL,
  `noi_dung_thong_tin_lien_he` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `thongtinlienhe`
--

INSERT INTO `thongtinlienhe` (`id`, `noi_dung_thong_tin_lien_he`) VALUES
(1, '<p><span style=\"font-size:16px\"><span style=\"font-family:Courier New,Courier,monospace\">K&iacute; t&uacute;c x&aacute; khu B ĐHQG Tp Hồ Ch&iacute; Minh Thủ đức - Việt Nam</span></span></p>\r\n\r\n<p><span style=\"font-size:16px\"><span style=\"font-family:Courier New,Courier,monospace\">Mobile: +84 966 746 080</span></span></p>\r\n\r\n<p><span style=\"font-size:16px\"><span style=\"font-family:Courier New,Courier,monospace\">Email: 14520168@gm.uit.edu.vn</span></span></p>\r\n');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `baocao`
--
ALTER TABLE `baocao`
  ADD PRIMARY KEY (`id_bao_cao`);

--
-- Indexes for table `binhluan`
--
ALTER TABLE `binhluan`
  ADD PRIMARY KEY (`id_binh_luan`);

--
-- Indexes for table `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  ADD PRIMARY KEY (`id_don_hang`,`id_san_pham`);

--
-- Indexes for table `donhang`
--
ALTER TABLE `donhang`
  ADD PRIMARY KEY (`id_don_hang`);

--
-- Indexes for table `gioithieu`
--
ALTER TABLE `gioithieu`
  ADD PRIMARY KEY (`id_gioi_thieu`);

--
-- Indexes for table `lienhe`
--
ALTER TABLE `lienhe`
  ADD PRIMARY KEY (`id_lien_he`);

--
-- Indexes for table `loaisanpham`
--
ALTER TABLE `loaisanpham`
  ADD PRIMARY KEY (`id_loai_san_pham`);

--
-- Indexes for table `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD PRIMARY KEY (`id_nguoi_dung`);

--
-- Indexes for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`id_san_pham`);
ALTER TABLE `sanpham` ADD FULLTEXT KEY `ten_san_pham` (`ten_san_pham`);

--
-- Indexes for table `thongtinlienhe`
--
ALTER TABLE `thongtinlienhe`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `baocao`
--
ALTER TABLE `baocao`
  MODIFY `id_bao_cao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `binhluan`
--
ALTER TABLE `binhluan`
  MODIFY `id_binh_luan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `donhang`
--
ALTER TABLE `donhang`
  MODIFY `id_don_hang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT for table `gioithieu`
--
ALTER TABLE `gioithieu`
  MODIFY `id_gioi_thieu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `lienhe`
--
ALTER TABLE `lienhe`
  MODIFY `id_lien_he` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `loaisanpham`
--
ALTER TABLE `loaisanpham`
  MODIFY `id_loai_san_pham` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `nguoidung`
--
ALTER TABLE `nguoidung`
  MODIFY `id_nguoi_dung` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `id_san_pham` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `thongtinlienhe`
--
ALTER TABLE `thongtinlienhe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
