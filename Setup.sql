DROP TABLE IF EXISTS INTERESTS;
DROP TABLE IF EXISTS STUDENTS;

CREATE TABLE STUDENTS (
    ST_ID SERIAL PRIMARY KEY,
    ST_NAME VARCHAR(20),
    ST_LAST VARCHAR(20)
);

CREATE TABLE INTERESTS (
    STUDENT_ID INT,
    INTEREST VARCHAR(20)
);

INSERT INTO STUDENTS (ST_NAME, ST_LAST) VALUES
('Konul', 'Gurbanova'),
('Shahnur', 'Isgandarli'),
('Natavan', 'Mammadova');

INSERT INTO INTERESTS (STUDENT_ID, INTEREST) VALUES
(1, 'Tennis'),
(1, 'Literature'),
(2, 'Math'),
(2, 'Tennis'),
(3, 'Math'),
(3, 'Music'),
(2, 'Football'),
(1, 'Chemistry'),
(3, 'Chess');
