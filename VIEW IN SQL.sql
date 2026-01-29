-- VIEW 
	-- it is a virtual table 
	-- view do'nt store data physically but will access the data from exisiting table 
	-- 1.Simple view,  2.complex view 
    -- A simple view is based on a single table without joins or aggregates, 
    -- while a complex view involves multiple tables, functions, or grouping and is mainly used for reporting.

-- ADVANTAGES OF VIEW
	-- 1. it make complex query easy 
	-- 2. it helps in security


use gaurav;

create table newactor as 
select actor_id, first_name from sakila.actor where actor_id between 1 and 3;


create view actor_v as 						-- crete view and store this query in view
select *, substr(first_name,2) from newactor;


insert into newactor values(4, 'riya');  	-- it also show on view

select * from newactor;

select * from actor_v;

insert into actor_v(actor_id, first_name) values(5, 'gaurav');		-- it not store it on view 


-- 1.SIMPLE VIEW
	-- any dml command change will be visiable on original table where view is created 
	-- A Simple View is created from one table
	-- ❌ No joins
	-- ❌ No group by
	-- ❌ No aggregate functions

create view actor_v3 as 
select * from newactor where actor_id in(1,2);

create view actor_v4 as 
select * from newactor;			-- if we make view without any filtter we can update view and it will be show on original table also 

select * from actor_v4;
insert into newactor values(5, 'sakahi');

select * from newactor;


-- 2.COMPLEX VIEW 
	-- no dml operation do
	-- A Complex View is created using:
	-- Multiple tables (JOIN)
	-- Aggregate functions (SUM, COUNT, AVG)
	-- GROUP BY
	-- Subqueries
    
    
create table newpayment as 
select payment_id, amount from sakila.payment where payment_id between 1 and 8;

create view payment_v as 
select count(*) from newpayment;

select * from payment_v;
insert into payment_v values(10);    	-- no DML command do 


