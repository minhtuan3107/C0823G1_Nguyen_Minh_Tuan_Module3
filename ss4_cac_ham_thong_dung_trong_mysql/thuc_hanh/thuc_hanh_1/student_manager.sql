create database student_manager;
use student_manager;

create table class(
	class_id int primary key auto_increment ,
    class_name varchar(60) not null,
    class_date datetime not null,
    class_status bit
);

create table student(
	student_id int primary key auto_increment,
    student_name varchar(60) not null,
    student_address varchar(50),
    student_phone varchar(20),
    student_status bit,
    class_id int not null,
    foreign key(class_id) references class(class_id)
);

create table subject(
	subject_id int primary key auto_increment,
    subject_name varchar(60) not null,
    subject_credit tinyint not null default 1 check( subject_credit >= 1),
    subject_status bit default 1
);

create table mark(
	mark_id int primary key auto_increment,
    subject_id int not null,
    student_id int not null,
	mark_point float default 0 check(mark_point between 0 and 100),
    mark_exam_time tinyint default 1,
    unique (subject_id, student_id),
    foreign key (subject_id) references subject(subject_id),
    foreign key(student_id)references student(student_id)
);

insert into class values (1, 'A1', '2008-12-20', 1),(2, 'A2', '2008-12-22', 1),(3, 'B3', current_date, 0);

insert into student(student_name, student_address, student_phone, student_status, class_id) values ('Hung', 'Ha Noi', '0912113113', 1, 1),('Manh', 'HCM', '0123123123', 0, 2);

insert into student(student_name, student_address, student_status, class_id) values ('Hoa', 'Hai phong', 1, 1);

insert into subject values (1, 'CF', 5, 1),(2, 'C', 6, 1),(3, 'HDJ', 5, 1),(4, 'RDBMS', 10, 1);
       
insert into mark(subject_id, student_id, mark_point, mark_exam_time) values (1, 1, 8, 1),(1, 2, 10, 2),(2, 1, 12, 1);
 -- Bước 2: Sử dụng hàm count để hiển thị số lượng sinh viên ở từng nơi
 
select student.student_address, count(student.student_id)
from student
group by student.student_address;

-- Bước 3: Tính điểm trung bình các môn học của mỗi học viên bằng cách sử dụng hàm AVG

select student.student_id, student.student_name, avg(mark.mark_point)
from student
join mark on student.student_id = mark.student_id
group by student.student_id, student.student_name;

-- Bước 4: Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15


select student.student_id, student.student_name, avg(mark.mark_point)
from student
join mark on student.student_id = mark.student_id
group by student.student_id, student.student_name
having avg(mark.mark_point) > 15;

-- Bước 5: Hiển thị thông tin các học viên có điểm trung bình lớn nhất.

select student.student_id, student.student_name, avg(mark.mark_point)
from student
join mark on student.student_id = mark.student_id
group by student.student_id, student.student_name
having avg(mark.mark_point) >= all(select avg(mark.mark_point) from mark group by mark.student_id);

