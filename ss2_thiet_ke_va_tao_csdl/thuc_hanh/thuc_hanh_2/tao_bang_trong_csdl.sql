create database quan_ly_diem_thi;
use quan_ly_diem_thi;
	create table student(
		student_id int primary key auto_increment,
        student_name varchar(50),
        student_birthday date,
        student_class varchar(20),
        student_gt varchar(20)
    );
    create table teacher(
		teacher_id int primary key auto_increment,
        teacher_name varchar(50),
        teacher_phone varchar(10)
    );
    create table `subject`(
		subject_id int primary key auto_increment,
        subject_name varchar(20),
        teacher_id int,
    foreign key(teacher_id) references teacher(teacher_id)
    );
    create table transcripts(
		student_id int,
        subject_id int,
        transcripts_point int,
        transcripts_date datetime,
        foreign key(student_id) references student(student_id),
        foreign key(subject_id) references `subject`(subject_id)
    );
    ALTER TABLE `subject` ADD CONSTRAINT teacher_id FOREIGN KEY (teacher_id) REFERENCES teacher(teacher_id);