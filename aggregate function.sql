use world;
show tables;
-- functions(data,string,number)
-- aggregate function( to perform the calculation on set of row)
-- it is a multiple line function

select * from country;
-- count(column name)--> it count only not null data
-- count(*)--> it count whole table
select count(*), count(indepyear) from country;

-- Distinct( find unique value, it not repeate the duplicate values)
-- give multiple values
select distinct continent,region from country;

-- sum(column name)--> it sum the total value
-- avg()--> to find average of any values
select count(*), sum(population), avg(population) from country;

select count( distinct governmentform) from country;

select count(governmentform), count( distinct governmentform) from country where continent='Asia';

-- to find different indepyear where country indepyear
select count(name),sum(population), count( distinct indepyear) from country where continent='Africa';

-- Que.1--> get the total country the average surface area and the total population for the countries which had got the 
-- independence from 1947 to 1998 this two year not be included
select count(name), avg(surfacearea), sum(population) from country
where indepyear > 1947 and indepyear < 1998 ;

-- Que.2--> get the total no of countries and the number of unique continent along with the avg of population
-- and the total number of capitals for the countries starting with a and d
select * from country;
select count(name), count(distinct continent), avg(population), sum(capital)
 from country where name like 'A%' or name like 'D%';
 
 -- group by--> group the common values and seperate it and it not contain duplicate values 
 -- we can only select only which column which are group by
 select continent, count(*) from country group by continent;
 
 select indepyear, count(*) from country group by indepyear; 
 
 select governmentform, count(*) from country group by governmentform;
 select name from country group by name;
 
 -- Que.3
 select continent , count(name), sum(population), avg(population),
 max(population), min(population), max(indepyear), min(indepyear)
 from country group by continent;
 
 
 use city;
 select * from city;
-- from the city table find the total cities, total district, unique district, total population from the city table
select countrycode,count(name), count( distinct district), sum(population) from city group by countrycode ;



