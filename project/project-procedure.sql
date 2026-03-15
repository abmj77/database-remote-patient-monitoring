-- Goal: Create stored procedures for the remote patient monitoring database.
-- This file includes one procedure to display doctor data and another
-- procedure to update a patient record.

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE doctor_data (
    p_doctor_id IN NUMBER
) AS
BEGIN
    FOR info IN (
        SELECT doctor_id, name, major, email, department
        FROM doctor
        WHERE doctor_id = p_doctor_id
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Data of Doctor: ID = ' || info.doctor_id ||
            ', Name = ' || info.name ||
            ', Major = ' || info.major ||
            ', Email = ' || info.email ||
            ', Department = ' || NVL(info.department, 'N/A')
        );
    END LOOP;
END doctor_data;
/
EXEC doctor_data(1);


CREATE OR REPLACE PROCEDURE set_patient (
    p_id                IN patient.patient_id%TYPE,
    p_new_gender        IN patient.gender%TYPE,
    p_new_phone_number  IN patient.phone_number%TYPE,
    p_new_name          IN patient.name%TYPE
) AS
    v_old_gender        patient.gender%TYPE;
    v_old_phone_number  patient.phone_number%TYPE;
    v_old_name          patient.name%TYPE;
BEGIN
    SELECT gender, phone_number, name
    INTO v_old_gender, v_old_phone_number, v_old_name
    FROM patient
    WHERE patient_id = p_id;

    DBMS_OUTPUT.PUT_LINE(
        'Old Values: Gender = ' || v_old_gender ||
        ', Phone_number = ' || v_old_phone_number ||
        ', Name = ' || v_old_name
    );

    UPDATE patient
    SET gender = p_new_gender,
        phone_number = p_new_phone_number,
        name = p_new_name
    WHERE patient_id = p_id;

    DBMS_OUTPUT.PUT_LINE(
        'New Values: Gender = ' || p_new_gender ||
        ', Phone_number = ' || p_new_phone_number ||
        ', Name = ' || p_new_name
    );
END set_patient;
/
EXEC set_patient(2, 'Male', '0500000000', 'Mohammad Alwaqdany');