CREATE TABLE DATA (
	ENCOUNTER_ID INT PRIMARY KEY,
	RACE VARCHAR(200),
	GENDER VARCHAR(50),
	ADMISSION_TYPE_ID INT,
	DISCHARGE_DISPOSITION_ID INT,
	ADMISSION_SOURCE_ID INT,
	TIME_IN_HOSPITAL INT,
	NUM_LAB_PROCEDURES INT,
	NUM_PROCEDURES INT,
	NUM_MEDICATIONS INT,
	NUM_OUTPATIENT INT,
	NUM_EMERGENCY INT,
	NUMBER_INPATIENT INT,
	NUMBER_DIAGNOSES VARCHAR(10),
	INSULIN VARCHAR(50),
	READMITTED VARCHAR(20),
	READMITTED_BINARY BOOLEAN,
	DISCHARGE_DESC VARCHAR(300),
	ADMISSION_TYPE_DESC VARCHAR(100),
	ADMISSION_SOURCE_DESC VARCHAR(300),
	AGE_GROUP VARCHAR(10),
	DIAGNOSIS_GROUP VARCHAR(10)
);

SELECT
	*
FROM
	DATA;

TRUNCATE TABLE DATA;

ALTER TABLE DATA
ALTER COLUMN NUMBER_DIAGNOSES TYPE INTEGER USING NUMBER_DIAGNOSES::INTEGER;
Select readmitted_binary,count(*) from data
group by readmitted_binary;

ALTER TABLE DATA
RENAME DIAGNOSIS_GROUP TO DIAGNOSES_GROUP;

--Replacing Oct-20 with 10-20
UPDATE DATA
SET AGE_GROUP='10-20'
WHERE AGE_GROUP='Oct-20';

SELECT * FROM DATA
WHERE AGE_GROUP='10-20';

--Emergency Visit Group
ALTER TABLE DATA
ADD COLUMN Emergency_Visit_Group CHAR(20);

UPDATE DATA
SET Emergency_Visit_Group=
CASE
    WHEN NUM_EMERGENCY<=2 THEN '0-2'
	WHEN NUM_EMERGENCY<=5 THEN '3-5'
	WHEN NUM_EMERGENCY<=10 THEN '6-10'
	ELSE '11+'
END;
	


--1)Total Patients
SELECT COUNT(ENCOUNTER_ID) as Total_Patients FROM DATA;

--2)Overall readmission rate
SELECT
	COUNT(*) AS TOTAL_PATIENTS,
	SUM(READMITTED_BINARY::INT) AS READMITTED,
	ROUND(SUM(READMITTED_BINARY::INT) * 100 / COUNT(*), 2) AS TOTAL_READMISSION_RATE
FROM
	DATA;

--3)Readmission Rate by age
SELECT
	AGE_GROUP,
	COUNT(*) AS TOTAL_PATIENTS,
	SUM(READMITTED_BINARY::INT) AS READMITTED,
	ROUND(SUM(READMITTED_BINARY::INT) * 100.0 / COUNT(*), 3) AS READMISSION_RATE
FROM
	DATA
GROUP BY
	AGE_GROUP
ORDER BY
	AGE_GROUP ASC;

--4)Readmission by Gender
SELECT
	GENDER,
	COUNT(*) AS TOTAL_PATIENTS,
	SUM(READMITTED_BINARY::INT) AS READMITTED,
	ROUND(SUM(READMITTED_BINARY::INT) * 100.0 / COUNT(*), 3) AS READMISSION_RATE
FROM
	DATA
GROUP BY
	GENDER
ORDER BY
	GENDER ASC;

--5)Number of Inpatient Readmitted
SELECT
	COUNT(*) AS TOTAL_INPATIENT_PATIENTS,
	SUM(READMITTED_BINARY::INT) AS READMITTED_INPATIENT_PATIENTS,
	ROUND(
		SUM(READMITTED_BINARY::INT) * 100.00 / COUNT(*),
		2
	) AS READMISSION_RATE
FROM
	DATA
WHERE
	NUMBER_INPATIENT > 0;

--6)Length of Stay Impact on Readmission
SELECT
	TIME_IN_HOSPITAL,
	COUNT(*) AS TOTAL_PATIENTS,
	SUM(READMITTED_BINARY::INT) AS READMITTED,
	ROUND(
		SUM(READMITTED_BINARY::INT) * 100.00 / COUNT(*),
		2
	) AS READMISSION_RATE
FROM
	DATA
GROUP BY
	TIME_IN_HOSPITAL
ORDER BY
	TIME_IN_HOSPITAL ASC;

--7)Average length of stay
SELECT
    readmitted_binary,
    ROUND(AVG(time_in_hospital), 2) AS avg_length_of_stay
FROM data
GROUP BY readmitted_binary;

--8)Readmission by Number of Procedures
SELECT
	NUM_PROCEDURES,
	COUNT(*) AS TOTAL_PATIENTS,
	SUM(READMITTED_BINARY::INT) AS READMITTED,
	ROUND(
		SUM(READMITTED_BINARY::INT) * 100.00 / COUNT(*),
		2
	) AS READMISSION_RATE
