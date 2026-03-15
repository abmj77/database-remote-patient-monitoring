-- Goal: Practice basic DML operations and simple schema maintenance
-- such as INSERT, SELECT, DELETE, ALTER TABLE, and DROP TABLE.

INSERT INTO dep (deptno, dname)
VALUES ('CM', 'CHEMISTRY');

INSERT INTO course (corsno, cname, deptno, cmax)
VALUES (301, 'CHEMISTRY I', 'CM', 40);

SELECT *
FROM dep;

SELECT *
FROM course;

DELETE FROM course;

DELETE FROM dep;

ALTER TABLE dep
ADD nbemp NUMBER(2);

DROP TABLE enrolment;
DROP TABLE course;
DROP TABLE student;
DROP TABLE dep;