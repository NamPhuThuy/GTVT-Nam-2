﻿use ThucHanh
CREATE TABLE KHACHHANG
(
     MAKHACHHANG NVARCHAR(10) PRIMARY KEY NOT NULL,
	 TENCONGTY NVARCHAR(40) NOT NULL,
	 TENGIAODICH NVARCHAR(30), 
	 DIACHI NVARCHAR(50),
	 DIENTHOAI NVARCHAR(15),
	 FAX NVARCHAR(15),
	 EMAIL NVARCHAR(30),

);

CREATE TABLE NHANVIEN(
     MANHANVIEN NVARCHAR(10) PRIMARY KEY NOT NULL,
	 HO NVARCHAR(20) NOT NULL,
	 TEN NVARCHAR(10) NOT NULL, 
	 NGAYSINH DATETIME,
	 NGAYLAMVIEC DATETIME,
	 DIACHI NVARCHAR(50),
	 DIENTHOAI NVARCHAR(15),
	 LUONGCOBAN INT,
	 PHUCAP INT,
	  CONSTRAINT CK_NHANVIEN_TUOI CHECK (DATEDIFF(YEAR, NGAYSINH, GETDATE()) BETWEEN 18 AND 61)
);


CREATE TABLE NHACUNGCAP(
     MACONGTY NVARCHAR(10) PRIMARY KEY NOT NULL,
	 TENCONGTY NVARCHAR(40) NOT NULL,
	 TENGIAODICH NVARCHAR(30),
	 DIACHI NVARCHAR(50),
	 DIENTHOAI NVARCHAR(15),
	 FAX NVARCHAR(15),
	 EMAIL NVARCHAR(30),

);

CREATE TABLE LOAIHANG(
     MALOAIHANG NVARCHAR(10) PRIMARY KEY NOT NULL,
	 TENLOAIHANG NVARCHAR(40) NOT NULL,

);

CREATE TABLE MATHANG(
     MAHANG NVARCHAR(10) PRIMARY KEY NOT NULL,
	 TENHANG NVARCHAR(50) NOT NULL,
	 MACONGTY NVARCHAR(10) FOREIGN KEY REFERENCES NHACUNGCAP(MACONGTY), 
	 MALOAIHANG NVARCHAR(10) FOREIGN KEY REFERENCES LOAIHANG(MALOAIHANG),
	 SOLUONG INT,
	 DONVITINH NVARCHAR(10),
	 GIAHANG INT,

);

CREATE TABLE DONDATHANG(
     SOHOADON INT PRIMARY KEY NOT NULL,
	 MAKHACHHANG NVARCHAR(10) FOREIGN KEY REFERENCES KHACHHANG(MAKHACHHANG),
	 MANHANVIEN NVARCHAR(10) FOREIGN KEY REFERENCES NHANVIEN(MANHANVIEN), 
	 NGAYDATHANG DATETIME,
	 NGAYGIAOHANG DATETIME,
	 NGAYCHUYENHANG DATETIME,
	 NOIGIAOHANG NVARCHAR(50),
	 CHECK (NGAYDATHANG<=NGAYGIAOHANG AND NGAYDATHANG<=NGAYCHUYENHANG)

);

CREATE TABLE CHITIETDATHANG(
     SOHOADON INT FOREIGN KEY REFERENCES DONDATHANG(SOHOADON) NOT NULL,
	 MAHANG NVARCHAR(10) FOREIGN KEY REFERENCES MATHANG(MAHANG) NOT NULL,
	 CONSTRAINT PK_CHITIETDATHANG PRIMARY KEY(SOHOADON, MAHANG),
	 GIABAN INT,
	 SOLUONG SMALLINT DEFAULT 1,
	 MUCGIAMGIA NUMERIC(2,1) DEFAULT 0,
);


INSERT INTO KHACHHANG (MAKHACHHANG, TENCONGTY, TENGIAODICH, DIACHI, DIENTHOAI, FAX, EMAIL)
VALUES ('3123512', 'Cong ty Elastic', 'GMK 67', 'Tra Bong, Quang Ngai', '02557 316 4902', '02557 316 4902', 'thamgia@icloud.com'),
       ('3123513', N'Cong ty Haixin', 'Gas 67', 'Can Duoc, Long An', '02725 481 5692', '02725 481 5692', 'dolien250@hotmail.com'),
       ('3123514', 'Cong ty SATWA', 'VN66', 'Muong Ang, Dien Bien', '076 271 9305', '03421 901 5492', 'sales@wid.com'),
	   ('3123515', N'Cong ty MINH QUANG', 'Moonsgeek m1', 'An Phu, An Giang', '085 065 2417', '085 065 2417', 'subach@google.com'),
       ('3123516', N'Cong ty Hapam', 'Alice', 'Ba To, Quang Ngai', '083 803 6459', '083 803 6459', 'hoangcam19@soft.com'),
       ('3123517', N'Cong ty Nikkiso', 'FL Es', 'Truc Ninh, Nam Dinh', '091 370 9542', '091 370 9542', 'doanlam11@goo.com');

