--1zadanie
--drop tablespace TS_KAV
Create Tablespace TS_KAV
  Datafile 'C:\Labs on Bd\TS_KAV.dbf'
  Size 7 m
  autoextend on next 5 m
  Maxsize 20 m
  extent management local;

--2zadanie
--drop tablespace TS_KAV_TEMP
Create Temporary Tablespace TS_KAV_TEMP
  Tempfile 'C:\Labs on Bd\TS_KAV_TEMP.dbf'
  Size 5 m
  autoextend on next 3 m
  Maxsize 30 m
  extent management local;
  
--3zadanie
select Tablespace_Name, Status, contents logging from SYS.DBA_Tablespaces;

select File_Name, Tablrspace_Name, Status, Maxbytes, User_Bytes From DBA_DATA_FILES
union 
select File_Name, Tablrspace_Name, Status, Maxbytes, User_Bytes From DBA_DATA_FILES;

--4zadanie

Create Role KAV_RL;
Grant connect, create session,
      create any table,
      create any view,
      create procedure to RLKAVCORE;
      
select * from dba_role Where Role like 'RL%';

--5zadanie
Select Privilege
from sys.dba_sys_privs
where grantee = 'KAV_RL' union
select privilege
from dba_role_privs rp join role_sys_privs rsp on (rp.granted_role = rsp.role)
where rp.grantee = 'KAV_RL'

--Вывести все привилегии
select * from dba_sys_privs
--Вывести все роли
select * from dba_roles

--6zadanie
Create profile KAV_PFCORE Limit
  password_life_time 180 --колисечтво дней жизни пароля
  sessions_per_user 3 --кол-во сессий для пользователя
  failed_login_attempts 7 --кол-во попыток входа
  password_lock_time 1 --кол-во дней блокирования после ошибок
  password_reuse_time 10 --через сколько дней можно повторить пароль
  password_grace_time default --кол-во дней предупреждений о смене пароля
  connect_time 180 --время соед, минут
  idle_time 30 -- кол-во минут простоя
  
--7zadanie
Select Profile, resource_name, limit from dba_profiles order by Profile;

select profile, resource_name, limit from dba_profiles 
where Profile = 'KAV_PFCORE' order by resource_name;

select profile, resource_name, limit from dba_profiles 
where Profile = 'Default' order by resource_name;

--8zadanie
Create user KAVCORE identified by 9900
default tablespace KAV_TS quota unlimited on KAV_TS
temporary tablespace KAV_TS_TEMP
profile KAV_PFCORE
account unlock
password expire;

--9zadanie
--V SQL Plus

--10zadanie
grant connect, create session, create any table, drop any table,
create any view, drop any view, create any procedure;

--создание произвольной таблицы
create table KAVCORE_Steam_Games
(
  Name varchar(50),
  Player number,
  Price number
);

insert into KAVCORE_Steam_Games values ('Dota2',1000000,10);
insert into KAVCORE_Steam_Games values ('CS_GO',1500000,15);
insert into KAVCORE_Steam_Games values ('Diablo3',100000,20);
insert into KAVCORE_Steam_Games values ('TheWitcher3',500000,40);
insert into KAVCORE_Steam_Games values ('Brawhalla',80000,2);
insert into KAVCORE_Steam_Games values ('Warcraft',2000000,0);
insert into KAVCORE_Steam_Games values ('The rainbow six',50000,14);
select * from KAVCORE_Steam_Games;

create view KAVCORE_VIEW as
select NAME,Price from
KAVCORE_Steam_Games
where Player = 1000000
select * from KAVCORE_VIEW

create tablespace KAV_QDATA
datafile 'KAV_QDATA.dbf'
size 10m
offline;

select Tablespace_Name, Status, Contents from sys.dba_tablespaces;

alter tablespace KAV_QDATA Online;

create table KAVCORE_SONGS
(
  TITLE varchar(50),
  ARTIST varchar(50)
);

insert into KAVCORE_SONGS values ('Show must go on', 'Queen');
insert into KAVCORE_SONGS values ('Another one by the dust', 'Queen');
insert into KAVCORE_SONGS values ('Pablo', 'Morgenstern');
insert into KAVCORE_SONGS values ('King Kong', 'Andy Panda');
insert into KAVCORE_SONGS values ('House', 'Miyagi');

select * from KAVCORE_SONGS