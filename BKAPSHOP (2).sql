CREATE DATABASE BKSHOP
USE BKSHOP

CREATE TABLE SanPham(
	Id int not null identity(1,1),
	Ten nvarchar(max) default null,
	Cpu nvarchar(max) default null,
	Main nvarchar(max) default null,
	CongGiaoTiep text default null,
	Audio nvarchar(max) default null,
	BanPhim nvarchar(max) default null,
	TrongLuong float,
	MauSac nvarchar(max) default null,
	KichThuoc nvarchar(max) default null,
	DonGia float not null,
	DonViBan bigint not null,
	DonViKho bigint not null,
	HDD nvarchar(max) default null,
	SSD nvarchar(max) default null,
	VGA nvarchar(max) default null,
	DungLuongPin nvarchar(max) default null,
	HeDieuHanh nvarchar(max) default null,
	ManHinh nvarchar(max) default null,
	Ram nvarchar(max) default null,
	ThietKe nvarchar(max) default null,
	ThongTinBaoHanh nvarchar(max) default null,
	ThongTinChung nvarchar(max) default null,
	MaHangSanXuat int default null,
	Status bit default(1),
	NgayTao datetime default null,
	NgayCapNhat datetime default null,
	PRIMARY KEY (Id),
) 
CREATE TABLE HangSanXuat(
	Id int not null identity(1,1),
	Ten nvarchar(max) default null,
	Status bit DEFAULT(1),
	NgayTao datetime default null,
	NgayCapNhat datetime default null,
	PRIMARY KEY (Id),
)
CREATE TABLE NguoiDung(
	Id int not null identity(1,1),
	HoTen nvarchar(max) ,
	DiaChi nvarchar(max),
	Email nvarchar(max),
	Password nvarchar(200),
	Sdt nvarchar(200),
	Status bit default(1) ,
	NgayTao datetime default null,
	NgayCapNhat datetime default null,
	PRIMARY KEY (Id),
)
CREATE TABLE TaiKhoan(
	Id int not null identity(1,1),
	HoTen nvarchar(max) ,
	DiaChi nvarchar(max),
	Email nvarchar(max),
	Password nvarchar(200),
	Sdt nvarchar(200),
	Status bit default(1),
	NgayTao datetime default null,
	NgayCapNhat datetime default null,

	PRIMARY KEY (Id),
)
CREATE TABLE VaiTro(
	Id int not null identity(1,1),
	Ten nvarchar(max),
	Status bit default(1),
	NgayTao datetime default null,
	NgayCapNhat datetime default null,

	PRIMARY KEY (Id),
)
CREATE TABLE VaiTroTaiKhoan(
	MaTaiKhoan int not null,
	MaVaiTro int not null,
	Status bit default(1) ,
	NgayTao datetime default null,
	NgayCapNhat datetime default null,

	PRIMARY KEY (MaTaiKhoan,MaVaiTro)
)
CREATE TABLE Anh(
	Id int not null identity(1,1),
	Url nvarchar(2000) default null,
	MaSanPham int default null,
	Status bit default(1) ,
	NgayTao datetime default null,
	NgayCapNhat datetime default null,
	PRIMARY KEY (Id),
)
CREATE TABLE DonHang(
	Id int not null identity(1,1),
	TenNguoiNhan nvarchar(max) default null,
	DiaChiNhan nvarchar(max) default null,
	GhiChu text default null,
	SDTNguoiNhan varchar(max) default null,
	MaNguoiDung int default null,
	PRIMARY KEY (Id) ,
)
CREATE TABLE ChiTietDonHang(
	DonGia float not null,
	SoLuong int not null,
	NgayDat date default null,
	NgayGiao date default null,
	NgayNhan date default null,
	MaDonHang int default null,
	MaSanPham int default null,
	Status nvarchar(100) default null,
	NgayTao datetime default null,
	NgayCapNhat datetime default null,
	PRIMARY KEY (MaDonHang,MaSanPham),
)



