create database demo_ss2;
use demo_ss2;

create table jame_account(
	user_name varchar(50) primary key,
    password varchar(50)
);

create table class(
	class_id int primary key auto_increment,
    class_name varchar(50)
);

create table student(
	student_id int primary key auto_increment,
    student_name varchar(50),
    student_birthday date,
    student_gender bit,
    student_email varchar(50),
    student_point double,
    user_name varchar(50),
    class_id int,
    foreign key(user_name) references jame_account(user_name),
    foreign key(class_id) references class(class_id)
);

create table instructor(
	instructor_id int primary key auto_increment,
	instructor_name varchar(50),
    instructor_birthday date,
	instructor_salary double
);

create table instructor_class(
	class_id int,
    instructor_id int,
    primary key(class_id,instructor_id),
    foreign key(class_id) references class(class_id),
    foreign key(instructor_id) references instructor(instructor_id)
);

insert into class (class_name) values ('c1121g1'), ('c1221g1'),('a0821i1'),('a0921i1');

insert into jame_account(user_name,password)
 values('cunn','12345'),('chunglh','12345'),('hoanhh','12345'),('dungd','12345'),('huynhtd','12345'),
 ('hainm','12345'),('namtv','12345'),('hieuvm','12345'),('kynx','12345'),('vulm','12345'),('anv','12345'),('bnv','12345');


insert into instructor(instructor_name,instructor_birthday, instructor_salary)
 values('tran van chanh','1985-02-03',100),('dang chi trung','1985-02-03',200),('nguyen vu thanh tien','1985-02-03',300);

 
 insert into student(student_name,student_birthday, student_gender,student_point, class_id,user_name) 
 values ('nguyen ngoc cu','1981-12-12',1,8,1,'cunn'),('le hai chung','1981-12-12',1,5,1,'chunglh'),
 ('hoang huu hoan','1990-12-12',1,6,2,'hoanhh'),('dau dung','1987-12-12',1,8,1,'dungd'),
 ('ta dinh huynh','1981-12-12',1,7,2,'huynhtd'),('nguyen minh hai','1987-12-12',1,9,1,'hainm'),
 ('tran van nam','1989-12-12',1,4,2,'namtv'),('vo minh hieu','1981-12-12',1,3,1,'hieuvm'),
 ('le xuan ky','1981-12-12',1,7,2,'kynx'),('le minh vu','1981-12-12',1,7,1,'vulm'),
 ('nguyen van a','1981-12-12',1,8,null,'anv'),('tran van b','1981-12-12',1,5,null,'bnv');


 insert into instructor_class(class_id,instructor_id) values (1,1),(1,2),(2,1),(2,2),(3,1),(3,2);
-- cau 1
 select student.student_name, student.student_birthday, student.student_gender, student.student_point, class.class_id, jame_account.user_name from student join class on class.class_id = student.class_id join jame_account on 
 jame_account.user_name = student.user_name;
 -- cau 2
 select * from student
 left join class on class.class_id = student.class_id;
 -- cau 3
 select *  from student
where (student.student_name like '%Hai' ) or (student.student_name like '%Huynh' );
-- cau 4
select *  from student
where student.student_point >= 5;
-- cau 5
 select *  from student
where student.student_name like 'Nguyen%';
-- cau 6
select student_point, count(*) as num_students
from student
group by student_point;
-- cau 7
select student_point, count(*) as num_students
from student
where student_point > 5
group by student_point;
-- cau 8 
select student_point, count(*) as num_students
from student
where student_point > 5
group by student_point
having num_students >= 2;
-- cau 9 
select s.student_name, s.student_birthday, s.student_gender, s.student_point, s.class_id, s.user_name , c.class_name
from student s join class c on c.class_id = s.class_id
where c.class_name like "%c11%"
order by student_name;