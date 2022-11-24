-- DROP TABLE FACULTY
CREATE TABLE FACULTY
  (
   FACULTY      CHAR(10)      NOT NULL,
   FACULTY_NAME VARCHAR2(50), 
   CONSTRAINT PK_FACULTY PRIMARY KEY(FACULTY) 
  );
     
delete FACULTY;
insert into FACULTY   (FACULTY,   FACULTY_NAME )
             values  ('����',   '����������� ���� � ����������');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('����',   '���������� ���������� � �������');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('���',     '����������������� ���������');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('���',     '���������-������������� ���������');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('����',    '���������� � ������� ������ ��������������');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('���',     '���������� ������������ �������');

--------------------------------------------------------------------------------------------
-- DROP TABLE PULPIT
CREATE TABLE PULPIT 
(
 PULPIT       CHAR(10)      NOT NULL,
 PULPIT_NAME  VARCHAR2(100), 
 FACULTY      CHAR(10)      NOT NULL, 
 CONSTRAINT FK_PULPIT_FACULTY FOREIGN KEY(FACULTY)   REFERENCES FACULTY(FACULTY), 
 CONSTRAINT PK_PULPIT PRIMARY KEY(PULPIT) 
 ); 
 
delete PULPIT;  
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY )
             values  ('����',    '������������� ������ � ���������� ',                         '����'  );
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY )
             values  ('������', '���������������� ������������ � ������ ��������� ���������� ', '����'  );
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
              values  ('��',      '�����������',                                                 '���') ;         
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
             values  ('��',      '������������',                                                 '���') ;   
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
             values  ('��',      '��������������',                                              '���');           
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
             values  ('�����',   '���������� � ����������������',                               '���');                
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
             values  ('������',  '������������ �������������� � ������-��������� �������������','���');                  
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
             values  ('��',     '���������� ����',                                              '����');                        
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
             values  ('�����',  '������ ����� � ���������� �������������',                      '����');                        
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
             values  ('��',     '������������ �����',                                           '���');            
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                              FACULTY)
             values  ('��������','���������� ���������������� ������� � ����������� ���������� ����������','���');             
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                      FACULTY)
             values  ('�������','���������� �������������� ������� � ����� ���������� ���������� ','����');                    
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                                         FACULTY)
             values  ('��������','�����, ���������� ����������������� ����������� � ���������� ����������� �������', '����');
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                      FACULTY)
             values  ('����',    '������������� ������ � ����������',                              '���');   
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                      FACULTY)
             values  ('����',   '����������� � ��������� ������������������',                      '���');    
------------------------------------------------------------------------------------------------------------------------        - DROP  TABLE TEACHER
CREATE TABLE TEACHER
 ( 
  TEACHER       CHAR(10) NOT  NULL,
  TEACHER_NAME  VARCHAR2(50), 
  PULPIT        CHAR(10) NOT NULL, 
  BIRTHDAY      DATE,
  SALARY        NUMBER,
  CONSTRAINT PK_TEACHER  PRIMARY KEY(TEACHER), 
  CONSTRAINT FK_TEACHER_PULPIT FOREIGN   KEY(PULPIT)   REFERENCES PULPIT(PULPIT)
 ) ;
 
 
