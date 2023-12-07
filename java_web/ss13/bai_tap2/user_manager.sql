create database user_manager;
use user_manager;
create table user(
 id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(220) NOT NULL,
    country VARCHAR(50)
);
insert into user(name, email, country)
values ('Minh', 'minh@codegym.vn', 'Viet Nam'),
       ('Kante', 'kante@che.uk', 'Kenia');
       

delimiter //
create procedure get_all_user()
begin
select *
from user;
end
//
delimiter ;

call get_all_user();