ALTER TABLE SanPham ADD CONSTRAINT FK_Ma_Hang_San_Xuat FOREIGN KEY (MaHangSanXuat) REFERENCES HangSanXuat(Id)
ALTER TABLE VaiTroTaiKhoan ADD CONSTRAINT FK_Ma_TaiKhoan FOREIGN KEY (MaTaiKhoan) REFERENCES TaiKhoan(Id)
ALTER TABLE VaiTroTaiKhoan ADD CONSTRAINT FK_Ma_VaiTro FOREIGN KEY (MaVaiTro) REFERENCES VaiTro(Id)

ALTER TABLE Anh ADD CONSTRAINT FK_Ma_San_Pham_Anh FOREIGN KEY (MaSanPham) REFERENCES SanPham(Id)
ALTER TABLE DonHang ADD CONSTRAINT FK_Ma_Nguoi_Dung_Don_Hang FOREIGN KEY (MaNguoiDung) REFERENCES NguoiDung(Id)

ALTER TABLE ChiTietDonHang ADD CONSTRAINT FK_Don_Hang_Chi_Tiet FOREIGN KEY (MaDonHang) REFERENCES DonHang(Id)
ALTER TABLE ChiTietDonHang ADD CONSTRAINT FK_San_Pham_Chi_Tiet FOREIGN KEY (MaSanPham) REFERENCES SanPham(Id)


INSERT INTO HangSanXuat VALUES (N'Apple',1,'2022-1-3','2022-1-3')
INSERT INTO HangSanXuat VALUES (N'Asus',1,'2022-1-3','2022-1-3')
INSERT INTO HangSanXuat VALUES (N'Acer',1,'2022-1-3','2022-1-3')
INSERT INTO HangSanXuat VALUES (N'Dell',1,'2022-1-3','2022-1-3')
INSERT INTO HangSanXuat VALUES (N'HP',1,'2022-1-3','2022-1-3')
INSERT INTO HangSanXuat VALUES (N'Lenovo',1,'2022-1-3','2022-1-3')
INSERT INTO HangSanXuat VALUES (N'Asus',1,'2022-1-3','2022-1-3')
INSERT INTO HangSanXuat VALUES (N'MSI',1,'2022-1-3','2022-1-3')
INSERT INTO HangSanXuat VALUES (N'Masstel',1,'2022-1-3','2022-1-3')

