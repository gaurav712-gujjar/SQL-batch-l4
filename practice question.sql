show databases;
use world;
select * from country;

-- question 1
select code, name, region from country where region !='Middle East';

-- question 2
select name, IndepYear, population,population * 0.1 as new_population from country;

-- question 3
show tables;
select * from country;
select * from country where LifeExpectancy in(38.3, 66.4);


-- question 4
select name, continent, population,GNP from country where Population between 5000 and 200000;
