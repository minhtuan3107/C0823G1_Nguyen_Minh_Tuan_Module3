create database user_manager;
create table user(
	id int primary key auto_increment,
    name varchar(255) not null,
    email varchar(220) not null,
    country varchar(50)
);
insert into user(name, email, country) values('Minh','minh@codegym.vn','Viet Nam'),('Kante','kante@che.uk','Kenia'),("Tuấn","a","Viet Nam");
select *
from user;
delete from user 
where user.id =6; 
update user 
set name = "A", email = "123",country = "am" 
where id = 7;

select *
from user
order by name;