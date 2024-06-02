use database1;
create table pduct (
    pcode  int(10) PRIMARY KEY,
    pname char(100),
    uprice int(50),
    mf char (10)
);
insert into pduct  (pcode,pname,uprice,mf)
values
(1, 'wp', 120,'surf'),
(2, 'tp', 54 ,'colg'),
(3, 'sp', 25,'lux'),
(4, 'tp', 65,'pepsodent'),
(5, 'sp', 38,'dove'),
(6, 'shp', 245,'dove');
 select * from pduct;
update pduct
set uprice = uprice * 0.12
where mf = 'dove';
              