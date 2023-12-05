create database user_manager;
create table user(
	id int primary key auto_increment,
    name varchar(255) not null,
    email varchar(220) not null,
    country varchar(50)
);
insert into user(name, email, country) values('Minh','minh@codegym.vn','Viet Nam'),('Kante','kante@che.uk','Kenia');
select *
from user;