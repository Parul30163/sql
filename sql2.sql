create database testing;
use testing;
create table product(
pid int,
pname varchar(20),
oid int
);

create table orders(
oid int,
city varchar(20)
);

insert into product
values
(1,"tv",100),
(2,"mobile",300);

insert into orders 
values
(100,"jaipur"),
(200,"goa"),
(300,"hp");

	select * from product;
    select * from orders;
    
    select pid,pname from
    product join orders; -- cross join cartein join
    -- 1st method
    select pid,pname ,city , orders.oid from
    product join orders
    where (product.oid=orders.oid); -- inner join
    
    
  -- 2nd method
  select pid,pname ,city , orders.oid from
    product join orders
   using(oid);
   
   
 -- 3rd method
 select pid,pname ,city , orders.oid from
    product inner join orders on (product.oid=orders.oid); 
   
   
select pid,pname ,city , orders.oid from
    product right join orders on (product.oid=orders.oid); 
   
-- natural join (bakwas join) interview

select pid,pname,city
from product natural join orders;   

-- self join interview important
create table employee(eid int,ename varchar(20), mid int);
insert  into employee values (10,"tushar",null), (20,"aman",30),
(30,"mayank",10),(40,"ujjwal",20);
select * from employee;

select  emp.eid ,emp.ename,emp.mid ,
 mgr.eid ,mgr.ename as manager_id
from employee as emp join employee as mgr
where emp.mid=mgr.eid;

create table employee1(eid int, ename varchar(20), mid int, sal int);
insert into employee1 values(10,"tushar", null, 52000),(20,"aman",30, 33000),(30,"mayank",10,20000),(40,"ujwal",20, 8000);

select * from employee1;

-- I need to get eid ename mname only for those user where the salary of a emp should be greater than the salary of manager.

select emp1.eid, emp1.ename, mgr1.ename as mname 
from employee1 as emp1 
join employee1 mgr1 
where emp1.sal > mgr1.sal and emp1.mid = mgr1.eid;

use sakila;
select * from actor;
select * from film_actor;
select * from film;
select a.actor_id,a.first_name , a.last_name ,fa.film_id
  from actor as a join film_actor as fa
    where (a.actor_id=fa.actor_id);
    
select a.actor_id,a.first_name , a.last_name ,fa.film_id, f.title
  from actor as a join film_actor as fa join film as f
    where (a.actor_id=fa.actor_id)and (fa.film_id=f.film_id);   
    
/*select actor_id , first_name ,
       case 
            when actor_id>30 then  actor_id+50
            when actor_id>20 then actor_id+20
             when actor_id>10 then actor_id+10
           else actor_id+5 
            
        end "newcol" from actor
  select customer_id,count(*) as total 
from payment group by customer_id order by total*/

select  count(film.title) from actor as a
inner join  film_actor as fa inner join film as f
on(a.actor_id)and(fa.film_id=f.film_id) group by actor.actor_id  ;

use actor;


  
        
    
   
 




















































































































































































































      
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
    
