create database sale_manager;

use sale_manager;

create table customer (
    customer_id int primary key auto_increment,
    customer_name varchar(50),
    customer_age int
);

create table product (
    product_id int primary key auto_increment,
    product_name varchar(50),
    product_price int not null check (product_price >= 1)
);

create table `order` (
    order_id int primary key auto_increment,
    customer_id int,
    foreign key (customer_id)
        references customer (customer_id),
    order_date date,
    order_total_price int
);

create table order_detail (
	order_detail_id int primary key auto_increment,
    order_id int,
    product_id int,
    foreign key (order_id)
        references `order` (order_id),
    foreign key (product_id)
        references product (product_id),
    order_detail_quality int
);

insert into customer(customer_name, customer_age) values ('Minh Quan' , 10), ('Ngoc Oanh',20),('Hong Ha', 50);

insert into product(product_name,product_price) values ('May Giat' , 3), ('Tu Lanh', 5),('Dieu Hoa',7),('Quat', 1), ('Bep dien',2);

insert into `order`(customer_id,order_date, order_total_price) values(1,'2006/3/21', null), (2,'2006/3/23', null), (1,'2006/3/16', null);

insert into order_detail(order_id, product_id,order_detail_quality) values (1,1,3),(1,3,7),(1,4,2),(2,1,1),(3,1,8),(2,5,4),(2,3,3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order

select 
    *
from
    `order`;
    
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách

select c.customer_id, c.customer_name, p.product_name, od.order_detail_quality
from customer c
join `order` o on c.customer_id = o.customer_id
join order_detail od on o.order_id = od.order_id
join product p on od.product_id = p.product_id;
 
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào

select customer.customer_name
from customer
where customer_id not in (select customer_id from `order`);
	
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)

select o.order_id, o.order_date,sum(od.order_detail_quality * p.product_price)
from `order` o
join order_detail od on o.order_id = od.order_id
join product p on od.product_id = p.product_id
group by o.order_id, o.order_date;