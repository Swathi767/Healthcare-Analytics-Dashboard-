create database Healthcare;

USE Healthcare;

drop database healthcare;

select * from patients;
select * from billing;
select * from doctor;
select * from treatments;
select * from visit;

-- 1. Data Count Validation
SELECT COUNT(*) FROM Patients;
SELECT COUNT(*) FROM Visit;
SELECT COUNT(*) FROM Treatments;
SELECT COUNT(*) FROM Labtest;

-- 2. Data Completeness Check
SELECT * 
FROM Patients 
WHERE First_Name IS NULL 
OR LastName IS NULL;

SELECT * FROM Visit WHERE Visit_Type IS NULL OR Visit_Date IS NULL;

SELECT * FROM Treatments WHERE Treatment_Name IS NULL OR Status IS NULL;

SELECT * FROM Labtest WHERE Test_Name IS NULL OR test_Result IS NULL;

-- 3. Data Consistency Check
SELECT v.visit__ID, v.Patient_ID, p.Patient_ID
FROM Visit v
LEFT JOIN Patients p ON v.Patient_ID = p.Patient_ID
WHERE p.Patient_ID IS NULL;  

show columns from visit;

SELECT t.Treatment_ID, t.Visit_ID, v.Visit_ID
FROM Treatments t
LEFT JOIN Visit v ON t.Visit_ID = v.Visit_ID
WHERE v.Visit_ID IS NULL;  

-- 4. Duplicate Records Check
SELECT Patient_ID, COUNT(*)
FROM Patients
GROUP BY Patient_ID
HAVING COUNT(*) > 1;

SELECT Visit_ID, COUNT(*)
FROM Visit
GROUP BY Visit_ID
HAVING COUNT(*) > 1;

-- 5. Dashboard Aggregation Check
SELECT SUM(TreatmentCost) FROM Treatments;  -- Compare with Power BI total cost
SELECT AVG(Age) FROM Patients;  -- Compare with Power BI average age

-- 6. Performance Testing (Query Execution Time)
EXPLAIN ANALYZE
SELECT * FROM Visit WHERE Visit_Date BETWEEN '2023-01-01' AND '2023-12-31';







