-- Goal: Create an employee table, insert sample records, and practice
-- table modification operations such as renaming columns, adding columns,
-- dropping columns, renaming the table, and applying a CHECK constraint.

CREATE TABLE emp (
    empno      NUMBER(6) PRIMARY KEY,
    ename      VARCHAR2(20),
    job        VARCHAR2(20),
    mgr        VARCHAR2(6),
    hiredate   DATE,
    sal        NUMBER(7),
    comm       NUMBER(7)
);

INSERT INTO emp VALUES (7369, 'SMITH',  'CLERK',     '7902', TO_DATE('17-DEC-80', 'DD-MON-RR'),  800,  NULL);
INSERT INTO emp VALUES (7499, 'ALLEN',  'SALESMAN',  '7698', TO_DATE('20-FEB-81', 'DD-MON-RR'), 1600,   300);
INSERT INTO emp VALUES (7521, 'WARD',   'SALESMAN',  '7698', TO_DATE('22-FEB-81', 'DD-MON-RR'), 1250,   500);
INSERT INTO emp VALUES (7566, 'JONES',  'MANAGER',   '7839', TO_DATE('02-APR-81', 'DD-MON-RR'), 2975,  NULL);
INSERT INTO emp VALUES (7654, 'MARTIN', 'SALESMAN',  '7698', TO_DATE('28-SEP-81', 'DD-MON-RR'), 1250,  1400);
INSERT INTO emp VALUES (7698, 'BLAKE',  'MANAGER',   '7839', TO_DATE('01-MAY-81', 'DD-MON-RR'), 2850,  NULL);
INSERT INTO emp VALUES (7782, 'CLARK',  'MANAGER',   '7839', TO_DATE('09-JUN-81', 'DD-MON-RR'), 2450,  NULL);
INSERT INTO emp VALUES (7788, 'SCOTT',  'ANALYST',   '7566', TO_DATE('19-APR-87', 'DD-MON-RR'), 3000,  NULL);
INSERT INTO emp VALUES (7839, 'KING',   'PRESIDENT', NULL,   TO_DATE('17-NOV-81', 'DD-MON-RR'), 5000,  NULL);
INSERT INTO emp VALUES (7844, 'TURNER', 'SALESMAN',  '7698', TO_DATE('08-SEP-81', 'DD-MON-RR'), 1500,     0);
INSERT INTO emp VALUES (7876, 'ADAMS',  'CLERK',     '7788', TO_DATE('23-MAY-87', 'DD-MON-RR'), 1100,  NULL);
INSERT INTO emp VALUES (7900, 'JAMES',  'CLERK',     '7698', TO_DATE('03-DEC-81', 'DD-MON-RR'), 9500,  NULL);
INSERT INTO emp VALUES (7902, 'FORD',   'ANALYST',   '7566', TO_DATE('03-DEC-81', 'DD-MON-RR'), 3000,  NULL);
INSERT INTO emp VALUES (7934, 'MILLER', 'CLERK',     '7782', TO_DATE('23-JAN-82', 'DD-MON-RR'), 1300,  NULL);

SELECT *
FROM emp;

ALTER TABLE emp
RENAME COLUMN job TO title;

ALTER TABLE emp
ADD date_of_birth DATE;

ALTER TABLE emp
DROP COLUMN comm;

ALTER TABLE emp
RENAME TO employee;

ALTER TABLE employee
ADD CONSTRAINT chk_salary_range CHECK (sal >= 500 AND sal <= 10000);

SELECT *
FROM employee;

TRUNCATE TABLE employee;