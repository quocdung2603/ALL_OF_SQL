USE [QL_Sinh_Vien]
GO

/****** Object:  Database [QL_Sinh_Vien]    Script Date: 9/13/2022 1:18:25 PM ******/
CREATE DATABASE [QL_Sinh_Vien]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QL_Sinh_Vien', FILENAME = N'D:\sql\MSSQL15.SQLEXPRESS\MSSQL\DATA\QL_Sinh_Vien.mdf' , SIZE = 30720KB , MAXSIZE = 204800KB , FILEGROWTH = 10%)
 LOG ON 
( NAME = N'QL_Sinh_Vien_log', FILENAME = N'D:\sql\MSSQL15.SQLEXPRESS\MSSQL\DATA\QL_Sinh_Vien_log.ldf' , SIZE = 10240KB , MAXSIZE = 2048GB , FILEGROWTH = 2048KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

CREATE TABLE [dbo].[khoa](
	[Makhoa] [char](4) NOT NULL,
	[Tenkhoa] [nvarchar](30) NULL,
	[Siso] [int] NULL,
 CONSTRAINT [PK_khoa] PRIMARY KEY CLUSTERED 
(
	[Makhoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Sinhvien](
	[Masv] [varchar](10) NOT NULL,
	[Hodem] [nvarchar](30) NULL,
	[Ten] [nvarchar](30) NULL,
	[Phai] [bit] NULL,
	[Ngaysinh] [date] NULL,
	[Diachi] [nvarchar](50) NULL,
	[Dienthoai] [nvarchar](14) NULL,
	[Malop] [varchar](10) NULL,
 CONSTRAINT [PK_Sinhvien] PRIMARY KEY CLUSTERED 
(
	[Masv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Sinhvien]  WITH CHECK ADD  CONSTRAINT [FK_Sinhvien_Lop] FOREIGN KEY([Malop])
REFERENCES [dbo].[Lop] ([Malop])
GO

ALTER TABLE [dbo].[Sinhvien] CHECK CONSTRAINT [FK_Sinhvien_Lop]
GO

CREATE TABLE [dbo].[Lop](
	[Malop] [varchar](10) NOT NULL,
	[Tenlop] [nvarchar](30) NULL,
	[Gvcn] [nvarchar](30) NULL,
	[Makhoa] [char](4) NULL,
	[Siso] [int] NULL,
 CONSTRAINT [PK_Lop] PRIMARY KEY CLUSTERED 
(
	[Malop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Lop]  WITH CHECK ADD  CONSTRAINT [FK_Lop_khoa] FOREIGN KEY([Makhoa])
REFERENCES [dbo].[khoa] ([Makhoa])
GO

ALTER TABLE [dbo].[Lop] CHECK CONSTRAINT [FK_Lop_khoa]
GO

CREATE TABLE [dbo].[Ketqua](
	[Masv] [varchar](10) NOT NULL,
	[Mahp] [varchar](10) NOT NULL,
	[Diemlan1] [float] NULL,
	[Diemlan2] [float] NULL,
 CONSTRAINT [PK_Ketqua] PRIMARY KEY CLUSTERED 
(
	[Masv] ASC,
	[Mahp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Ketqua]  WITH CHECK ADD  CONSTRAINT [FK_Ketqua_Hocphan] FOREIGN KEY([Mahp])
REFERENCES [dbo].[Hocphan] ([Mahp])
GO
ALTER TABLE [dbo].[Ketqua] CHECK CONSTRAINT [FK_Ketqua_Hocphan]
GO
ALTER TABLE [dbo].[Ketqua]  WITH CHECK ADD  CONSTRAINT [FK_Ketqua_Sinhvien] FOREIGN KEY([Masv])
REFERENCES [dbo].[Sinhvien] ([Masv])
GO
ALTER TABLE [dbo].[Ketqua] CHECK CONSTRAINT [FK_Ketqua_Sinhvien]
GO


CREATE TABLE [dbo].[Hocphan](
	[Mahp] [varchar](10) NOT NULL,
	[Tenhp] [nvarchar](30) NULL,
	[Sotc] [int] NULL,
 CONSTRAINT [PK_Hocphan] PRIMARY KEY CLUSTERED 
(
	[Mahp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

--D
ALTER TABLE dbo.Ketqua ADD CONSTRAINT
	DF_Ketqua_Diemlan1 DEFAULT 0 FOR Diemlan1
GO
ALTER TABLE dbo.Ketqua ADD CONSTRAINT
	DF_Ketqua_Diemlan2 DEFAULT 0 FOR Diemlan2
GO

ALTER TABLE dbo.Sinhvien ADD CONSTRAINT
	DF_Sinhvien_Diachi DEFAULT N'Bình Dương' FOR Diachi

--E
ALTER TABLE dbo.Ketqua ADD CONSTRAINT
	CK_Ketqua_Diem CHECK ((Diemlan1 >=0 and Diemlan1<=10 ) and (Diemlan2 >=0 and Diemlan2<=10 ))

--F
ALTER TABLE dbo.Sinhvien ADD CONSTRAINT
	CK_Sinhvien_Dienthoai CHECK (LEN(Dienthoai)=10 or LEN(Dienthoai)=11)
--G
ALTER TABLE dbo.Sinhvien ADD
	SoCMND char(15) NULL
GO
CREATE UNIQUE NONCLUSTERED INDEX IX_Sinhvien_CMND ON dbo.Sinhvien
	(
	Masv
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
--H
ALTER TABLE dbo.Sinhvien ADD CONSTRAINT
	CK_Sinhvien_Ngaysinh CHECK (YEAR(GETDATE())-YEAR(Ngaysinh)>=18)
GO

-----------------------------------------------------------------------------PHAN II-----------------------------------------------------------------------------
USE [QL_Sinh_Vien]
GO
INSERT [dbo].[khoa] ([Makhoa], [Tenkhoa], [Siso]) VALUES (N'CNTT', N'Cong nghe thong tin', 70)
GO
INSERT [dbo].[khoa] ([Makhoa], [Tenkhoa], [Siso]) VALUES (N'CTXH', N'Cong tac xa hoi', 50)
GO
INSERT [dbo].[khoa] ([Makhoa], [Tenkhoa], [Siso]) VALUES (N'DDT ', N'Dien-Dien tu', 65)
GO
INSERT [dbo].[khoa] ([Makhoa], [Tenkhoa], [Siso]) VALUES (N'KHTN', N'Khoa hoc tu nhien', 81)
GO
INSERT [dbo].[khoa] ([Makhoa], [Tenkhoa], [Siso]) VALUES (N'KT  ', N'Kinh te', 51)
GO
INSERT [dbo].[khoa] ([Makhoa], [Tenkhoa], [Siso]) VALUES (N'LLCT', N'Ly luan chinh tri', 65)
GO
INSERT [dbo].[khoa] ([Makhoa], [Tenkhoa], [Siso]) VALUES (N'LS  ', N'Lich su', 65)
GO
INSERT [dbo].[khoa] ([Makhoa], [Tenkhoa], [Siso]) VALUES (N'LU  ', N' Luat', 65)
GO
INSERT [dbo].[khoa] ([Makhoa], [Tenkhoa], [Siso]) VALUES (N'NV  ', N'Ngu van', 65)
GO
INSERT [dbo].[khoa] ([Makhoa], [Tenkhoa], [Siso]) VALUES (N'SP  ', N'Su Pham ', 65)
GO
INSERT [dbo].[Lop] ([Malop], [Tenlop], [Gvcn], [Makhoa], [Siso]) VALUES (N'CDSH1A', N'Cao dang sinh 1A', N'Nguyen Quoc Dung', N'CNTT', 45)
GO
INSERT [dbo].[Lop] ([Malop], [Tenlop], [Gvcn], [Makhoa], [Siso]) VALUES (N'CKT2A', N'Kinh te 2A', N'Le Thanh Tung', N'KT  ', 45)
GO
INSERT [dbo].[Lop] ([Malop], [Tenlop], [Gvcn], [Makhoa], [Siso]) VALUES (N'CTH1A', N'Tin hoc 1A', N'Nguyen Van Minh', N'CNTT', 56)
GO
INSERT [dbo].[Lop] ([Malop], [Tenlop], [Gvcn], [Makhoa], [Siso]) VALUES (N'CTH1B', N'Tin hoc 1B', N'Nguyen Van Thang', N'CNTT', 43)
GO
INSERT [dbo].[Lop] ([Malop], [Tenlop], [Gvcn], [Makhoa], [Siso]) VALUES (N'CTH2B', N'Tin hoc 2B', N'Nguyen Van Thang', N'CNTT', 43)
GO
INSERT [dbo].[Lop] ([Malop], [Tenlop], [Gvcn], [Makhoa], [Siso]) VALUES (N'DLS36A', N'Lich su 36A', N'Nguyen Van Hai', N'LS  ', 46)
GO
INSERT [dbo].[Lop] ([Malop], [Tenlop], [Gvcn], [Makhoa], [Siso]) VALUES (N'DSP35B', N'Su pham 35B', N'Nguyen Hoang Vu', N'SP  ', 50)
GO
INSERT [dbo].[Lop] ([Malop], [Tenlop], [Gvcn], [Makhoa], [Siso]) VALUES (N'DTH2B', N'Tin hoc 2B', N'Nguyen Van Tung', N'CNTT', 40)
GO
INSERT [dbo].[Lop] ([Malop], [Tenlop], [Gvcn], [Makhoa], [Siso]) VALUES (N'DTH35A', N'Tin hoc 35A', N'Hoang Van Thanh', N'CNTT', 45)
GO
INSERT [dbo].[Lop] ([Malop], [Tenlop], [Gvcn], [Makhoa], [Siso]) VALUES (N'DTH35B', N'Tin hoc 35B', N'Hoang Van Thanh', N'CNTT', 45)
GO
INSERT [dbo].[Sinhvien] ([Masv], [Hodem], [Ten], [Phai], [Ngaysinh], [Diachi], [Dienthoai], [Malop], [SoCMND]) VALUES (N'A202', N'Ta Thanh', N'Lam', 0, CAST(N'1996-01-11' AS Date), N'172 Nguyen Du', NULL, N'CKT2A', N'1              ')
GO
INSERT [dbo].[Sinhvien] ([Masv], [Hodem], [Ten], [Phai], [Ngaysinh], [Diachi], [Dienthoai], [Malop], [SoCMND]) VALUES (N'A203', N'Hoang Minh', N'Minh', 1, CAST(N'1994-11-22' AS Date), N'132/Le Loi', NULL, N'CKT2A', N'2              ')
GO
INSERT [dbo].[Sinhvien] ([Masv], [Hodem], [Ten], [Phai], [Ngaysinh], [Diachi], [Dienthoai], [Malop], [SoCMND]) VALUES (N'A204', N'Le Thi', N'Hoa', 0, CAST(N'1996-03-12' AS Date), N'98 Vo Van Kiet', N'0990789213', N'CKT2A', N'3              ')
GO
INSERT [dbo].[Sinhvien] ([Masv], [Hodem], [Ten], [Phai], [Ngaysinh], [Diachi], [Dienthoai], [Malop], [SoCMND]) VALUES (N'B101', N'Le Ba ', N'Hai', 1, CAST(N'1993-01-09' AS Date), N'12 Truong Dinh', N'0909081313', N'CTH1B', N'4              ')
GO
INSERT [dbo].[Sinhvien] ([Masv], [Hodem], [Ten], [Phai], [Ngaysinh], [Diachi], [Dienthoai], [Malop], [SoCMND]) VALUES (N'B102', N'Pham Thi', N'Hoa', 0, CAST(N'1993-09-01' AS Date), N'5 Le Lai Q1', NULL, N'CTH1B', N'5              ')
GO
INSERT [dbo].[Sinhvien] ([Masv], [Hodem], [Ten], [Phai], [Ngaysinh], [Diachi], [Dienthoai], [Malop], [SoCMND]) VALUES (N'B103', N'Le Vinh', N' Phuc', 1, CAST(N'1995-04-01' AS Date), N'12 Phan Van Tri', NULL, N'CTH1B', N'6              ')
GO
INSERT [dbo].[Sinhvien] ([Masv], [Hodem], [Ten], [Phai], [Ngaysinh], [Diachi], [Dienthoai], [Malop], [SoCMND]) VALUES (N'B104', N'Pham Van ', N'Hung ', 1, CAST(N'1994-04-09' AS Date), N'50 Nguyen Kien', N'0901091233', N'DLS36A', N'7              ')
GO
INSERT [dbo].[Sinhvien] ([Masv], [Hodem], [Ten], [Phai], [Ngaysinh], [Diachi], [Dienthoai], [Malop], [SoCMND]) VALUES (N'B105', N'Nguyen Thanh', N'Tam', 1, CAST(N'1995-07-05' AS Date), N'45 le quang dinh', N'01689908231', N'CTH1B', N'8              ')
GO
INSERT [dbo].[Sinhvien] ([Masv], [Hodem], [Ten], [Phai], [Ngaysinh], [Diachi], [Dienthoai], [Malop], [SoCMND]) VALUES (N'B201', N'Do', N'Hoang', 1, CAST(N'1991-11-09' AS Date), N'12 Nguyen Kien', N'01649128392', N'CTH2B', N'9              ')
GO
INSERT [dbo].[Sinhvien] ([Masv], [Hodem], [Ten], [Phai], [Ngaysinh], [Diachi], [Dienthoai], [Malop], [SoCMND]) VALUES (N'B202', N'Tran Thi', N'Dung', 0, CAST(N'1998-01-10' AS Date), N'12 ABC', NULL, N'DSP35B', N'10             ')
GO
INSERT [dbo].[Sinhvien] ([Masv], [Hodem], [Ten], [Phai], [Ngaysinh], [Diachi], [Dienthoai], [Malop], [SoCMND]) VALUES (N'B203', N'Nguyen Van ', N'A', 1, CAST(N'1993-09-07' AS Date), N'57 Le Quang', NULL, N'DTH2B', N'11             ')
GO
INSERT [dbo].[Sinhvien] ([Masv], [Hodem], [Ten], [Phai], [Ngaysinh], [Diachi], [Dienthoai], [Malop], [SoCMND]) VALUES (N'B204', N'Dang Trung ', N' Tien', 1, CAST(N'1998-12-11' AS Date), N'Bình Dương', NULL, N'DTH35A', N'12             ')
GO
INSERT [dbo].[Sinhvien] ([Masv], [Hodem], [Ten], [Phai], [Ngaysinh], [Diachi], [Dienthoai], [Malop], [SoCMND]) VALUES (N'C306', N'Nguyen Hoang ', N'Nam', 1, CAST(N'1991-12-07' AS Date), N'12 Vo Thi Sau', NULL, N'DLS36A', N'19             ')
GO
INSERT [dbo].[Sinhvien] ([Masv], [Hodem], [Ten], [Phai], [Ngaysinh], [Diachi], [Dienthoai], [Malop], [SoCMND]) VALUES (N'C3501', N'Nguyen Van ', N'Minh', 1, CAST(N'1997-01-01' AS Date), N'Q1', NULL, N'DTH35B', N'13             ')
GO
INSERT [dbo].[Sinhvien] ([Masv], [Hodem], [Ten], [Phai], [Ngaysinh], [Diachi], [Dienthoai], [Malop], [SoCMND]) VALUES (N'C3504', N'Tran Hung', N' Son', 1, CAST(N'1990-12-12' AS Date), N'45 Nguyen Trai', N'0909779125', N'DTH35B', N'16             ')
GO
INSERT [dbo].[Sinhvien] ([Masv], [Hodem], [Ten], [Phai], [Ngaysinh], [Diachi], [Dienthoai], [Malop], [SoCMND]) VALUES (N'C3505', N'Nguyen Minh', N'Thang', 1, CAST(N'2003-03-01' AS Date), N'Bình Dương', NULL, N'CDSH1A', N'17             ')
GO
INSERT [dbo].[Hocphan] ([Mahp], [Tenhp], [Sotc]) VALUES (N'CTR', N'Chinh tri', 3)
GO
INSERT [dbo].[Hocphan] ([Mahp], [Tenhp], [Sotc]) VALUES (N'JAVA', N'Lap trinh JAVA', 5)
GO
INSERT [dbo].[Hocphan] ([Mahp], [Tenhp], [Sotc]) VALUES (N'NMTH', N'Nhap mon tin hoc', 4)
GO
INSERT [dbo].[Hocphan] ([Mahp], [Tenhp], [Sotc]) VALUES (N'PPLT', N'Phuong phap lt', 5)
GO
INSERT [dbo].[Hocphan] ([Mahp], [Tenhp], [Sotc]) VALUES (N'PTWB', N'Phat trien web', 3)
GO
INSERT [dbo].[Hocphan] ([Mahp], [Tenhp], [Sotc]) VALUES (N'TRR', N'Toan roi rac', 3)
GO
INSERT [dbo].[Ketqua] ([Masv], [Mahp], [Diemlan1], [Diemlan2]) VALUES (N'A202', N'JAVA', 4, 0)
GO
INSERT [dbo].[Ketqua] ([Masv], [Mahp], [Diemlan1], [Diemlan2]) VALUES (N'A204', N'JAVA', 7, 0)
GO
INSERT [dbo].[Ketqua] ([Masv], [Mahp], [Diemlan1], [Diemlan2]) VALUES (N'A204', N'TRR', 6.5, 0)
GO
INSERT [dbo].[Ketqua] ([Masv], [Mahp], [Diemlan1], [Diemlan2]) VALUES (N'B101', N'CTR', 3, 1)
GO
INSERT [dbo].[Ketqua] ([Masv], [Mahp], [Diemlan1], [Diemlan2]) VALUES (N'B101', N'TRR', 8, 0)
GO
INSERT [dbo].[Ketqua] ([Masv], [Mahp], [Diemlan1], [Diemlan2]) VALUES (N'B102', N'CTR', 9, 7)
GO
INSERT [dbo].[Ketqua] ([Masv], [Mahp], [Diemlan1], [Diemlan2]) VALUES (N'B102', N'PPLT', 7, 0)
GO
INSERT [dbo].[Ketqua] ([Masv], [Mahp], [Diemlan1], [Diemlan2]) VALUES (N'B102', N'PTWB', 2, 0)
GO
INSERT [dbo].[Ketqua] ([Masv], [Mahp], [Diemlan1], [Diemlan2]) VALUES (N'B102', N'TRR', 9, 0)
GO
INSERT [dbo].[Ketqua] ([Masv], [Mahp], [Diemlan1], [Diemlan2]) VALUES (N'B103', N'PPLT', 7, 0)
GO
INSERT [dbo].[Ketqua] ([Masv], [Mahp], [Diemlan1], [Diemlan2]) VALUES (N'B103', N'PTWB', 6, 0)
GO
INSERT [dbo].[Ketqua] ([Masv], [Mahp], [Diemlan1], [Diemlan2]) VALUES (N'B103', N'TRR', 9, 0)
GO
INSERT [dbo].[Ketqua] ([Masv], [Mahp], [Diemlan1], [Diemlan2]) VALUES (N'B104', N'NMTH', 8, 0)
GO
INSERT [dbo].[Ketqua] ([Masv], [Mahp], [Diemlan1], [Diemlan2]) VALUES (N'C3505', N'NMTH', 10, 10)
GO


-----------------------------------------------------------------------------PHAN III-----------------------------------------------------------------------------
--BACK_UP
BACKUP DATABASE [QL_Sinh_Vien] TO  DISK = N'D:\sql\QL_Sinh_Vien.bak' WITH NOFORMAT, NOINIT,  NAME = N'QL_Sinh_Vien-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO
USE [master]
RESTORE DATABASE [QL_Sinh_Vien] FROM  DISK = N'D:\sql\QL_Sinh_Vien.bak' WITH  FILE = 2,  NOUNLOAD,  STATS = 5
GO


-----------------------------------------------------------------------------PHAN IV-----------------------------------------------------------------------------
--A
SELECT Ketqua.Masv, Sinhvien.Hodem, Sinhvien.Ten, Hocphan.Tenhp, Ketqua.Diemlan1,
CASE 
	WHEN Ketqua.Diemlan1>=5 THEN 'Dat'
	ELSE 'Khong dat'
END As Ket_qua_cuoi_cung
FROM   Hocphan INNER JOIN
             Ketqua ON Hocphan.Mahp = Ketqua.Mahp INNER JOIN
             Sinhvien ON Ketqua.Masv = Sinhvien.Masv
--B
SELECT Lop.Malop, Sinhvien.Masv, Sinhvien.Hodem, Sinhvien.Ten, Hocphan.Tenhp,
case 
	when Ketqua.Diemlan1 >=5 then Ketqua.Diemlan1
	when Ketqua.Diemlan2 <>0 then 
	(
		case
			when Ketqua.Diemlan1 > = Ketqua.Diemlan2 then Ketqua.Diemlan1
			else ketqua.Diemlan2
		end
	)
	when Ketqua.Diemlan2 =0 then 0
end as KQ
FROM   Lop INNER JOIN
             Sinhvien ON Lop.Malop = Sinhvien.Malop INNER JOIN
             Ketqua ON Sinhvien.Masv = Ketqua.Masv INNER JOIN
             Hocphan ON Ketqua.Mahp = Hocphan.Mahp

--C
SELECT Sinhvien.Masv, Sinhvien.Hodem, Sinhvien.Ten, Round(Avg(IIF([diemlan1]>ISNULL([diemlan2],0),[diemlan1],[diemlan2])),1) AS DIEMTB,
CASE
	WHEN Round(Avg(IIF([diemlan1]>ISNULL([diemlan2],0),[diemlan1],[diemlan2])),1)>=8 THEN ' GIOI'
	WHEN Round(Avg(IIF([diemlan1]>ISNULL([diemlan2],0),[diemlan1],[diemlan2])),1) >=6.5 AND
		Round(Avg(IIF([diemlan1]>ISNULL([diemlan2],0),[diemlan1],[diemlan2])),1) <8 THEN 'KHA'
	WHEN Round(Avg(IIF([diemlan1]>ISNULL([diemlan2],0),[diemlan1],[diemlan2])),1) >=5 AND
		Round(Avg(IIF([diemlan1]>ISNULL([diemlan2],0),[diemlan1],[diemlan2])),1) <6.5 THEN 'TRUNG BINH'
	ELSE 'YEU'
END AS XEPLOAI
FROM   Sinhvien INNER JOIN
             Ketqua ON Sinhvien.Masv = Ketqua.Masv
GROUP BY Sinhvien.Masv, Sinhvien.Hodem, Sinhvien.Ten

-----------------------------------------------------------------------------PHAN V-----------------------------------------------------------------------------
--A
CREATE VIEW DIEM_THI AS
SELECT Sinhvien.Masv, Sinhvien.Hodem, Sinhvien.Ten, Hocphan.Tenhp, Ketqua.Diemlan1, Ketqua.Diemlan2
FROM   Sinhvien INNER JOIN
             Ketqua ON Sinhvien.Masv = Ketqua.Masv INNER JOIN
             Hocphan ON Ketqua.Mahp = Hocphan.Mahp
SELECT *FROM DIEM_THI

--B
CREATE VIEW TIN_HOC_LAN_2 AS
SELECT Sinhvien.Masv, Sinhvien.Hodem, Sinhvien.Ten, Hocphan.Mahp, Hocphan.Tenhp,Lop.Tenlop,Ketqua.Diemlan1, Ketqua.Diemlan2
FROM   Ketqua INNER JOIN
             Hocphan ON Ketqua.Mahp = Hocphan.Mahp INNER JOIN
             Sinhvien ON Ketqua.Masv = Sinhvien.Masv INNER JOIN
             Lop ON Sinhvien.Malop = Lop.Malop
WHERE lop.Tenlop like 'Tin hoc%' and Ketqua.Diemlan2 <>0 
SELECT* FROM TIN_HOC_LAN_2

--C
CREATE VIEW SV_CAO_DANG_LAN_2 AS
SELECT Sinhvien.Masv, Sinhvien.Hodem, Sinhvien.Ten, Hocphan.Tenhp, Ketqua.Diemlan1, Ketqua.Diemlan2
FROM   Sinhvien INNER JOIN
             Ketqua ON Sinhvien.Masv = Ketqua.Masv INNER JOIN
             Lop ON Sinhvien.Malop = Lop.Malop INNER JOIN
             Hocphan ON Ketqua.Mahp = Hocphan.Mahp
WHERE Lop.Tenlop like'Cao dang%' and Ketqua.Diemlan2>=0
SELECT* FROM SV_CAO_DANG_LAN_2
--D
CREATE VIEW SV_KHONG_DAT AS
SELECT Sinhvien.Masv, Sinhvien.Hodem, Sinhvien.Ten, Lop.Malop, Hocphan.Tenhp, Ketqua.Diemlan1, Ketqua.Diemlan2
FROM   Sinhvien INNER JOIN
             Ketqua ON Sinhvien.Masv = Ketqua.Masv INNER JOIN
             Hocphan ON Ketqua.Mahp = Hocphan.Mahp INNER JOIN
             Lop ON Sinhvien.Malop = Lop.Malop
WHERE (Ketqua.Diemlan2 < 5)
SELECT* FROM SV_KHONG_DAT

SELECT*FROM Sinhvien
SELECT * FROM  khoa
SELECT* FROM Hocphan
SELECT *FROM Ketqua
SELECT *FROM Lop

