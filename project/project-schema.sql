-- Goal: Create the database schema for a remote patient monitoring system.
-- This file defines all core tables and relationships for the project.

CREATE TABLE doctor (
    doctor_id    NUMBER PRIMARY KEY,
    name         VARCHAR2(100) NOT NULL,
    major        VARCHAR2(100) NOT NULL,
    email        VARCHAR2(200) NOT NULL,
    department   VARCHAR2(100)
);

CREATE TABLE patient (
    patient_id     NUMBER PRIMARY KEY,
    gender         VARCHAR2(10) NOT NULL,
    phone_number   CHAR(10) NOT NULL UNIQUE,
    name           VARCHAR2(100) NOT NULL
);

CREATE TABLE consultation (
    consultation_id   NUMBER PRIMARY KEY,
    disease           VARCHAR2(150) NOT NULL
);

CREATE TABLE examination_patient (
    examination_id    NUMBER PRIMARY KEY,
    consultation_id   NUMBER NOT NULL UNIQUE,
    examination       VARCHAR2(300) NOT NULL,
    CONSTRAINT fk_exam_consultation
        FOREIGN KEY (consultation_id) REFERENCES consultation (consultation_id)
);

CREATE TABLE consultation_date (
    patient_id              NUMBER,
    consultation_id         NUMBER,
    doctor_id               NUMBER,
    date_of_consultation    DATE NOT NULL,
    CONSTRAINT pk_consultation_date
        PRIMARY KEY (patient_id, consultation_id, doctor_id),
    CONSTRAINT fk_consultation_date_patient
        FOREIGN KEY (patient_id) REFERENCES patient (patient_id),
    CONSTRAINT fk_consultation_date_consultation
        FOREIGN KEY (consultation_id) REFERENCES consultation (consultation_id),
    CONSTRAINT fk_consultation_date_doctor
        FOREIGN KEY (doctor_id) REFERENCES doctor (doctor_id)
);

CREATE TABLE determination (
    determination_id   VARCHAR2(600) PRIMARY KEY,
    health_rate        VARCHAR2(10) NOT NULL
);

CREATE TABLE monitoring_record (
    monitoring_id       NUMBER PRIMARY KEY,
    doctor_id           NUMBER NOT NULL,
    determination_id    VARCHAR2(600),
    CONSTRAINT fk_monitoring_doctor
        FOREIGN KEY (doctor_id) REFERENCES doctor (doctor_id),
    CONSTRAINT fk_monitoring_determination
        FOREIGN KEY (determination_id) REFERENCES determination (determination_id)
);

CREATE TABLE vital_signs (
    monitoring_id   NUMBER,
    patient_id      NUMBER,
    vital_signs     VARCHAR2(300) NOT NULL,
    CONSTRAINT pk_vital_signs
        PRIMARY KEY (monitoring_id, patient_id),
    CONSTRAINT fk_vital_signs_monitoring
        FOREIGN KEY (monitoring_id) REFERENCES monitoring_record (monitoring_id),
    CONSTRAINT fk_vital_signs_patient
        FOREIGN KEY (patient_id) REFERENCES patient (patient_id)
);

CREATE TABLE medicine (
    medicine_id      NUMBER PRIMARY KEY,
    medicine_name    VARCHAR2(40) NOT NULL,
    cost_medicine    NUMBER(5,2) NOT NULL
);

CREATE TABLE prescription (
    medicine_id        NUMBER,
    consultation_id    NUMBER,
    patient_id         NUMBER,
    dosage             VARCHAR2(50) NOT NULL,
    CONSTRAINT pk_prescription
        PRIMARY KEY (medicine_id, consultation_id, patient_id),
    CONSTRAINT fk_prescription_medicine
        FOREIGN KEY (medicine_id) REFERENCES medicine (medicine_id),
    CONSTRAINT fk_prescription_consultation
        FOREIGN KEY (consultation_id) REFERENCES consultation (consultation_id),
    CONSTRAINT fk_prescription_patient
        FOREIGN KEY (patient_id) REFERENCES patient (patient_id)
);