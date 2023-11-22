create database demo;

use demo;

create table product(
	product_id int primary key auto_increment,
    product_code int not null,
    product_name varchar(50) not null,
    product_price double not null,
    pruduct_amount int not null,
    product_des varchar(50) not null,
    product_status bit not null
);
insert into product(product_code, product_name, product_price, pruduct_amount, product_des,product_status) 
values (1,'Iphone 7',15000000,5,'Iphone',1),(2,'Iphone 8',18000000,5,'Iphone',0),(3,'Iphone 9',20000000,5,'Iphone',1);

-- B3 : Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)

create index product_index_code on product(product_code);

 -- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)

create index product_index_name_and_price on product(product_name, product_price);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào

explain select * 
from product
where product_name = 'Iphone 9';
 
 -- B4:  Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
 
create view product_view as
select product_code, product_name, product_price, product_status
from product;

-- Tiến hành sửa đổi view

set sql_safe_updates = 0;
update product_view
set product_name = 'Iphone 15'
where product_name = 'Iphone 7';

-- Tiến hành xoá view

drop view product_view;

-- B5 : Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product

delimiter //
create procedure get_all_products()
begin 
select * from product;
end //
delimiter ;
call get_all_products();

-- Tạo store procedure thêm một sản phẩm mới

delimiter //
create procedure add_product(product_new_code int, product_new_name varchar(50), product_new_price double, product_new_amount int, product_new_des varchar(50), product_new_status bit )
begin 
insert into product(product_code, product_name, product_price, pruduct_amount, product_des,product_status) value (product_new_code, product_new_name, product_new_price, product_new_amount, product_new_des,product_new_status);
end //
delimiter ;

call add_product(5,'Iphone 10', 21000000, 5, 'Iphone' , 1);

-- Tạo store procedure sửa thông tin sản phẩm theo id

delimiter //
create procedure edit_product(product_edit_id int,product_edit_code int, product_edit_name varchar(50), product_edit_price double, product_edit_amount int, product_edit_des varchar(50), product_edit_status bit )
begin 
set sql_safe_updates = 0;
update product set product_code = product_edit_code
where product_edit_id = product_id ;
update product set product_name = product_edit_name
where product_edit_id = product_id ;
update product set product_price = product_edit_price
where product_edit_id = product_id ;
update product set pruduct_amount = product_edit_amount
where product_edit_id = product_id ;
update product set product_des = product_edit_des
where product_edit_id = product_id ;
update product set product_status = product_edit_status
where product_edit_id = product_id ;
end //
delimiter ;

call edit_product (2,4,'Iphone 1', 1000000, 5,'Iphone',1);

-- Tạo store procedure sửa thông tin sản phẩm theo id

delimiter //
create procedure delete_product(product_id_delete int)
begin
delete from product
where product_id = product_id_delete;
end //
delimiter ;

call delete_product(1);
