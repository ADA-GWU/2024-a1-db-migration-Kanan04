Instructions:
1. If you don't have a PostgreSQL => go to https://www.postgresql.org/download/ and download it
2. Create/login a Postgres server in pgAdmin 4
3. If there are no tables indicated in the task => run the Setup.sql file in the server
4. To implement migration => run Migration.sql on the server
5. To implement rollback => run Rollback.sql on the server


Migration steps:
1. Change ST_ID to STUDENT_ID using ALTER statement
2. Change ST_NAME and ST_LAST type to VARCHAR(30) using ALTER statement
3. Change the INTEREST column to INTERESTS using the ALTER statement
4. Group the interests in the lists by the student ids:
    1. Change INTERESTS column type to array VARCHAR(255)[] using ALTER statement and keeping the existing value as the first element of the array by USING ARRAY[INTERESTS]
    2. Select interests by student ids
    3. Put those grouped interests as arrays in the INTERESTS table by student ids
    4. Since we had/may have repeating student ids in the INTERESTS table, we have to delete all the duplicates:
        1. Group the rows from the INTERESTS table in tuples by STUDENT_ID and INTERESTS columns, meaning, group all the duplicates
        2. Select the first elements in the duplicate tuples
        3. Delete all other elements from the tuples


Rollback steps:
1. Change STUDENT_ID to ST_ID using ALTER statement
2. Change ST_NAME and ST_LAST type to VARCHAR(20) using ALTER statement
3. Change the INTERESTS column to INTEREST using the ALTER statement
4. Create a temporary table INTERESTS_TEMP
5. Separate all the elements of the arrays using the UNNEST function
6. Insert all the separated elements in a temporary table
7. Drop the original table (INTERESTS) and rename the temporary table (INTERESTS_TEMP) to INTERESTS
