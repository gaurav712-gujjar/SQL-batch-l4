show databases;
use sakila;
show tables;
select * from actor;
select * from payment;

-- count trasanction for each  customer
select customer_id, count(payment_id) from payment group by customer_id;

-- no of transtion fro each customer where amount>3
-- where( fro filtter the data)
select customer_id, count(payment_id) from payment 
where amount > 3 group by customer_id;

-- total amount of transtion for each amount in the month of may
select payment_date, month(payment_date) from payment
where month(payment_date)=5;

-- to show every column
select amount, count(amount) from payment where 
month(payment_date)=5 group by amount;

-- 1.find out max amount spend and the avg amount is spend and total amount spend for each satff only customer id=1,3,7,11
select max(amount), avg(amount), sum(amount) from payment group by staff_id;

select max(amount), avg(amount), sum(amount) from payment where customer_id in (1,3,7,11) group by staff_id;

-- 2. find total amount spend and no of coustomer who done payment in each months where the  amount spend > 1 dollar;
select month(payment_date), sum(amount), count(customer_id) from payment 
where amount > 1 group by month(payment_date) having count(customer_id>300);

select year(payment_date), month(payment_date), count(customer_id), sum(amount) from payment
group by year(payment_date), month(payment_date);
