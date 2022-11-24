--Task1
Select tablespace_name, contents from DBA_TABLESPACES;

--Task2
create tablespace KAV_QDATA
datafile 'C:\app\Tablespaces\KAV_PDB\KAV_QDATA5.dbf'
size 10M
offline;

alter tablespace KAV_QDATA online;

DROP tablespace KAV_QDATA including contents and datafiles;

--drop role MY_ROLE;
Create role MY_ROLE;
commit;


grant create session,
  create view,
  create table,
  create procedure,
  drop any table,
  drop any view,
  drop any procedure to MY_ROLE;
grant create session to MY_ROLE;
commit;

create profile My_Profile limit
  password_life_time 180 --колисечтво дней жизни пароля
  sessions_per_user 3 --кол-во сессий для пользователя
  failed_login_attempts 7 --кол-во попыток входа
  password_reuse_time 10 --через сколько дней можно повторить пароль
  connect_time 180 --время соед, минут
  idle_time 30 -- кол-во минут простоя
commit;

create user KAV identified by 12345
default tablespace KAV_QDATA quota unlimited on KAV_QDATA
profile My_Profile
account unlock;

alter user KAV quota 2M on KAV_QDATA;
grant My_Role to KAV;

create table KAV_T1(
id number(15) Primary key,
name varchar(20))
tablespace KAV_QDATA;

DROP Table KAV_T1;


insert into KAV_T1 values(1,'A');
insert into KAV_T1 values(2,'Б');
insert into KAV_T1 values(3,'В');

Select * from KAV_T1;

--Task3
select segment_name, segment_type from dba_segments where tablespace_name='KAV_QDATA';

--Task4
drop table KAV_T1;
select * from dba_segments where tablespace_name='KAV_QDATA';
select * from user_recyclebin;

--Task5
flashback table KAV_T1 to before drop;

--Task6
begin 
  for k in 4..10004
  loop
  insert into KAV_T1 values(k, 'A');
  end loop;
end;
  commit;

select * from KAV_T1 order by id;

--Task7
select extent_id, blocks, bytes from dba_extents where segment_name='KAV_T1';

--Task8
Drop tablespace KAV_QDATA including contents and datafiles;

--Task9
select group#, sequence#, bytes, members, status, first_change# From v$log;

--Task10
select group#, sequence#, bytes, members, status, first_change# From v$log;

--Task11
Alter System Switch Logfile; 00:41:15
Select * from V$log;

--Task12
alter database add logfile group 4 'C:\app\LOGFILES\REDO040.LOG' size 50m blocksize 512;
alter database add logfile member 'C:\app\LOGFILES\REDO041.LOG' to group 4;
alter database add logfile member 'C:\app\LOGFILES\REDO042.LOG' to group 4;
commit;

select group#, sequence#, bytes, members, status, first_change# From v$log;

--Task 13
alter database clear logfile group 4;
alter database drop logfile group 4;
select group#, sequence#, bytes, members, status, first_change# From v$log;
commit;

--Task14
select name, log_mode from v$database;
select instance_name, archiver, active_state from v$instance;

--Task15
Alter system Switch Logfile;
select name, first_change#, Next_Change# From v$archived_log;

--Task16
--sql plus
--connect /as sysdba
--shutdown immediate;
--startup mount;
--alter database archivelog;
--archive log list;
--alter database open;

--Task17
alter system set log_archive_dest_1='LOCATION=C:\app\lilkrug\oradata\orcl\archive'
alter system switch logfile;
select name, first_change#, Next_change# from v$archived_log;

--Task18
--shutdown immediate;
--startup mount;
--alter database noarchivelog;
--select name, log_mode from v$database;
--alter database open;

--Task19
select name from v$controlfile;

--Task20
show parameter control;

--Task21
alter database backup controlfile to trace;
show parameter spfile;

--Task22
Create pfile='user_pf.ora' from spfile;
--C:\app\lilkrug\product\12.1.0\dbhome_1\database

--Task23
select * from v$pwfile_users;
show parameter remote_login_passwordfile;

--Task24
select * from v$diag_info;

--Task25
--C:\app\lilkrug\diag\rdbms\orcl\orcl\alert

--Task26
--Удалить все файлы







