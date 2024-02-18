ALTER TABLE STUDENTS RENAME COLUMN ST_ID TO STUDENT_ID;
ALTER TABLE STUDENTS ALTER COLUMN ST_NAME TYPE VARCHAR(30);
ALTER TABLE STUDENTS ALTER COLUMN ST_LAST TYPE VARCHAR(30);
ALTER TABLE INTERESTS RENAME COLUMN INTEREST TO INTERESTS;

ALTER TABLE INTERESTS ALTER COLUMN INTERESTS TYPE VARCHAR(255)[] USING ARRAY[INTERESTS];

UPDATE INTERESTS AS i
SET INTERESTS = subquery.INTERESTS
FROM (
	SELECT s.STUDENT_ID, ARRAY_AGG(i.INTERESTS) AS interests
	FROM STUDENTS s
	LEFT JOIN INTERESTS i ON s.STUDENT_ID = i.STUDENT_ID
	GROUP BY s.STUDENT_ID
) AS subquery
WHERE i.STUDENT_ID = subquery.STUDENT_ID;

DELETE FROM INTERESTS WHERE ctid NOT IN (
	SELECT MIN(ctid) FROM INTERESTS GROUP BY STUDENT_ID, INTERESTS
);
