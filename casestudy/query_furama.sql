use case_study;

-- 2.	Hiển thị thông tin của tất cả nhân viên có trong 
-- hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.

select *  from nhan_vien
where (nhan_vien.ho_ten like 'H%' ) or (nhan_vien.ho_ten like 'T%' ) or (nhan_vien.ho_ten like 'K%' ) and length(nhan_vien.ho_ten) <= 15 ;

--  3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa 4
-- chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.

select *
from khach_hang
where (year(now()) -  year(khach_hang.ngay_sinh) > 18) and (year(now()) - year(khach_hang.ngay_sinh) < 50) 
and khach_hang.dia_chi like "%Đà Nẵng" or khach_hang.dia_chi like "%Quảng Trị";

-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

select  khach_hang.ma_khach_hang, khach_hang.ho_ten, loai_khach.ten_loai_khach, count(hop_dong.ma_khach_hang) as so_lan
from khach_hang
join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
where loai_khach.ten_loai_khach = "Diamond"
group by khach_hang.ma_khach_hang
order by so_lan;

-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, 
-- tong_tien (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá 
-- là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra). 

select kh.ma_khach_hang, kh.ho_ten,lk.ten_loai_khach,hd.ma_hop_dong,dv.ten_dich_vu,hd.ngay_lam_hop_dong,hd.ngay_ket_thuc,
(ifnull(dv.chi_phi_thue, 0) + sum(ifnull(hdct.so_luong, 0) * ifnull(dvdk.gia, 0))) as 'tong_tien'
from khach_hang kh
join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
left join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by kh.ma_khach_hang , hd.ma_hop_dong;

 -- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
 
select dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu
from dich_vu 
join loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
join hop_dong on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
where hop_dong.ngay_lam_hop_dong > '2021-04-01' 
group by dich_vu.ma_dich_vu;

-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm alte
-- nhưng chưa từng được khách hàng đặt phòng trong năm 2021.

select dv.ma_dich_vu,dv.ten_dich_vu,dv.dien_tich,dv.so_nguoi_toi_da,dv.chi_phi_thue,ldv.ten_loai_dich_vu
from dich_vu dv
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
where year(hd.ngay_lam_hop_dong) = 2020 and dv.ma_dich_vu not in (
select ma_dich_vu
from hop_dong
where year(ngay_lam_hop_dong) = 2021); 
  -- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
  
-- cach 1

select khach_hang.ho_ten
from khach_hang 
group by khach_hang.ho_ten;

-- cach 2 

select distinct khach_hang.ho_ten
from khach_hang;

-- cach 3

select khach_hang.ho_ten
from khach_hang
union
select khach_hang.ho_ten
from khach_hang;
-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

select month(hop_dong.ngay_lam_hop_dong) as thang, count(*)
from hop_dong
where year(hop_dong.ngay_lam_hop_dong) = 2021
group by thang
order by thang;
-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm.
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).

select hd.*, sum(ifnull(hdct.so_luong,0)) as so_luong_dich_vu_di_kem 
from hop_dong hd
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem 
group by hd.ma_hop_dong ;


-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.

select dvdk.*
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
join hop_dong hd on hdct.ma_hop_dong = hd.ma_hop_dong
join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
where (kh.ma_loai_khach = 1) and (kh.dia_chi like "% Vinh" or kh.dia_chi like "% Quảng Ngãi");

-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 
-- 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.

select hd.ma_hop_dong, nv.ho_ten,hd.ngay_lam_hop_dong ,kh.ho_ten, kh.so_dien_thoai, dv.ten_dich_vu,sum(ifnull(hdct.so_luong,0)),hd.tien_dat_coc
from hop_dong hd
join nhan_vien nv on hd.ma_nhan_vien = nv.ma_nhan_vien
join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong 
group by hd.ma_hop_dong
having (month(hd.ngay_lam_hop_dong) between 10 and 12) and year(hd.ngay_lam_hop_dong) = 2020 and hd.ma_hop_dong not in (
select hd.ma_hop_dong
from hop_dong hd
where (month(hd.ngay_lam_hop_dong) between 1 and 6) and (year(hd.ngay_lam_hop_dong) = 2021));

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).

select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, sum(hdct.so_luong) as so_luong
from dich_vu_di_kem dvdk
left join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by dvdk.ma_dich_vu_di_kem
having sum(hdct.so_luong) = (
select max(so_luong)
from hop_dong_chi_tiet hdct
);

-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất.
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, 
-- so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).

select hd.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem, count(hdct.ma_dich_vu_di_kem) as so_luong
from hop_dong hd
join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
left join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by dvdk.ma_dich_vu_di_kem
having so_luong = 1;

-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, 
-- ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.

select nv.*, hd.ngay_lam_hop_dong
from nhan_vien nv
left join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
where year(hd.ngay_lam_hop_dong) between 2020 and 2021
group by nv.ma_nhan_vien
having count(hd.ma_hop_dong) <= 3;

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
set sql_safe_updates = 0 ;
delete from nhan_vien 
where nhan_vien.ma_nhan_vien not in (select hop_dong.ma_nhan_vien
from hop_dong
where year(hop_dong.ngay_lam_hop_dong) between 2019 and 2021
group by hop_dong.ma_nhan_vien);
set sql_safe_updates = 1;

-- 17: Cập nhật thông tin khách hàng có tên_loại_khách_hàng từ platinum lên diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với 
-- Tổng tiền thanh toán trong năm 2021 là lớn hơn 10000000 vnđ.

update khach_hang
set ma_loai_khach = (select ma_loai_khach 
from loai_khach
where ten_loai_khach = 'diamond')
where ma_khach_hang in (
select  hop_dong.ma_khach_hang
from hop_dong
where hop_dong.ngay_lam_hop_dong between '2021-01-01' and '2021-12-31'
and hop_dong.tien_dat_coc > 1000000
);

-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).

set sql_mode = 1;
delete from khach_hang
where ma_khach_hang in (
select hop_dong.ma_khach_hang
from hop_dong 
where year(hop_dong.ngay_lam_hop_dong) < 2021
);


-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.

update dich_vu_di_kem
set gia = gia * 2
where ma_dich_vu_di_kem in (
select ma_dich_vu_di_kem
from hop_dong_chi_tiet hdct
join hop_dong hd ON hdct.ma_hop_dong = hd.ma_hop_dong
where year(ngay_lam_hop_dong) = 2020 and so_luong > 10
group by ma_dich_vu_di_kem
);

-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.

select kh.ma_khach_hang , kh.ho_ten , kh.email , kh.so_dien_thoai , kh.ngay_sinh , kh.dia_chi
from khach_hang kh
union
select nv.ma_nhan_vien , nv.ho_ten , nv.email , nv.so_dien_thoai , nv.ngay_sinh , nv.dia_chi
from nhan_vien nv;