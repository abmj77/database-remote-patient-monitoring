-- Goal: Create a simple STUDENT table to practice basic table creation
-- for a Database course lab using Oracle SQL.

CREATE TABLE student (
    student_id        NUMBER(7) PRIMARY KEY,
    student_name      VARCHAR2(10),
    year_of_joining   DATE,
    specialization    VARCHAR2(10)
);