INSERT INTO NHANVIEN (MANHANVIEN, HO, TEN, NGAYSINH, NGAYLAMVIEC, DIACHI, DIENTHOAI, LUONGCOBAN, PHUCAP)
VALUES ('NV007', 'Pham Van', 'Tuat', '1971-04-12', '1980-01-2', '38 B Biet, Ward 1', '091826472', 20000000, 2100000),
		('NV001', 'Nguyen Van', 'Linh', '2000-04-12', '2022-09-12', '138 A Lan, Ward 3', '0912231829', 15000000, 3500000),
	   ('NV002', 'Nguy The', 'Quang', '2002-11-07', '2021-12-27', '140 Su Van Hanh, Ward 12', '0978231229', 12000000, 1500000),
	   ('NV003', 'Nguyen The', 'Quan', '2002-07-29', '2021-04-26', '73 Au Co, Ward 14', '0912331829', 9000000, 2000000),
	   ('NV004', 'Trinh Thanh', 'Nam', '2002-12-14', '2023-07-11', '63 Nguyen Son', '0978231829', 12000000, 2000000),
	   ('NV005', 'Nguyen', 'Van A', '2000-03-11', '2020-01-01', '36 Thai Ha', '0358231329', 10000000, 1500000);

INSERT INTO NHACUNGCAP(MACONGTY, TENCONGTY, TENGIAODICH, DIACHI, DIENTHOAI, FAX, EMAIL)
VALUES ('489432', 'AKKO Co ltd', 'M1 pack', 'Shenzhen, China', '92-6623286', '92-6623286', 'what@gmail.com'),
	   ('489434', 'Ritchy Co ltd', 'VN66 pack', 'Cupertino, CA', '60-3177470', '60-3177470', 'joey@gmail.com'),
	   ('141241', 'FL Esports Co ltd', 'FL pack', 'HCM, Viet Nam', '0924278509', '47-4278509', 'hope@gmail.com'),
	   ('413453', 'VNG Cor', 'VINAMILK', 'Hanoi, Viet Nam', '09221837463', '47-4414509', 'cate@gmail.com');

INSERT INTO DONDATHANG(SOHOADON, MAKHACHHANG, MANHANVIEN, NGAYDATHANG, NGAYGIAOHANG, NGAYCHUYENHANG, NOIGIAOHANG)
VALUES (1, '3123512', 'NV002', '2018-05-15', '2018-05-21', '2018-05-16', '12 Cong Dinh, Thach That'),
		(12, '3123512', 'NV002', '2022-09-22', '2022-09-25', '2022-09-23', '199 Tran Quoc Hoan, Cau Giay'),
		(8, '3123514', 'NV004', '2018-01-28', '2018-01-31', '2018-01-29', '431 Can Duoc, Long An'),
		(11, '3123512', 'NV001', '2023-02-06', '2023-02-12', '2023-02-07', '12 Muong Ang, Dien Bien'),
		(9, '3123515', 'NV005', '2023-03-12', '2023-03-15', '2023-03-13', '25 1194 Lang, Cau Giay'),
		(16, '3123515', 'NV003', '2023-02-14', '2023-03-21', '2023-03-15', '111 Quan Hoa, Cau Giay'),
		(21, '3123516', 'NV002', '2023-03-18', '2023-03-21', '2023-03-18', '68 Cau Giay, Cau Giay'),
		(19, '3123517', 'NV002', '2019-06-16', '2019-06-21', '2019-06-17', '67 Trieu Khuc, Tan Trieu'),
	   (7, '3123516', 'NV004', '2000-11-21', '2022-11-29', '2022-11-22', '12 Van Tao, Thuong Tin'),
	   (10, '3123516', 'NV001', '1999-11-21', '1999-11-29', '1999-11-22', '12 Tran Phu, Thuong Tin');


INSERT INTO LOAIHANG(MALOAIHANG, TENLOAIHANG)
VALUES ('KB', 'KeyBoard'),
	   ('MO', 'Mouse'),
	   ('HP', 'HeadPhone'),
	   ('EP', 'EarPhone'),
	   ('SC', 'Screen');



INSERT INTO MATHANG(MAHANG, TENHANG, MACONGTY, MALOAIHANG, SOLUONG, DONVITINH, GIAHANG)
VALUES ('KB-L', 'Moonsgeek M1', '489432', 'KB', 28, 'VND', 1700000),
	   ('KB-M', '3087', '489432', 'KB', 30, 'VND', 2800000),
	   ('EP-L', ' MOD001 Psittacus', '489432', 'EP', 46, 'VND', 4500000),
	   ('HP-M', 'FL Esports 870', '489434', 'HP', 30, 'VND', 1300000),
	   ('HP-L', 'FL Esports CMK87', '489434', 'HP', 17, 'VND', 2200000),
	   ('SC-L', 'Keychron K8', '141241', 'SC', 50, 'VND', 2500000);

