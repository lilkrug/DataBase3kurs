--Task1
select name,open_mode from v$pdbs;

--Task2
select Instance_name from v$instance;

--Task3
select * from product_component_version;

--Task4
--Oracle DATABASE CONFIGREATION ASSISTANT;
--alter session set container=CDB$ROOT;
alter session set container=KAV_PDB;
--Task5
select name,open_mode from v$pdbs;

--Task6
create tablespace TS_KAV
Datafile 'C:\app\Tablespaces\TS_KAV.dbf'
size 7M
Reuse Autoextend on next 5M
Maxsize 20M
Logging
Online;
commit;

Drop Tablespace TS_KAV Including contents and datafiles;

select Tablespace_name, Block_size, Max_size from sys.dba_tablespaces order by tablespace_name;

Create Temporary tablespace TS_KAV_Temp_1
TempFile 'C:\app\Tablespaces\TS_KAV_TEMP.dbf'
size 5M
Reuse autoextend on next 3M
Maxsize 30M;
commit;

Drop Tablespace TS_KAV_TEMP_1 including contents and datafiles;

create role RL_KAV;
commit;

drop role RL_KAV;

grant connect, create session, create any table, create any procedure,
Alter any sequence, create sequence, create any view to RL_KAV;

grant drop any table, drop any view, drop any procedure to RL_KAV;
commit;

create profile PF_KAV limit
  password_life_time 180 --колисечтво дней жизни пароля
  sessions_per_user 3 --кол-во сессий для пользователя
  failed_login_attempts 7 --кол-во попыток входа
  password_lock_time 1 --кол-во дней блокирования после ошибок
  password_reuse_time 10 --через сколько дней можно повторить пароль
  connect_time 180 --время соед, минут
  idle_time 30 -- кол-во минут простоя
commit;

drop profile PF_KAV;

create user U1_KAV_PDB identified by 1234
default tablespace TS_KAV quota unlimited on TS_KAV
profile PF_KAV
account unlock;

grant SYSDBA to U1_KAV_PDB;

drop user U1_KAV_PDB CASCADE;

grant RL_Kav to U1_KAV_PDB;
commit;

select Grantee, privilege from DBA_SYS_PRIVS where Grantee like '%KAV%';
commit;

--Task7
Drop table U1KAVTABLE

create table U1KAVTABLE(
id number generated always as identity primary key,
word varchar2(50)
);

insert into U1KAVTABLE(word) values('Changed');
insert into U1KAVTABLE(word) values('a');
insert into U1KAVTABLE(word) values('b');
commit;

Select * from U1KAVTABLE;

--Task8
Select * from DBA_USERS;
Select * from DBA_Tablespaces;
Select * from DBA_DATA_FILES;
Select * from DBA_TEMP_FILES;
Select * from DBA_ROLES;
Select * from DBA_ROLE_PRIVS t1 inner join DBA_SYS_PRIVS t2 on t1.GRANTED_ROLE = t2.GRANTEE
where t1.GRANTEE = 'U1_KAV_PDB';

select * from DBA_PROFILES;

--Task9
create user C##KAV identified by 1234
account unlock;

--Task 10
grant create session, create any table, drop any table to C##KAV;

create table CDB_C_KAV(num number);

create table PDB_C_KAV(num number);

select * from v$session where Username is not null;
select Privilege from USER_SYS_PRIVS;