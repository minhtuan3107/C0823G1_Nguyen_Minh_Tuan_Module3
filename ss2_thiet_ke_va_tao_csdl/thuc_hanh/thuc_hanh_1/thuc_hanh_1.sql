create database manager_eorder;
use manager_order;
create table product(
	product_id int primary key auto_increment,
    product_name varchar(50),
    product_unit varchar(20),
    product_des varchar(20)
);
create table shipper(
	shipper_id int primary key auto_increment,
    shipper_name varchar(50)
);
create table address(
	address_id int primary key auto_increment,
    address_name varchar(50)
    );
create table customer(
	customer_id int primary key auto_increment,
    customer_name varchar(50),
    customer_address varchar(50),
    customer_phone varchar(50)
);
create table orderer(
	orderer_id int primary key auto_increment,
    orderer_name varchar(50)
);
create table receiver(
	receiver_id int primary key auto_increment,
    receiver_name varchar(50)
);
create table `order`(
	
);