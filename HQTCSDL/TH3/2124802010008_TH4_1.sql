use THB2_bt1
go
--cau 1
CREATE FUNCTION TSL_manv 
(
	@manv int
)
RETURNS int
AS
BEGIN
	set @manv = (SELECT SUM(CTHOADON.SoLuong)
			FROM   CTHOADON INNER JOIN
						 HOADON ON CTHOADON.MaHD = HOADON.MaHD INNER JOIN
						 NHANVIEN ON HOADON.MaNV = NHANVIEN.MaNV INNER JOIN
						 SANPHAM ON CTHOADON.MaSP = SANPHAM.MaSP
			WHERE @manv = NHANVIEN.MaNV)
	return @manv
END
GO
--print  dbo.TSL_manv(1)
--cau 2
CREATE FUNCTION TSL_makh 
(
	-- Add the parameters for the function here
	@makh nvarchar(25)
)
RETURNS int
AS
BEGIN
	DECLARE @Result int
	set @Result = (SELECT SUM(CTHOADON.SoLuong)
					FROM   KHACHHANG INNER JOIN
						 HOADON ON KHACHHANG.MaKH = HOADON.MaKH INNER JOIN
						 CTHOADON ON HOADON.MaHD = CTHOADON.MaHD INNER JOIN
						 SANPHAM ON CTHOADON.MaSP = SANPHAM.MaSP
					WHERE @makh=KHACHHANG.MaKH)
	RETURN @Result
END
GO
--print dbo.TSL_makh (N'hunsan')

--cau 3
CREATE FUNCTION KH_buy_NO1 ()
RETURNS TABLE 
AS
RETURN 
(
	SELECT a.MaKH, a.TenKH, a.DiaChi, a.ThanhPho, a.DienThoai , SUM(b.SoLuong) soluong
	FROM  KHACHHANG a , CTHOADON b , HOADON c , SANPHAM d
	where a.MaKH = c.MaKH and c.MaHD = b.MaHD and b.MaSP = d.MaSP
	group by a.MaKH, a.TenKH, a.DiaChi, a.ThanhPho, a.DienThoai 
	having sum(b.SoLuong) >= all (select sum(f.SoLuong)
								from KHACHHANG e , CTHOADON f , HOADON g , SANPHAM h
								where e.makh = g.MaKH and g.MaHD= f.MaHD and f.MaSP = h.MaSP
								group by e.MaKH)
)
GO
select *from dbo.KH_buy_NO1()
--cau 4
CREATE FUNCTION Print_NV_sold_No1()
RETURNS TABLE 
AS
RETURN 
(
	select a.manv , sum(c.SoLuong) as Soluong_sanpham
	from nhanvien a , hoadon b , cthoadon c , sanpham d
	where a.manv = b.manv and b.mahd = c.mahd and c.masp= d.MaSP
	group by a.MaNV 
	having sum(c.SoLuong) >= all (select sum(g.soluong)
									from nhanvien e , hoadon f , cthoadon g , sanpham h
									where e.manv = f.manv and f.mahd = g.mahd and g.masp = h.masp
									group by e.MaNV)
)
GO
--cau 5
CREATE FUNCTION Sp_was_sold_No1()
RETURNS TABLE 
AS
RETURN 
(
	select sanpham.masp,SANPHAM.tensp ,sum (cthoadon.SoLuong) as Tong_soluong
	from SANPHAM, CTHOADON 
	where sanpham.masp = cthoadon.masp
	group by sanpham.masp, sanpham.tensp
	having sum(cthoadon.soluong) >= all (select sum(b.SoLuong)
										from sanpham a ,cthoadon b
										where a.masp = b.masp
										group by a.MaSP)
)
GO

--cau 6
alter FUNCTION Print_TSL_Quarter (@quy int, @nam int)
RETURNS TABLE 
AS
RETURN 
(
	select  DATEPART(quarter , HOADON.NgayGiaoHang) as Quy, year(HOADON.NgayGiaoHang) as Nam ,SUM(CTHOADON.SoLuong) as Tong_soluong
	from HOADON , CTHOADON
	where HOADON.MaHD =CTHOADON.MaHD and @quy=DATEPART(quarter , HOADON.NgayGiaoHang) and @nam=year(hoadon.NgayGiaoHang)
	group by DATEPART(quarter , HOADON.NgayGiaoHang),year(HOADON.NgayGiaoHang) 
)
GO

--select *from Print_TSL_Quarter (2, 2009)

--cau 7
CREATE FUNCTION Print_Cthoadon 
(	
	@sohd nvarchar(5)
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT KHACHHANG.MaKH, KHACHHANG.TenKH, SANPHAM.MaSP, SANPHAM.TenSP , (CTHOADON.SoLuong * CTHOADON.DonGiaBan) Thanh_Tien
	FROM   HOADON INNER JOIN
				 CTHOADON ON HOADON.MaHD = CTHOADON.MaHD INNER JOIN
				 KHACHHANG ON HOADON.MaKH = KHACHHANG.MaKH INNER JOIN
				 SANPHAM ON CTHOADON.MaSP = SANPHAM.MaSP
	where @sohd = CTHOADON.MaHD
)
GO
--select *from dbo.Print_Cthoadon ('10150')
-----------------------------------------------II------------------------------------------------
--cau 1 ---- kiem tra san pham da ton tai ?
alter PROCEDURE ThemHangHoa 
	@masp smallint ,  @tensp nvarchar(40) , @dvt nvarchar(10) , @gia money , @tonkho int
AS
BEGIN
	if not exists (select masp from sanpham where @masp=masp)
		begin
			INSERT INTO [dbo].[SANPHAM]
           ([MaSP]
           ,[TenSP]
           ,[DonViTinh]
           ,[DonGia]
           ,[SoLuongTon])
			 VALUES
				   (@masp, @tensp , @dvt , @gia , @tonkho)
		end
	else 
		print 'San pham da ton tai tu truoc do !'
END
GO
--exec ThemHangHoa 21 , N'Dau an' ,N'chai' , 123000 ,100

--cau 2
CREATE PROCEDURE SL_TonKho 
	-- Add the parameters for the stored procedure here
	@month int , @year int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select A.MaSP ,(A.SoLuongTon - M.total) SoluongTon
	from (SELECT  CTHOADON.MaHD, HOADON.NgayLapHD, HOADON.NgayGiaoHang, SANPHAM.SoLuongTon, SANPHAM.DonGia, CTHOADON.MaSP, sum(cthoadon.SoLuong) as total
		FROM   CTHOADON INNER JOIN
					 HOADON ON CTHOADON.MaHD = HOADON.MaHD INNER JOIN
					 SANPHAM ON CTHOADON.MaSP = SANPHAM.MaSP
		group by CTHOADON.MaHD, HOADON.NgayLapHD, HOADON.NgayGiaoHang, SANPHAM.SoLuongTon, SANPHAM.DonGia, CTHOADON.MaSP) as M , SANPHAM A  
	where A.MaSP = M.MaSP and month(M.NgayGiaoHang)=@month and year(M.NgayGiaoHang)=@year
END
GO
--exec SL_TonKho 1 , 2009


select *from NHANVIEN
select *from CTHOADON 
select *from HOADON 
select *from SANPHAM
select *from KHACHHANG
