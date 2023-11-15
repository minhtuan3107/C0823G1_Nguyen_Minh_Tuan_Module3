CREATE DATABASE `baitap1`;
use baitap1;

create table class(
	id int key auto_increment,
    name varchar(200)
);
create table teacher(
	id int key auto_increment,
	name varchar(200),
	age int,
	country varchar(200)
);
insert into class(name) value("Tuấn");
select * from class;
insert into teacher(name,age,country) value("Tuan",18,"VietNam"),("Hehe",19,"Viet Nam");
select * from teacher;