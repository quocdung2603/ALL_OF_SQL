
------------------------------------PHAN 1
--cau 1
select *from Sinhvien
where datediff(year , Ngaysinh , getdate()) > 22
--cau 2
SELECT lop.malop , lop.tenlop , count(ketqua.Diemlan2)
FROM   Ketqua INNER JOIN
             Sinhvien ON Ketqua.Masv = Sinhvien.Masv INNER JOIN
             Lop ON Sinhvien.Malop = Lop.Malop
group by lop.malop , lop.tenlop
--cau 3
SELECT hocphan.Mahp , hocphan.Tenhp , count(ketqua.diemlan2)
FROM   Hocphan INNER JOIN
             Ketqua ON Hocphan.Mahp = Ketqua.Mahp
group by hocphan.Mahp , hocphan.Tenhp
-----------------------------------PHAN 2
--cau 1
CREATE PROCEDURE Find_students 
	@hodem nvarchar(30) , @ten nvarchar(30)
AS
BEGIN
	SET NOCOUNT ON;	
	if @hodem is null and @ten is not null 
		begin
			select *from Sinhvien where @ten = sinhvien.Ten
		end
	else if @hodem is not null and @ten is null
		begin
			select *from sinhvien where @hodem = Sinhvien.hodem
		end 
	else if @hodem is null and @ten is null
		begin
			select *from Sinhvien where @hodem = sinhvien.hodem and @ten= sinhvien.ten
		end 
	else 
		begin
			print 'Not found'
		end
END
GO
--exec Find_students NULL , N'Lam'
--cau 2

CREATE PROCEDURE Find_results
	@masv varchar(10)
AS
BEGIN
	SET NOCOUNT ON;	
	if exists (select * from Ketqua where Ketqua.Masv = @masv)
		begin
			select *from Ketqua where @masv= Ketqua.Masv
		end
	else 
		begin
			print 'Not found'
		end
END
GO
--exec Find_results 'A202'
--cau 3
CREATE PROCEDURE Counts_student
	@makhoa char(4)
AS
BEGIN
	SET NOCOUNT ON;	
	if exists (select * from khoa where @makhoa=khoa.makhoa)
		begin
			select siso from khoa where khoa.makhoa = @makhoa  
		end
	else 
		begin
			insert into khoa(makhoa) values (@makhoa)
		end 
END
GO
--exec Counts_student 'NN'
--cau 4

CREATE PROCEDURE add_student
	@masv varchar(10) , @hodem nvarchar(30) , @ten nvarchar(30) ,
	@phai bit , @ngaysinh date , @diachi nvarchar(50) , 
	@dienthoai nvarchar(14) , @malop varchar(10) , @socmnd char(15)
AS
BEGIN
	SET NOCOUNT ON;	
	INSERT INTO [dbo].[Sinhvien]
           ([Masv]
           ,[Hodem]
           ,[Ten]
           ,[Phai]
           ,[Ngaysinh]
           ,[Diachi]
           ,[Dienthoai]
           ,[Malop]
           ,[SoCMND])
     VALUES
           (@masv, @hodem, @ten, @phai, @ngaysinh, @diachi , @dienthoai, @malop, @socmnd)
END
GO
---------------------------------------PHAN 3
--cau 1
CREATE FUNCTION Finds_sv 
(	
	@masv varchar(10)
)
RETURNS TABLE 
AS
RETURN 
(
	select *from sinhvien where sinhvien.Masv = @masv
)
GO
--select * from dbo.Finds_sv ('A202')
--cau 2
CREATE FUNCTION Count_passing_credits 
(
	@masv varchar(10)
)
RETURNS int
AS
BEGIN
	DECLARE @Result int
	SELECT @Result = (select count(*)
						from ketqua, Sinhvien 
						where sinhvien.Masv = ketqua.Masv 
						and Sinhvien.Masv= @masv 
						and Ketqua.Diemlan1>=5 and Ketqua.Diemlan2>=5)
	RETURN @Result

END
GO
--print dbo.Count_passing_credits ('A204')
--cau 3
CREATE FUNCTION Count_failed_credits 
(
	@masv varchar(10)
)
RETURNS int
AS
BEGIN
	DECLARE @Result int
	SELECT @Result = (select count(*)
						from ketqua, Sinhvien 
						where sinhvien.Masv = ketqua.Masv 
						and Sinhvien.Masv= @masv 
						and ((Ketqua.Diemlan1<5 and ketqua.Diemlan2 is null) or (ketqua.Diemlan1<5 and ketqua.Diemlan2<5)))
	RETURN @Result

END
GO
--print dbo.Count_failed_credits ('A202')
------------------------------------PHAN 4
--cau 1
CREATE or alter TRIGGER dbo.Add_students 
   ON  dbo.Sinhvien 
   AFTER INSERT
AS 
BEGIN
	SET NOCOUNT ON;
	declare @masv varchar(10), @hodem nvarchar(30) , @ten nvarchar(30) , @phai bit , @ngaysinh date , @diachi nvarchar(50) , @dienthoai nvarchar(14) , @malop varchar(10) ,@socmnd char(15) 
	select @masv=masv,@hodem=hodem,@ten=ten,@phai=phai,@ngaysinh=ngaysinh,@diachi=diachi,@dienthoai=dienthoai,@malop=malop,@socmnd=socmnd
	from Sinhvien
	if datediff(year,@ngaysinh, getdate())<18
		begin
			print 'chua du 18'
			rollback tran
		end
END
GO
--cau 2
CREATE TRIGGER trg_SiSoLopCuaSinhVienDuocThem
ON SinhVien 
AFTER INSERT 
AS
BEGIN
	DECLARE @cnt int = 1

	SELECT @cnt = @cnt + COUNT(*) FROM Sinhvien SV
	INNER JOIN INSERTED I ON I.Malop = SV.Malop
	PRINT N'Tổng Số Sinh Viên Của Lớp' + CONVERT(nvarchar(max),@cnt)
END
GO
--cau 3
CREATE TRIGGER DBO.UPDATE_CLASS 
   ON  DBO.LOP 
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	IF EXISTS (SELECT * FROM INSERTED WHERE MALOP='DTH35A')
	BEGIN
		UPDATE LOP SET MALOP = 'DTH35A' WHERE MALOP = 'DTH35B'
		UPDATE SINHVIEN SET MALOP = 'DTH35A' WHERE MALOP = 'DTH35B'
	END
END
GO
--cau 4
CREATE or alter TRIGGER dbo.Insert_results 
   ON  dbo.Ketqua 
   AFTER INSERT
AS 
BEGIN
	SET NOCOUNT ON;
	declare @masv varchar(10) , @mahp varchar(10) , @diemlan1 float , @diemlan2 float
	select @masv=masv , @mahp=mahp , @diemlan1=diemlan1 , @diemlan2 = diemlan2
	from Ketqua
	if not exists (select * from Sinhvien where Masv=@masv) or ((@diemlan1<0 or @diemlan1>10) or (@diemlan2<0 or @diemlan2>10))
		begin
			print 'WRONG !!!'
			rollback tran

		end
END
GO

select *from Ketqua
select *from Sinhvien
select *from khoa
