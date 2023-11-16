create database student_manager;
use student_manager;
create table class(
	class_id int primary key auto_increment,
    class_name varchar(60) not null,
    class_startdate datetime not null,
    class_status bit
);
create table student(
	student_id int primary key auto_increment,
    student_name varchar(30) not null,
    student_address varchar(50),
    student_phone varchar(20),
    student_status bit,
    class_id int,
    foreign key(class_id) references class(class_id)
);
create table subject(
	subject_id int primary key auto_increment,
    subject_name varchar(30) not null,
    subject_credit tinyint not null default 1 ,
    check (subject_credit >= 1),
    subject_status bit default 1
);
create table mark(
mark_id int primary key auto_increment,
subject_id int unique key,
student_id int unique key,
foreign key (subject_id) references subject(subject_id),
foreign key(student_id) references student(student_id),
mark float default 0 check(mark between 0 and 100),
mark_exam tinyint default 1
);