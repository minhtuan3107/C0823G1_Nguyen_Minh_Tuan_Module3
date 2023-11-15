create database `thuchanh3`;
use thuchanh3;
create table student(
	id int,
    `name` varchar(200),
    age int,
    country varchar(50)
);
insert into student(id,`name`,age,country) value (1,"Tuan",18,"Viet Nam");
SELECT 
    *
FROM
    student;