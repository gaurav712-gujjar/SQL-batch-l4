show databases;
use regex;
show tables;
select * from orders;


-- joining two tables 
select c.customer_id, c.customer_name, o.customer_id, o.order_id,
o.amount from customers as c inner join orders as o on c.customer_id=o.customer_id;

-- joining tables from left side or common element 
-- right side or common element
select c.customer_id, c.customer_name, o.customer_id, o.order_id, o.amount from customers
as c left join orders as o on c.customer_id=o.customer_id;

-- Natural join 
-- it is alternative of inner join it use, if there is only one column common 
select c.cid, c.customer_name, o.customer_id, o.order_id, o.amount from customers
as c natural join orders as o;


alter table customers rename column customer_id to cid;

select C.