delete  TEACHER;
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('����',    '������ �������� �������������',  '����', '01.02.1975', 5000);
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('�����',    '�������� ��������� ��������',  '����', '02.02.1976', 4500);
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('�����',    '���������� ������ ����������',  '����', '03.03.1977', 3000);
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('����',    '������ ���� �����������',  '����', '04.05.1991', 2200);
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('����',    '������� �������� ��������',  '����', '21.04.1992', 2000);
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('�����',    '�������� ������ ���������',  '����', '27.01.1988', 2345);
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('���',     '����� ��������� ����������',  '����', '29.12.1990', 2675);
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('���',     '������� ��������� �����������',  '����', '30.06.1984', 2943);
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('���',     '��������� ����� ��������',  '����', '14.07.1993', 1899);
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('����',     '��������� ������� ����������',  '����', '11.05.1989', 2124);
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('������',  '����������� ������� ����������', '����', '17.09.1984', 2979);
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('?',     '�����������',  '����', '22.02.1992', 2000);
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                      values  ('���',     '����� ������� ��������',  '����', '26.09.1987', 1500);
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('���',     '����� ������� �������������',  '����', '31.04.1991', 1689);
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('������',   '���������� ��������� �������������',  '������', '24.03.1990', 1398);
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('�����',   '������� ������ ����������',  '������', '27.02.1991', 3589);
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('������',   '����������� ��������� ��������',  '����', '03.06.1982', 3579);
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('����',   '������� ��������� ����������',  '����', '28.08.1988', 2479);
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('����',   '������ ������ ��������',  '��', '17.07.1989' 3577);
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('����', '������� ������ ����������',  '������', '19.08.1979', 4775);
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('������',   '���������� �������� ��������',  '��', '11.09.1994', 1579);
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('���',   '������ ���������� ������������',  '��', '09.09.1992', 2155);
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('�����',   '��������� �������� ���������',  '�����', '24.05.1991', 2144); 
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('������',   '���������� �������� ����������',  '��', '26.08.1974', 2367); 
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('������',   '��������� ������� ���������',  '��������', '26.09.1987', 4689); 
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('�����',   '�������� ������ ����������',  '��', '28.09.1988', 2567); 
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('���',   '����� ������ ��������',  '�����', '13.03.1993', 3976); 
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('����',   '������ ������� ���������',  '�������', '25.05.1985', 7895); 
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('����',   '������� ���� ����������',  '��������', '20.02.1990', 2467); 
---------------------------------------------------------------------------------------------------------------------
-- DROP TABLE SUBJECT 
CREATE TABLE SUBJECT
    (
     SUBJECT      CHAR(10)     NOT NULL, 
     SUBJECT_NAME VARCHAR2(50)  NOT NULL,
     PULPIT       CHAR(10)     NOT NULL,  
     CONSTRAINT PK_SUBJECT PRIMARY KEY(SUBJECT),
     CONSTRAINT FK_SUBJECT_PULPIT FOREIGN  KEY(PULPIT)  REFERENCES PULPIT(PULPIT)
    );

