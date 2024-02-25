drop database SHOP_BAN_SACH
create database SHOP_BAN_SACH
go
use SHOP_BAN_SACH
go

set dateformat dmy

create table TaiKhoan(
	TenTK char (20) primary key,
	MatKhau char (20),
	TenKhach nvarchar (100),
	SDT char (11),
	Email nvarchar (100),
	DiaChi nvarchar(200),
	SoThe char(20)
)

create table TrangThai(
	MaTrangThai char (7) primary key, 
	GiaSale int
)

create table TheLoai(
	MaTheLoai char (20) primary key, 
	TenTheLoai nvarchar (50)
)

create table Sach(
	MaSach char (10) primary key, 
	TenSach nvarchar (200),
	MaTheLoai char (20) foreign key references TheLoai(MaTheLoai),
	TacGia nvarchar(100),
	NhaXuatBan nvarchar(100),
	Gia int,
	BiaSach char(100),
	MaTrangThai char (7) foreign key references TrangThai(MaTrangThai)
)

create table GioHang(
	TenTK char (20) foreign key references TaiKhoan(TenTK), 
	MaSach char (10) foreign key references Sach(MaSach),
	Soluong smallint,
	TongTien bigint
	primary key(TenTK,MaSach)
)

go
--TRANG THAI
INSERT INTO TrangThai VALUES ('BT',null)
INSERT INTO TrangThai VALUES ('HOT',null)
INSERT INTO TrangThai VALUES ('SALE15',15)
INSERT INTO TrangThai VALUES ('SALE50',50)

--THE LOAI
INSERT INTO TheLoai VALUES ('KinhDi',N'Kinh dị')
INSERT INTO TheLoai VALUES ('GiaTuong',N'Giả tưởng')
INSERT INTO TheLoai VALUES ('KhoaHoc',N'Khoa học')
INSERT INTO TheLoai VALUES ('GiaoDuc',N'Giáo dục')
INSERT INTO TheLoai VALUES ('VanHoc',N'Văn học')
--INSERT INTO TheLoai VALUES ('CoTich',N'Cổ tích')
--INSERT INTO TheLoai VALUES ('TinhCam',N'Tình cảm')
--INSERT INTO TheLoai VALUES ('LichSu',N'Lịch sử')
--INSERT INTO TheLoai VALUES ('TrietHoc',N'Triết học')
--INSERT INTO TheLoai VALUES ('YHoc',N'Y học')
--INSERT INTO TheLoai VALUES ('AmThuc',N'Ẩm thực')
--INSERT INTO TheLoai VALUES ('NgonTinh',N'Ngôn tình')
INSERT INTO TheLoai VALUES ('PhieuLuu',N'Phiêu lưu')
INSERT INTO TheLoai VALUES ('TruyenTranh',N'Truyện tranh')
INSERT INTO TheLoai VALUES ('XaHoi',N'Xã hội')
INSERT INTO TheLoai VALUES ('KinhTe',N'Kinh tế')
INSERT INTO TheLoai VALUES ('NgheThuat',N'Nghệ thuật')
INSERT INTO TheLoai VALUES ('TruyenCuoi',N'Truyện cười')
INSERT INTO TheLoai VALUES ('TieuThuyet',N'Tiểu Thuyết')
INSERT INTO TheLoai VALUES ('TruyenNgan',N'Truyện Ngắn - Tán Văn')
INSERT INTO TheLoai VALUES ('TamLy',N'Tâm Lý')
INSERT INTO TheLoai VALUES ('HocDuong',N'Học Đường')
INSERT INTO TheLoai VALUES ('KyNangSong',N'Kỹ Năng Sống')
INSERT INTO TheLoai VALUES ('TrinhTham',N'Trinh Thám')
INSERT INTO TheLoai VALUES ('NgonNgu',N'Ngôn Ngữ')

--TAI KHOAN
INSERT INTO TaiKhoan VALUES ('Roku','123456',N'Huỳnh Thanh Lộc','0834710712',N'thanhlochuynh102@gmail.com',N'475 Điện Biên Phủ',null)
INSERT INTO TaiKhoan VALUES ('Nagai','123456',N'Nguyễn Văn Trường','0377209518',N'nvtruong.it.02@gmail.com',N'475 Điện Biên Phủ',null)
INSERT INTO TaiKhoan VALUES ('Mono','123456',N'Nguyễn Lương Tấn Trọng','0123456789',N'MonoDepTrai123@gmail.com',N'475 Điện Biên Phủ',null)

