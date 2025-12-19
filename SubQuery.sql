show databases;
use sakila;
show tables;

-- Subquery 
-- > Ouery witn a query
-- > solve outer query frist then solve inner query 
select * from payment where amount > 0.99;

select amount from payment where payment_id=25;

select * from payment where amount > 4.99;

select payment_date, month(payment_date) from payment where payment_id=3;
select * from payment where month(payment_date)=6;

-- subquery
select * from payment where month(payment_date)=
(select month(payment_date) from payment where payment_id=3);

-- subquery
select * from payment where
amount>(select amount from payment where payment_id=20);