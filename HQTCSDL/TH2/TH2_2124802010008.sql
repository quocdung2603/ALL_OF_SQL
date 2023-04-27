USE THB2_bt1
GO
/****** Object:  Database [THB2_bt1]    Script Date: 9/20/2022 2:46:28 PM ******/
CREATE DATABASE [THB2_bt1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'THB2_bt1', FILENAME = N'D:\sql\MSSQL15.SQLEXPRESS\MSSQL\DATA\THB2_bt1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'THB2_bt1_log', FILENAME = N'D:\sql\MSSQL15.SQLEXPRESS\MSSQL\DATA\THB2_bt1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

CREATE TABLE [dbo].[CTHOADON](
	[MaHD] [nvarchar](5) NOT NULL,
	[MaSP] [smallint] NOT NULL,
	[SoLuong] [smallint] NULL,
	[DonGiaBan] [money] NULL,
 CONSTRAINT [PK_CTHOADON] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[HOADON](
	[MaHD] [nvarchar](5) NOT NULL,
	[MaKH] [nvarchar](10) NULL,
	[MaNV] [int] NOT NULL,
	[NgayLapHD] [date] NULL,
	[NgayGiaoHang] [date] NULL,
 CONSTRAINT [PK_HOADON] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[KHACHHANG](
	[MaKH] [nvarchar](10) NOT NULL,
	[TenKH] [nvarchar](25) NULL,
	[DiaChi] [nvarchar](40) NULL,
	[ThanhPho] [nvarchar](10) NULL,
	[DienThoai] [nvarchar](14) NULL,
 CONSTRAINT [PK_KHACHHANG] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[NHANVIEN](
	[MaNV] [int] NOT NULL,
	[HoNV] [nvarchar](25) NULL,
	[TenNV] [nvarchar](10) NULL,
	[Phai] [bit] NULL,
	[NgaySinh] [datetime] NULL,
	[DiaChi] [nvarchar](50) NULL,
	[DienThoai] [nvarchar](14) NULL,
	[Hinh] [image] NULL,
 CONSTRAINT [PK_NHANVIEN] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[SANPHAM](
	[MaSP] [smallint] NOT NULL,
	[TenSP] [nvarchar](40) NULL,
	[DonViTinh] [nvarchar](10) NULL,
	[DonGia] [money] NULL,
	[SoLuongTon] [int] NULL,
 CONSTRAINT [PK_SANPHAM] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
-------insert into -----------
USE [THB2_bt1]
GO
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [SoLuong], [DonGiaBan]) VALUES (N'10148', 3, 20, 2.1000)
GO
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [SoLuong], [DonGiaBan]) VALUES (N'10148', 4, 30, 15.7500)
GO
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [SoLuong], [DonGiaBan]) VALUES (N'10148', 9, 20, 12.6000)
GO
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [SoLuong], [DonGiaBan]) VALUES (N'10149', 2, 22, 42.0000)
GO
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [SoLuong], [DonGiaBan]) VALUES (N'10149', 8, 10, 65.6300)
GO
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [SoLuong], [DonGiaBan]) VALUES (N'10150', 4, 10, 15.7500)
GO
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [SoLuong], [DonGiaBan]) VALUES (N'10150', 6, 20, 10.5000)
GO
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [SoLuong], [DonGiaBan]) VALUES (N'10150', 7, 30, 5.2500)
GO
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [SoLuong], [DonGiaBan]) VALUES (N'10151', 2, 20, 42.0000)
GO
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [SoLuong], [DonGiaBan]) VALUES (N'10151', 3, 10, 2.1000)
GO
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [SoLuong], [DonGiaBan]) VALUES (N'10151', 4, 23, 15.7500)
GO
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [SoLuong], [DonGiaBan]) VALUES (N'10152', 7, 22, 5.2500)
GO
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [SoLuong], [DonGiaBan]) VALUES (N'10152', 8, 10, 65.6300)
GO
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [SoLuong], [DonGiaBan]) VALUES (N'10153', 4, 10, 15.7500)
GO
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [SoLuong], [DonGiaBan]) VALUES (N'10153', 5, 10, 1.0500)
GO
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [SoLuong], [DonGiaBan]) VALUES (N'10154', 10, 4, 2.1000)
GO
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [SoLuong], [DonGiaBan]) VALUES (N'10156', 8, 20, 65.6300)
GO
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [SoLuong], [DonGiaBan]) VALUES (N'10157', 3, 4, 2.1000)
GO
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [SoLuong], [DonGiaBan]) VALUES (N'10157', 4, 50, 15.7500)
GO
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [SoLuong], [DonGiaBan]) VALUES (N'10157', 9, 10, 12.6000)
GO
INSERT [dbo].[HOADON] ([MaHD], [MaKH], [MaNV], [NgayLapHD], [NgayGiaoHang]) VALUES (N'10149', N'BSCO', 1, CAST(N'2009-12-01' AS Date), CAST(N'2009-12-15' AS Date))
GO
INSERT [dbo].[HOADON] ([MaHD], [MaKH], [MaNV], [NgayLapHD], [NgayGiaoHang]) VALUES (N'10150', N'hunsan', 4, CAST(N'2009-05-03' AS Date), CAST(N'2009-06-29' AS Date))
GO
INSERT [dbo].[HOADON] ([MaHD], [MaKH], [MaNV], [NgayLapHD], [NgayGiaoHang]) VALUES (N'10151', N'lixco', 5, CAST(N'2009-09-10' AS Date), CAST(N'2009-09-12' AS Date))
GO
INSERT [dbo].[HOADON] ([MaHD], [MaKH], [MaNV], [NgayLapHD], [NgayGiaoHang]) VALUES (N'10152', N'bsco', 1, CAST(N'2009-01-12' AS Date), CAST(N'2009-01-20' AS Date))
GO
INSERT [dbo].[HOADON] ([MaHD], [MaKH], [MaNV], [NgayLapHD], [NgayGiaoHang]) VALUES (N'10153', N'hunsan', 2, CAST(N'2009-01-11' AS Date), CAST(N'2009-02-15' AS Date))
GO
INSERT [dbo].[HOADON] ([MaHD], [MaKH], [MaNV], [NgayLapHD], [NgayGiaoHang]) VALUES (N'10154', N'sjc', 10, CAST(N'2009-11-19' AS Date), CAST(N'2009-12-10' AS Date))
GO
INSERT [dbo].[HOADON] ([MaHD], [MaKH], [MaNV], [NgayLapHD], [NgayGiaoHang]) VALUES (N'10155', N'saíico', 2, CAST(N'2009-10-10' AS Date), CAST(N'2009-10-15' AS Date))
GO
INSERT [dbo].[HOADON] ([MaHD], [MaKH], [MaNV], [NgayLapHD], [NgayGiaoHang]) VALUES (N'10156', N'fisc', 4, CAST(N'2009-01-12' AS Date), CAST(N'2009-09-05' AS Date))
GO
INSERT [dbo].[HOADON] ([MaHD], [MaKH], [MaNV], [NgayLapHD], [NgayGiaoHang]) VALUES (N'10157', N'saíico', 2, CAST(N'2009-01-10' AS Date), CAST(N'2009-05-20' AS Date))
GO
INSERT [dbo].[HOADON] ([MaHD], [MaKH], [MaNV], [NgayLapHD], [NgayGiaoHang]) VALUES (N'10158', N'hunsan', 5, CAST(N'2009-02-11' AS Date), CAST(N'2009-03-05' AS Date))
GO
INSERT [dbo].[HOADON] ([MaHD], [MaKH], [MaNV], [NgayLapHD], [NgayGiaoHang]) VALUES (N'10159', N'comeco', 8, CAST(N'2009-01-09' AS Date), CAST(N'2009-07-06' AS Date))
GO
INSERT [dbo].[HOADON] ([MaHD], [MaKH], [MaNV], [NgayLapHD], [NgayGiaoHang]) VALUES (N'10160', N'thadaco', 11, CAST(N'2009-01-13' AS Date), CAST(N'2009-06-30' AS Date))
GO
INSERT [dbo].[HOADON] ([MaHD], [MaKH], [MaNV], [NgayLapHD], [NgayGiaoHang]) VALUES (N'10162', N'cinotec', 7, CAST(N'2009-01-25' AS Date), CAST(N'2009-07-10' AS Date))
GO
INSERT [dbo].[HOADON] ([MaHD], [MaKH], [MaNV], [NgayLapHD], [NgayGiaoHang]) VALUES (N'10163', N'tracodi', 3, CAST(N'2009-05-02' AS Date), CAST(N'2009-07-06' AS Date))
GO
INSERT [dbo].[HOADON] ([MaHD], [MaKH], [MaNV], [NgayLapHD], [NgayGiaoHang]) VALUES (N'10166', N'sjc', 9, CAST(N'2009-01-21' AS Date), CAST(N'2009-09-12' AS Date))
GO
INSERT [dbo].[HOADON] ([MaHD], [MaKH], [MaNV], [NgayLapHD], [NgayGiaoHang]) VALUES (N'10172', N'taíaco', 9, CAST(N'2009-09-12' AS Date), CAST(N'2009-09-17' AS Date))
GO
INSERT [dbo].[HOADON] ([MaHD], [MaKH], [MaNV], [NgayLapHD], [NgayGiaoHang]) VALUES (N'10175', N'tranaco', 9, CAST(N'2009-05-03' AS Date), CAST(N'2009-09-07' AS Date))
GO
INSERT [dbo].[HOADON] ([MaHD], [MaKH], [MaNV], [NgayLapHD], [NgayGiaoHang]) VALUES (N'10177', N'comeco', 2, CAST(N'2009-01-29' AS Date), CAST(N'2009-07-05' AS Date))
GO
INSERT [dbo].[HOADON] ([MaHD], [MaKH], [MaNV], [NgayLapHD], [NgayGiaoHang]) VALUES (N'10183', N'saíico', 2, CAST(N'2009-01-01' AS Date), CAST(N'2009-06-02' AS Date))
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [ThanhPho], [DienThoai]) VALUES (N'ánotec', N'ĐIÊN TOÁN SÀI GÒN', N'43 Yẽt Kiêu P6 Q3', N'Sài gòn', N'7931752')
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [ThanhPho], [DienThoai]) VALUES (N'bsco', N'JCT CHỨNG KHOÁN NHĐT&PTVN', N'146 Nguyễn Công Trứ Q1', N'Sài gòn', N'8218509')
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [ThanhPho], [DienThoai]) VALUES (N'comeco', N'VẬT Tư THIẾT BI VẬN TÁI', N'226 An Dúơng vương P11Q11', NULL, N'8456781')
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [ThanhPho], [DienThoai]) VALUES (N'hntrco', N'HÀNỘITOURISTTRAVEL', N'18 Hai Bà Trưng', N'HÀ NỘI', N'3824310')
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [ThanhPho], [DienThoai]) VALUES (N'hunsan', N'HỪNG SÁNG', N'175 Lý Thường Kiệt TB', NULL, N'5465487')
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [ThanhPho], [DienThoai]) VALUES (N'lixco', N'BỘT GIẶT LIX', N'79 Bàn CỜP3Q5', N'Sài gòn', N'8952187')
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [ThanhPho], [DienThoai]) VALUES (N'saíico', N'THÚY SÀN XUẨT KHẨU', N'47 Bày Sậy P1Q11', N'Sài gòn', NULL)
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [ThanhPho], [DienThoai]) VALUES (N'sjc', N'VÀNGBẠCĐÁQUÝTP.HCM', N'350CMT8P12Q5', NULL, N'8543543')
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [ThanhPho], [DienThoai]) VALUES (N'tahasa', N'PHÁT HÀNH SÁCH SÀI GÒN', N'12 Thuận Kiêu Q5', N'Sài gòn', N'8452792')
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [ThanhPho], [DienThoai]) VALUES (N'tataco', N'THƯŨNG MẠI TÂN PHÁT', N'4 Trăn Phú Q5', N'Sài gòn', N'8754875')
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [ThanhPho], [DienThoai]) VALUES (N'thadaco', N'XÂY DỤNG THÀNH ĐẠT', N'6E Huỳnh Thúc Kháng BĐ', N'HÀ NỘI', N'5465454')
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [ThanhPho], [DienThoai]) VALUES (N'tisc', N'DỊCH VỤ ĐẦU Tư NƯỚC NGOÀI', N'31 Trương Định P6 Q1', N'Sài gòn', N'8458247')
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [ThanhPho], [DienThoai]) VALUES (N'tracodi', N'ĐẦU TƯ PHÁT TRIỂN G1VT', N'343 Nhật Tao Q10', NULL, N'5321321')
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiaChi], [ThanhPho], [DienThoai]) VALUES (N'tranaco', N'DỊCH VỤ VẬN TẢI Q3', N'156 Lê Đại Hành P7Q1 ũ', N'Sài gòn', N'8654635')
GO
INSERT [dbo].[NHANVIEN] ([MaNV], [HoNV], [TenNV], [Phai], [NgaySinh], [DiaChi], [DienThoai], [Hinh]) VALUES (1, N'Nguyền Ngoe', N'nga', 0, NULL, N'13 Hùng Vuông P4Q5', N'5465465', NULL)
GO
INSERT [dbo].[NHANVIEN] ([MaNV], [HoNV], [TenNV], [Phai], [NgaySinh], [DiaChi], [DienThoai], [Hinh]) VALUES (2, N'hà Vinh Phát', N'phát', 1, NULL, N'89ĐòngKhồíQ1', N'8767461', NULL)
GO
INSERT [dbo].[NHANVIEN] ([MaNV], [HoNV], [TenNV], [Phai], [NgaySinh], [DiaChi], [DienThoai], [Hinh]) VALUES (3, N'Trântuyẽt', N'oanh', 0, NULL, N'45LêQúyĐônQ3', N'5465465', NULL)
GO
INSERT [dbo].[NHANVIEN] ([MaNV], [HoNV], [TenNV], [Phai], [NgaySinh], [DiaChi], [DienThoai], [Hinh]) VALUES (4, N'nguyễn kim', N'ngoe', 0, NULL, N'187 Hậu Giang P5Q6', N'5654654', NULL)
GO
INSERT [dbo].[NHANVIEN] ([MaNV], [HoNV], [TenNV], [Phai], [NgaySinh], [DiaChi], [DienThoai], [Hinh]) VALUES (5, N'TRƯƠNGDUY', N'hùng', 1, NULL, N'77TrùòngĐịnhQ1', N'5871544', NULL)
GO
INSERT [dbo].[NHANVIEN] ([MaNV], [HoNV], [TenNV], [Phai], [NgaySinh], [DiaChi], [DienThoai], [Hinh]) VALUES (6, N'truongbá', N'thẳng', 1, NULL, N'92 Lê Thánh Tôn Q11', N'8754165', NULL)
GO
INSERT [dbo].[NHANVIEN] ([MaNV], [HoNV], [TenNV], [Phai], [NgaySinh], [DiaChi], [DienThoai], [Hinh]) VALUES (7, N'lâm sòn', N'hoàng', 1, NULL, N'45 Ký Con Q1', N'8231231', NULL)
GO
INSERT [dbo].[NHANVIEN] ([MaNV], [HoNV], [TenNV], [Phai], [NgaySinh], [DiaChi], [DienThoai], [Hinh]) VALUES (8, N'nguyên minh', N'hoàng', 1, NULL, N'22 Lạc Long Quân Q11', N'7845138', NULL)
GO
INSERT [dbo].[NHANVIEN] ([MaNV], [HoNV], [TenNV], [Phai], [NgaySinh], [DiaChi], [DienThoai], [Hinh]) VALUES (9, N'vuông ngọc', N'lan', 0, NULL, N'227HaiBàTrUngQ1', N'7784184', NULL)
GO
INSERT [dbo].[NHANVIEN] ([MaNV], [HoNV], [TenNV], [Phai], [NgaySinh], [DiaChi], [DienThoai], [Hinh]) VALUES (10, N'nguyên thị', N'mai', 0, NULL, N'12 Nguyễn Chí Thanh Q3', N'3451365', NULL)
GO
INSERT [dbo].[NHANVIEN] ([MaNV], [HoNV], [TenNV], [Phai], [NgaySinh], [DiaChi], [DienThoai], [Hinh]) VALUES (11, N'lê vãn', N'hùng', 1, NULL, N'56 Nguyên Trài Q1', N'5745785', NULL)
GO
INSERT [dbo].[NHANVIEN] ([MaNV], [HoNV], [TenNV], [Phai], [NgaySinh], [DiaChi], [DienThoai], [Hinh]) VALUES (12, N'nguyên thi', N'hoa', 0, NULL, N'12 Tràn Hung Đạo Q1', N'5745785', NULL)
GO
INSERT [dbo].[NHANVIEN] ([MaNV], [HoNV], [TenNV], [Phai], [NgaySinh], [DiaChi], [DienThoai], [Hinh]) VALUES (13, N'lê thị bích', N'ngọc', 0, NULL, N'34 Nguyền Thông Q3', N'3333239', NULL)
GO
INSERT [dbo].[NHANVIEN] ([MaNV], [HoNV], [TenNV], [Phai], [NgaySinh], [DiaChi], [DienThoai], [Hinh]) VALUES (14, N'đăng', N'hùng', 1, NULL, N'12/AHaỉ Bà Trung Q1', N'7765889', NULL)
GO
INSERT [dbo].[NHANVIEN] ([MaNV], [HoNV], [TenNV], [Phai], [NgaySinh], [DiaChi], [DienThoai], [Hinh]) VALUES (15, N'đoàn', N'khoa', 1, NULL, N'78LêLỢiGòVãp', N'7656766', NULL)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [SoLuongTon]) VALUES (1, N'rượu', N'CHAI', NULL, NULL)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [SoLuongTon]) VALUES (2, N'GIA VỊ', N'THÚNG', 40.0000, NULL)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [SoLuongTon]) VALUES (3, N'BÁNH KEM', N'CÁI', 2.0000, NULL)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [SoLuongTon]) VALUES (4, N'Bơ', N'KG', 15.0000, NULL)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [SoLuongTon]) VALUES (5, N'BÁNH MÌ', N'CÁI', 1.0000, NULL)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [SoLuongTon]) VALUES (6, N'NEM', N'KG', 10.0000, NULL)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [SoLuongTon]) VALUES (7, N'TÁO', N'KG', 5.0000, NULL)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [SoLuongTon]) VALUES (8, N'CÁ HÔP', N'THÙNG', NULL, NULL)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [SoLuongTon]) VALUES (9, N'KẸO', N'THÙNG', 12.0000, NULL)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [SoLuongTon]) VALUES (12, N'SỮA', N'HỘP', 20.0000, NULL)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [SoLuongTon]) VALUES (13, N'BIA', N'THÙNG', 25.0000, NULL)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [SoLuongTon]) VALUES (14, N'BỘT NGỌT', N'KG', 5.0000, NULL)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [SoLuongTon]) VALUES (15, N'ĐƯỜNG', N'KG', 2.0000, NULL)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [SoLuongTon]) VALUES (16, N'CAFÉ', N'HỘP', 20.0000, NULL)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [SoLuongTon]) VALUES (17, N'DẦU ÁN', N'THÙNG', 25.0000, NULL)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [SoLuongTon]) VALUES (18, N'THỊT HỘP', N'THÙNG', 120.0000, NULL)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [SoLuongTon]) VALUES (19, N'TRƯNG', N'THÙNG', 55.0000, NULL)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [DonViTinh], [DonGia], [SoLuongTon]) VALUES (20, N'THỊT NGUỘI', N'KG', 50.0000, NULL)
GO

