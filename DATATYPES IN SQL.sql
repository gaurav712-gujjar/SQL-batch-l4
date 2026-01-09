-- Datatype in sql 
-- 1.Numeric 
   -- int, float, decimal
   -- tinyint, medium, big int, small int, int
   -- 1byte, small=> 2byte, medium=> 3, int=> 4byte, long 8byte


use gaurav;

create table test11( id tinyint);
insert into test11 values(1), (-127), (127);
insert into test11 values(128); -- error because of the values give 
select * from test11;

create table test12( id tinyint unsigned);
insert into test12 values(129), (255);
insert into test12 values(455); -- out of range 
select * from test12;

create table test13( price float);
insert into test13 values(234.566),( 11.1000);
select * from test13;


create table test14( price double);
insert into test14 values(2334.45564664),(3434.309083857);
insert into test14 values(24.4444444533),(18.32184729746);
select * from test14;

create table test15( price double(5,2));
insert into test15 values(123.8946396),(336.090238927);
insert into test15 values(195.3946986);
select * from test15;

-- varchar and char
-- varchar is datatype => string/charecter values
-- char => charecter  but of fix length of chracter
-- char define the total chracter

create table test16( name char(10));
insert into test16 values('gaurav'),('akash');
insert into test16 values('gauravgujjar'); -- error --> too long 
select * from test16;

-- char_length --> define total chracter

insert into test16 values('АБВГДЕЁ');
insert into test16 values('ЧЧЧЧЧЧЧЧЧ');
select * from test16;




