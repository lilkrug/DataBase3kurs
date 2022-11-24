-- DROP TABLE FACULTY
CREATE TABLE FACULTY
  (
   FACULTY      CHAR(10)      NOT NULL,
   FACULTY_NAME VARCHAR2(50), 
   CONSTRAINT PK_FACULTY PRIMARY KEY(FACULTY) 
  );
     
delete FACULTY;
insert into FACULTY   (FACULTY,   FACULTY_NAME )
             values  ('ИДиП',   'Издателькое дело и полиграфия');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('ХТиТ',   'Химическая технология и техника');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('ЛХФ',     'Лесохозяйственный факультет');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('ИЭФ',     'Инженерно-экономический факультет');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('ТТЛП',    'Технология и техника лесной промышленности');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('ТОВ',     'Технология органических веществ');

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
             values  ('ИСиТ',    'Иформационный систем и технологий ',                         'ИДиП'  );
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY )
             values  ('ПОиСОИ', 'Полиграфического оборудования и систем обработки информации ', 'ИДиП'  );
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
              values  ('ЛВ',      'Лесоводства',                                                 'ЛХФ') ;         
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
             values  ('ОВ',      'Охотоведения',                                                 'ЛХФ') ;   
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
             values  ('ЛУ',      'Лесоустройства',                                              'ЛХФ');           
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
             values  ('ЛЗиДВ',   'Лесозащиты и древесиноведения',                               'ЛХФ');                
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
             values  ('ЛПиСПС',  'Ландшафтного проектирования и садово-паркового строительства','ЛХФ');                  
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
             values  ('ТЛ',     'Транспорта леса',                                              'ТТЛП');                        
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
             values  ('ЛМиЛЗ',  'Лесных машин и технологии лесозаготовок',                      'ТТЛП');                        
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
             values  ('ОХ',     'Органической химии',                                           'ТОВ');            
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                              FACULTY)
             values  ('ТНХСиППМ','Технологии нефтехимического синтеза и переработки полимерных материалов','ТОВ');             
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                      FACULTY)
             values  ('ТНВиОХТ','Технологии неорганических веществ и общей химической технологии ','ХТиТ');                    
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                                         FACULTY)
             values  ('ХТЭПиМЭЕ','Химии, технологии электрохимических производств и материалов электронной техники', 'ХТиТ');
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                      FACULTY)
             values  ('ЭТиМ',    'экономической теории и маркетинга',                              'ИЭФ');   
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                      FACULTY)
             values  ('МиЭП',   'Менеджмента и экономики природопользования',                      'ИЭФ');    
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
                       values  ('СМЛВ',    'Смелов Владимир Владиславович',  'ИСиТ', '01.02.1975', 5000);
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('АКНВЧ',    'Акунович Станислав Иванович',  'ИСиТ', '02.02.1976', 4500);
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('КЛСНВ',    'Колесников Леонид Валерьевич',  'ИСиТ', '03.03.1977', 3000);
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('ГРМН',    'Герман Олег Витольдович',  'ИСиТ', '04.05.1991', 2200);
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('ЛЩНК',    'Лащенко Анатолий Пвалович',  'ИСиТ', '21.04.1992', 2000);
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('БРКВЧ',    'Бракович Андрей Игорьевич',  'ИСиТ', '27.01.1988', 2345);
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('ДДК',     'Дедко Александр Аркадьевич',  'ИСиТ', '29.12.1990', 2675);
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('КБЛ',     'Кабайло Александр Серафимович',  'ИСиТ', '30.06.1984', 2943);
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('УРБ',     'Урбанович Павел Павлович',  'ИСиТ', '14.07.1993', 1899);
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('РМНК',     'Романенко Дмитрий Михайлович',  'ИСиТ', '11.05.1989', 2124);
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('ПСТВЛВ',  'Пустовалова Наталия Николаевна', 'ИСиТ', '17.09.1984', 2979);
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('?',     'Неизвестный',  'ИСиТ', '22.02.1992', 2000);
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                      values  ('ГРН',     'Гурин Николай Иванович',  'ИСиТ', '26.09.1987', 1500);
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('ЖЛК',     'Жиляк Надежда Александровна',  'ИСиТ', '31.04.1991', 1689);
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('БРТШВЧ',   'Барташевич Святослав Александрович',  'ПОиСОИ', '24.03.1990', 1398);
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('ЮДНКВ',   'Юденков Виктор Степанович',  'ПОиСОИ', '27.02.1991', 3589);
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('БРНВСК',   'Барановский Станислав Иванович',  'ЭТиМ', '03.06.1982', 3579);
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('НВРВ',   'Неверов Александр Васильевич',  'МиЭП', '28.08.1988', 2479);
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('РВКЧ',   'Ровкач Андрей Иванович',  'ОВ', '17.07.1989' 3577);
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('ДМДК', 'Демидко Марина Николаевна',  'ЛПиСПС', '19.08.1979', 4775);
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('МШКВСК',   'Машковский Владимир Петрович',  'ЛУ', '11.09.1994', 1579);
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('ЛБХ',   'Лабоха Константин Валентинович',  'ЛВ', '09.09.1992', 2155);
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('ЗВГЦВ',   'Звягинцев Вячеслав Борисович',  'ЛЗиДВ', '24.05.1991', 2144); 
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('БЗБРДВ',   'Безбородов Владимир Степанович',  'ОХ', '26.08.1974', 2367); 
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('ПРКПЧК',   'Прокопчук Николай Романович',  'ТНХСиППМ', '26.09.1987', 4689); 
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('НСКВЦ',   'Насковец Михаил Трофимович',  'ТЛ', '28.09.1988', 2567); 
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('МХВ',   'Мохов Сергей Петрович',  'ЛМиЛЗ', '13.03.1993', 3976); 
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('ЕЩНК',   'Ещенко Людмила Семеновна',  'ТНВиОХТ', '25.05.1985', 7895); 
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT , BIRTHDAY, SALARY)
                       values  ('ЖРСК',   'Жарский Иван Михайлович',  'ХТЭПиМЭЕ', '20.02.1990', 2467); 
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
                       values ('СУБД',   'Системы управления базами данных',                   'ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT)
                       values ('БД',     'Базы данных',                                        'ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ИНФ',    'Информацтонные технологии',                          'ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ОАиП',  'Основы алгоритмизации и программирования',            'ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ПЗ',     'Представление знаний в компьютерных системах',       'ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ПСП',    'Пограммирование сетевых приложений',                 'ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('МСОИ',     'Моделирование систем обработки информации',        'ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ПИС',     'Проектирование информационных систем',              'ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('КГ',      'Компьютерная геометрия ',                           'ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ПМАПЛ',   'Полиграфические машины, автоматы и поточные линии', 'ПОиСОИ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('КМС',     'Компьютерные мультимедийные системы',               'ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ОПП',     'Организация полиграфического производства',         'ПОиСОИ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,                            PULPIT)
               values ('ДМ',   'Дискретная матеатика',                     'ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,                             PULPIT )
               values ('МП',   'Математисеское программирование',          'ИСиТ');  
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,                             PULPIT )
               values ('ЛЭВМ', 'Логические основы ЭВМ',                     'ИСиТ');                   
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,                             PULPIT )
               values ('ООП',  'Объектно-ориентированное программирование', 'ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ЭП',     'Экономика природопользования',                       'МиЭП');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ЭТ',     'Экономическая теория',                               'ЭТиМ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('БЛЗиПсOO','Биология лесных зверей и птиц с осн. охотов.',      'ОВ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ОСПиЛПХ','Основы садовопаркового и лесопаркового хозяйства',  'ЛПиСПС');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ИГ',     'Инженерная геодезия ',                              'ЛУ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ЛВ',    'Лесоводство',                                        'ЛЗиДВ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ОХ',    'Органическая химия',                                 'ОХ');   
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ТРИ',    'Технология резиновых изделий',                      'ТНХСиППМ'); 
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ВТЛ',    'Водный транспорт леса',                             'ТЛ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ТиОЛ',   'Технология и оборудование лесозаготовок',           'ЛМиЛЗ'); 
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ТОПИ',   'Технология обогащения полезных ископаемых ',        'ТНВиОХТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ПЭХ',    'Прикладная электрохимия',                           'ХТЭПиМЭЕ');          
---------------------------------------------------------------------------------------------------------------------
-- DROP TABLE AUDITORIUM_TYPE 
create table AUDITORIUM_TYPE 
(
  AUDITORIUM_TYPE   char(10) constraint AUDITORIUM_TYPE_PK  primary key,  
  AUDITORIUM_TYPENAME  varchar2(30) constraint AUDITORIUM_TYPENAME_NOT_NULL not null         
);

delete AUDITORIUM_TYPE;
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,   AUDITORIUM_TYPENAME )
                       values  ('ЛК',   'Лекционная');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,   AUDITORIUM_TYPENAME )
                       values  ('ЛБ-К',   'Компьютерный класс');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,   AUDITORIUM_TYPENAME )
                       values  ('ЛК-К', 'Лекционная с уст. компьютерами');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,   AUDITORIUM_TYPENAME )
                       values  ('ЛБ-X', 'Химическая лаборатория');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,   AUDITORIUM_TYPENAME )
                       values  ('ЛБ-СК', 'Спец. компьютерный класс');
