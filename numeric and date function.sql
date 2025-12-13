use world;
show tables;

-- numeric function dates
select lifeexpectancy, round(lifeexpectancy)	from country;
select 83.62, round(83.687,2);
select (456.23), round(46.23,-2);

-- pow for power -- ceil convert to upper value --- floor give decimal upper value 
select pow(2,3), ceil(3.0000008), floor(3.456);

-- date 
-- inbuilt function it print date and time
-- now() and current_timestamp() is same 
-- now() print current date
select now(),curdate(), current_time(), current_timestamp();

-- add date---> to add date in current date 
-- this are for to add date, month
select now(), adddate( now(), 2), adddate(now(), interval 3 month);

-- to find days, months, year from now()
select now(), extract(week from now());

-- date_formate--> is use to repersent month,year as a string 
select now(), date_format(now(), 'month is %M & year is%w ');