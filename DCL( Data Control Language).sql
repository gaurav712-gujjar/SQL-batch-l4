-- DCL( Data Control Language)
	-- permission which user can accessbility 
    -- Authentatication
    -- Authorization 
    
-- OBJECT --> it is a structure that can manage, store and update 
-- user ==> create ==> permission 
-- ddl statement

create user gaurav1 identified by '12345';		-- creating a user 

select * from mysql.user;		-- to show all user 

create database tushardb;
use tushardb;
create table tushar1 as 
select * from sakila.actor where actor_id between 1 and 5;


create table tushar2 as 
select * from sakila.actor where actor_id between 3 and 10;


-- give access to other user 
grant select, update on tushardb.*
to gaurav1;

grant select on tushar2
to gaurav1;


   
