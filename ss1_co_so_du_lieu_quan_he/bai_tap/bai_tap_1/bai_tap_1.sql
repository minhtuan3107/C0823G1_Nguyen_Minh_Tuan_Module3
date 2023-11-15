CREATE DATABASE `bai_tap_1`;
use bai_tap_1;

CREATE TABLE class (
    id INT KEY AUTO_INCREMENT,
    class_name VARCHAR(200)
);
CREATE TABLE teacher (
    id INT KEY AUTO_INCREMENT,
    teacher_name VARCHAR(200),
    teacher_age INT,
    teacher_country VARCHAR(200)
);
insert into class(class_name) value("Tuấn");
SELECT 
    *
FROM
    class;
insert into teacher(teacher_name,teacher_age,teaher_country) value("Tuan",18,"VietNam");
insert into teacher(teacher_name,teacher_age,teaher_country) value("Hehe",19,"VietNam");
SELECT 
    *
FROM
    teacher;