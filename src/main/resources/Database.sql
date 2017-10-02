create database bookbank;
create user 'pooja'@'localhost' identified by 'pooja';
grant all privileges on *.* TO 'pooja'@'localhost';
flush privileges;

create table user(userid integer,username varchar(100), password varchar(10), usertype varchar(50));
create table transactions(userid integer, transactionid integer, bookid integer, bookname varchar(200), duedate date);