delete SUBJECT;
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('����',   '������� ���������� ������ ������',                   '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT)
                       values ('��',     '���� ������',                                        '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('���',    '�������������� ����������',                          '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('����',  '������ �������������� � ����������������',            '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('��',     '������������� ������ � ������������ ��������',       '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('���',    '��������������� ������� ����������',                 '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('����',     '������������� ������ ��������� ����������',        '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('���',     '�������������� �������������� ������',              '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('��',      '������������ ��������� ',                           '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('�����',   '��������������� ������, �������� � �������� �����', '������');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('���',     '������������ �������������� �������',               '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('���',     '����������� ���������������� ������������',         '������');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,                            PULPIT)
               values ('��',   '���������� ���������',                     '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,                             PULPIT )
               values ('��',   '�������������� ����������������',          '����');  
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,                             PULPIT )
               values ('����', '���������� ������ ���',                     '����');                   
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,                             PULPIT )
               values ('���',  '��������-��������������� ����������������', '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('��',     '��������� ������������������',                       '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('��',     '������������� ������',                               '����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('������OO','�������� ������ ������ � ���� � ���. ������.',      '��');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('�������','������ ��������������� � ������������� ���������',  '������');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('��',     '���������� �������� ',                              '��');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('��',    '�����������',                                        '�����');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('��',    '������������ �����',                                 '��');   
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('���',    '���������� ��������� �������',                      '��������'); 
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('���',    '������ ��������� ����',                             '��');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('����',   '���������� � ������������ �������������',           '�����'); 
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('����',   '���������� ���������� �������� ���������� ',        '�������');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('���',    '���������� ������������',                           '��������');          
---------------------------------------------------------------------------------------------------------------------
-- DROP TABLE AUDITORIUM_TYPE 
create table AUDITORIUM_TYPE 
(
  AUDITORIUM_TYPE   char(10) constraint AUDITORIUM_TYPE_PK  primary key,  
  AUDITORIUM_TYPENAME  varchar2(30) constraint AUDITORIUM_TYPENAME_NOT_NULL not null         
);

delete AUDITORIUM_TYPE;
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,   AUDITORIUM_TYPENAME )
                       values  ('��',   '����������');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,   AUDITORIUM_TYPENAME )
                       values  ('��-�',   '������������ �����');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,   AUDITORIUM_TYPENAME )
                       values  ('��-�', '���������� � ���. ������������');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,   AUDITORIUM_TYPENAME )
                       values  ('��-X', '���������� �����������');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,   AUDITORIUM_TYPENAME )
                       values  ('��-��', '����. ������������ �����');
---------------------------------------------------------------------------------------------------------------------
-- DROP TABLE AUDITORIUM 
create table AUDITORIUM 
(
 AUDITORIUM           char(10) primary key,  -- ��� ���������
 AUDITORIUM_NAME      varchar2(200),          -- ��������� 
 AUDITORIUM_CAPACITY  number(4),              -- �����������
 AUDITORIUM_TYPE      char(10) not null      -- ��� ���������
                      references AUDITORIUM_TYPE(AUDITORIUM_TYPE)  
);

delete  AUDITORIUM;
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('206-1',   '206-1', '��-�', 15);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)
                       values  ('301-1',   '301-1', '��-�', 15);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('236-1',   '236-1', '��',   60);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('313-1',   '313-1', '��',   60);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('324-1',   '324-1', '��',   50);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('413-1',   '413-1', '��-�', 15);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('423-1',   '423-1', '��-�', 90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('408-2',   '408-2', '��',  90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('103-4',   '103-4', '��',  90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('105-4',   '105-4', '��',  90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('107-4',   '107-4', '��',  90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('110-4',   '110-4', '��',  30);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('111-4',   '111-4', '��',  30);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                      values  ('114-4',   '114-4', '��-�',  90 );
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values ('132-4',   '132-4', '��',   90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values ('02�-4',   '02�-4', '��',   90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values ('229-4',   '229-4', '��',   90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('304-4',   '304-4','��-�', 90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('314-4',   '314-4', '��',  90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('320-4',   '320-4', '��',  90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('429-4',   '429-4', '��',  90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                        values  ('?',   '???', '��',  90);
-----------------------------------------------------------------------------------------------------------------------



--Task1
begin
  null;
end;

--Task2

begin
  dbms_output.put_line('Hello World!');
end;

--Task3
declare 
  x number(3) := 3;
  y number(3) := 0;
  z number(10,2);
begin
  z:=x/y;
  exception when others
  then dbms_output.put_line(sqlcode||':error =' || sqlerrm);
end;

--Task4
declare 
  x number(3) := 3;
begin 
  begin
  declare x number(3) := 1;
  begin dbms_output.put_line('x = ' || x);end;
  end;
  dbms_output.put_line('x = ' || x);
end;

--Task5
alter system set plsql_warnings='Enable:INFORMATION';
select name, value from v$parameter where name ='plsql_warnings';

--Task6
select keyword from v$reserved_words
  where length = 1 and keyword != 'A';
  
--Task7
select keyword from v$reserved_words
  where length > 1 and keyword != 'A';

--Task8
select name, value from v$parameter
  where name like 'plsql';
show parameters;

--Task9-17
declare 
  n1 number(3):= 25;
  n2 number(3):= 10;
  div number(10,2);
  fix number(10,2):= 3.14;
  neg number(4,-5):= 32.12345;
  en number(32,10):= 12345E-10;
  bf binary_float:=123456789.123456789;
  bd binary_double:=123456789.123456789;
  b1 boolean:= true;
begin
  div:=mod(n1,n2);
  dbms_output.put_line('n1 = '|| n1);
  dbms_output.put_line('n2 = '|| n2);
  dbms_output.put_line('n1%n2 = '|| div);
  dbms_output.put_line('fix = '|| fix);
  dbms_output.put_line('neg = '|| neg);
  dbms_output.put_line('en = '|| en);
  dbms_output.put_line('bf = '|| bf);
  dbms_output.put_line('bd = '|| bd);
  if b1 then dbms_output.put_line('b1 = '|| 'true'); end if;
end;

--Task18
declare
  n3 constant number(5):=5;
  vc constant varchar(25):= 'Hello World!';
  mm constant char(7):='Alex';
  begin
  dbms_output.put_line('vc = '|| vc);
  dbms_output.put_line('n3 = '|| n3);
  dbms_output.put_line('mm = '|| mm);
end;

--Task 19-20
declare
  name varchar(25):= 'One';
  surname name%type:= 'Two';
  x dual%ROWTYPE;
begin
  select 'T' into x from dual;
  dbms_output.put_line('name = '|| name);
  dbms_output.put_line(x.dummy);
end;

--Task21
declare 
  x pls_integer := 17;
begin
  if x > 8 then dbms_output.put_line(x || '>8');
  elsif  x = 8 then dbms_output.put_line(x || '=8');
  else dbms_output.put_line(x || '8');
  end if;
end;

--Task22
declare 
  x pls_integer :=19;
begin
  case
   when x < 18 then dbms_output.put_line(x || '<18');
   when x between 13 and 20 then dbms_output.put_line(x || ' is between 13 and 20 ');
   else dbms_output.put_line('else');
   end case;
end;

--Task23-24
declare 
  x pls_integer :=0;
  begin
    loop x:x+1;
     dbms_output.put(x);
     exit when x>5;
    end loop;
    dbms_output.put_line(' ');
    for k in 1..5
     loop dbms_output.put_line(k); end loop;
    while(x>0)
      loop x:x-1;
      dbms_output.put_line(x);
      end loop;
  end;
  
 