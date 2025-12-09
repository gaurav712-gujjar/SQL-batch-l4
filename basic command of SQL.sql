select database();
show tables;

-- to see the structure table
desc city;

-- to print data of a table
select * from city;

-- to access coloum
select name, population from city;

-- column can be print in any order
select population, Population+10, name, district from city;

-- query can be written in multiple line
SELECT name, population,CountryCode
FROM city;

-- alias (nickname)
select *,population-10000 as 'New population' from country;