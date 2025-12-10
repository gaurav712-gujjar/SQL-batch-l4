select database();
use world;
show tables;
select * from city;

-- to print sepcific row 
select * from city where ID=3;

-- between operator are use to print within a range 
select * from city where ID between 1 and 10;

-- in operator are use to print specific values like if we print  in(2,5) ,
-- then it will give only 2 and 5 not range from 2 to 5
select * from city where ID in(2,5);

-- not in --> it not print thos value which give like- not in(2,5)
select * from city where ID not in(1,2);

-- not between --> it not print thos range which give it 
select * from city where ID not between 1 and 10;

-- like operator 
-- to meet with pattern
-- special cahracter is called wildcard character
-- 1. % [where are finding zero and more character] 																																																																																					
select name, continent from country where name like 'A%';
select name, continent from country where name like '%A';
select name, continent from country where name like '%di%';

-- 2._ (underscore) => 1 character
select name, continent from country where name like 'in___';