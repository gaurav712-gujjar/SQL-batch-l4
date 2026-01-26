show databases;
use world;
show tables;
select * from city;
select name, population from city;
desc city;
select * from city where district='Zuid-Holland';
select * from city where countrycode='ARG';
desc city;
show tables;
select * from city;
select * from city
where population=100000;

select * from city where id between 1 and 10;
select * from city where id not between 1 and 10;

-- > ( greater than)
select * from city where population>600000;

-- != (not equal to )
select * from city where countrycode != 'ARG';

-- in operator use--> to search specific values
select * from country where contenent in( 'north america', 'Europe','asia');

show tables;
select * from country;

-- gettinig countries in below continents
select * from country where continent in('north america','asia');

-- indepyear
select name, continent from country where IndepYear in(1901,1960);

-- between operator--> to search in range
select name, continent from country where IndepYear between 1900 and 1910;

-- not between 
select name, continent, IndepYear from country where IndepYear not between 1901 and 1950;

ds



