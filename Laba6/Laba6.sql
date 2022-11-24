--Task1
select * from v$sga;
select sum(value) from v$sga;

--Task2
select * from v$sga_dynamic_components where current_size>0;

--Task3
select component, granule_size from v$sga_dynamic_components where current_size>0;

--Task4
select current_size from v$sga_dynamic_free_memory;

--Task5
select component, current_size, min_size from v$sga_dynamic_components where
component='DEFAULT buffer cache'
or component='KEEP buffer cache'
or component='RECYCLE buffer cache';

--Tsak6
create table MyTable(x int) storage(buffer_pool keep);
select segment_name, segment_type, tablespace_name, buffer_pool from user_segments where lower(segment_name)='mytable';
drop table MyTable;

--Task7
create table MyTable2(x int) cache storage(buffer_pool default);
select segment_name, segment_type, tablespace_name, buffer_pool from user_segments where lower(segment_name)='mytable2';
drop table MyTable2;

--Task8
show parameter log_buffer;

--Task9
select * from (select pool,name,bytes from v$sgastat where pool = 'shared pool' order by bytes desc) where rownum <=10;

--Task10
select pool,name,bytes from v$sgastat where pool= 'large pool' and name='free memory';

--Task11
select * from v$session;

--Task12
select username,server from v$session;

--Task13
select * from dba_objects where EXTRACT(YEAR from LAST_DDL_TIME) >= 2021 and rownum <= 5 order by LAST_DDL_TIME desc;