--1
SELECT NHANVIEN.*, NgaySinh AS Expr1
FROM   NHANVIEN
WHERE DATEDIFF(year, NgaySinh, GETDATE())>=20 and DATEDIFF(year, NgaySinh, GETDATE()) <=40
--2
select * , DATEDIFF(year, NgaySinh, GETDATE()) as Tuoi,
case
	when DATEDIFF(year, NgaySinh, GETDATE()) >=18 then 'Thanh thieu nien'
	when DATEDIFF(year, NgaySinh, GETDATE()) >18 and DATEDIFF(year, NgaySinh, GETDATE()) <=35 then  'Thanh  nien'
	when DATEDIFF(year, NgaySinh, GETDATE()) >35 and DATEDIFF(year, NgaySinh, GETDATE())<50 then 'Trung nien nien'
	else 'cao nien'	
end as Do_Tuoi
from nhanvien

--3
select  top  3 manv, honv +' '+ tennv as hotennv , Phai, DATEDIFF(year, NgaySinh, GETDATE()) as tuoi 
from nhanvien 
order by DATEDIFF(year, NgaySinh, GETDATE()) desc
--4
select * , (Thanh_tien- Tra_Truoc) as Con_lai
from(select *,
case 
	when so_ngay <=20 then 0.2
	when so_ngay >20 and so_ngay<=30 then 0.3
	else 0.5
end  * T.SoLuong * T.DonGiaBan as Tra_Truoc
from (SELECT HOADON.MaHD, HOADON.MaKH, SANPHAM.TenSP, SANPHAM.DonGia,dongiaban,soluong , datediff(day , hoadon.NgayLapHD , HOADON.NgayGiaoHang) as So_ngay , (CTHOADON.SoLuong * CTHOADON.DonGiaBan) as Thanh_tien
FROM   CTHOADON INNER JOIN
             HOADON ON CTHOADON.MaHD = HOADON.MaHD INNER JOIN
             KHACHHANG ON HOADON.MaKH = KHACHHANG.MaKH INNER JOIN
             NHANVIEN ON HOADON.MaNV = NHANVIEN.MaNV INNER JOIN
             SANPHAM ON CTHOADON.MaSP = SANPHAM.MaSP
			 ) as T
) as M 
--5
SELECT SANPHAM.MaSP , SANPHAM.TenSP , SANPHAM.DonViTinh, SUM(CTHOADON.SoLuong) AS Tong_so_luong
FROM   SANPHAM INNER JOIN
             CTHOADON ON SANPHAM.MaSP = CTHOADON.MaSP
