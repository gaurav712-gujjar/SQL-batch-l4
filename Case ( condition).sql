show databases;
use regex;
show tables;

-- Case ( it is like a if/else condition )
/*
case population 
	when population=0 then 'very small population'
    when population=8000 then 'population is 8000'
    
end world.country;
*/

-- Case statement for give contidion on tables
select name, population,
case 
	when population > 100000 then 'large population'
	when population >= 50000 then 'medium population'
	when population >= 1000 then 'low population'
	else 'very small'
end as condition_population from world.country;


select count(*),
case 
	when population > 100000 then 'large population'
	when population >= 50000 then 'medium population'
	when population >= 1000 then 'low population'
	else 'very small'
end as 'condition_population' from world.country
group by condition_population;


select continent, 
sum(case
	when population >=50000 then 1 else 0 end)
    
from world.country
group by continent;
    
    