--SACH
INSERT INTO Sach VALUES ('2',N'Dare Me - Đừng thách tôi','XaHoi',N'Megan Abbott',N'Báo Sinh Viên VN - Hoa Học Trò',90,'/Assets/img/SALE50/Dare-Me.jpg','SALE50')
INSERT INTO Sach VALUES ('3',N'Tình Yêu Và Tuổi Trẻ','TieuThuyet',N'Valery Larbaud',N'NXB Hội Nhà Văn',75,'/Assets/img/SALE50/TinhYeuVaTuoiTre.jpg','SALE50')
INSERT INTO Sach VALUES ('4',N'Câm','TruyenNgan',N'Phong Điệp',N'NXB Phụ Nữ',50,'/Assets/img/SALE50/Cam.jpg','SALE50')
INSERT INTO Sach VALUES ('5',N'Hôm Nay Người Ta Nói Chia Tay','TruyenNgan',N'Iris Cao',N'NXB Văn Học',47,'/Assets/img/SALE50/homnaynguoitanoichiatay.jpg','SALE50')


INSERT INTO Sach VALUES ('6',N'Tâm Lý Học Tội Phạm - Phác Họa Chân Dung Kẻ Phạm Tội','TamLy',N'Diệp Hồng Vũ',N'NXB Thanh Niên',101,'/Assets/img/SALE15/TamLyHoc.jpg','SALE15')
INSERT INTO Sach VALUES ('7',N'Chú Thuật Hồi Chiến','TruyenTranh',N'Gege Akutami',N'NXB Kim Đồng',25,'/Assets/img/SALE15/TsuTsuKaiSen.jpg','SALE15')
INSERT INTO Sach VALUES ('8',N'Chú Thuật Hồi Chiến','TruyenTranh',N'Gege Akutami',N'NXB Kim Đồng',30,'/Assets/img/SALE15/TsuTsuKaiSen1.jpg','SALE15')
INSERT INTO Sach VALUES ('9',N'Blue Period','HocDuong',N'Yamaguchi Tsubasa',N'NXB Trẻ',48,'/Assets/img/SALE15/BluePeriod.jpg','SALE15')


INSERT INTO Sach VALUES ('10',N'Shin - Cậu bé bút chì','TruyenTranh',N'Yoshito Usui',N'Kim Đồng',25,'/Assets/img/HOT/Shin.jpg','HOT')
INSERT INTO Sach VALUES ('11',N'Shin - Cậu bé bút chì','TruyenTranh',N'Yoshito Usui',N'Kim Đồng',25,'/Assets/img/HOT/Shin2.jpg','HOT')
INSERT INTO Sach VALUES ('12',N'Shin - Cậu bé bút chì','TruyenTranh',N'Yoshito Usui',N'Kim Đồng',25,'/Assets/img/HOT/Shin3.jpg','HOT')
INSERT INTO Sach VALUES ('13',N'Shin - Cậu bé bút chì','TruyenTranh',N'Yoshito Usui',N'Kim Đồng',25,'/Assets/img/HOT/Shin4.jpg','HOT')
INSERT INTO Sach VALUES ('14',N'Shin - Cậu bé bút chì','TruyenTranh',N'Yoshito Usui',N'Kim Đồng',25,'/Assets/img/HOT/Shin5.jpg','HOT')
INSERT INTO Sach VALUES ('15',N'Shin - Cậu bé bút chì','TruyenTranh',N'Yoshito Usui',N'Kim Đồng',25,'/Assets/img/HOT/Shin6.jpg','HOT')
INSERT INTO Sach VALUES ('16',N'Shin - Cậu bé bút chì','TruyenTranh',N'Yoshito Usui',N'Kim Đồng',25,'/Assets/img/HOT/Shin7.jpg','HOT')
INSERT INTO Sach VALUES ('17',N'Shin - Cậu bé bút chì','TruyenTranh',N'Yoshito Usui',N'Kim Đồng',25,'/Assets/img/HOT/Shin8.jpg','HOT')


