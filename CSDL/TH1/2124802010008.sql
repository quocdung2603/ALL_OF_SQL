CREATE DATABASE QLDA
GO

USE QLDA
GO

CREATE TABLE PHONGBAN
(
	MAPHG INT PRIMARY KEY,
	TENPHG CHAR(10) NOT NULL,
	TRPHG CHAR(3),
	NG_NHANCHUC DATETIME,
)

CREATE TABLE NHANVIEN
(
	MANV CHAR(3) PRIMARY KEY,
	HONV CHAR(20) NOT NULL,
	TENLOT CHAR(20),
	TENNV CHAR(20) NOT NULL,
	NGSINH DATETIME,
	PHAI CHAR(3),
	DCHI CHAR(100),
	MA_NQL CHAR(3),
	PHG INT FOREIGN KEY(PHG) REFERENCES PHONGBAN(MAPHG),
	LUONG FLOAT,
)

CREATE TABLE DEAN
(
	MADA INT PRIMARY KEY,
	TENDA CHAR(30) NOT NULL,
	DDIEM_DA CHAR(100) NOT NULL,
	PHONG INT FOREIGN KEY (PHONG) REFERENCES PHONGBAN(MAPHG),
)

CREATE TABLE PHANCONG
(
	MA_NVIEN CHAR(3) FOREIGN KEY(MA_NVIEN) REFERENCES NHANVIEN(MANV),
	SODA INT FOREIGN KEY(SODA) REFERENCES DEAN(MADA),
	THOIGIAN FLOAT,	
	PRIMARY KEY (MA_NVIEN,SODA)
)

CREATE TABLE DIADIEM_PHG
(
	MAPHG INT FOREIGN KEY (MAPHG) REFERENCES PHONGBAN(MAPHG),
	DIADIEM CHAR(30),
	PRIMARY KEY(MAPHG,DIADIEM),
)

CREATE TABLE THANNHAN
(
	MA_NVIEN CHAR(3) FOREIGN KEY(MA_NVIEN) REFERENCES NHANVIEN(MANV),
	TENTN CHAR(50),
	PHAI CHAR(5),
	NGSINH DATETIME,
	QUANHE CHAR(30),
	PRIMARY KEY( MA_NVIEN , TENTN),
)

INSERT INTO PHONGBAN
VALUES( 1,'QUAN LY', '888', '06/19/1971')
INSERT INTO PHONGBAN
VALUES(4,'DIEU HANH', '777', '01/01/1985')
INSERT INTO PHONGBAN
VALUES(5,'NGHIEN CUU', '333', '05/22/1978')

INSERT INTO NHANVIEN
VALUES('123','Dinh','Ba' , 'Tien' , '01/09/1955','Nam','731 Tran Hung Dao Q1','333',5 ,30000)
INSERT INTO NHANVIEN
VALUES('333','Nguyen','Thanh' , 'Tung' , '12/08/1945','Nam','638 Nguyen Van Cu Q5','888',5 ,40000)
INSERT INTO NHANVIEN
VALUES('453','Tran','Thanh' , 'Tam' , '07/31/1962','Nam','543 Mai Thi Luu Ba Dinh Ha','333',5 ,25000)
INSERT INTO NHANVIEN
VALUES('666','Nguyen','Manh' , 'Hung' , '09/015/1952','Nam','975 Le Lai P3 Vung Tau','333',5 ,38000)
INSERT INTO NHANVIEN
VALUES('888','Vuong','Ngoc' , 'Quyen' , '10/10/1927','Nu','450 Trung Vuong My Tho TG',' ',1 ,55000)
INSERT INTO NHANVIEN
VALUES('987','Le','Thi' , 'Nhan' , '06/20/1931','Nu','291 Ho Van Hue Q.PN','888',4 ,43000)
INSERT INTO NHANVIEN
VALUES('777','Tran','Hong' , 'Quang' , '03/29/1959','Nam','980 Le Hong Phuong Vung Tau','987',4 ,25000)
INSERT INTO NHANVIEN
VALUES('999','Bui','Thuy' , 'Vu' , '07/19/1958','Nam','332 Nguyen Thai Hoc Quy','987',4 ,25000)
SELECT * FROM NHANVIEN

