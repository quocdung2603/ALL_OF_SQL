USE [QLTV]
GO
/****** Object:  Table [dbo].[CT_PHIEUMUON]    Script Date: 10/18/2022 1:07:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_PHIEUMUON](
	[MaPhieu] [char](6) NOT NULL,
	[MaSach] [char](8) NOT NULL,
	[HanTra] [datetime] NOT NULL,
 CONSTRAINT [PK_CT_PHIEUMUON] PRIMARY KEY CLUSTERED 
(
	[MaPhieu] ASC,
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DOCGIA]    Script Date: 10/18/2022 1:07:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHIEUMUON]    Script Date: 10/18/2022 1:07:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIEUMUON](
	[MaPhieu] [char](6) NOT NULL,
	[MaDG] [char](6) NOT NULL,
	[NgayMuon] [datetime] NOT NULL,
	[MaNV] [char](6) NOT NULL,
 CONSTRAINT [PK_PHIEUMUON_1] PRIMARY KEY CLUSTERED 
(
	[MaPhieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SACH]    Script Date: 10/18/2022 1:07:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SACH](
	[MaSach] [char](8) NOT NULL,
	[TenSach] [nvarchar](100) NOT NULL,
	[NoiDungTT] [nvarchar](300) NULL,
	[SoTrang] [int] NULL,
	[Gia] [bigint] NULL,
	[SoLuong] [int] NOT NULL,
	[NgayNhap] [datetime] NULL,
	[MaNXB] [char](6) NOT NULL,
	[MaTG] [char](6) NOT NULL,
	[MaTL] [char](6) NOT NULL,
	[TinhTrang] [varchar](50) NULL,
 CONSTRAINT [PK_SACH_1] PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THELOAI]    Script Date: 10/18/2022 1:07:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THELOAI](
	[MaTL] [char](6) NOT NULL,
	[TenTL] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_THELOAI] PRIMARY KEY CLUSTERED 
(
	[MaTL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DOCGIA]    Script Date: 10/18/2022 1:07:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_DOCGIA] ON [dbo].[DOCGIA]
(
	[MaDG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
ALTER TABLE [dbo].[DOCGIA]  WITH CHECK ADD  CONSTRAINT [CK_DOCGIA] CHECK  ((len([DienThoaiDG])=(10)))
GO
ALTER TABLE [dbo].[DOCGIA] CHECK CONSTRAINT [CK_DOCGIA]
GO
ALTER TABLE [dbo].[SACH]  WITH CHECK ADD  CONSTRAINT [CK_SACH_1] CHECK  (([TinhTrang]=(0) OR [TinhTrang]=(1)))
GO
ALTER TABLE [dbo].[SACH] CHECK CONSTRAINT [CK_SACH_1]
GO
ALTER TABLE [dbo].[SACH]  WITH CHECK ADD  CONSTRAINT [CK_SACH_soluong] CHECK  (([SoLuong]>(0)))
GO
ALTER TABLE [dbo].[SACH] CHECK CONSTRAINT [CK_SACH_soluong]
GO
/****** Object:  Trigger [dbo].[Delete_books]    Script Date: 10/18/2022 1:07:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Delete_books] 
   ON  [dbo].[SACH] 
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
ALTER TABLE [dbo].[SACH] ENABLE TRIGGER [Delete_books]
GO

-- 2a
ALTER TABLE dbo.SACH ADD CONSTRAINT
	CK_SACH_1 CHECK (([TinhTrang]=(0) OR [TinhTrang]=(1)))
--2b
ALTER TABLE dbo.DOCGIA ADD CONSTRAINT
	CK_DOCGIA_1 CHECK ((len([DienThoaiDG])=(10)))
--3
INSERT [dbo].[CT_PHIEUMUON] ([MaPhieu], [MaSach], [HanTra]) VALUES (N'PM0001', N'MS000001', CAST(N'2012-09-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[CT_PHIEUMUON] ([MaPhieu], [MaSach], [HanTra]) VALUES (N'PM0001', N'MS000002', CAST(N'2012-09-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[CT_PHIEUMUON] ([MaPhieu], [MaSach], [HanTra]) VALUES (N'PM0002', N'MS000003', CAST(N'2012-09-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[DOCGIA] ([MaDG], [HoTenDG], [EmailDG], [GioiTinhDG], [NgaySinhDG], [DiaChiDG], [DienThoaiDG], [NgayLamThe]) VALUES (N'DG0001', N'Lê Thị Hải', N'haile@gmail.com', 0, CAST(N'1989-01-01T00:00:00.000' AS DateTime), N'Nghệ An', N'0988666888 ', CAST(N'2012-03-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[DOCGIA] ([MaDG], [HoTenDG], [EmailDG], [GioiTinhDG], [NgaySinhDG], [DiaChiDG], [DienThoaiDG], [NgayLamThe]) VALUES (N'DG0002', N'Nguyễn Thị Hà', N'nguyenthiha@gmail.com', 0, CAST(N'1992-06-17T00:00:00.000' AS DateTime), N'Vĩnh Phúc', N'0987369852 ', CAST(N'2011-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[DOCGIA] ([MaDG], [HoTenDG], [EmailDG], [GioiTinhDG], [NgaySinhDG], [DiaChiDG], [DienThoaiDG], [NgayLamThe]) VALUES (N'DG0003', N'Hà Thị Thu Trang', N'thutrang@gmail.com', 0, CAST(N'1992-06-02T00:00:00.000' AS DateTime), N'Bắc Giang', N'0916234567 ', CAST(N'2012-06-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[PHIEUMUON] ([MaPhieu], [MaDG], [NgayMuon], [MaNV]) VALUES (N'PM0001', N'DG0001', CAST(N'2012-02-01T00:00:00.000' AS DateTime), N'NV0001')
GO
INSERT [dbo].[PHIEUMUON] ([MaPhieu], [MaDG], [NgayMuon], [MaNV]) VALUES (N'PM0002', N'DG0002', CAST(N'2012-06-01T00:00:00.000' AS DateTime), N'NV0002')
GO
INSERT [dbo].[SACH] ([MaSach], [TenSach], [NoiDungTT], [SoTrang], [Gia], [SoLuong], [NgayNhap], [MaNXB], [MaTG], [MaTL], [TinhTrang]) VALUES (N'MS000001', N'Kính Vạn Hoa', N'Truyện kể về cuộc điều tra của nhóm học sinh...', 250, 99000, 54, CAST(N'2009-02-02T00:00:00.000' AS DateTime), N'NXB001', N'TG0001', N'TL0001', N'0')
GO
INSERT [dbo].[SACH] ([MaSach], [TenSach], [NoiDungTT], [SoTrang], [Gia], [SoLuong], [NgayNhap], [MaNXB], [MaTG], [MaTL], [TinhTrang]) VALUES (N'MS000002', N'Trở về tuổi thơ', N'Tâm hồn của một con người sau bao nhiêu năm muốn trở về giống như ngày còn thơ bé...', 66, 36000, 21, CAST(N'2012-06-12T00:00:00.000' AS DateTime), N'NXB001', N'TG0001', N'TL0001', N'1')
GO
INSERT [dbo].[SACH] ([MaSach], [TenSach], [NoiDungTT], [SoTrang], [Gia], [SoLuong], [NgayNhap], [MaNXB], [MaTG], [MaTL], [TinhTrang]) VALUES (N'MS000003', N'Lập Trình Windows', N'Giáo trình hướng dẫn lập trình bằng ngôn ngữ C#...', 125, 80000, 122, CAST(N'2012-06-25T00:00:00.000' AS DateTime), N'NXB003', N'TG0003', N'TL0004', N'1')
GO
INSERT [dbo].[SACH] ([MaSach], [TenSach], [NoiDungTT], [SoTrang], [Gia], [SoLuong], [NgayNhap], [MaNXB], [MaTG], [MaTL], [TinhTrang]) VALUES (N'MS000004', N'Nguyên Lý HĐH', N'Bài giảng ĐH CN HN', 56, 8500, 19, CAST(N'2009-02-02T00:00:00.000' AS DateTime), N'NXB001', N'TG0003', N'TL0004', N'1')
GO
INSERT [dbo].[SACH] ([MaSach], [TenSach], [NoiDungTT], [SoTrang], [Gia], [SoLuong], [NgayNhap], [MaNXB], [MaTG], [MaTL], [TinhTrang]) VALUES (N'MS000005', N'English', N'Luyện thi TOIEC', 135, 66000, 36, CAST(N'2012-01-01T00:00:00.000' AS DateTime), N'NXB002', N'TG0001', N'TL0006', N'1')
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

--4
create view FindBook_123 as
select sach.MaSach , sach.TenSach 
from SACH, theloai
where sach.matl = theloai.matl and theloai.tentl = N'Truyện Tranh' 
	and not exists (select * from CT_PHIEUMUON where CT_PHIEUMUON.MaSach = sach.MaSach)

--5
CREATE FUNCTION TONGLUOTMUONSACH
(
	@MASACH CHAR(8),
	@NAM INT
)
RETURNS INT
AS
BEGIN
	-- Declare the return variable here
	DECLARE @SUM INT

	-- Add the T-SQL statements to compute the return value here
	SELECT @SUM = COUNT(*)
	FROM     CT_PHIEUMUON INNER JOIN
					  PHIEUMUON ON CT_PHIEUMUON.MaPhieu = PHIEUMUON.MaPhieu INNER JOIN
					  SACH ON CT_PHIEUMUON.MaSach = SACH.MaSach
	WHERE  (YEAR(PHIEUMUON.NgayMuon) = @NAM) AND (CT_PHIEUMUON.MaSach = @MASACH)
	-- Return the result of the function
	RETURN @SUM

END
GO