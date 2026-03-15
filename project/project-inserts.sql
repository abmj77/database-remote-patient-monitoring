-- Goal: Insert sample data into the remote patient monitoring database.
-- This file populates the project tables with clean and consistent records.

INSERT INTO doctor VALUES
    (1, 'Ahmad Khaled', 'Cardiologist', 'ahmadkh@gmail.com', 'Cardiology Department');

INSERT INTO doctor VALUES
    (2, 'Saleh Khaled', 'Ophthalmologist', 'saleh3kh@gmail.com', 'Ophthalmology Department');

INSERT INTO doctor VALUES
    (3, 'Talal Hamada', 'Orthopedist', 'tlal4h@gmail.com', 'Orthopedics Department');

INSERT INTO doctor VALUES
    (4, 'Wleed Baeshin', 'General Practitioner', 'wleed@gmail.com', 'General Medicine Department');

INSERT INTO doctor VALUES
    (5, 'Abeer Alrogy', 'Internist', 'abeer56@gmail.com', 'Internal Medicine Department');


INSERT INTO patient VALUES
    (1, 'Female', '0512345678', 'Asala Albogamy');

INSERT INTO patient VALUES
    (2, 'Male', '0523456789', 'Mohammad Alwaqdany');

INSERT INTO patient VALUES
    (3, 'Male', '0534567890', 'Aseel Alshihry');

INSERT INTO patient VALUES
    (4, 'Female', '0545678901', 'Wedad Alsheek');

INSERT INTO patient VALUES
    (5, 'Male', '0556789012', 'Ahmed Alyamy');


INSERT INTO consultation VALUES (1001, 'Influenza');
INSERT INTO consultation VALUES (1002, 'Cataract');
INSERT INTO consultation VALUES (1003, 'Coronary Artery Disease');
INSERT INTO consultation VALUES (1004, 'Hypertension');
INSERT INTO consultation VALUES (1005, 'Type 2 Diabetes');


INSERT INTO examination_patient VALUES
    (10, 1001, 'Administered annual flu vaccine and prescribed antiviral medication for Influenza');

INSERT INTO examination_patient VALUES
    (11, 1002, 'Performed phacoemulsification with intraocular lens implant for Cataract removal');

INSERT INTO examination_patient VALUES
    (12, 1003, 'Conducted cardiac catheterization to assess severity of Coronary Artery Disease');

INSERT INTO examination_patient VALUES
    (13, 1004, 'Measured blood pressure and adjusted antihypertensive medication for Hypertension management');

INSERT INTO examination_patient VALUES
    (14, 1005, 'Reviewed blood glucose records and optimized insulin therapy for Type 2 Diabetes');


INSERT INTO consultation_date VALUES
    (1, 1001, 4, TO_DATE('2023-11-10', 'YYYY-MM-DD'));

INSERT INTO consultation_date VALUES
    (2, 1002, 2, TO_DATE('2023-11-12', 'YYYY-MM-DD'));

INSERT INTO consultation_date VALUES
    (3, 1003, 1, TO_DATE('2023-11-16', 'YYYY-MM-DD'));

INSERT INTO consultation_date VALUES
    (4, 1004, 5, TO_DATE('2023-11-08', 'YYYY-MM-DD'));

INSERT INTO consultation_date VALUES
    (4, 1005, 5, TO_DATE('2023-11-15', 'YYYY-MM-DD'));


INSERT INTO determination VALUES
    ('Recommended rest, fluids, and over-the-counter fever reducers. Consider antiviral medication if within the first 48 hours of symptom onset.', '70%');

INSERT INTO determination VALUES
    ('Make sure you do not drive at night.', '40%');

INSERT INTO determination VALUES
    ('Advised on lifestyle changes, including diet, exercise, and smoking cessation.', '55%');

INSERT INTO determination VALUES
    ('Importance of lifestyle modifications such as reducing salt intake and regular physical activity. Scheduled follow-up to monitor blood pressure and adjust medications as necessary.', '65%');

INSERT INTO determination VALUES
    ('Importance of dietary management, regular blood glucose monitoring, and physical activity.', '58%');


INSERT INTO monitoring_record VALUES
    (1, 4, 'Recommended rest, fluids, and over-the-counter fever reducers. Consider antiviral medication if within the first 48 hours of symptom onset.');

INSERT INTO monitoring_record VALUES
    (2, 2, 'Make sure you do not drive at night.');

INSERT INTO monitoring_record VALUES
    (3, 1, 'Advised on lifestyle changes, including diet, exercise, and smoking cessation.');

INSERT INTO monitoring_record VALUES
    (4, 5, 'Importance of lifestyle modifications such as reducing salt intake and regular physical activity. Scheduled follow-up to monitor blood pressure and adjust medications as necessary.');

INSERT INTO monitoring_record VALUES
    (5, 5, 'Importance of dietary management, regular blood glucose monitoring, and physical activity.');


INSERT INTO vital_signs VALUES
    (1, 1, 'Pulse Rate: 100 bpm, Respiration Rate: 20 breaths/min, Blood Pressure: 120/80 mmHg, Blood Oxygen: 97%, Temperature: 38.5 C');

INSERT INTO vital_signs VALUES
    (2, 2, 'Pulse Rate: 70 bpm, Respiration Rate: 16 breaths/min, Blood Pressure: 118/78 mmHg, Blood Oxygen: 99%, Temperature: 36.6 C');

INSERT INTO vital_signs VALUES
    (3, 3, 'Pulse Rate: 75 bpm, Respiration Rate: 18 breaths/min, Blood Pressure: 130/85 mmHg, Blood Oxygen: 95%, Weight: 85 kg');

INSERT INTO vital_signs VALUES
    (4, 4, 'Pulse Rate: 80 bpm, Respiration Rate: 19 breaths/min, Blood Pressure: 150/90 mmHg, Blood Oxygen: 98%, Weight: 90 kg');

INSERT INTO vital_signs VALUES
    (5, 4, 'Pulse Rate: 85 bpm, Respiration Rate: 20 breaths/min, Blood Pressure: 135/88 mmHg, Blood Oxygen: 96%, Blood Glucose Level: 180 mg/dL');


INSERT INTO medicine VALUES
    (1, 'Oseltamivir', 327.78);

INSERT INTO medicine VALUES
    (2, 'Prednisolone Acetate', 150.00);

INSERT INTO medicine VALUES
    (3, 'Atorvastatin', 41.25);

INSERT INTO medicine VALUES
    (4, 'Lisinopril', 30.41);

INSERT INTO medicine VALUES
    (5, 'Insulin Glargine', 483.75);


INSERT INTO prescription VALUES
    (1, 1001, 1, 'Take one tablet every 6 hours');

INSERT INTO prescription VALUES
    (2, 1002, 2, 'Use one drop in the affected eye twice a day');

INSERT INTO prescription VALUES
    (3, 1003, 3, 'Take one tablet daily');

INSERT INTO prescription VALUES
    (4, 1004, 4, 'One tablet daily in the morning');

INSERT INTO prescription VALUES
    (5, 1005, 4, 'Inject 10 units subcutaneously before meals');