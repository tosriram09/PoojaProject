create database bookbank;
create user 'pooja'@'localhost' identified by 'pooja';
grant all privileges on *.* TO 'pooja'@'localhost';
flush privileges;

create table user(userid varchar(10),username varchar(100), password varchar(10), usertype varchar(50));