FROM
	DATA
GROUP BY
	NUM_PROCEDURES
ORDER BY
	NUM_PROCEDURES ASC;

--9)Readmission by Number of Diagnoses
SELECT
	NUMBER_DIAGNOSES,
	COUNT(*) AS TOTAL_PATIENTS,
	SUM(READMITTED_BINARY::INT) AS READMITTED,
	ROUND(
		SUM(READMITTED_BINARY::INT) * 100.00 / COUNT(*),
		2
	) AS READMISSION_RATE
FROM
	DATA
GROUP BY
	NUMBER_DIAGNOSES
ORDER BY
	NUMBER_DIAGNOSES DESC;

--10)Emergency visits impact
SELECT num_emergency,count(*) as Total_Patient,sum(readmitted_binary::int) as Readmitted,
Round(sum(readmitted_binary::int)*100.00/count(*),2) as Readmission_Rate
from data
group by num_emergency
order by num_emergency asc;

--11)Risk Factor
ALTER TABLE DATA
ADD COLUMN risk VARCHAR(10);

UPDATE DATA
SET
	risk = CASE
		WHEN NUM_EMERGENCY >= 10
		OR TIME_IN_HOSPITAL > 7 THEN 'High'
		WHEN NUM_EMERGENCY >= 5
		OR TIME_IN_HOSPITAL > 4 THEN 'Medium'
		ELSE 'Low'
	END;
--12)high risk percentage
SELECT
	ROUND(
		COUNT(*) * 100.0 / (
			SELECT
				COUNT(*)
			FROM
				DATA
		),
		2
	) AS HIGH_RISK_PERCENTAGE
FROM
	DATA
WHERE
	risk = 'High';
	

--13)Cost
ALTER TABLE DATA
ADD COLUMN COST NUMERIC;

UPDATE data
SET cost = time_in_hospital * 3000;

--14)Emergency Cost
ALTER TABLE data
ADD COLUMN Emergency_Cost NUMERIC;

UPDATE data
SET Emergency_cost =
CASE
    WHEN num_emergency <= 2 THEN 0
    WHEN num_emergency <= 5 THEN cost * 0.2
    WHEN num_emergency <= 10 THEN cost * 0.4
    ELSE cost * 0.6
END;

--15)Readmission Cost
ALTER TABLE data
ADD COLUMN Readmission_Cost NUMERIC;

UPDATE DATA
SET Readmission_Cost =
    CASE
        WHEN readmitted = '<30'
        THEN
            cost
            +
            CASE
                WHEN num_emergency <= 2 THEN 0
                WHEN num_emergency <= 5 THEN cost * 0.2
                WHEN num_emergency <= 10 THEN cost * 0.4
                WHEN num_emergency > 10 THEN cost * 0.6
                ELSE 0
            END
        ELSE 0
    END;

--16)Excess length of Stay Cost
ALTER TABLE DATA
ADD COLUMN Excess_LOS_Cost NUMERIC;

UPDATE Data
SET Excess_LOS_Cost =
    CASE
        WHEN time_in_hospital > 5
        THEN (time_in_hospital - 5) * 3000
        ELSE 0
    END;

--17)Cost Leakage
ALTER TABLE DATA
ADD COLUMN Cost_Leakage NUMERIC;

UPDATE DATA
SET Cost_Leakage=
Readmission_Cost
+ Emergency_Cost
+ Excess_LOS_Cost;

--18)Total cost Leakage
SELECT SUM(Readmission_Cost
+ Emergency_Cost
+ Excess_LOS_Cost) AS Total_Cost_Leakage FROM DATA;

--19)Risk Level distribution
SELECT
    risk,
    COUNT(*) AS total_patients,

    ROUND(
        100.0 * COUNT(*) / SUM(COUNT(*)) OVER (),
        2
    ) AS percentage_share

FROM data
GROUP BY risk
ORDER BY total_patients DESC;

--20)Cost Leakage by Emergency Visits
SELECT
    Emergency_visit_group,

    COUNT(*) AS total_patients,

    SUM(COALESCE(Cost_Leakage,0)) AS total_cost_leakage,

    ROUND(AVG(COALESCE(Cost_Leakage,0)), 2) AS avg_cost_leakage

FROM data
GROUP BY emergency_visit_group
ORDER BY emergency_visit_group;

--21)Readmission by  total number of diagnoses
SELECT
    diagnoses_group,

    COUNT(*) AS total_patients,

    SUM(
        CASE
            WHEN readmitted = '<30' THEN 1
            ELSE 0
        END
    ) AS readmitted_count,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN readmitted = '<30' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS readmission_percentage

FROM data
GROUP BY diagnoses_group
ORDER BY diagnoses_group;


--22)Emergency Visits vs Readmission Risk
SELECT
    emergency_visit_group,
    COUNT(*) AS total_patients,
    SUM(
        CASE
            WHEN readmitted = '<30' THEN 1
            ELSE 0
        END
    ) AS readmitted_patients,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN readmitted = '<30' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS readmission_percentage

FROM data
GROUP BY emergency_visit_group
ORDER BY emergency_visit_group;
