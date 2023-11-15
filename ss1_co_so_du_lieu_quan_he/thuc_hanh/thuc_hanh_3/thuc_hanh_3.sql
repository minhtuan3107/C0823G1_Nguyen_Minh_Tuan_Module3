create database `thuc_hanh_3`;
use thuc_hanh_3;
CREATE TABLE student (
    student_id INT,
    student_name VARCHAR(200),
    student_age INT,
    student_country VARCHAR(50)
);
insert into student(student_id,student_name,student_age,student_country) value (1,"Tuan",18,"Viet Nam");
SELECT 
    *
FROM
    student;