INSERT INTO SanPham values ('Macbook','Intel, Core i5, 1.8 Ghz',N'Main',N'1x USB 3.2 Gen 2 port featuring power-off USB charging',N'Waves MaxxAudio, Acer TrueHarmony™',N'RGB 4 vùng',2.5,N'Obsidian Black',N'360.4 x 271.09 x 25.9 mm',23990000,26980000,100,N'1TB',N'512GB',N'NVIDIA GeForce RTX 3050 4GB GDDR6','5800mAh',N'Windows 11 Home',N'15.6 inch FHD(1920 x 1080) IPS 144Hz SlimBezel',N'8GB DDR4 3200MHz (2x SO-DIMM socket, up to 32GB SDRAM)',N'thiết kế không thay đổi, vỏ nhôm sang trọng, siêu mỏng và siêu nhẹ',N'12 tháng',N'hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',1,1,2030-4-4,2034-4-4)
INSERT INTO SanPham values ('Macbook','Intel, Core i7, 1.8 Ghz',N'Main',N'1x USB 5.2 Gen 2 port featuring power-off USB charging',N'Waves MaxxAudio, Acer TrueHarmony™',N'RGB 4 vùng',3.5,N'Obsidian Black',N'360.4 x 271.09 x 25.9 mm',2990000,3290000,100,N'1TB',N'512GB',N'NVIDIA GeForce RTX 3050 4GB GDDR6','5800mAh',N'Windows 11 Home',N'15.6 inch FHD(1920 x 1080) IPS 144Hz SlimBezel',N'8GB DDR4 3200MHz (2x SO-DIMM socket, up to 32GB SDRAM)',N'thiết kế không thay đổi, vỏ nhôm sang trọng, siêu mỏng và siêu nhẹ',N'12 tháng',N'hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',1,1,2030-4-4,2034-4-4)
INSERT INTO SanPham values ('Asus','Intel, Core i7, 1.8 Ghz',N'Main',N'1x USB 5.2 Gen 2 port featuring power-off USB charging',N'Waves MaxxAudio, Acer TrueHarmony™',N'RGB 4 vùng',5.5,N'Obsidian Black',N'360.4 x 271.09 x 25.9 mm',2344000,2544000,100,N'1TB',N'512GB',N'NVIDIA GeForce RTX 3050 4GB GDDR6','5800mAh',N'Windows 11 Home',N'15.6 inch FHD(1920 x 1080) IPS 144Hz SlimBezel',N'8GB DDR4 3200MHz (2x SO-DIMM socket, up to 32GB SDRAM)',N'thiết kế không thay đổi, vỏ nhôm sang trọng, siêu mỏng và siêu nhẹ',N'12 tháng',N'hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',2,1,2030-4-4,2034-4-4)
INSERT INTO SanPham values ('HP','Intel, Core i10, 1.8 Ghz',N'Main',N'1x USB 5.2 Gen 2 port featuring power-off USB charging',N'Waves MaxxAudio, Acer TrueHarmony™',N'RGB 4 vùng',4.5,N'Obsidian Black',N'360.4 x 271.09 x 25.9 mm',25990000,27990000,100,N'1TB',N'512GB',N'NVIDIA GeForce RTX 3050 4GB GDDR6','5800mAh',N'Windows 11 Home',N'15.6 inch FHD(1920 x 1080) IPS 144Hz SlimBezel',N'8GB DDR4 3200MHz (2x SO-DIMM socket, up to 32GB SDRAM)',N'thiết kế không thay đổi, vỏ nhôm sang trọng, siêu mỏng và siêu nhẹ',N'12 tháng',N'hiệu năng được nâng cấp, thời lượng pin cực lâu, phù hợp cho nhu cầu làm việc văn phòng nhẹ nhàng, không cần quá chú trọng vào hiển thị của màn hình',5,1,2030-4-4,2034-4-4)

select * from NguoiDung

insert into NguoiDung values(N'Bùi Khắc Duyệt',N'Hà Nội',N'duyet@gmail.com',123,0988998767,1,'2022-4-5','2022-4-6')
insert into NguoiDung values(N'Nguyễn Hữu Thắng',N'Thanh Hóa',N'thang@gmail.com',123,0988998767,1,'2022-4-5','2022-4-6')

insert into TaiKhoan values (N'Nguyễn Văn Long',N'Quốc Oai - Hà Nội',N'long@gmail.com',N'long123',N'0393875645',1,null,null)
insert into TaiKhoan values (N'Do Van Tan',N'Thach That - Hà Nội',N'tan@gmail.com',N'long123',N'03935875645',1,null,null)
insert into TaiKhoan values (N'Nguyen Van A',N'Cau Giay - Hà Nội',N'a@gmail.com',N'long123',N'039382475645',1,null,null)
insert into TaiKhoan values (N'Tran Van B',N'Ninh Binh',N'b@gmail.com',N'long123',N'03938475645',1,null,null)
insert into TaiKhoan values (N'Vuong Van Tu',N'Ha Tay',N'tu@gmail.com',N'long123',N'03938756645',1,null,null)

insert into VaiTro values (N'Nhân Viên',1,null,null)
insert into VaiTro values (N'Admin',1,null,null)

insert into VaiTroTaiKhoan values(1,1,1,null,null)
insert into VaiTroTaiKhoan values(2,2,1,null,null)
insert into VaiTroTaiKhoan values(3,1,1,null,null)
insert into VaiTroTaiKhoan values(4,2,1,null,null)
insert into VaiTroTaiKhoan values(5,1,1,null,null)

select * from TaiKhoan
select * from VaiTroTaiKhoan