DELETE  FROM NHANVIEN
DELETE  FROM THANNHAN

INSERT INTO THANNHAN
VALUES ('123','Chau' ,'Nu','12/31/1978','Con gai')
INSERT INTO THANNHAN
VALUES ('123','Duy' ,'Nam','01/01/1978','Con trai')
INSERT INTO THANNHAN
VALUES ('123','Phuong' ,'Nu','05/05/1957','Vo chong')
INSERT INTO THANNHAN
VALUES ('333','Duong' ,'Nu','05/03/1937','Vo chong')
INSERT INTO THANNHAN
VALUES ('333','Tung' ,'Nam','10/25/1973','Con trai')
INSERT INTO THANNHAN
VALUES ('333','Quang' ,'Nu','04/05/1976','Con gai')
INSERT INTO THANNHAN
VALUES ('987','Dang' ,'Nam','02/29/1932','Vo chong')
SELECT * FROM THANNHAN

INSERT INTO DEAN
VALUES (1,'San phan X','VUNG TAU',5)
INSERT INTO DEAN
VALUES (2,'San phan Y','NHA TRANG',5)
INSERT INTO DEAN
VALUES (3,'San phan Z','TP HCM',5)
INSERT INTO DEAN
VALUES (10,'Tin hoc hoa','HA NOI',4)
INSERT INTO DEAN
VALUES (20,'Cap quang','TP HCM',1)
INSERT INTO DEAN
VALUES (30,'Dao tao','HA NOI',4)
SELECT * FROM DEAN

INSERT INTO PHANCONG
VALUES ('123',1,22.5)
INSERT INTO PHANCONG
VALUES ('123',2,7.5)
INSERT INTO PHANCONG
VALUES ('123',3,10)
INSERT INTO PHANCONG
VALUES ('333',10,10)
INSERT INTO PHANCONG
VALUES ('333',20,10)
INSERT INTO PHANCONG
VALUES ('453',1,20)
INSERT INTO PHANCONG
VALUES ('453',2,20)
INSERT INTO PHANCONG
VALUES ('666',3,40)
INSERT INTO PHANCONG
VALUES ('888',20,0)
INSERT INTO PHANCONG
VALUES ('987',20,15)
SELECT * FROM PHANCONG

INSERT INTO DIADIEM_PHG
VALUES (1,'TP HCM')
INSERT INTO DIADIEM_PHG
VALUES (4,'HA NOI')
INSERT INTO DIADIEM_PHG
VALUES (5,'NHA TRANG')
INSERT INTO DIADIEM_PHG
VALUES (5,'TP HCM')
INSERT INTO DIADIEM_PHG
VALUES (5,'VUNG TAU')
SELECT * FROM DIADIEM_PHG

/*CAU1*/
SELECT * 
FROM NHANVIEN
WHERE PHG = 4

/*CAU2*/
SELECT *
FROM NHANVIEN
WHERE LUONG>30000

/*CAU3*/
SELECT *
FROM NHANVIEN
WHERE LUONG>25000 AND PHG=4 OR LUONG>30000 AND PHG=5

/*CAU 4*/
SELECT HONV,TENLOT,TENNV
FROM NHANVIEN,DIADIEM_PHG
WHERE DIADIEM ='TP HCM' AND MAPHG=PHG
/*CAU5*/
SELECT HONV,TENLOT,TENNV
FROM NHANVIEN
WHERE HONV LIKE 'N%'
/*CAU6*/
SELECT NGSINH,DCHI
FROM NHANVIEN
WHERE HONV LIKE 'Dinh' AND TENLOT LIKE 'Ba' AND TENNV LIKE 'Tien'
/*CAU7*/
SELECT *
FROM NHANVIEN
WHERE YEAR(NGSINH) BETWEEN 1960 AND 1965
/*CAU8*/
SELECT HONV,TENLOT,TENNV,YEAR(NGSINH)
FROM NHANVIEN
/*CAU9*/
SELECT HONV,TENLOT,TENNV,(2022-YEAR(NGSINH))AS TUOINV
FROM NHANVIEN