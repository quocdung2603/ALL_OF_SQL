
/****** Object:  Database [QLTV]    Script Date: 7/8/2020 11:09:07 AM ******/
CREATE DATABASE [QLTV]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLTV', FILENAME = N'D:\QLTV.mdf' , SIZE = 6072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLTV_log', FILENAME = N'D:\QLTV_log.ldf' , SIZE = 4224KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
USE [QLTV]
GO
/****** Object:  Table [dbo].[CT_PHIEUMUON]    Script Date: 7/8/2020 11:08:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CT_PHIEUMUON](
	[MaPhieu] [char](6) NOT NULL,
	[MaSach] [char](8) NOT NULL,
	[HanTra] [datetime] NOT NULL,
 CONSTRAINT [PK_CT_PHIEUMUON] PRIMARY KEY CLUSTERED 
(
	[MaPhieu] ASC,
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DOCGIA]    Script Date: 7/8/2020 11:08:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DOCGIA](
	[MaDG] [char](6) NOT NULL,
	[HoTenDG] [nvarchar](30) NOT NULL,
	[EmailDG] [nvarchar](30) NULL,
	[GioiTinhDG] [bit] NULL,
	[NgaySinhDG] [datetime] NULL,
	[DiaChiDG] [nvarchar](100) NULL,
	[DienThoaiDG] [char](11) NULL,
	[NgayLamThe] [datetime] NULL,
 CONSTRAINT [PK_DOCGIA] PRIMARY KEY CLUSTERED 
(
	[MaDG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NHAXUATBAN]    Script Date: 7/8/2020 11:08:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NHAXUATBAN](
	[MaNXB] [char](6) NOT NULL,
	[TenNXB] [nvarchar](100) NOT NULL,
	[DiaChiNXB] [nvarchar](100) NULL,
	[DienThoaiNXB] [char](11) NULL,
	[Website] [char](50) NULL,
 CONSTRAINT [PK_NHAXUATBAN] PRIMARY KEY CLUSTERED 
(
	[MaNXB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PHIEUMUON]    Script Date: 7/8/2020 11:08:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PHIEUMUON](
	[MaPhieu] [char](6) NOT NULL,
	[MaDG] [char](6) NOT NULL,
	[NgayMuon] [datetime] NOT NULL,
	[MaNV] [char](6) NOT NULL,
 CONSTRAINT [PK_PHIEUMUON_1] PRIMARY KEY CLUSTERED 
(
	[MaPhieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SACH]    Script Date: 7/8/2020 11:08:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SACH](
	[MaSach] [char](8) NOT NULL,
	[TenSach] [nvarchar](100) NOT NULL,
	[NoiDungTT] [nvarchar](300) NULL,
	[SoTrang] [int] NULL,
	[Gia] [bigint] NULL,
	[SoLuong] [int] NULL,
	[NgayNhap] [datetime] NULL,
	[MaNXB] [char](6) NOT NULL,
	[MaTG] [char](6) NOT NULL,
	[MaTL] [char](6) NOT NULL,
	[TinhTrang] [varchar](50) NULL,
 CONSTRAINT [PK_SACH_1] PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[THELOAI]    Script Date: 7/8/2020 11:08:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[THELOAI](
	[MaTL] [char](6) NOT NULL,
	[TenTL] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_THELOAI] PRIMARY KEY CLUSTERED 
(
	[MaTL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TRASACH]    Script Date: 7/8/2020 11:08:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TRASACH](
	[MaPhieu] [char](6) NOT NULL,
	[MaSach] [char](8) NOT NULL,
	[MaNV] [char](6) NOT NULL,
	[NgayTra] [datetime] NOT NULL,
	[PhatHuHong] [bigint] NULL,
	[PhatQuaHan] [bigint] NULL,
 CONSTRAINT [PK_TRASACH_1] PRIMARY KEY CLUSTERED 
(
	[MaPhieu] ASC,
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[CT_PHIEUMUON] ([MaPhieu], [MaSach], [HanTra]) VALUES (N'PM0001', N'MS000001', CAST(0x0000A0C700000000 AS DateTime))
GO
INSERT [dbo].[CT_PHIEUMUON] ([MaPhieu], [MaSach], [HanTra]) VALUES (N'PM0001', N'MS000002', CAST(0x0000A0C700000000 AS DateTime))
GO
INSERT [dbo].[CT_PHIEUMUON] ([MaPhieu], [MaSach], [HanTra]) VALUES (N'PM0002', N'MS000003', CAST(0x0000A0DC00000000 AS DateTime))
GO
INSERT [dbo].[DOCGIA] ([MaDG], [HoTenDG], [EmailDG], [GioiTinhDG], [NgaySinhDG], [DiaChiDG], [DienThoaiDG], [NgayLamThe]) VALUES (N'DG0001', N'Lê Thị Hải', N'haile@gmail.com', 0, CAST(0x00007EFB00000000 AS DateTime), N'Nghệ An', N'0988666888 ', CAST(0x0000A00900000000 AS DateTime))
GO
INSERT [dbo].[DOCGIA] ([MaDG], [HoTenDG], [EmailDG], [GioiTinhDG], [NgaySinhDG], [DiaChiDG], [DienThoaiDG], [NgayLamThe]) VALUES (N'DG0002', N'Nguyễn Thị Hà', N'nguyenthiha@gmail.com', 0, CAST(0x000083EA00000000 AS DateTime), N'Vĩnh Phúc', N'0987369852 ', CAST(0x00009E5E00000000 AS DateTime))
GO
INSERT [dbo].[DOCGIA] ([MaDG], [HoTenDG], [EmailDG], [GioiTinhDG], [NgaySinhDG], [DiaChiDG], [DienThoaiDG], [NgayLamThe]) VALUES (N'DG0003', N'Hà Thị Thu Trang', N'thutrang@gmail.com', 0, CAST(0x000083DB00000000 AS DateTime), N'Bắc Giang', N'0916234567 ', CAST(0x0000A06300000000 AS DateTime))
GO
INSERT [dbo].[NHAXUATBAN] ([MaNXB], [TenNXB], [DiaChiNXB], [DienThoaiNXB], [Website]) VALUES (N'NXB001', N'Kim Đồng', N'Từ Liêm-Minh Khai-HN', N'043-1234567', N'nxbkimdong.com.vn                                 ')
GO
INSERT [dbo].[NHAXUATBAN] ([MaNXB], [TenNXB], [DiaChiNXB], [DienThoaiNXB], [Website]) VALUES (N'NXB002', N'Tuổi Trẻ', N'Đống Đa-Hà Nội', N'043-321564 ', N'tuoitre.vn                                        ')
GO
INSERT [dbo].[NHAXUATBAN] ([MaNXB], [TenNXB], [DiaChiNXB], [DienThoaiNXB], [Website]) VALUES (N'NXB003', N'Lao Động', N'Quận 3, tp HCM', N'083-69258  ', N'laodong.com.vn                                    ')
GO
INSERT [dbo].[PHIEUMUON] ([MaPhieu], [MaDG], [NgayMuon], [MaNV]) VALUES (N'PM0001', N'DG0001', CAST(0x00009FEA00000000 AS DateTime), N'NV0001')
GO
INSERT [dbo].[PHIEUMUON] ([MaPhieu], [MaDG], [NgayMuon], [MaNV]) VALUES (N'PM0002', N'DG0002', CAST(0x0000A06300000000 AS DateTime), N'NV0002')
GO
INSERT [dbo].[SACH] ([MaSach], [TenSach], [NoiDungTT], [SoTrang], [Gia], [SoLuong], [NgayNhap], [MaNXB], [MaTG], [MaTL], [TinhTrang]) VALUES (N'MS000001', N'Kính Vạn Hoa', N'Truyện kể về cuộc điều tra của nhóm học sinh...', 250, 99000, 54, CAST(0x00009BA400000000 AS DateTime), N'NXB001', N'TG0001', N'TL0001', N'0')
GO
INSERT [dbo].[SACH] ([MaSach], [TenSach], [NoiDungTT], [SoTrang], [Gia], [SoLuong], [NgayNhap], [MaNXB], [MaTG], [MaTL], [TinhTrang]) VALUES (N'MS000002', N'Trở về tuổi thơ', N'Tâm hồn của một con người sau bao nhiêu năm muốn trở về giống như ngày còn thơ bé...', 66, 36000, 21, CAST(0x0000A06E00000000 AS DateTime), N'NXB001', N'TG0001', N'TL0001', N'1')
GO
INSERT [dbo].[SACH] ([MaSach], [TenSach], [NoiDungTT], [SoTrang], [Gia], [SoLuong], [NgayNhap], [MaNXB], [MaTG], [MaTL], [TinhTrang]) VALUES (N'MS000003', N'Lập Trình Windows', N'Giáo trình hướng dẫn lập trình bằng ngôn ngữ C#...', 125, 80000, 122, CAST(0x0000A07B00000000 AS DateTime), N'NXB003', N'TG0003', N'TL0004', N'1')
GO
INSERT [dbo].[SACH] ([MaSach], [TenSach], [NoiDungTT], [SoTrang], [Gia], [SoLuong], [NgayNhap], [MaNXB], [MaTG], [MaTL], [TinhTrang]) VALUES (N'MS000004', N'Nguyên Lý HĐH', N'Bài giảng ĐH CN HN', 56, 8500, 19, CAST(0x00009BA400000000 AS DateTime), N'NXB001', N'TG0003', N'TL0004', N'1')
GO
INSERT [dbo].[SACH] ([MaSach], [TenSach], [NoiDungTT], [SoTrang], [Gia], [SoLuong], [NgayNhap], [MaNXB], [MaTG], [MaTL], [TinhTrang]) VALUES (N'MS000005', N'English', N'Luyện thi TOIEC', 135, 66000, 36, CAST(0x00009FCB00000000 AS DateTime), N'NXB002', N'TG0001', N'TL0006', N'1')
GO
INSERT [dbo].[THELOAI] ([MaTL], [TenTL]) VALUES (N'TL0001', N'Truyện Ngắn')
GO
INSERT [dbo].[THELOAI] ([MaTL], [TenTL]) VALUES (N'TL0002', N'Truyện dài')
GO
INSERT [dbo].[THELOAI] ([MaTL], [TenTL]) VALUES (N'TL0003', N'Tiểu Thuyết')
GO
INSERT [dbo].[THELOAI] ([MaTL], [TenTL]) VALUES (N'TL0004', N'Tin Học')
GO
INSERT [dbo].[THELOAI] ([MaTL], [TenTL]) VALUES (N'TL0005', N'Truyện Tranh')
GO
INSERT [dbo].[THELOAI] ([MaTL], [TenTL]) VALUES (N'TL0006', N'Văn học')
GO
INSERT [dbo].[TRASACH] ([MaPhieu], [MaSach], [MaNV], [NgayTra], [PhatHuHong], [PhatQuaHan]) VALUES (N'PM0001', N'MS000001', N'NV0002', CAST(0x0000A0E300000000 AS DateTime), 9000, 2000)
GO
INSERT [dbo].[TRASACH] ([MaPhieu], [MaSach], [MaNV], [NgayTra], [PhatHuHong], [PhatQuaHan]) VALUES (N'PM0001', N'MS000002', N'NV0002', CAST(0x0000A08A00000000 AS DateTime), 0, 0)
GO
ALTER TABLE [dbo].[CT_PHIEUMUON]  WITH CHECK ADD  CONSTRAINT [FK_CT_PHIEUMUON_PHIEUMUON] FOREIGN KEY([MaPhieu])
REFERENCES [dbo].[PHIEUMUON] ([MaPhieu])
GO
ALTER TABLE [dbo].[CT_PHIEUMUON] CHECK CONSTRAINT [FK_CT_PHIEUMUON_PHIEUMUON]
GO
ALTER TABLE [dbo].[CT_PHIEUMUON]  WITH CHECK ADD  CONSTRAINT [FK_CT_PHIEUMUON_SACH] FOREIGN KEY([MaSach])
REFERENCES [dbo].[SACH] ([MaSach])
GO
ALTER TABLE [dbo].[CT_PHIEUMUON] CHECK CONSTRAINT [FK_CT_PHIEUMUON_SACH]
GO
ALTER TABLE [dbo].[PHIEUMUON]  WITH CHECK ADD  CONSTRAINT [FK_PHIEUMUON_DOCGIA] FOREIGN KEY([MaDG])
REFERENCES [dbo].[DOCGIA] ([MaDG])
GO
ALTER TABLE [dbo].[PHIEUMUON] CHECK CONSTRAINT [FK_PHIEUMUON_DOCGIA]
GO
ALTER TABLE [dbo].[SACH]  WITH CHECK ADD  CONSTRAINT [FK_SACH_NHAXUATBAN] FOREIGN KEY([MaNXB])
REFERENCES [dbo].[NHAXUATBAN] ([MaNXB])
GO
ALTER TABLE [dbo].[SACH] CHECK CONSTRAINT [FK_SACH_NHAXUATBAN]
GO
ALTER TABLE [dbo].[SACH]  WITH CHECK ADD  CONSTRAINT [FK_SACH_THELOAI] FOREIGN KEY([MaTL])
REFERENCES [dbo].[THELOAI] ([MaTL])
GO
ALTER TABLE [dbo].[SACH] CHECK CONSTRAINT [FK_SACH_THELOAI]
GO
ALTER TABLE [dbo].[TRASACH]  WITH CHECK ADD  CONSTRAINT [FK_TRASACH_PHIEUMUON] FOREIGN KEY([MaPhieu])
REFERENCES [dbo].[PHIEUMUON] ([MaPhieu])
GO
ALTER TABLE [dbo].[TRASACH] CHECK CONSTRAINT [FK_TRASACH_PHIEUMUON]
GO
ALTER TABLE [dbo].[TRASACH]  WITH CHECK ADD  CONSTRAINT [FK_TRASACH_SACH] FOREIGN KEY([MaSach])
REFERENCES [dbo].[SACH] ([MaSach])
GO
ALTER TABLE [dbo].[TRASACH] CHECK CONSTRAINT [FK_TRASACH_SACH]
GO

------------------------------cau 1
--a
ALTER TABLE dbo.SACH ADD CONSTRAINT
	CK_SACH CHECK (TinhTrang =0 or TinhTrang=1)

--b
CREATE UNIQUE NONCLUSTERED INDEX IX_DOCGIA ON dbo.DOCGIA
	(
	MaDG
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE dbo.DOCGIA ADD CONSTRAINT
	CK_DOCGIA CHECK (LEN(DienThoaiDG)=10)
GO
--c
ALTER TABLE dbo.SACH ADD CONSTRAINT
	CK_SACH_soluong CHECK (SoLuong >0)

------------------------------------------------cau 3
--a
create view TT_chuamuon as 
select * 
from SACH , THELOAI
where SACH.MaTL=THELOAI.MaTL and THELOAI.TenTL=N'Truyện Tranh' and SACH.MaSach not in ( select CT_PHIEUMUON.MaSach from CT_PHIEUMUON)

--b
alter TRIGGER dbo.Delete_books 
   ON  dbo.SACH 
   AFTER DELETE
AS 
BEGIN
	SET NOCOUNT ON;
	if exists (select * from CT_PHIEUMUON where MaSach in (select MaSach from deleted))
		begin 
			print'Sach da duoc cho muon'
		end
END
GO
--C
CREATE FUNCTION Count_muon 
(
	-- Add the parameters for the function here
	@masach char(8) , @year int
)
RETURNS int
AS
BEGIN
	declare @result int
	set @result = (select  count(*)
						from SACH , PHIEUMUON , CT_PHIEUMUON
						where sach.MaSach = CT_PHIEUMUON.MaSach and PHIEUMUON.MaPhieu = CT_PHIEUMUON.MaPhieu 
							and SACH.MaSach = @masach and year(PHIEUMUON.NgayMuon)=@year)
	return @result
END
GO
--print dbo.Count_muon ('MS000001', 2912)

--d
CREATE PROCEDURE ThongKeQuaHan 
	-- Add the parameters for the stored procedure here
	@year int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT sach.MaSach , SACH.TenSach , SACH.SoLuong , count(*)
	FROM   SACH INNER JOIN
				 CT_PHIEUMUON ON SACH.MaSach = CT_PHIEUMUON.MaSach INNER JOIN
				 TRASACH ON SACH.MaSach = TRASACH.MaSach
	where SACH.MaSach = CT_PHIEUMUON.MaSach and CT_PHIEUMUON.MaSach = TRASACH.MaSach
		AND  CT_PHIEUMUON.HanTra < TRASACH.NgayTra and year(CT_PHIEUMUON.HanTra) =@year
	group by sach.MaSach , SACH.TenSach , SACH.SoLuong
END
GO

----------------------cau 4
--a
CREATE LOGIN [newlogin] WITH PASSWORD=N'!123456abc', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [QLTV]
GO
CREATE USER [newlogin] FOR LOGIN [newlogin]
GO
USE [QLTV]
GO
ALTER ROLE [db_owner] ADD MEMBER [newlogin]
GO
--b
BACKUP DATABASE [QLTV] TO  DISK = N'D:\sql\MSSQL15.SQLEXPRESS\MSSQL\Backup\QLTV.bak' WITH NOFORMAT, NOINIT,  NAME = N'QLTV-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO


select *from SACH
select *from DOCGIA
select *from PHIEUMUON
select *from TRASACH
select *from THELOAI
select * from CT_PHIEUMUON
