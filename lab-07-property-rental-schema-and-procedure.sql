-- Goal: Build a property rental database schema, insert sample data,
-- and create a stored procedure to display properties handled by a
-- specific staff member within a maximum rental limit.

CREATE TABLE branch (
    bno       VARCHAR2(5) PRIMARY KEY,
    street    VARCHAR2(50),
    suburb    VARCHAR2(50),
    pcode     NUMBER(6),
    tel_no    NUMBER(10),
    fax_no    NUMBER(10)
);

CREATE TABLE staff (
    sno       VARCHAR2(5) PRIMARY KEY,
    fname     VARCHAR2(20),
    lname     VARCHAR2(20),
    address   VARCHAR2(50),
    tel_no    NUMBER(10),
    position  VARCHAR2(20),
    sex       CHAR(1),
    dob       DATE,
    salary    NUMBER(10),
    bno       VARCHAR2(5),
    CONSTRAINT fk_staff_branch FOREIGN KEY (bno) REFERENCES branch (bno)
);

CREATE TABLE owner (
    ono       VARCHAR2(5) PRIMARY KEY,
    fname     VARCHAR2(20),
    lname     VARCHAR2(20),
    address   VARCHAR2(50),
    telno     VARCHAR2(20)
);

CREATE TABLE property_for_rent (
    pno       VARCHAR2(10) PRIMARY KEY,
    street    VARCHAR2(50),
    suburb    VARCHAR2(50),
    pcode     NUMBER(6),
    type      VARCHAR2(20),
    rooms     NUMBER(4),
    rent      NUMBER(10),
    ono       VARCHAR2(5),
    sno       VARCHAR2(5),
    bno       VARCHAR2(5),
    CONSTRAINT fk_property_owner  FOREIGN KEY (ono) REFERENCES owner (ono),
    CONSTRAINT fk_property_staff  FOREIGN KEY (sno) REFERENCES staff (sno),
    CONSTRAINT fk_property_branch FOREIGN KEY (bno) REFERENCES branch (bno)
);

CREATE TABLE client (
    cno       VARCHAR2(5) PRIMARY KEY,
    fname     VARCHAR2(20),
    lname     VARCHAR2(20),
    address   VARCHAR2(50),
    telno     VARCHAR2(20),
    preftype  VARCHAR2(20),
    maxrent   NUMBER(10),
    bno       VARCHAR2(5),
    CONSTRAINT fk_client_branch FOREIGN KEY (bno) REFERENCES branch (bno)
);

CREATE TABLE viewing (
    cno        VARCHAR2(5),
    pno        VARCHAR2(10),
    viewdate   DATE,
    vcomment   VARCHAR2(100),
    CONSTRAINT pk_viewing PRIMARY KEY (cno, pno),
    CONSTRAINT fk_viewing_client   FOREIGN KEY (cno) REFERENCES client (cno),
    CONSTRAINT fk_viewing_property FOREIGN KEY (pno) REFERENCES property_for_rent (pno)
);

INSERT INTO branch VALUES ('B2', '56 Clover St', 'Melbourne', 3000, 96627723, 96627724);
INSERT INTO branch VALUES ('B3', '163 Main St', 'Kew',       3101, 96598301, 98590231);
INSERT INTO branch VALUES ('B4', '32 Manse Rd', 'Bundoora',  3803, 94791284, 94791212);
INSERT INTO branch VALUES ('B5', '22 Deer Rd',  'Melbourne', 3000, 96628733, 96624455);
INSERT INTO branch VALUES ('B7', '16 Argyll St','Hawthorn',  3122, 96187444, 98186666);

INSERT INTO staff VALUES ('SA9',  'Mary',  'Howe',  '2 Elm Pl, Hawthorn 3122',   NULL,       'Assistant',     'F', TO_DATE('19-FEB-70', 'DD-MON-RR'), 27000, 'B7');
INSERT INTO staff VALUES ('SG14', 'David', 'Ford',  '63 Aghby St, Kew 3103',     411942432,  'Deputy',        'M', TO_DATE('24-MAR-58', 'DD-MON-RR'), 51000, 'B3');
INSERT INTO staff VALUES ('SG37', 'Ann',   'Beech', '81 George St, Kew 3103',    413983983,  'Snr Assistant', 'F', TO_DATE('10-NOV-60', 'DD-MON-RR'), 36000, 'B3');
INSERT INTO staff VALUES ('SG5',  'Susan', 'Brand', '5 Western Rd, Kew 3103',    411412242,  'Manager',       'F', TO_DATE('03-JUN-40', 'DD-MON-RR'), 72000, 'B3');
INSERT INTO staff VALUES ('SL21', 'John',  'White', '19 Taylor St, Melbourne 3000', 418444234, 'Manager',    'M', TO_DATE('01-OCT-45', 'DD-MON-RR'), 90000, 'B5');
INSERT INTO staff VALUES ('SL41', 'Julie', 'Lee',   '28 Malvern Rd, East Kew 3102', 411002332, 'Assistant',  'F', TO_DATE('13-JUN-65', 'DD-MON-RR'), 27000, 'B5');

INSERT INTO owner VALUES ('CO64', 'Owner1', 'Last1', 'Address 1', '0400000001');
INSERT INTO owner VALUES ('CO93', 'Owner2', 'Last2', 'Address 2', '0400000002');
INSERT INTO owner VALUES ('CO87', 'Owner3', 'Last3', 'Address 3', '0400000003');
INSERT INTO owner VALUES ('CO40', 'Owner4', 'Last4', 'Address 4', '0400000004');

INSERT INTO property_for_rent VALUES ('PA14', '16 High St',    'Hawthorn',  3122, 'House', 6, 650, 'CO64', 'SA9',  'B7');
INSERT INTO property_for_rent VALUES ('PG16', '5 Novar Rd',    'Kew',       3101, 'Flat',  4, 450, 'CO93', 'SG14', 'B3');
INSERT INTO property_for_rent VALUES ('PG21', '18 Dale St',    'Kew',       3101, 'House', 5, 600, 'CO87', 'SG37', 'B3');
INSERT INTO property_for_rent VALUES ('PG36', '2 Manor St',    'Kew',       3101, 'Flat',  3, 375, 'CO93', 'SG37', 'B3');
INSERT INTO property_for_rent VALUES ('PG4',  '6 Lawrence St', 'Kew',       3101, 'Flat',  3, 350, 'CO40', 'SG14', 'B3');
INSERT INTO property_for_rent VALUES ('PL94', '6 Argyll St',   'Melbourne', 3000, 'Flat',  4, 400, 'CO87', 'SL41', 'B5');

SELECT *
FROM branch;

SELECT *
FROM staff;

SELECT *
FROM property_for_rent;

CREATE OR REPLACE PROCEDURE pro_property (
    p_staff_no   IN VARCHAR2,
    p_max_rent   IN NUMBER
) AS
BEGIN
    DBMS_OUTPUT.PUT_LINE(
        'Properties handled by staff ' || p_staff_no ||
        ' with rent not more than ' || p_max_rent || ':'
    );

    FOR rec IN (
        SELECT pno, street
        FROM property_for_rent
        WHERE sno = p_staff_no
          AND rent <= p_max_rent
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(rec.pno || ' - ' || rec.street);
    END LOOP;
END pro_property;
/

EXEC pro_property('SG14', 600);