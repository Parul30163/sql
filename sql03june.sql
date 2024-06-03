-- DCL
create user bob12 identified by 'bob';

select * from mysql.user;

-- current
select current_user();
show grants for 'bob12';

create user 'sammy'@'192.16.10.%' identified by 'password';
-- permission
grant all  privileges on sakila.* to bob12;
show grants for 'bob12';

alter user 'bob12' identified by'regex';

alter user  'bob12' account lock;
alter user  'bob12' account unlock;


-- group ; collection of user
create role sales; -- creating role
grant select on sakila.* to sales; -- grant all privilage



create user "aman" identified by "aman";
show grants for "aman"; 

grant sales to aman;
show grants for "aman"; 




set default role all to aman;

use sakila;
/*create table parul(id  int,ename varchar(50));
create user parul16 identified by 'parul';

grant select (id)on sakila.* to parul;*/
create table test(id int,col int) ;

create user t1 identified by 't';

grant select (id) on sakila.test to t1;

create user a1 identified by 'a';

grant update (col) on sakila.test to a;