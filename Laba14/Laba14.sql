--Task1
Create Database Link ANOTHERDB
  CONNECT TO KAV
  Identified by "Lalka007"
  Using 'orcl';
  

Alter session close database Link ANOTHERDB;
DROP database Link ANOTHERDB;

--Task2

--Task3
Create public Database Link ANOTHERDB_PUBLIC
  CONNECT TO KAV
  Identified by "Lalka007"
  Using 'orcl';
  
Alter session close database Link ANOTHERDB_PUBLIC;
DROP database Link ANOTHERDB_PUBLIC;

--Task4
--Select * from teacher@ANOTHERDB_PUBLIC;
  