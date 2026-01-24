-- TCL --> transcation control language
-- It is used to manage transactions in a database.
-- to mantain data consistancy and integrity we use TCL.
-- Transaction ==> set of logoical statement ( permanent nahi hai )
-- update 
-- commit, rollback, savepoint

use gaurav;
create table actor_cp1 as select actor_id, first_name from sakila.actor
where actor_id between 1 and 5;


select * from actor_cp1;
insert into actor_cp1 values (6,'gaurav'); -- it will be save and we show it on other connection 

-- autocommit ==> enable 
set @@autocommit=1;
select @@autocommit;
insert into actor_cp1 values (7,'akash'); -- it not show in new connection because we desable autosave, it will be logical 

-- transaction starting 
-- In case if you run any DML operation or insert, update, delete, we write start transcation(statement) to start transcation--transcation start autometically, then transcation will start


-- autometically close transcation
-- commit or rollback 
-- if we write any ddl statement 
-- if we use any statement of TCL my transcation is closed commit, rollback
-- if i run any ddl operation create, drop, alter, will of transcation 

-- Commit
-- Saves all changes permanently

-- Rollback
-- Undoes changes since last COMMIT, disable all transcation and rollback to previous transcation, revert pending transcation
-- if we run commit, rollback was not work 

-- SavePoint
-- Creates a checkpoint inside a transaction
-- Rollback can happen up to a specific point


-- if we run any DDL statment transcation is disable and all will be auto save 


insert into actor_cp1 values (7,'akash');
commit; 

insert into actor_cp1 values(8, 'yash');
rollback;  

insert into actor_cp1 values(9, 'piyush');

start transaction;
insert into actor_cp1 values(10, 'mitansh');	-- pending statement 
commit;

insert into actor_cp1 values(11, 'mitansh'); 	-- it will be auto save because autocommit is enable 

insert into actor_cp1 values(12, 'mitansh');	-- if we run start transction it will be in pending phase 
create table xyz( id int );						-- it will disable the autocommit 


start transaction;

insert into actor_cp1 values(13, 'abi');

insert into actor_cp1 values(14, 'abcd');

delete from actor_cp1 where actor_id in (7,9);
rollback;

start transaction;
insert into actor_]cp1 values(15, 'hik');
savepoint actor_cp1_chk_1;

insert into actor_cp1 values(16, 'llkl');

delete from actor_cp1 where actor_id in (8);
rollback to actor_cp1_chk_1;		-- revert to specific point which is our savepoint

select * from actor_cp1;








