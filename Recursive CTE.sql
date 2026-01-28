-- recursive cte 
-- A Recursive CTE is a CTE that calls itself to process hierarchical or sequential data.


-- set operators --> used to combine two or more query

-- 1. UNION --> Combines results, removes duplicates --> number of columns are same in both
-- 2. UNION ALL --> Combines results, keeps duplicates

-- it not contain duplicate values
select actor_id, first_name from sakila.actor where actor_id between 1 and 4
union
select actor_id, first_name from sakila.actor where actor_id between 3 and 5;


-- it contains duplicate values
select actor_id, first_name from sakila.actor where actor_id between 1 and 4
union all
select actor_id, first_name from sakila.actor where actor_id between 3 and 5;

-- example 
with recursive cte as 
(select 10 as num 			-- assinging values to this num column (starting poin)
union all
select num+1 from cte 		-- call cte
where num<15				-- terminating condition ( stop point )
)
select * from cte;




use gaurav;
show databases;
CREATE TABLE employees1 (
    employeeid INT PRIMARY KEY,
    name VARCHAR(50),
    managerid INT
);

INSERT INTO employees1 (employeeid, name, managerid) VALUES
(1, 'Alice', NULL),      -- CEO
(2, 'Bob', 1),           -- Reports to Alice
(3, 'Charlie', 2),       -- Reports to Bob
(4, 'Diana', 2),         -- Reports to Bob
(5, 'Eve', 3);           -- Reports to Charlie


-- find employees hirecharcy

with recursive cte as (
select employeeid, name,  name as hirechary_path from employees1 where managerid is null
union all
select e.employeeid, e.name, concat(e.name,'->',cte.hirechary_path) from employees1 as e 
join cte on 
e.managerid=cte.employeeid
and e.employeeid<6
)
select * from cte;


-- LEVEL EXAMPLES
with recursive abc as (
select employeeid, name, 1 as level from employees1 where managerid is null
union all
select e.employeeid, e.name, level+1 from employees1 as e 
join abc on 
e.managerid=abc.employeeid
and e.employeeid<6
)
select * from abc
order by level, employeeid;