GROUP BY SANPHAM.MaSP, SANPHAM.TenSP, SANPHAM.DonViTinh
--6
SELECT KHACHHANG.MaKH, KHACHHANG.TenKH, HOADON.MaHD, SUM(CTHOADON.SoLuong * CTHOADON.DonGiaBan) AS Tong_tien_HD
FROM   KHACHHANG INNER JOIN
             HOADON ON KHACHHANG.MaKH = HOADON.MaKH INNER JOIN
             CTHOADON ON HOADON.MaHD = CTHOADON.MaHD
GROUP BY KHACHHANG.MaKH, KHACHHANG.TenKH, HOADON.MaHD
--7
SELECT KHACHHANG.MaKH, KHACHHANG.TenKH, COUNT(HOADON.MaHD) AS Tong_so_HD, SUM(CTHOADON.SoLuong * CTHOADON.DonGiaBan) AS Tong_Tien_KH
FROM   KHACHHANG INNER JOIN
             HOADON ON KHACHHANG.MaKH = HOADON.MaKH INNER JOIN
             CTHOADON ON HOADON.MaHD = CTHOADON.MaHD
GROUP BY KHACHHANG.MaKH, KHACHHANG.TenKH
--8
update SANPHAM
set DonGia=DonGia*1.01
--9
update CTHOADON
set DonGiaBan = (SELECT DonGia*1.2
				FROM   SANPHAM
				where SANPHAM.MaSP= CTHOADOn.MaSP)
