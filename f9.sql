use database1;
create table product (
    pcode  int(10) PRIMARY KEY,
    pname char(100),
    uprice int(50),
    mf char (10)
);
insert into product  (pcode,pname,uprice,mf)
values
(1, 'wp', 120,'surf'),
(2, 'tp', 54 ,'colg'),
(3, 'sp', 25,'lux'),
(4, 'tp', 65,'pepsodent'),
(5, 'sp', 38,'dove'),
(6, 'shp', 245,'dove');
 select * from product;
select SUM(uprice) as total_amount
from product
where pname = ('wp', 'shp', 'tp');

select mf
from product
where uprice = (select MAX(uprice) from product);

select pcode, pname, uprice
from product
order by pname DESC, uprice ASC;

update product
set discount = Case 
                  when uprice>100 then uprice*0.1
                  Else 0
                  End;

alter table product
add column discount int(10);


update product
set uprice = uprice * 0.12
where mf = 'dove';
              
              
              


 