-- order of excution of sql statement 

-- 1. Add a row number for employees sorted by salary (highest first)
select *, ROW_NUMBER() OVER (ORDER BY salary DESC)
FROM employees;

-- 2.Rank employees by salary (ties share rank)
select *, rank() over(order by salary) from employees;

-- 3. Dense rank employees by salary (no gaps in rank numbers)
select *, dense_rank() over(order by salary) from employees;

-- 4.Row number within each department by salary desc
select *, row_number() over(partition by department order by salary desc) from employees;

-- 5. Rank within each department by salary desc
select *, rank() over(partition by department order by salary desc)  from employees;

-- 6.
select *, lag(salary) over(order by salary) as previous_Salary,
lead(salary) over(order by salary) as next_salary
from employees;

-- 7.
select *, sum(amount) over(order by sale_date) as running_total from sales;

-- 8.
select *, sum(amount) over(partition by emp_id order by sale_date) as running_total from sales;

-- 9.
select *, sum(amount) over() from sales;

-- 10.
select *,  AVG(salary) OVER (PARTITION BY department) AS avg_department_salary
FROM employees;

-- MEDIUM LEVEL QUESTIONS


-- subquery saved to a variable named as 'tempdata'
-- first the subquery is solved save to a variable
-- and then access the column and we fitter out the data

-- 1. Top 2 salaries in each department (use ROW_NUMBER)
select * from 
( select *, row_number() over(partition by department order by salary) as row_value
from employees ) as tempdata where row_value <= 2;


-- 2. Salary difference vs department average
select *, avg(salary) over(partition by department),
salary - avg(salary) over(partition by department) from employees;


-- 3. Percent rank of employees by salary (overall)
select *, sum(salary) over(), rank() over(order by salary),
percent_rank() over(order by salary) 
from employees;


-- 4.Salary distribution into 4 buckets (NTILE) 
-- highest salaries go to bucket 1, lowest to bucket 4
-- highest salaries go to bucket 1, lowest to bucket 4
select *, ntile(4) over(order by salary desc) from employees;

