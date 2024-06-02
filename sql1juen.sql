-- alter
-- tcl>> tranction control lang >>set of logical statenment/ or unit of work 

-- dml, ddl ,dcl ,tcl >>>tranction
# start: dml operation
#end:ddl ,dcl ,tcl

select @@autocommit ;  -- tranction chala or automaticlly band value>>1
set autocommit =0;
create database po;
use po;

create table  if not exists emp(eid int ,ename varchar(50));
insert into emp values (11,"abc123");
select * from emp;

commit;      --  everything stored in databasee --tcl statement

insert into emp values (11,"abc123");
select * from emp;
rollback;-- remove uper wala  pending statenment -- tcl statenment
 update emp set ename = 'empname';

create  table emp1 (eid int);
rollback;

insert into emp values (14,'xyz' );
savepoint emp_sv1;
update emp set ename="tushar";
rollback to emp_sv1;
select * from emp;


-- alter >>ddl
 use po;
 create table comp(id int);
 insert into comp values(10);
 select * from comp;

alter table comp
add column phone varchar(15);

desc comp;



alter table comp
add column ecount int not null;

alter table comp
drop column ecount ;


-- rename 
rename table comp to newcomp;
select * from newcomp;

-- rename with alter
alter table newcomp
rename to comp ;
select * from comp;

alter table comp
rename  column phone to comp_name ;

alter table comp add primary key (id);

desc comp;

alter table  comp add constraint comp_uk unique (comp_name);

alter table  comp drop constraint comp_uk;

update comp set comp_name =0;

alter table companies modify comp_name int;
desc comp;

-- change
alter table comp change comp_name gender char(3);
