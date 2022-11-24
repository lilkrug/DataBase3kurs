--Task1
select name, description from v$bgprocess order by 1;

--Task2
select * from v$process;

--Task3
show parameter db_writer_processes;

--Task4 and 5
select * from v$instance;

--Task6
select * from v$services;

--Task7
select * from v$dispatcher;
show parameter dispatchers;

--Task9
select username, server from v$session;

--Task10
--C:\app\lilkrug\product\12.1.0\dbhome_1\NETWORK\ADMIN

--Task11
--sqlPlus -> lsnrctl -> --help

--Task12
select Type, name, NETWORK_NAME, PDB from v$listener_network inner join
v$services on v$listener_network.value = v$services.name;