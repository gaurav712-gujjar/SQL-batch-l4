show databases;
use world;
select * from city;
select * from country;

select continent, count(name) from country group by continent
having count(name) < 10;

select name, avg(population) from city group by name
having avg(population) > 1000000;

select continent, sum(population) from country group by continent
having sum(population) >  1000000000;

select name, max(population) from city group by name
having max(population)  < 500000;

select region, count(name), avg(lifeExpectancy) from country group by region
having count(name) >= 3 and avg(lifeexpectancy) > 70;

select name, avg(population) from country where continent = 'ASIA'
having avg(population) > 5000000;



