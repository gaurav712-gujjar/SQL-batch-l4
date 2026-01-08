show databases;
use gaurav;
show tables;

-- constrains 
-- rules that we applied to limit the data in my table
-- Constraints in SQL are rules applied to table columns to control the type of data that can be stored in a database.
-- They help maintain data accuracy, integrity, and reliability.


-- Create table
-- structure( data defination language)
-- create, alter, drop, truncate

create table test1( Sno int);

-- dml( insert, update, delete, merge)
insert into test1 values(10);
insert into test1(Sno) values(20);
insert into test1(Sno) values(null), (30);
select * from test1;
select count(Sno), count(*) from test1;

-- constraints
-- 1.Not null
create table test2( Sno int not null, Salary int);
insert into test2(Sno, Salary) values(20,20000);
insert into test2(Sno, Salary) values(10,500000);
insert into test2(Sno, Salary) values(20,null);
insert into test2(Sno, Salary) values(null,20000); -- > error
insert into test2(Salary) values(20000);-- > error
select * from test2;


-- 2.default
create table test3( Sno int not null default 50, Salary int);
insert into test3(Salary) values(300000);
insert into test3(Sno) values(5000);
select * from test3;


-- 3.unique
-- it contains there will be multiple null values
create table test4( Sno int not null, Salary int unique default 100);
insert into test4(Sno, Salary) values(100, 500000);
insert into test4(Sno, Salary) values(200, 500000); -- >error duplicate values
insert into test4(Sno) values(300);
insert into test4(Sno) values(400); -- > error default 100 already in table
insert into test4(Sno, Salary) values(500, null);
select * from test4;

-- 4.check
create table test7( Sno int , Salary int, check(Sno between 1 and 100), check(Salary in (1000,2000)) );
insert into test7(Sno, Salary) values(5,1000);
insert into test7(Sno, Salary) values(5,2500); -- > error
insert into test7(Sno, Salary) values(90,1500); -- > error

create table test8( Sno int, Salary int,
constraint gaurav_test8_Sno_check check(Sno between 1 and 100),
constraint gaurav_test8_Salary_check check(Salary (1000,2000)) );


-- 5.primary key
create table test9(Sno int primary key, Salary int);
insert into test9(Sno, Salary) values(5,1000);
insert into test9(Sno, Salary) values(null, 12332);
select * from test9;

-- 6.forigen key
-- made which table first that contains unique data
create table customer1( cid int primary key, cname varchar(20));
insert into customer1 values(10, 'Aman'), (11, 'Yash');
select * from customer1;

create table order1( order_no int primary key, city varchar(20), cid int,
foreign key(cid) references customer1(cid) );
insert into order1 values(1007, 'jaipur', 10), (1008, 'goa', 11), (1009, 'mumbai', 10);
insert into order1 values(10010, 'kota', 25); -- > error as 25 cid is not in customer table
select * from order1;


