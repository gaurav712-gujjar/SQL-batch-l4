use world;
show tables;
select * from city;

select district, count(name) as total_city from city group by district;

-- count cities which have a population of more than 1 lakh
-- where( sabse phele chelega) --> group by --> count()
select district, count(name) from city where population > 100000 group by district;

select district, count(name) as Total_City from city group by district;

select * from country;

select count(name) from country where continent='Asia' and indepyear>1950;

-- get total contry which got independence after in each continent
select continent, count(name) from country where indepyear>1950 group by continent;

-- where is fillter only data which  are exist in original table

-- difference b/w where and having clause
-- where clause is fittler the data from table
-- having clause is filter data from aggregate column
-- having ( group by ke baad me lagta hai)
-- having to fittler data based on aggregate column like sum, count, max
select continent, sum(population) from country  group by continent
having sum(population) > 30401150;

select * from country;

select continent, sum(population) from country where lifeexpectancy > 35.0 group by continent;

-- 1.find out the total countries for each government form where the total no of countries > 30
-- 2. find out  the total countries for each government form only for the countries having there capital>30 and total population > 3lakh

-- 1.
select governmentform, count(name) from country group by governmentform
having count(name)>30;

-- 2.
select governmentform, count(name), sum(population) from country
where capital>30
group by governmentform 
	having sum(population)>300000;
    
-- to find each continent, each region with count it 
select continent,region, indepyear, count(name) from country group by continent, region, indepyear;

select * FROM CITY;
SELECT COUNT(*) FROM CITY where POPULATION > 100000;
