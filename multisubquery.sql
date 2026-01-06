show databases;
use sakila;
show tables;

-- in operetor
select * from payment where amount in (select amount from payment where payment_id=2
										or payment_id=3);
                                        
-- =any  (0.99, 5.99) 
-- <any 
-- >any
select * from payment where amount > any ( select amount from payment where payment_id=2 or payment_id=3);

-- all
-- >all it is more than the subquery 
select * from payment where amount >= all ( select amount from payment where payment_id=2 or payment_id=3);

-- what are coreleted subquery and hoe it work 
-- what are constrains in sql