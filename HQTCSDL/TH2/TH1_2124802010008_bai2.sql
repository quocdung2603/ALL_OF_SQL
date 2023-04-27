USE [QL_Du_An]
GO
/****** Object:  Database [QL_Du_An]    Script Date: 9/13/2022 9:16:46 PM ******/
CREATE DATABASE [QL_Du_An]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QL_Du_An', FILENAME = N'D:\sql\MSSQL15.SQLEXPRESS\MSSQL\DATA\QL_Du_An.mdf' , SIZE = 10240KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5120KB )
 LOG ON 
( NAME = N'QL_Du_An_log', FILENAME = N'D:\sql\MSSQL15.SQLEXPRESS\MSSQL\DATA\QL_Du_An_log.ldf' , SIZE = 5120KB , MAXSIZE = 2048GB , FILEGROWTH = 3072KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

CREATE TABLE [dbo].[Duan](
	[mada] [int] IDENTITY(1,1) NOT NULL,
	[tenda] [nvarchar](50) NOT NULL,
	[ngaybd] [smalldatetime] NULL,
	[ngaykt] [smalldatetime] NULL,
 CONSTRAINT [PK_Duan] PRIMARY KEY CLUSTERED 
(
	[mada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Nhanvien](
	[manv] [int] NOT NULL,
	[tennv] [nvarchar](50) NOT NULL,
	[tuoi] [tinyint] NOT NULL,
	[gioitinh] [bit] NULL,
 CONSTRAINT [PK_Nhanvien] PRIMARY KEY CLUSTERED 
(
	[manv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Thamgia](
	[manv] [int] NOT NULL,
	[mada] [int] NOT NULL,
	[ngayvaoda] [smalldatetime] NOT NULL,
	[ngayrada] [smalldatetime] NULL,
 CONSTRAINT [PK_Thamgia] PRIMARY KEY CLUSTERED 
(
	[manv] ASC,
	[mada] ASC,
	[ngayvaoda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Duan]  WITH CHECK ADD  CONSTRAINT [FK_Duan_Duan] FOREIGN KEY([mada])
REFERENCES [dbo].[Duan] ([mada])
GO
ALTER TABLE [dbo].[Duan] CHECK CONSTRAINT [FK_Duan_Duan]
GO



------------------------------------CAU 2---------------------------------
--2.1
ALTER TABLE dbo.Nhanvien ADD CONSTRAINT
	DF_Nhanvien_gioitinh DEFAULT 1 FOR gioitinh
GO
--2.2
ALTER TABLE [dbo].[Thamgia]  WITH CHECK ADD  CONSTRAINT [FK_Thamgia_Nhanvien] FOREIGN KEY([manv])
REFERENCES [dbo].[Nhanvien] ([manv])
GO
ALTER TABLE [dbo].[Thamgia] CHECK CONSTRAINT [FK_Thamgia_Nhanvien]
GO
--2.3
ALTER TABLE [dbo].[Thamgia]  WITH CHECK ADD  CONSTRAINT [FK_Thamgia_Duan] FOREIGN KEY([mada])
REFERENCES [dbo].[Duan] ([mada])
GO
ALTER TABLE [dbo].[Thamgia] CHECK CONSTRAINT [FK_Thamgia_Duan]
GO
--2.4
ALTER TABLE	 [dbo].[Duan]
ALTER COLUMN [tenda] nvarchar(200)
--2.5
ALTER TABLE dbo.Thamgia ADD
	lydorada nvarchar(300) NULL
GO
-------------------------------------------------- CAU 3-------------------------
USE [QL_Du_An]
GO
INSERT [dbo].[Nhanvien] ([manv], [tennv], [tuoi], [gioitinh]) VALUES (1, N'Nguyen Hoang Anh', 19, 0)
GO
INSERT [dbo].[Nhanvien] ([manv], [tennv], [tuoi], [gioitinh]) VALUES (2, N'Tran Hao Binh', 33, 1)
GO
INSERT [dbo].[Nhanvien] ([manv], [tennv], [tuoi], [gioitinh]) VALUES (3, N'Banh Dai Kien', 30, NULL)
GO
INSERT [dbo].[Nhanvien] ([manv], [tennv], [tuoi], [gioitinh]) VALUES (4, N'Quach Dai Lo', 32, NULL)
GO
INSERT [dbo].[Nhanvien] ([manv], [tennv], [tuoi], [gioitinh]) VALUES (5, N'Hua Quang Ha', 24, 0)
GO
SET IDENTITY_INSERT [dbo].[Duan] ON 
GO
INSERT [dbo].[Duan] ([mada], [tenda], [ngaybd], [ngaykt]) VALUES (1, N'Phan mem quan ly truong hoc', CAST(N'2005-02-02T00:00:00' AS SmallDateTime), CAST(N'2007-05-05T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Duan] ([mada], [tenda], [ngaybd], [ngaykt]) VALUES (2, N'He thong du bao thoi tiet', CAST(N'2005-03-03T00:00:00' AS SmallDateTime), CAST(N'2009-08-03T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Duan] ([mada], [tenda], [ngaybd], [ngaykt]) VALUES (3, N'He thong xac thuc van tay', CAST(N'2006-03-03T00:00:00' AS SmallDateTime), CAST(N'2007-04-04T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Duan] ([mada], [tenda], [ngaybd], [ngaykt]) VALUES (4, N'He thong hack facebook', CAST(N'2006-03-03T00:00:00' AS SmallDateTime), CAST(N'2007-03-03T00:00:00' AS SmallDateTime))
GO
SET IDENTITY_INSERT [dbo].[Duan] OFF
GO
INSERT [dbo].[Thamgia] ([manv], [mada], [ngayvaoda], [ngayrada], [lydorada]) VALUES (1, 1, CAST(N'2006-03-03T00:00:00' AS SmallDateTime), CAST(N'2007-05-04T00:00:00' AS SmallDateTime), NULL)
GO
INSERT [dbo].[Thamgia] ([manv], [mada], [ngayvaoda], [ngayrada], [lydorada]) VALUES (1, 2, CAST(N'2006-03-03T00:00:00' AS SmallDateTime), CAST(N'2007-03-03T00:00:00' AS SmallDateTime), NULL)
GO
INSERT [dbo].[Thamgia] ([manv], [mada], [ngayvaoda], [ngayrada], [lydorada]) VALUES (2, 1, CAST(N'2006-02-02T00:00:00' AS SmallDateTime), CAST(N'2007-05-05T00:00:00' AS SmallDateTime), NULL)
GO
INSERT [dbo].[Thamgia] ([manv], [mada], [ngayvaoda], [ngayrada], [lydorada]) VALUES (3, 2, CAST(N'2006-03-03T00:00:00' AS SmallDateTime), CAST(N'2007-04-04T00:00:00' AS SmallDateTime), NULL)
GO

----------------------------------------------CAU 4--------------------------
INSERT [dbo].[Thamgia] ([manv], [mada], [ngayvaoda], [ngayrada], [lydorada]) VALUES (5, 3, CAST(N'2006-05-05T00:00:00' AS SmallDateTime), CAST(N'2007-05-04T00:00:00' AS SmallDateTime), NULL)
GO

----------------------------------------------CAU 5----------------------------
--a
SELECT Duan.tenda, COUNT(Nhanvien.manv) AS Expr1
FROM   Duan INNER JOIN
             Thamgia ON Duan.mada = Thamgia.mada INNER JOIN
             Nhanvien ON Thamgia.manv = Nhanvien.manv
GROUP BY Duan.tenda

--b
SELECT tennv, manv, tuoi ,
CASE 
	WHEN gioitinh=0	then 'nam'
	WHEN gioitinh=1	then 'nu'
	else 'khong ro'
END as GT
FROM   Nhanvien

--c
select a.tenda, count(c.manv)
from Duan a, Thamgia b, Nhanvien c
where a.mada = b.mada and b.manv= c.manv
group by a.tenda
having count(c.manv) >= all (select count(d.manv) 
							from nhanvien d , duan e, thamgia f
							where d.manv=f.manv and f.mada= e.mada
							group by d.manv)

--d
select tenda as Du_an_0_nv_tham_gia
from duan 
where mada not in (select mada from thamgia)
--e
select a.manv , a.tennv , a.tuoi
from nhanvien a, thamgia b, duan c
where a.manv= b.manv and b.mada = c.mada
group by a.manv , a.tennv , a.tuoi
having a.tuoi <=all (select d.tuoi 
					from nhanvien d, thamgia e , duan f 
					where d.manv = e.manv and e.mada = f.mada
					group by d.tuoi)
--f
update nhanvien
set gioitinh = 1
where gioitinh is null
--g
select c.gioitinh , count(c.manv) as SL_NV
from Duan a, Thamgia b, Nhanvien c
where a.mada = b.mada and b.manv= c.manv 
group by c.gioitinh
--h
select top 1 tenda
from duan 
order by datediff(day ,ngaybd , ngaykt) desc

-----------------------------CAU 6---------------
--a
create view NhanVienDuAn as
SELECT Nhanvien.tennv, Duan.tenda, Thamgia.ngayvaoda, Thamgia.ngayrada
FROM   Thamgia INNER JOIN
             Nhanvien ON Thamgia.manv = Nhanvien.manv INNER JOIN
             Duan ON Thamgia.mada = Duan.mada
select *from NhanVienDuAn
--b
create view NV_0_tham_gia_DeAn as
select * 
from nhanvien
where manv not in (select manv from Thamgia)
select * from NV_0_tham_gia_DeAn
--------------------------- CAU 7---------------------
--a
alter procedure ThemNhanVien ( @tennv nvarchar(50) , @tuoi tinyint , @gioitinh bit )
as
begin
	insert into Nhanvien (tennv, tuoi , gioitinh) values ( @tennv, @tuoi, @gioitinh)
end
go 
--execute Themnhanvien  @tennv=N'Nguyen Van A'  , @tuoi=19 , @gioitinh=0
go
--b
CREATE PROCEDURE SuaMaNV(@manv int, @manv_new int)
AS
BEGIN
	if (@manv not in (select manv from Nhanvien) or (@manv in (select manv from Nhanvien) and @manv_new in (select manv from Nhanvien)))
		UPDATE Nhanvien SET manv = @manv where manv = @manv
	else 
		UPDATE Nhanvien SET manv = @manv_new where manv = @manv
END
GO
--exec SuaMaNV @manv= 9, @manv_new=11
--drop proc SuaMaNV

-----------------Cau8
---a
alter TRIGGER dbo.KiemTrathamgia1 
   ON  dbo.Thamgia
   After INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @cnt int
	SELECT @cnt = count(inserted.mada)
	from inserted
	group by inserted.mada
	select @cnt=@cnt + count(thamgia.mada)
	from thamgia , inserted 
	where thamgia.mada = inserted.mada
	if @cnt>3
	begin
		print ('ko hop le mot chut nao ca')
		rollback transaction
	end
END
GO
---b
CREATE TRIGGER dbo.Kiemtratuoi 
   ON  dbo.Nhanvien 
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @tuoi tinyint 
	declare @gioitinh bit
	select @tuoi=tuoi , @gioitinh = gioitinh
	from inserted
	if(@tuoi>45 and @gioitinh=0) or (@tuoi>50 and @gioitinh=1)
	begin
		print('Khong hop le')
		rollback
	end
END
GO

select*from Thamgia
select*from nhanvien
select*from Duan
