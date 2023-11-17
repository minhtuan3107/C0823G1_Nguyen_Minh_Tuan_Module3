create database quan_ly_don_hang;

use quan_ly_don_hang;

create table phieu_xuat(
	ma_phieu_xuat int primary key auto_increment,
    ngay_xuat datetime
);

create table vat_tu(
	ma_vat_tu int primary key auto_increment,
    ten_vat_tu varchar(45)
);

create table chi_tiet_phieu_xuat(
	chi_tiet_phieu_xuat int primary key auto_increment,
	don_gia_xuat int,
    so_luong_xuat int,
    ma_vat_tu int,
    ma_phieu_xuat int,
    foreign key (ma_vat_tu) references vat_tu(ma_vat_tu),
    foreign key(ma_phieu_xuat) references phieu_xuat(ma_phieu_xuat)
);

create table phieu_nhap(
	ma_phieu_nhap int primary key auto_increment,
    ngay_nhap datetime
);

create table chi_tiet_phieu_nhap(
	chi_tiet_phieu_nhap int primary key auto_increment,
	don_gia_nhap int,
    so_luong_nhap int,
    ma_phieu_nhap int,
    ma_vat_tu int,
    foreign key(ma_phieu_nhap) references phieu_nhap(ma_phieu_nhap),
    foreign key(ma_vat_tu)references vat_tu(ma_vat_tu)
);

create table don_dat_hang(
	ma_don_hang int primary key auto_increment,
    ngay_dat_hang datetime
);

create table chi_tiet_don_dat_hang(
	ma_chi_tiet_don_hang int primary key auto_increment,
	ma_don_hang int,
    ma_vat_tu int,
    foreign key (ma_don_hang) references don_dat_hang(ma_don_hang),
    foreign key(ma_vat_tu) references vat_tu(ma_vat_tu)
);

create table nha_cung_cap(
	ma_nha_cung_cap int primary key auto_increment,
    ten_nha_cung_cap varchar(50),
    dia_chi varchar(50)
);

create table cung_cap(
	ma_cung_cap int primary key auto_increment,
	ma_nha_cung_cap int,
    ma_don_hang int,
    foreign key (ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap),
    foreign key(ma_don_hang) references don_dat_hang(ma_don_hang)
);

create table so_dien_thoai(
	ma_so_dien_thoai int primary key auto_increment,
	ma_nha_cung_cap int,
    so_dien_thoai varchar(50),
    foreign key (ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);