select * from Anh
delete from Anh where id =5
INSERT INTO Anh values ('Asus.jpg',3,1,2020-4-5,2035-30-5)
INSERT INTO Anh values ('Macbook.jpg',1,1,2020-4-5,2035-30-5)
INSERT INTO Anh values ('HP.jpg',2,1,2020-4-5,2035-30-5)
INSERT INTO Anh values ('HP1.jpg',4,1,2020-4-5,2035-30-5)
INSERT INTO Anh values ('HP1.jpg',4,1,2020-4-5,2035-30-5)
INSERT INTO Anh values ('1.jpg',4,1,2020-4-5,2035-30-5)



insert into DonHang values (N'Lee Min Hoo',N'21 lê văn lương thanh xuân hà nội',N'Khong co ghi chu',N'09867654187',1)
insert into DonHang values (N'Trần Văn Tiến',N'24/23 Cầu giấy Hà Nội',N'Giao giờ hành chinh',N'0393165875',2)
insert into DonHang values (N'Nguyễn Cẩm Ly',N'Số 35 Văn Tiến Dũng hà nội',N'Khong co ghi chu',N'0986321312',1)
insert into DonHang values (N'Lê Đức Thọ',N'Số 23 ngách 45/24 Khuất Duy Tiến Hà Nội',N'Khong co ghi chu',N'0986915915',2)
insert into DonHang values (N'Nguyễn Minh Châu',N'21 Hoàng Đạo Thuy Thanh Xuân Hà Nội',N'Khong co ghi chu',N'0986234234',2)
insert into DonHang values (N'Đào Bá Hợp',N'24/87 Nguyễn Thị Thập thanh xuân hà nội',N'Khong co ghi chu',N'0986123456',1)


select * from NguoiDung
select * from DonHang
select * from ChiTietDonHang


insert into ChiTietDonHang values (2000000,2,'2022-01-01','2022-01-02','2022-01-05',11,1,1,null,null)
insert into ChiTietDonHang values (3000000,3,'2022-02-05','2022-02-06','2022-02-08',12,2,1,null,null)
insert into ChiTietDonHang values (5000000,4,'2022-03-02','2022-03-03','2022-03-05',7,3,1,null,null)
insert into ChiTietDonHang values (7000000,2,'2022-03-02','2022-03-03','2022-03-05',8,4,1,null,null)
insert into ChiTietDonHang values (8000000,5,'2022-04-16','2022-04-18','2022-04-24',9,1,1,null,null)
insert into ChiTietDonHang values (1000000,1,'2022-05-15','2022-05-16','2022-05-20',10,2,1,null,null)

select * from DonHang
select * from SanPham
select * from Anh

select * from ChiTietDonHang where Status=1 or Status=2
select * from TaiKhoan


select count(*) from ChiTietDonHang where status=4

select DonGia from ChiTietDonHang where status = 4 and NgayTao >= '20220801' and NgayTao <= '20220831'


SELECT * FROM ChiTietDonHang WHERE MaSanPham=1
select * from DonHang where status = 3 and NgayTao >= '20220801'

select * from ChiTietDonHang
update ChiTietDonHang set NgayTao = '2022-03-04' where MaDonHang = 7
update ChiTietDonHang set NgayTao = '2022-04-04' where MaDonHang = 8
update ChiTietDonHang set NgayTao = '2022-05-04' where MaDonHang = 9
update ChiTietDonHang set NgayTao = '2022-06-04' where MaDonHang = 1

select * from TaiKhoan
select * from VaiTroTaiKhoan

select donGia from ChiTietDonHang where status=3 and ngayTao >= '20220801' and ngayTao<= '20220831'
select * from VaiTroTaiKhoan vttk inner join TaiKhoan tk on vttk.MaTaiKhoan = tk.Id where  email='long@gmail.com' and password = 'long123'
select * from VaiTroTaiKhoan vttk inner join TaiKhoan tk on vttk.MaTaiKhoan = tk.Id where email= 'long@gmail.com'