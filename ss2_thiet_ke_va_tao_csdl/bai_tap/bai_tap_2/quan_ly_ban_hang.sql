create database sale_manager;

use sale_manager;

create table customer (
    customer_id int primary key auto_increment,
    customer_name varchar(50),
    customer_age date
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
    order_total_price int not null check (order_total_price >= 1)
);

create table order_dentail (
    order_id int,
    product_id int,
    foreign key (order_id)
        references `order` (order_id),
    foreign key (product_id)
        references product (product_id),
    order_dentail_quality varchar(20)
);