-- Goal: Build a small university database schema and apply primary keys,
-- foreign keys, NOT NULL, CHECK constraints, and a default date value.

CREATE TABLE dep (
    deptno   VARCHAR2(2),
    dname    VARCHAR2(20)
);

CREATE TABLE student (
    stdno    NUMBER(8),
    sname    VARCHAR2(30),
    deptno   VARCHAR2(2)
);

CREATE TABLE course (
    corsno   NUMBER(3),
    cname    VARCHAR2(30),
    deptno   VARCHAR2(2),
    cmax     NUMBER(2)
);

CREATE TABLE enrolment (
    stdno    NUMBER(8),
    corsno   NUMBER(3),
    grade    NUMBER(2),
    edate    DATE
);

ALTER TABLE dep
ADD CONSTRAINT pk_dep PRIMARY KEY (deptno);

ALTER TABLE student
ADD CONSTRAINT pk_student PRIMARY KEY (stdno);

ALTER TABLE course
ADD CONSTRAINT pk_course PRIMARY KEY (corsno);

ALTER TABLE enrolment
ADD CONSTRAINT pk_enrolment PRIMARY KEY (stdno, corsno);

ALTER TABLE student
ADD CONSTRAINT fk_student_dep
FOREIGN KEY (deptno) REFERENCES dep (deptno);

ALTER TABLE course
ADD CONSTRAINT fk_course_dep
FOREIGN KEY (deptno) REFERENCES dep (deptno);

ALTER TABLE enrolment
ADD CONSTRAINT fk_enrolment_student
FOREIGN KEY (stdno) REFERENCES student (stdno);

ALTER TABLE enrolment
ADD CONSTRAINT fk_enrolment_course
FOREIGN KEY (corsno) REFERENCES course (corsno);

ALTER TABLE student
MODIFY sname NOT NULL;

ALTER TABLE student
ADD CONSTRAINT chk_student_deptno_not_null CHECK (deptno IS NOT NULL);

ALTER TABLE enrolment
MODIFY edate DEFAULT SYSDATE;