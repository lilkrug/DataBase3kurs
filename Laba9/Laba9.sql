--Task1
grant create session to KAV;
grant create table to KAV;
grant create view to KAV;
grant create any sequence to KAV;
grant select any sequence to KAV;
grant create cluster to KAV;
grant create public synonym to KAV;
grant create synonym to KAV;
grant create materialized view to KAV;
grant drop public synonym to KAV;
alter user KAV quota unlimited on users;

--Task2
create sequence KAV.S1
  increment by 10
  start with 1000
  nomaxvalue
  nominvalue
  nocycle
  nocache
  noorder;

select S1.nextval from dual;
select S1.currval from dual;

Drop sequence S1;

--Task3
create sequence KAV.S2
  increment by 10
  start with 10
  maxvalue 100
  nocycle;

select S2.nextval from dual;
alter sequence S2 increment by 90;
select S2.cerrval from dual;

Drop sequence S2;

--Task5
create sequence KAV.S3
  increment by -10
  start with 10
  maxvalue 20
  minvalue -100
  nocycle
  order;
  
select S3.nextval from dual;
alter sequence S3 increment by -90;
select S3.currval from dual;
alter sequence S3 increment by -10;

Drop sequence S3;

--Task6
create sequence KAV.S4
  increment by 1
  start with 1
  maxvalue 4
  cycle
  cache 2
  noorder;
  
select S4.nextval from dual;

Drop sequence S4;

--Task7
select * from sys.all_sequences where sequence_owner='KAV';

--Task8
select * from user_tablespaces;
create table T1(
  N1 number(20),
  N2 number(20),
  N3 number(20),
  N4 number(20)
) tablespace USERS;

alter table T1 cache storage (buffer_pool keep);

Begin
  for i IN 1..7
  Loop
  insert into T1(N1,N2,N3,N4) values (S1.currval, S2.currval, S3.currval, S4.currval);
  End Loop;
End;

select * from T1;

--Task9
create cluster KAV.ABC
(
  x number(10),
  y varchar(12)
)
hashkeys 200 tablespace USERS;

--Task10-12
create table A(XA number(10), VA number(10), CA number(10)) cluster KAV.ABC(XA,VA);
create table B(XB number(10), VB number(10), CB number(10)) cluster KAV.ABC(XB,VB);
create table C(XC number(10), VC number(10), CC number(10)) cluster KAV.ABC(XC,VC);

--Task13
select cluster_name, owner from dba_clusters;
select * from dba_tables where cluster_name='ABC';

--Task14-15
create synonym SS1 for KAV.C;
create public synonym SS for KAV.B;
select * from all_synonyms where table_owner='KAV';

Drop synonym SS1;
Drop public synonym SS;
Drop table A;
Drop table B;
Drop table C;

--Task16
create table A( 
  X number(20) primary key
);

create table B(
  Y number(20),
  constraint fk_column
  foreign key (Y) references A(X)
);

insert into A(X) values (1);
insert into A(X) values (2);
insert into B(Y) values (1);
insert into B(Y) values (2);

create view V1 as select X, Y from A inner join B on A.X=B.Y;

select * from V1;
DROP View V1;

--Task17
create materialized view MV
  build immediate
  refresh complete 
  start with sysdate
  next sysdate + Interval '1' minute
  as 
  select A.X, B.Y
  from (select count(*) X from A) a,
       (select count(*) Y from B) b
       
       select * from MV;
       insert into A(X) values (8);
drop materialized view MV;