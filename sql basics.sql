use sakila;
select database();
show tables;

describe actor;

-- select statenment(DQL)
select * from actor;
select actor_id, first_name ,last_name from actor;
select actor_id, first_name ,actor_id+4 from actor;
select * from actor where actor_id=2;
select first_name from actor where actor_id<=2; 
select actor_id from actor where first_name='NICK';
select * from actor where actor_id between 2 and 5;
select * from actor where actor_id in (2,5,9);
select * from actor where actor_id not in (2,5,9);
select * from actor where first_name='ED';
select * from actor where first_name like "E%"; -- starting e
select * from actor where first_name like "%E"; -- ending e
select * from actor where first_name like "%E%"; -- e anywhere
select * from actor where first_name like "_D";
select * from actor where first_name like "__%";
-- function and logical op.
select actor_id,first_name from actor 
where actor_id=2 or actor_id=4;

select * from actor where first_name='NICK' and actor_id =44;
-- actorid frst name fn =ed or nick and actorid >=3
select * from actor where (first_name='ED' or first_name ="NICK") and actor_id>=3; -- prioraty order.. and>>or
#function string => output
#single row function
#string function

select first_name, lower(first_name) from actor; -- lower,upper,title

-- dual table(dummy table)
select 4 from dual;
select upper("ac") from dual;

select first_name ,last_name ,concat (first_name,"  ", last_name)from actor; -- join to string but u have to give saperator

-- select first_name ,last_name ,concat_ws (' ','Mr',first_name, last_name)from actor; -- ws =with sepration

select * from actor where concat (first_name," ", last_name) ='ED CHASE';

select * from actor where first_name like concat("J", "%"); -- like("J%")>>>same

-- sub string method>>substr
select first_name ,substr(first_name ,2) from actor; -- substr(column name , starting value)
select first_name ,substr(first_name ,2,5) from actor; -- substr(column name , starting value,kite ch chiye)
select first_name ,substr(first_name ,-3,2) from actor; -- neg se statring values

-- instr >>tells the position of char
select first_name ,instr(first_name ,'E') from actor;

select first_name ,locate("E",first_name ) from actor; -- locate(char to find, from where, kaha se dhund na stat kar na hai)

-- length ( return total no of bytes)(only apply on english)

select length("abgd") from dual;

-- so we use char_length

select char_length("abgd") from dual;

-- trim function remove extra white space

select trim('  abc ') from dual;

select rtrim('  abc ') from dual; -- remove from right
select ltrim('  abc ') from dual; -- remove from left
select trim( trailing ' 'from '  abc ') from dual; -- remove from end
select trim( trailing 'x'from '  xabcxxxxx') from dual;
select trim( leading 'x'from 'xxabcx ') from dual;

select trim( both'x'from 'xxabcx') from dual; -- remove from both side

-- lpad ,rpad >>left ya right side jord na

select rpad(946121,10,'#') from dual;
select rpad(94156584,5,'#') from dual;


-- date time fun
--  year, current date , time 
 select curdate() from dual; -- current_date()
 select curtime() from dual;
  select current_timestamp() from dual;
  
  select adddate(now(),2) from dual;
    select adddate(now(),interval 15 day) from dual;
  select adddate(now(),interval 15 month) from dual;
select dayname(now())
 from dual;
 
 -- date format
 select date_format(now(),"%Y") from dual;
 select date_format(now(),"%M") from dual;
 select date_format(now(),"%D") from dual;
 select date_format(now(),"%m") from dual;
 select date_format(now(),"%m--%d") from dual;
 -- numerical fun  work on numeric data
 -- round , truncate, mod
 select round(10.5)from dual;
select round(10.565,1) from dual;
select truncate(10.565,2) from dual;
select truncate(10.565,1) from dual;
select truncate(10.86,1) from dual;

select mod(10,2) from dual; -- reminder

-- conditional statenment

use sakila;

select * from actor;

select if(True,10,20) from dual;

select actor_id , first_name,
if(actor_id=2,actor_id+10,actor_id) from actor;

select actor_id , first_name,
if(actor_id=2,actor_id+10,if(actor_id=4,actor_id+20,actor_id)) from actor;

-- case study 
/* select col,case  expression \col
              when cond then wht type of work 
              
              end
              from table;
*/


select actor_id , first_name ,
       case actor_id
            when 2 then  actor_id+10
            when 3 then actor_id+20
           else actor_id 
            
        end "newcol"
        from actor;
 
 
 select actor_id , first_name ,
       case 
            when actor_id=2 then  actor_id+10
            when actor_id=3 then actor_id+20
           else actor_id 
            
        end "newcol" from actor
     ;
 
-- if ap erson hav e actor id  >5 +10 15> +25 30> 50+ other wise +5

select actor_id , first_name ,
       case 
            when actor_id>30 then  actor_id+50
            when actor_id>20 then actor_id+20
             when actor_id>10 then actor_id+10
           else actor_id+5 
            
        end "newcol" from actor
     ;
-- group by, diff btw distint and grpby , diff btw where and having 

-- group by (aggregate fun)
-- multi row fun
use sakila;
select * from address;
select count(address_id) from address;

select count(address2) from address;
select count(*) from address;

select distinct (district) from address; -- give unique values
select count(distinct (district)) from address; -- remove same value and count distinct vale
select sum(address_id) from address; -- total of all no
-- min max avg count sum

select count(*) from address where district ='QLD';
select count(*) from address where district ='Alberta';

select district, count(*)
 from address group by district;
 
select district, count(*),sum(city_id)
 from address group by district;
 
 select * from payment;
 select customer_id,count(*) from payment group by customer_id;
 
 -- alias
select customer_id,count(*) as total from payment group by customer_id;
 
select customer_id,count(*) as total 
from payment group by customer_id order by total;-- sort default asc

select customer_id,count(*) as total 
from payment group by customer_id order by total desc;-- sort default asc


select customer_id,sum(amount) as total 
from payment group by customer_id ;-- sort default asc


-- having .. aggerate fun pr filter kar a gha ..group by k baad
-- where normal filter.. group by se phele

select customer_id,sum(amount) as total 
from payment group by customer_id having total>100 ;

select customer_id , sum(amount) from payment where customer_id>5
group by customer_id having  sum(amount)>100;


select sum(amount) from payment where customer_id=1
and staff_id=2;

select customer_id,staff_id from payment
group by customer_id,staff_id;



