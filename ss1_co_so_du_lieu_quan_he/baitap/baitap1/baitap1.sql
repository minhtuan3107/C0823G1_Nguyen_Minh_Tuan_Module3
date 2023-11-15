CREATE DATABASE `baitap1`;
use baitap1;

CREATE TABLE class (
    id INT KEY AUTO_INCREMENT,
    name VARCHAR(200)
);
CREATE TABLE teacher (
    id INT KEY AUTO_INCREMENT,
    name VARCHAR(200),
    age INT,
    country VARCHAR(200)
);
insert into class(name) value("Tuấn");
SELECT 
    *
FROM
    class;
insert into teacher(name,age,country) value("Tuan",18,"VietNam"),("Hehe",19,"Viet Nam");
SELECT 
    *
FROM
    teacher;