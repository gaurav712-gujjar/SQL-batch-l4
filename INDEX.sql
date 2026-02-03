use sakila;
-- INDEX
		-- indexes is like a data structure which is use to access the data in a faster way 
        -- An INDEX is a database object that improves the speed of data retrieval from a table.
        
-- Types
		-- Clustered index(primary key) --> arrange data in ascending order
			-- Only ONE clustered index per table (because data can be sorted only once).
            
		-- Non-clustered index --> A non-clustered index does not change physical order of table data.


create table test1000 as select actor_id, first_name from actor where actor_id between 1 and 10;
-- any key not copy in making table from other table 

select * from test1000;
desc test100;	-- no primary key 

explain select * from test1000 where actor_id=4;

insert into test1000 values(14, 'abc'), (13, 'def'), (11,'aman'), (12,'shubam');

select * from test1000;


-- 1.clustered index
-- alter command 
alter table test1000 add primary key(actor_id);
desc test1000;

explain select * from test1000 where actor_id=5;
ALTER TABLE test1000
DROP PRIMARY KEY;

-- 2.Non clustered index
create index inx1 on test1000(actor_id);
show indexes from test1000;

explain select * from test1000 where actor_id=5;

explain select * from test1000 where first_name='aman';
insert into test1000 values(12, 'gt');
insert into test1000 values(15, 'og');
drop index inx1 on test1000;


-- 3.Composite (Multiple Column) Index --> index on two column 
create index indx_composite on test1000(actor_id, first_name);
show index from test1000;
select * from test1000;

drop index indx_composite on test1000;

explain select * from test1000 where first_name='abc';


-- 4.Partial Index
	-- A Partial Index is an index created on only a subset of rows in a table using a WHERE condition.

insert into test1000 values(16, 'joh');
insert into test1000 values(17, 'johh');
insert into test1000 values(18, 'jo');
insert into test1000 values(19, 'johney');
insert into test1000 values(20, 'joe');
insert into test1000 values(21, 'joah');


create index index_3 on test1000(first_name(2) );
show index from test1000;

explain select* from test1000 where first_name like 'jo%';