--10
ALTER TABLE dbo.CTHOADON ADD
	ThanhTien money NULL
GO

update CTHOADON
set ThanhTien = SoLuong*DonGiaBan

select *from CTHOADON


---------------Store Procduced-----------------
---1

CREATE PROCEDURE Xuathoadon 
	@manv int
AS
BEGIn
	SET NOCOUNT ON;
	SELECT *From hoadon
	where @manv=MaNV
END
GO
--exec Xuathoadon 3
---2

alter PROCEDURE Xuat_CTHD 
	-- Add the parameters for the stored procedure here
	@makh nvarchar(10) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT distinct CTHOADON.MaHD, CTHOADON.MaSP, CTHOADON.SoLuong, CTHOADON.DonGiaBan, CTHOADON.ThanhTien
	FROM CTHOADON, HOADON , KHACHHANG
	WHERE @makh=HOADON.MaKH AND HOADON.MaHD=CTHOADON.MaHD

END
GO
--EXEC Xuat_CTHD  BSCO
--3
alter PROCEDURE ThongTinHoaDonTheoThoiGian (@batdau date ,@ketthuc date)
AS
BEGIN
	SET NOCOUNT ON;
	select * 
	from HOADON 
	where HOADON.NgayLapHD >= @batdau and HOADON.NgayLapHD <= @ketthuc