---------------------------------------------------------------------------------------------------------------------
-- DROP TABLE AUDITORIUM 
create table AUDITORIUM 
(
 AUDITORIUM           char(10) primary key,  -- код аудитории
 AUDITORIUM_NAME      varchar2(200),          -- аудитория 
 AUDITORIUM_CAPACITY  number(4),              -- вместимость
 AUDITORIUM_TYPE      char(10) not null      -- тип аудитории
                      references AUDITORIUM_TYPE(AUDITORIUM_TYPE)  
);

delete  AUDITORIUM;
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('206-1',   '206-1', 'ЛБ-К', 15);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)
                       values  ('301-1',   '301-1', 'ЛБ-К', 15);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('236-1',   '236-1', 'ЛК',   60);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('313-1',   '313-1', 'ЛК',   60);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('324-1',   '324-1', 'ЛК',   50);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('413-1',   '413-1', 'ЛБ-К', 15);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('423-1',   '423-1', 'ЛБ-К', 90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('408-2',   '408-2', 'ЛК',  90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('103-4',   '103-4', 'ЛК',  90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('105-4',   '105-4', 'ЛК',  90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('107-4',   '107-4', 'ЛК',  90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('110-4',   '110-4', 'ЛК',  30);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('111-4',   '111-4', 'ЛК',  30);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                      values  ('114-4',   '114-4', 'ЛК-К',  90 );
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values ('132-4',   '132-4', 'ЛК',   90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values ('02Б-4',   '02Б-4', 'ЛК',   90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values ('229-4',   '229-4', 'ЛК',   90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('304-4',   '304-4','ЛБ-К', 90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('314-4',   '314-4', 'ЛК',  90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('320-4',   '320-4', 'ЛК',  90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('429-4',   '429-4', 'ЛК',  90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                        values  ('?',   '???', 'ЛК',  90);
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
  
 