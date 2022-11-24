--            TASK 1
create or replace procedure GET_TEACHERS(PCODE TEACHER.PULPIT%TYPE) is
  cursor my_curs is select TEACHER_NAME, TEACHER from TEACHER where PULPIT = PCODE;
  t_name TEACHER.TEACHER_NAME%type;
  t_code TEACHER.TEACHER%type;
begin
  open my_curs;
  fetch my_curs into t_name,t_code;
    loop
      dbms_output.put_line(my_curs%rowcount|| '. '|| t_code||'?'||t_name);
      fetch my_curs into t_name,t_code;
      exit when my_curs%notfound;
    end loop;
    close my_curs;
end;

begin
  GET_TEACHERS('ИСиТ');
end;


--            TASK 2
create or replace function GET_NUM_TEACHERS(PCODE TEACHER.PULPIT%TYPE) return number is
  tCount number;
begin
  select count(*) into tCount from teacher where pulpit = pcode;
  return tCount;
end;

begin
  dbms_output.put_line('Количество преподавателей: ' || GET_NUM_TEACHERS('ИСиТ'));
end;


--            TASK 3
create or replace procedure FGET_TEACHERS(FCODE FACULTY.FACULTY%TYPE) is
  cursor my_curs is
    select t.teacher_name,t.teacher,p.faculty from teacher t inner join pulpit p
    on t.pulpit = p.pulpit where p.faculty = FCODE;
  t_name teacher.teacher_name%type;
  t_code teacher.teacher%type;
  t_faculty pulpit.faculty%type;
begin
  open my_curs;
  fetch my_curs into t_name,t_code,t_faculty;
  loop
    dbms_output.put_line(my_curs%rowcount|| '. '||t_name||'?'|| t_code||'?'|| t_faculty);
    fetch my_curs into t_name,t_code,t_faculty;
    exit when my_curs%notfound;
  end loop;
  close my_curs;
end;

begin 
  FGET_TEACHERS('ИДиП');
END;
  
--            TASK 4
create or replace procedure GET_SUBJECTS (PCODE SUBJECT.PULPIT%TYPE) is
  cursor my_curs is
    select subject,subject_name,s.pulpit from subject s where s.pulpit=pcode;
  s_subject subject.subject%type;
  s_subject_name subject.subject_name%type;
  s_pulpit subject.pulpit%type;
begin
  open my_curs;
  fetch my_curs into s_subject, s_subject_name, s_pulpit;
  loop
    dbms_output.put_line(my_curs%rowcount|| '. '||s_subject||'?'|| s_subject_name||'?'|| s_pulpit);
    fetch my_curs into s_subject, s_subject_name, s_pulpit;
    exit when my_curs%notfound;
  end loop;
  close my_curs;
end;

begin
  GET_SUBJECTS('ИСиТ');
end;

--            TASK 5
create or replace function FGET_NUM_TEACHERS (FCODE FACULTY.FACULTY%TYPE)
  RETURN NUMBER is tCount number;
begin
  select count(*) into tCount from teacher t inner join pulpit p 
  on t.pulpit = p.pulpit where p.faculty=fcode;
    return tCount;
end;

begin
  dbms_output.put_line('Количество преподавателей: ' || FGET_NUM_TEACHERS('ФИТ'));
end;

--            TASK 6
create or replace function GET_NUM_SUBJECTS (PCODE SUBJECT.PULPIT%TYPE) 
  RETURN NUMBER is tCount number :=0;
begin
  select count(*) into tCount from subject where subject.pulpit = PCODE;
  return tCount;
end;

begin
  dbms_output.put_line('Количество дисциплин: ' || GET_NUM_SUBJECTS('ИСиТ'));
end;

--            TASK 7

create or replace package TEACHERS AS
  FCODE FACULTY.FACULTY%TYPE;
  PCODE SUBJECT.PULPIT%TYPE;
  PROCEDURE GET_TEACHERS(FCODE FACULTY.FACULTY%TYPE);
  PROCEDURE GET_SUBJECTS(PCODE SUBJECT.PULPIT%TYPE);
  FUNCTION GET_NUM_TEACHERS(FCODE FACULTY.FACULTY%TYPE) RETURN NUMBER;
  FUNCTION GET_NUM_SUBJECTS(PCODE SUBJECT.PULPIT%TYPE) RETURN NUMBER;
end TEACHERS;


create or replace package body TEACHERS as

function GET_NUM_TEACHERS (FCODE FACULTY.FACULTY%TYPE)
  RETURN NUMBER is tCount number;
begin
  select count(*) into tCount from teacher t inner join pulpit p 
  on t.pulpit = p.pulpit where p.faculty=FCODE;
    return tCount;
end GET_NUM_TEACHERS;
      
function GET_NUM_SUBJECTS (PCODE SUBJECT.PULPIT%TYPE) 
  RETURN NUMBER is tCount number :=0;
begin
  select count(*) into tCount from subject where subject.pulpit = PCODE;
  return tCount;
end GET_NUM_SUBJECTS;
    
procedure GET_SUBJECTS (PCODE SUBJECT.PULPIT%TYPE) is
  cursor my_curs is
    select subject,subject_name,s.pulpit from subject s where s.pulpit=pcode;
  s_subject subject.subject%type;
  s_subject_name subject.subject_name%type;
  s_pulpit subject.pulpit%type;
begin
  open my_curs;
  fetch my_curs into s_subject, s_subject_name, s_pulpit;
  loop
    dbms_output.put_line(my_curs%rowcount|| '. '||s_subject||'?'|| s_subject_name||'?'|| s_pulpit);
    fetch my_curs into s_subject, s_subject_name, s_pulpit;
    exit when my_curs%notfound;
  end loop;
  close my_curs;
end GET_SUBJECTS;

procedure GET_TEACHERS(FCODE FACULTY.FACULTY%TYPE) is
  cursor my_curs is
    select t.teacher_name,t.teacher,p.faculty from teacher t inner join pulpit p
    on t.pulpit = p.pulpit where p.faculty = FCODE;
  t_name teacher.teacher_name%type;
  t_code teacher.teacher%type;
  t_faculty pulpit.faculty%type;
begin
  open my_curs;
  fetch my_curs into t_name,t_code,t_faculty;
  loop
    dbms_output.put_line(my_curs%rowcount|| '. '||t_name||'?'|| t_code||'?'|| t_faculty);
    fetch my_curs into t_name,t_code,t_faculty;
    exit when my_curs%notfound;
  end loop;
  close my_curs;
end GET_TEACHERS;
END TEACHERS;
  
  
BEGIN
  DBMS_OUTPUT.PUT_LINE('Преподаватели по факультету:');
  TEACHERS.GET_TEACHERS('ИДиП');
  
  DBMS_OUTPUT.PUT_LINE('Дисциплины по факультету:');
  TEACHERS.GET_SUBJECTS('ИСиТ');
  
  dbms_output.put_line('Количество преподавателей: ' ||  TEACHERS.GET_NUM_TEACHERS('ИДиП'));
  
  dbms_output.put_line('Количество преподавателей: ' || TEACHERS.GET_NUM_SUBJECTS('ИСиТ'));
END;