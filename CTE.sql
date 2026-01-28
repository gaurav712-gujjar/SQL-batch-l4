-- CTE :- common table expression 
	-- it is a temprary name of the quary we write 
    -- it  is kind of like a subquary 
	-- SYNTAX :-
    
with alias as 
(select * from sakila.actor where actor_id between 5 and 35)
select count(*) from alias;


-- the quary in coljumns is the cte 
-- they are stored on the temp basis and cant be used after the semicolumn 
-- it helps convert complex quary into readable formate




-- find the number of payments done in each month from sakila.payments
with x as 
(select *,month(payment_date) from sakila.payment)
select month(payment_date), count(*) from x group by month(payment_date);




-- find all the info where the amount is second highest
		-- we have done this with nested subquary but that is too complex 
		-- now we do it with cte and windows function
with cte as 
(Select *,dense_rank() over(order by amount desc) as rankings from sakila.payment)
select * from cte where rankings = 2;




-- find second highest amount of each customer 
with cte as 
(Select *,dense_rank() over(partition by customer_id order by amount desc) as rankings from sakila.payment)
select * from cte where rankings = 2;














use gaurav;

create database test90;
use test90;

CREATE TABLE employee (
    emp_id     INT PRIMARY KEY,
    emp_name   VARCHAR(50),
    department VARCHAR(30),
    salary     INT,
    manager_id INT
);

INSERT INTO employee (emp_id, emp_name, department, salary, manager_id) VALUES
(1, 'Alice',   'HR',      50000, NULL),
(2, 'Bob',     'HR',      45000, 1),
(3, 'Charlie', 'HR',      55000, 1),

(4, 'David',   'IT',      70000, NULL),
(5, 'Eva',     'IT',      65000, 4),
(6, 'Frank',   'IT',      72000, 4),
(7, 'Grace',   'IT',      68000, 4),

(8, 'Henry',   'Sales',   60000, NULL),
(9, 'Irene',   'Sales',   58000, 8),
(10,'Jack',    'Sales',   62000, 8);

select * from employee;




-- find the details of emps who has salary higher than the avg salary of their dept

select department, avg(salary) from employee group by department;
-- correlated
select emp_id, emp_name,department,salary from employee as e
where salary>( select avg(salary) from employee where department=e.department);

-- cte
with cte as (
select department as dept, avg(salary) as deptsalary from employee group by department)

select  emp_id, emp_name,department,salary, dept, deptsalary
from employee as e join cte where e.department=cte.dept
and salary>deptsalary;