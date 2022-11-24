--Task1
select * from teacher;

--Task2 
select teacher_name from teacher;
select(regexp_substr(teacher_name, '(\S+)',1,1)||' '||
       substr(regexp_substr(teacher_name,'(\S+)',1,2),1,1)||'. '||
       substr(regexp_substr(teacher_name,'(\S+)',1,3),1,1)||'.') as teacher
from teacher;

--Task3
select * from teacher where TO_CHAR((BIRTHDAY), 'd') = 1;
       
--Task4
create view NextMonthBirth as select * from teacher
  where TO_CHAR(sysdate, 'mm') + 1= TO_CHAR(BIRTHDAY, 'mm');
  
select * from NextMonthBirth;
--drop view NextMonthBith;

--Task5
create view NumberMounth as 
  select to_char(birthday, 'Month') Месяц,
  count(*) Количество
  from teacher
  group by to_char(birthday, 'Month')
  having count(*) >= 1;
  
select * from NumberMounth;
drop view NumberMonth;

--Task6
cursor TeacherBirthday(teacher%rowtype)
    return teacher%rowtype is 
    select * from teacher
    where MOD((TO_CHAR(sysdate, 'yyyy')- TO_CHAR(birthday, 'yyyy')+1),10)=0;

--Task7
cursor AvgSalary(teacher.salary%type,teacher.pulpit%type)
      return teacher.salary%type,teacher.pulpit%type is
      select 
        floor(avg(salary))Средняя_Зарплата,
        pulpit Кафедра
      from teacher group by pulpit;
      
cursor AvgSalaryF(T.salary%type,P.faculty%type)
      return T.salary%type,P.pulpit%type is
      select 
        round(AVG(T.salary),3)Средняя_Зарплата,
        P.faculty Факультет‚
from teacher T inner join pulpit P
      on T.pulpit = P.pulpit
      group by P.faculty order by faculty;
      
cursor AvgSalaryFALL(T.salary%type,P.faculty%type)
      return T.salary%type,P.pulpit%type is
      select 
        round(avg(salary),3)Средняя_Зарплата 
from teacher;     
  
--            TASK 8
declare 
type ADDRESS is record
        (
          town nvarchar2(20),
          country nvarchar2(20)
        );
type PERSON is record
        (
          name teacher.teacher_name%type,
          pulp teacher.pulpit%type,
          homeAddress ADDRESS
        );
per1 PERSON;
per2 PERSON;
begin
  select teacher_name, pulpit into per1.name, per1.PULP from teacher where teacher='ЖЛК';
  per1.homeAddress.town := 'Минск';
  per1.homeAddress.country := 'Беларусь';
  per2 := per1;
  dbms_output.put_line( per2.name||' '|| per2.pulp||' из '|| per2.homeAddress.town||', '|| per2.homeAddress.country);
end;