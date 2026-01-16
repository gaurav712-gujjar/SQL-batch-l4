-- WINDOWS FUNCTION 
-- it is used to perform/apply the calculation on set of rows with reference to current row.


-- 1.OVER CLAUSE --> it apply the function over a window( a set of row), apply any aggrete/logic function to each row 
-- 2.PARTITION BY --> it is same as group by which is use to apply the logic into group, it means divide the data 


-- Over clause
use world;
select code, name, continent, population,
sum(population) over() , avg(population) over() from country;


-- Partition by
-- it apply the aggregate function to each continent 
select code, name, continent, population,
sum(population) over(partition by continent) from country;

-- IMPORTANT FOR INTERVIEW
-- running sum, cumulative sum
-- A running sum (also called cumulative sum) is the progressive total of a column calculated row by row, based on a specific order.
-- used order by 
select code, name, continent, population, 
sum(population) over( order by population) from country;

