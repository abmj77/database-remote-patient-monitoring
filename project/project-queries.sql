-- Goal: Run sample queries on the remote patient monitoring database.
-- This file includes filtering, grouping, joins, and subqueries.

SELECT
    name,
    doctor_id AS id
FROM doctor
WHERE doctor_id > 2
ORDER BY doctor_id DESC;

SELECT
    name,
    COUNT(name) AS name_count,
    MIN(patient_id) AS min_patient_id
FROM patient
GROUP BY name
HAVING MAX(patient_id) > 2;

SELECT
    name,
    doctor_id
FROM doctor
WHERE doctor_id > (
    SELECT MIN(patient_id)
    FROM patient
);

SELECT
    p.name
FROM patient p
INNER JOIN consultation_date c
    ON p.patient_id = c.patient_id
WHERE p.patient_id > 2;