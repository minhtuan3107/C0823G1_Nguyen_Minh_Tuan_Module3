create database student_manager;
use student_manager;

create table class (
    id int key auto_increment,
    class_name varchar(200)
);

create table teacher (
    id int key auto_increment,
    teacher_name varchar(200),
    teacher_age int,
    teacher_country varchar(200)
);

insert into class(class_name) value("Tuấn");

select 
    *
from
    class;
    
insert into teacher(teacher_name,teacher_age,teacher_country) value("Tuan",18,"VietNam");

insert into teacher(teacher_name,teacher_age,teacher_country) value("Hehe",19,"VietNam");

select 
    *
from
    teacher;