END
GO
exec ThongTinHoaDonTheoThoiGian '2009-01-01','2009-01-29'
--4
alter PROCEDURE ThongTinHoaDon4 
	-- Add the parameters for the stored procedure here
	@tenkh nvarchar(25),
	@sdt nvarchar(14),
	@diachi nvarchar(40)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select M.MaHD, M.MaKH, M.MaNV, M.NgayLapHD, M.NgayGiaoHang
	from (SELECT *,
	case
		when @tenkh is not null and @sdt is null and @diachi is null then khachhang.tenkh
		when @tenkh is null and @sdt is not null and @diachi is null then KHACHHANG.Dienthoai
		when @tenkh is null and @sdt is null and @diachi is not null then khachhang.diachi
		else 'not found'
	end
	from HOADON, KHACHHANG
	where HOADON.MaKH=KHACHHANG.MaKH) as M
	where @Tenkh = M.tenkh or @sdt=M.dienthoai or @diachi=M.diachi
END
GO
exec ThongTinHoaDon4  @Tenkh=N'' , @diachi=N'' , @sdt=N'7931752'
exec ThongTinHoaDon4  @Tenkh=N'ĐIÊN TOÁN SÀI GÒN' , @diachi='' , @sdt=''
exec ThongTinHoaDon4  @Tenkh=N'' , @diachi=N'4 Trăn Phú Q5' , @sdt=N''

select *from KHACHHANG
select *from HOADON
select *from CTHOADON