INSERT INTO CHITIETDATHANG(SOHOADON, MAHANG, GIABAN, SOLUONG, MUCGIAMGIA)
VALUES (12, 'KB-L', 230000, 2, 1),
	   (11, 'KB-M', 320000, 2, 2),
	   (16, 'KB-L', 124000, 3, 1),
	   (21, 'EP-L', 439000, 4, 2),
	   (9, 'HP-M', 213000, 3, 1),
	   (8, 'SC-L', 189000, 3, 1),
	   (19, 'SC-L', 5419000, 10, 2),
	   (7, 'EP-L', 121000, 3, 1),
	   (10, 'KB-L', 1910000, 12, 1),
	   (1, 'HP-M', 8400000, 100, 2);


--1 Cho biết danh sách các đối tác cung cấp hàng cho công ty
Select MACONGTY, TENCONGTY
from NHACUNGCAP

--2 Mã hàng, tên hàng và số lượng hiện có trong công ty
Select MAHANG, TENHANG, SOLUONG
from MATHANG

--3 Địa chỉ, số điện thoại của nhà cung cấp có tên giao dịch VINAMILK là gì?
Select DIACHI, DIENTHOAI
from NHACUNGCAP
where TENGIAODICH = 'VINAMILK'

--4 Cho biết mã và tên các mặt hàng có giá lơn hơn 100000 và số lượng hiện có ít hơn 50
Select MAHANG, TENHANG 
from MATHANG
where SOLUONG < 50 and GIAHANG > 100000

--5 Đơn đặt hàng số 1 do ai đặt, do nhân viên nào lập, thời gian và địa điểm giao hàng ở đâu?
Select DONDATHANG.NGAYGIAOHANG, DONDATHANG.NOIGIAOHANG, KHACHHANG.MAKHACHHANG, KHACHHANG.TENCONGTY, NHANVIEN.MANHANVIEN, NHANVIEN.HO, NHANVIEN.TEN
from ((KHACHHANG INNER JOIN DONDATHANG 
     ON KHACHHANG.MAKHACHHANG = DONDATHANG.MAKHACHHANG) INNER JOIN NHANVIEN
     ON DONDATHANG.MANHANVIEN = NHANVIEN.MANHANVIEN)
WHERE SOHOADON = 1

--6 Hiển thị những nhân viên có lương cơ bản cao nhất công ty
Select MANHANVIEN, HO, TEN
From NHANVIEN 
where LUONGCOBAN = (Select Max(LUONGCOBAN) from NHANVIEN);

--7 Nhân viên nào trong công ty bán được nhiều hàng nhất và số lượng bán được là bao nhiêu?
SELECT TOP 1 n.HO, n.TEN, SUM(c.SOLUONG) AS TONGSOLUONGBAN
FROM DONDATHANG d
JOIN NHANVIEN n ON d.MANHANVIEN = n.MANHANVIEN
JOIN CHITIETDATHANG c ON d.SOHOADON = c.SOHOADON
GROUP BY n.HO, n.TEN
ORDER BY TONGSOLUONGBAN DESC;

--8 Hãy cho biết tổng số hàng của mỗi loại hàng
SELECT MAHANG, SUM(SOLUONG) as TONG_SOLUONG
FROM MATHANG
GROUP BY MAHANG;

--9 Tăng lương lên 50% cho những nhân viên bán được số lượng hàng >=100 trong năm 2023
SELECT NHANVIEN.MANHANVIEN,NHANVIEN.LUONGCOBAN, SUM(TONGSL) AS TONGSP INTO CHECK1 
FROM NHANVIEN,
	(SELECT CHITIETDATHANG.SOHOADON, SUM(SOLUONG) AS TONGSL,DONDATHANG.MANHANVIEN 
		FROM CHITIETDATHANG, DONDATHANG
	WHERE CHITIETDATHANG.SOHOADON = DONDATHANG.SOHOADON
	GROUP BY CHITIETDATHANG.SOHOADON, DONDATHANG.MANHANVIEN) t
	WHERE NHANVIEN.MANHANVIEN = T.MANHANVIEN
	GROUP BY NHANVIEN.MANHANVIEN,NHANVIEN.LUONGCOBAN
	HAVING SUM(TONGSL)>=100;
---SELECT * FROM CHECK1
UPDATE NHANVIEN
SET NHANVIEN.LUONGCOBAN = NHANVIEN.LUONGCOBAN * 1.5
FROM NHANVIEN FULL JOIN CHECK1
ON NHANVIEN.MANHANVIEN = (SELECT MANHANVIEN FROM CHECK1);

Select *
from NHANVIEN

--11 Xóa khỏi bảng NHANVIEN những nhân viên đã làm việc cho công ty trên 40 năm
Delete from NHANVIEN
where Datediff(day, NGAYLAMVIEC, Getdate()) > 14600

Select *
from NHANVIEN

--12 Xóa những đơn hàng có ngày đặt hàng trước năm 2020 ra khỏi CSDL
BEGIN TRANSACTION;
DELETE FROM CHITIETDATHANG WHERE SOHOADON IN (SELECT SOHOADON FROM DONDATHANG WHERE NGAYDATHANG < '2020-01-01');
DELETE FROM DONDATHANG WHERE NGAYDATHANG < '2020-01-01';
COMMIT;

Select *
from DONDATHANG