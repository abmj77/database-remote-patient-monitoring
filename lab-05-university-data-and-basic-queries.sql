-- Goal: Populate a university schema with sample data and practice
-- basic SELECT queries, filtering, pattern matching, and sorting.

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

INSERT INTO dep VALUES ('27', 'SWE');
INSERT INTO dep VALUES ('71', 'CP');
INSERT INTO dep VALUES ('10', 'IT');
INSERT INTO dep VALUES ('30', 'CS');
INSERT INTO dep VALUES ('41', 'CYS');
INSERT INTO dep VALUES ('20', 'CNE');
INSERT INTO dep VALUES ('21', 'IOT');

INSERT INTO student VALUES (2240, 'Abdulmajeed', '27');
INSERT INTO student VALUES (2211, 'Abdullah',    '41');
INSERT INTO student VALUES (2230, 'Abdulaziz',   '30');
INSERT INTO student VALUES (2321, 'Motaz',       '21');
INSERT INTO student VALUES (2113, 'Mohammed',    '71');
INSERT INTO student VALUES (2232, 'Sara',        '20');
INSERT INTO student VALUES (2241, 'Raghad',      '27');
INSERT INTO student VALUES (2782, 'Jori',        '27');
INSERT INTO student VALUES (2097, 'Nour',        '71');
INSERT INTO student VALUES (2910, 'Nouf',        '21');
INSERT INTO student VALUES (2292, 'Asmaa',       '10');
INSERT INTO student VALUES (2210, 'Ali',         '71');
INSERT INTO student VALUES (2981, 'Raied',       '30');

INSERT INTO course VALUES (213, 'Data Bases',     '30', 60);
INSERT INTO course VALUES (214, 'English',        '71', 60);
INSERT INTO course VALUES (215, 'Mathematics',    '41', 50);
INSERT INTO course VALUES (216, 'SEP',            '27', 65);
INSERT INTO course VALUES (217, 'Statistics',     '21', 35);
INSERT INTO course VALUES (218, 'Digital Logic',  '20', 55);
INSERT INTO course VALUES (219, 'Discrete Math',  '10', 45);

INSERT INTO enrolment VALUES (2240, 214, 99, NULL);
INSERT INTO enrolment VALUES (2211, 218, 92, NULL);
INSERT INTO enrolment VALUES (2292, 219, 79, NULL);
INSERT INTO enrolment VALUES (2097, 213, 95, NULL);
INSERT INTO enrolment VALUES (2981, 214, 89, NULL);
INSERT INTO enrolment VALUES (2210, 215, 91, NULL);
INSERT INTO enrolment VALUES (2113, 217, 88, NULL);
INSERT INTO enrolment VALUES (2241, 216, 99, NULL);

SELECT *
FROM dep;

SELECT *
FROM dep
WHERE dname = 'CP';

SELECT *
FROM student;

SELECT stdno, sname
FROM student
WHERE deptno = '71';

SELECT *
FROM dep
WHERE dname LIKE 'M%'
   OR dname LIKE 'C%';

SELECT *
FROM course
ORDER BY cmax DESC;