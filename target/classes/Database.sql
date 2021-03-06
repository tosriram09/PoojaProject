create database bookbank;
create user 'pooja'@'localhost' identified by 'pooja';
grant all privileges on *.* TO 'pooja'@'localhost';
flush privileges;

create table user(userid integer,username varchar(100), password varchar(10), usertype varchar(50));
create table transactions(userid integer, transactionid integer, bookid integer, bookname varchar(200), duedate date);
create table book(bookid integer, author varchar(200), title varchar(300), edition varchar(100), publication varchar(300), price decimal(6, 2), purchasedate varchar(20), reference varchar(1));
alter table book add available varchar(1);
insert into book values(100, 'Pooja', 'ABC', 1, 'ABC', 120.50, '12-Dec-2017','N');