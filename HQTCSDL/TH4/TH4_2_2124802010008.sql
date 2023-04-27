USE [master]
GO
/****** Object:  Database [TH4_2_QLSACH]    Script Date: 10/4/2022 1:09:42 PM ******/
CREATE DATABASE [TH4_2_QLSACH]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TH4_2_QLSACH', FILENAME = N'D:\sql\MSSQL15.SQLEXPRESS\MSSQL\DATA\TH4_2_QLSACH.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TH4_2_QLSACH_log', FILENAME = N'D:\sql\MSSQL15.SQLEXPRESS\MSSQL\DATA\TH4_2_QLSACH_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

CREATE TABLE [dbo].[KHACH](
	[makh] [int] NOT NULL,
	[tenkh] [nvarchar](50) NOT NULL,
	[diachi] [nvarchar](50) NOT NULL,
	[quan] [nvarchar](50) NOT NULL,
	[dienthoai] [varchar](14) NULL,
	[nguoigt] [nvarchar](50) NULL,
 CONSTRAINT [PK_KHACH] PRIMARY KEY CLUSTERED 
(
	[makh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[SACH](
	[masach] [int] NOT NULL,
	[tensach] [nvarchar](50) NULL,
	[tacgia] [nvarchar](50) NULL,
	[chude] [nvarchar](50) NULL,
	[trongkho] [int] NULL,
 CONSTRAINT [PK_SACH] PRIMARY KEY CLUSTERED 
(
	[masach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[SACHBAN](
	[sohd] [int] NOT NULL,
	[makh] [int] NOT NULL,
	[masach] [int] NOT NULL,
	[ngaymua] [datetime] NOT NULL,
	[soluong] [int] NOT NULL,
 CONSTRAINT [PK_SACHBAN] PRIMARY KEY CLUSTERED 
(
	[sohd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SACHBAN]  WITH CHECK ADD  CONSTRAINT [FK_SACHBAN_KHACH] FOREIGN KEY([makh])
REFERENCES [dbo].[KHACH] ([makh])
GO
ALTER TABLE [dbo].[SACHBAN] CHECK CONSTRAINT [FK_SACHBAN_KHACH]
GO
ALTER TABLE [dbo].[SACHBAN]  WITH CHECK ADD  CONSTRAINT [FK_SACHBAN_SACH] FOREIGN KEY([masach])
REFERENCES [dbo].[SACH] ([masach])
GO
ALTER TABLE [dbo].[SACHBAN] CHECK CONSTRAINT [FK_SACHBAN_SACH]
GO
USE [master]
GO
ALTER DATABASE [TH4_2_QLSACH] SET  READ_WRITE 
GO

USE [TH4_2_QLSACH]
GO
INSERT [dbo].[SACH] ([masach], [tensach], [tacgia], [chude], [trongkho], [Dongia]) VALUES (1, N'Hoàng hôn trên sồn', N'Gia Phong', N'Tình yêu', 11, 120)
GO
INSERT [dbo].[SACH] ([masach], [tensach], [tacgia], [chude], [trongkho], [Dongia]) VALUES (2, N'Cây lúa nước', N'Lê Mây', N'Khoa học', 24, 30)
GO
INSERT [dbo].[SACH] ([masach], [tensach], [tacgia], [chude], [trongkho], [Dongia]) VALUES (3, N'Tâm lý trước mùa thi', N'Hải Đăng', N'Tâm lý', 32, 42)
GO
INSERT [dbo].[KHACH] ([makh], [tenkh], [diachi], [quan], [dienthoai], [nguoigt]) VALUES (1, N'Lê Công', N'22 CMT8', N'TDM', N'098123654', N'Hoàng Kim')
GO
INSERT [dbo].[KHACH] ([makh], [tenkh], [diachi], [quan], [dienthoai], [nguoigt]) VALUES (2, N'Văn Nghệ', N'19 Ngô Gia Tự', N'Bến Cát', NULL, NULL)
GO
INSERT [dbo].[KHACH] ([makh], [tenkh], [diachi], [quan], [dienthoai], [nguoigt]) VALUES (3, N'Trần Thông', N'87 Hoàng Hoa Thám', N'Dầu Tiếng', N'', NULL)
GO
INSERT [dbo].[KHACH] ([makh], [tenkh], [diachi], [quan], [dienthoai], [nguoigt]) VALUES (4, N'Hoàng Tín', N'6 Trần Văn Ơn', N'TDM', NULL, NULL)
GO
INSERT [dbo].[SACHBAN] ([sohd], [makh], [masach], [ngaymua], [soluong]) VALUES (1, 1, 2, CAST(N'2006-11-22T00:00:00.000' AS DateTime), 5)
GO
INSERT [dbo].[SACHBAN] ([sohd], [makh], [masach], [ngaymua], [soluong]) VALUES (2, 2, 3, CAST(N'2005-07-15T00:00:00.000' AS DateTime), 4)
GO
INSERT [dbo].[SACHBAN] ([sohd], [makh], [masach], [ngaymua], [soluong]) VALUES (3, 2, 1, CAST(N'2006-05-24T00:00:00.000' AS DateTime), 7)
GO
INSERT [dbo].[SACHBAN] ([sohd], [makh], [masach], [ngaymua], [soluong]) VALUES (4, 3, 1, CAST(N'2005-11-15T00:00:00.000' AS DateTime), 9)
GO


-------------------------------CAU 3-----------------------------
--A
select tensach,tacgia
from SACH
where Dongia between 100 and 300
--b
select 	sach.masach,sach.chude,sum(sachban.soluong) 
from sach, SACHBAN
where sach.masach = sachban.masach
group by sach.masach,sach.chude
having sum(sachban.soluong) >= all (select sum(sb1.soluong)
									from sach s1 , SACHBAN sb1
									where s1.masach = sb1.masach
									group by s1.masach , s1.chude)

--c
select top 3 KHACH.makh, KHACH.tenkh , sum(SACHBAN.soluong * SACH.Dongia)
from KHACH , SACHBAN , SACH
where KHACH.makh = SACHBAN.makh and SACH.masach = SACHBAN.masach
group by KHACH.makh , KHACH.tenkh
order by  sum(SACHBAN.soluong * SACH.Dongia) desc 

--d
select tenkh , diachi , quan
from KHACH
where nguoigt is not null

--e
select SACHBAN.ngaymua , sum(SACHBAN.soluong* SACH.Dongia) doanhthu
from SACHBAN , SACH
where sachban.masach = sach.masach
group by sachban.ngaymua

--f
select SACH.masach , SACH.tacgia, sum(SACHBAN.soluong)
from SACH , SACHBAN 
where SACH.masach = SACHBAN.masach
group by SACH.masach, SACH.tacgia
having sum(SACHBAN.soluong) >= all (select sum(sb1.soluong)
									from SACH s1 , SACHBAN sb1
									where s1.masach =sb1.masach 
									group by s1.masach , s1.tacgia)

--g
select SACH.tensach
from  sach 
where sach.trongkho < (select avg(SACH.trongkho) from SACH)
--h
select KHACH. quan , count(KHACH.quan)
from KHACH
group by KHACH.quan 
having count(KHACH.quan) <= all (select count(k1.quan) from KHACH k1 group by k1.quan)



-------------------------cau 4
--a
CREATE PROCEDURE update_dongia 
	-- Add the parameters for the stored procedure here
	@tensach nvarchar(50) , @tacgia nvarchar(50) , @values int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	update SACH
	set sach.Dongia = @values
	where SACH.tensach =@tensach and SACH.tacgia = @tacgia
END
GO
--exec update_dongia N'Cây lúa nước' , N'Lê Mây' , 500

--b
CREATE PROCEDURE insert_hoadon 
	-- Add the parameters for the stored procedure here
	@sohd int , @makh int , @masach int ,@ngaymua datetime , @soluong int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into SACHBAN values (@sohd ,@makh ,@masach , @ngaymua , @soluong)
END
GO

--exec insert_hoadon 5,1,3,'7/12/2006' , 10

--c
CREATE PROCEDURE delete_hd 
	-- Add the parameters for the stored procedure here
	@sohd int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from SACHBAN where @sohd= SACHBAN.sohd
END
GO

--exec delete_hd 5

------------------------------------cau 5
--a
CREATE FUNCTION SL_TON 
(
	@masach int
)
RETURNS int
AS
BEGIN
	DECLARE @Result int
	SELECT @Result = (select trongkho from SACH where @masach = masach)
	RETURN @Result

END
GO
--select dbo.SL_TON(1)

--b
CREATE FUNCTION SL_sachdamua 
(
	@makh int 
)
RETURNS int
AS
BEGIN
	DECLARE @Result int
	SELECT @Result = (select sum(SACHBAN.soluong)
					from KHACH , SACHBAN
					where KHACH.makh = SACHBAN.makh and @makh= KHACH.makh)
	RETURN @Result

END
GO

--select dbo.SL_sachdamua (2)
--c
CREATE FUNCTION Sach_dabantrongngay 
(
	@ngaymua datetime
)
RETURNS int
AS
BEGIN
	DECLARE @Result int
	SELECT @Result = (select sum (soluong) 
					from SACHBAN where @ngaymua = ngaymua)
	RETURN @Result
END
GO

--select dbo.Sach_dabantrongngay ('2006-11-22 00:00:00.000')










select *from KHACH
select *from SACH
select *from SACHBAN