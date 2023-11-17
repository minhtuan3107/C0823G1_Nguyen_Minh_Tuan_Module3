use case_study;

-- cau 2

select *  from nhan_vien
where (nhan_vien.ho_ten like 'H%' ) or (nhan_vien.ho_ten like 'T%' ) or (nhan_vien.ho_ten like 'K%' ) and length(nhan_vien.ho_ten) <= 15 ;

-- cau 3
select * from khach_hang
where (khach_hang.dia_chi like '%Đà Nẵng' ) or (khach_hang.dia_chi like '%Quảng trị' ) and ( now() - khach_hang.ngay_sinh >= 18 and 