INSERT INTO Sach VALUES ('1',N'Dế Mèn Phiêu Lưu Ký','PhieuLuu',N'Tô Hoài',N'Kim Đồng',30,'/Assets/img/BinhThuong/de-men-phieu-luu-ky.jpg','BT')
INSERT INTO Sach VALUES ('18',N'Thỏ Bảy Màu Và Những Người Nghĩ Nó Là Bạn','TruyenCuoi',N'HUỲNH THÁI NGỌC',N'Dân Trí',99,'/Assets/img/BinhThuong/Tho7mau.jpg','BT')
INSERT INTO Sach VALUES ('19',N'Khéo Ăn Nói Sẽ Có Được Thiên Hạ','XaHoi',N'Trác Nhã',N'Văn Học',78,'/Assets/img/BinhThuong/AnNoiKhoe.jpg','BT')
INSERT INTO Sach VALUES ('20',N'Đắc Nhân Tâm','KyNangSong',N'Dale Carnegie',N'NXB Tổng Hợp TPHCM',60,'/Assets/img/BinhThuong/DacNhanTam.jpg','BT')
INSERT INTO Sach VALUES ('21',N'Doremon','TruyenTranh',N'FujikoFFujio',N'NXB Kim Đồng',28,'/Assets/img/BinhThuong/Doremon.jpg','BT')
INSERT INTO Sach VALUES ('22',N'Nam Hào Thượng Phong','TruyenCuoi',N'Bố Lãng Ni',N'Hồng Đức',108,'/Assets/img/BinhThuong/NamPhongHao.jpg','BT')
INSERT INTO Sach VALUES ('23',N'Nam Hào Thượng Phong','TruyenCuoi',N'Bố Lãng Ni',N'Hồng Đức',108,'/Assets/img/BinhThuong/NamPhongHao2.jpg','BT')
INSERT INTO Sach VALUES ('24',N'Thám Tử Lừng Danh Conan','TrinhTham',N'BAoyama Gosho',N'NXB Kim Đồng',20,'/Assets/img/BinhThuong/Conan.jpg','BT')
INSERT INTO Sach VALUES ('25',N'Nhà Đầu Tư Thông Minh','KinhTe',N'Benjamin Graham',N'NXB Thế Giới',139,'/Assets/img/BinhThuong/DauTuThongMinh.jpg','BT')
INSERT INTO Sach VALUES ('26',N'Heesu Ở Lớp B','HocDuong',N'Lily',N'Hà Nội',122,'/Assets/img/BinhThuong/HeeSu.jpg','BT')
INSERT INTO Sach VALUES ('27',N'Trịnh Công Sơn - Thư Tình Gửi Một Người','NgheThuat',N'Trịnh Công Sơn',N'NXB Trẻ',165,'/Assets/img/BinhThuong/TrinhCongSon.jpg','BT')
INSERT INTO Sach VALUES ('28',N'Hành Tinh Của Một Kẻ Nghĩ Nhiều','KyNangSong',N'Amateur Psychology Nguyễn Đoàn Minh Thư',N'Thế Giới',62,'/Assets/img/BinhThuong/HanhTinhCuaMotKeNghiNhieu.jpg','BT')
INSERT INTO Sach VALUES ('29',N'Mind Map English Vocabulary','NgonNgu',N'Hoàng Ngân, Linh Chi',N'NXB Hồng Đức',128,'/Assets/img/BinhThuong/TiengAnh.jpg','BT')
INSERT INTO Sach VALUES ('30',N'Tiếng Nhật Cho Mọi Người','NgonNgu',N'Minna no Nihongo',N'NXB Trẻ',111,'/Assets/img/BinhThuong/TiengNhat.jpg','BT')

INSERT INTO Sach VALUES ('31',N'Người Dọn Dẹp Hiện Trường Án Mạng','KinhDi',N'Lư Lạp Lạp',N'Dân Trí',65,'/Assets/img/SALE50/nguoi-don-dep-hien-truong.jpg','SALE50')
INSERT INTO Sach VALUES ('32',N'Những Con Quái Vật Đội Lốt Người Trong Thị Trấn','KinhDi',N'Mitzi Szereto',N'Dân Trí',88,'/Assets/img/SALE50/nhung-con-quai-vat-doi-lot-nguoi-trong-thi-tran.jpg','SALE50')
INSERT INTO Sach VALUES ('33',N'Móng Vuốt Quạ Đen - Mưu Ma Chước Quỷ','KinhDi',N'Leigh Bardugo',N'NXB Kim Đồng',65,'/Assets/img/SALE50/mong-vuot-qua-den_bia_tap-3_2.jpg','SALE50')
INSERT INTO Sach VALUES ('34',N'4MK','KinhDi',N'J D BARKER',N'NXB Văn Học',87,'/Assets/img/SALE50/4mk.jpg','SALE50')
INSERT INTO Sach VALUES ('35',N'Đồng Linh Dị Truyện - Quỷ Triền Thân','KinhDi',N'Tống Ngọc',N'Thanh Niên',65,'/Assets/img/SALE50/quy-truyen-than.jpg','SALE50')

