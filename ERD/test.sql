select * from t_student;

select * from v_prof_dept;

SELECT s.name, d.dname FROM t_student s, t_department d WHERE s.deptno1 = d.deptno
;

SELECT * FROM t_emp;

UPDATE t_emp SET sal = sal + 1;

DELETE FROM test_write WHERE wr_uid > 10;


show tables;

select * from test_write;