INSERT INTO Sach VALUES ('36',N'Harry Potter Và Hòn Đá Phù Thuỷ','GiaTuong',N'J.K.Rowling, Lý Lan',N'Nhà Suất Bản Trẻ',115,'/Assets/img/SALE15/HP_HonDaPhuThuy.jpg','SALE15')
INSERT INTO Sach VALUES ('37',N'Harry Potter Và Phòng Chứa Bí Mật - Tập 2 (Tái Bản 2022)','GiaTuong',N'J.K.Rowling',N'Nhà Suất Bản Trẻ',127,'/Assets/img/SALE15/HP_PhongChuaBiMat.jpg','SALE15')
INSERT INTO Sach VALUES ('38',N'Harry Potter Và Hội Phượng Hoàng - Tập 5 (Tái Bản 2023)','GiaTuong',N'J.K.Rowling',N'Nhà Suất Bản Trẻ',346,'/Assets/img/SALE15/HP_HoiPhuongHoang.jpg','SALE15')
INSERT INTO Sach VALUES ('39',N'Harry Potter Và Hoàng Tử Lai - Tập 06 (Tái Bản 2022)','GiaTuong',N'J.K.Rowling',N'Nhà Suất Bản Trẻ',196,'/Assets/img/SALE15/HP_HoangTuLai.jpg','SALE15')
INSERT INTO Sach VALUES ('40',N'Harry Potter Và Hội Phượng Hoàng - Phiên Bản Màu','GiaTuong',N'J.K.Rowling',N'Nhà Suất Bản Trẻ',1350,'/Assets/img/SALE15/HP_HoiPhuongHoang_Color.jpg','SALE15')

INSERT INTO Sach VALUES ('41',N'Kays Anatomy - Giải Phẫu Cơ Thể Người','KhoaHoc',N'Adam Kay, Henry Paker',N'NXB Kim Đồng',127,'/Assets/img/BinhThuong/Giai-phau-co-the.jpg','BT')
INSERT INTO Sach VALUES ('42',N'Quiz! Khoa Học Kì Thú: Dậy Thì Giới Tính','KhoaHoc',N'Park, Kyung Eun',N'NXB Kim Đồng',50,'/Assets/img/BinhThuong/day-thi-gioi-tinh.jpg','BT')
INSERT INTO Sach VALUES ('43',N'Những Cái Nhất Và Đầu Tiên Trên Thế Giới','KhoaHoc',N'Cha Hyun Jin',N'NXB Kim Đồng',57,'/Assets/img/BinhThuong/nhung-cai-nhat.jpg','BT')
INSERT INTO Sach VALUES ('44',N'Bộ Sách Vỡ Lòng Về Khoa Học - Vũ Trụ Từ A Đến Z','KhoaHoc',N'Chris Ferrie, Julia Kregenow',N'NXB Phụ Nữ Việt Nam',31,'/Assets/img/BinhThuong/vu-tru-a-toi-z.jpg','BT')
INSERT INTO Sach VALUES ('45',N'Thảo Nguyên Châu Phi - Sức Sống Mãnh Liệt','KhoaHoc',N'Nhiều Tác Giả',N'NXB Mỹ Thuật',46,'/Assets/img/BinhThuong/thao-nguyen-chau-phi.jpg','BT')
	
INSERT INTO Sach VALUES ('46',N'Cẩm Nang Tuổi Dậy Thì Dành Cho Bạn Gái (Tái Bản)','GiaoDuc',N'Từ Ninh',N'NXB Phụ Nữ Việt Nam',60,'/Assets/img/BinhThuong/tuoi-day-thi-gai.jpg','BT')
INSERT INTO Sach VALUES ('47',N'Giới Hạn Của Bạn Chỉ Là Xuất Phát Điểm Của Tôi (Tái Bản)','GiaoDuc',N'Mèo Maverick',N'NXB Thế Giới',75,'/Assets/img/BinhThuong/Gioi-han-xuat-phat.jpg','BT')
INSERT INTO Sach VALUES ('48',N'Cẩm Nang Tuổi Dậy Thì Dành Cho Bạn Trai (Tái Bản)','GiaoDuc',N'Từ Ninh',N'NXB Phụ Nữ Việt Nam',54,'/Assets/img/BinhThuong/tuoi-day-thi-trai.jpg	','BT')
INSERT INTO Sach VALUES ('49',N'Học Cho Ai? Học Để Làm Gì? Tập 1 (Tái Bản 2019)','GiaoDuc',N'Tiêu Vệ',N'NXB Kim Đồng',34,'/Assets/img/BinhThuong/hoc-de-lam-gi.jpg','BT')
INSERT INTO Sach VALUES ('50',N'Kỹ Năng Kiên Trì Và Ứng Phó Với Khó Khăn','GiaoDuc',N'Trí Thức Việt',N'NXB Dân Trí',52,'/Assets/img/BinhThuong/ky-nang-ung-pho.jpg','BT')



