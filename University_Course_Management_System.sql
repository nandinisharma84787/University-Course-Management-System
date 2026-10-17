INSERT INTO public."Students"
("Student Id", "FirstName", "LastName", "Email", "BirthDate", "EnrollmentDate")
VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '2004-05-10', '2023-08-15'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '1999-05-25', '2023-08-01');


INSERT INTO public."Courses"
("CoursesID", "CoursesName", "DepartmentID", "Credits")
VALUES
(1, 'Introduction to SQL', 1, 3),
(2, 'Data Structures', 2, 4);


INSERT INTO public."Departments"
("DepartmentID", "DepartmentName")
VALUES
(1, 'Computer Science'),
(2, 'Mathematics');


INSERT INTO public."Instructors"
("InstructorID", "FirstName", "LastName", "Email", "DepartmentID")
VALUES
(1, 'Alice', 'Johnson', 'alice@example.com', 1),
(2, 'Bob', 'Lee', 'bob@example.com', 2);


INSERT INTO public."Enrollments"
("EnrollmentID", "StudentID", "CourseID", "EnrollmentDate")
VALUES
(1, 1, 1, '2023-08-15'),
(2, 2, 2, '2023-08-16');


--Question 1. Perform CRUD Operations on all tables.
-- 1. Students
-- CREATE
INSERT INTO public."Students"
("Student Id", "FirstName", "LastName", "Email", "BirthDate", "EnrollmentDate")
VALUES
(3, 'Alex', 'Brown', 'alex.brown@email.com', '2003-04-12', '2023-08-20');

-- READ
SELECT * FROM public."Students";

-- UPDATE
UPDATE public."Students"
SET "LastName" = 'Taylor'
WHERE "Student Id" = 3;

-- DELETE
DELETE FROM public."Students"
WHERE "Student Id" = 3;


-- 2. Departments
-- CREATE
INSERT INTO public."Departments" ("DepartmentID", "DepartmentName")
VALUES (3, 'Physics');

-- READ
SELECT * FROM public."Departments";

-- UPDATE
UPDATE public."Departments"
SET "DepartmentName" = 'Mathematics'
WHERE "DepartmentID" = 2;

-- DELETE
DELETE FROM public."Departments"
WHERE "DepartmentID" = 3;


-- 3. Courses
-- CREATE
INSERT INTO public."Courses"
("CoursesID", "CoursesName", "DepartmentID", "Credits")
VALUES (3, 'Database Management', 1, 4);

-- READ
SELECT * FROM public."Courses";

-- UPDATE
UPDATE public."Courses"
SET "CoursesName" = 'Advanced SQL'
WHERE "CoursesID" = 3;

-- DELETE
DELETE FROM public."Courses"
WHERE "CoursesID" = 3;


-- 4. Instructors
-- CREATE
INSERT INTO public."Instructors"
("InstructorID", "FirstName", "LastName", "Email", "DepartmentID")
VALUES (3, 'Alex', 'Taylor', 'alex.taylor@email.com', 1);

-- READ
SELECT * FROM public."Instructors";

-- UPDATE
UPDATE public."Instructors"
SET "FirstName" = 'Alex'
WHERE "InstructorID" = 3;

-- DELETE
DELETE FROM public."Instructors"
WHERE "InstructorID" = 3;


-- 5. Enrollments
-- CREATE
INSERT INTO public."Enrollments"
("EnrollmentID", "StudentID", "CourseID", "EnrollmentDate")
VALUES (3, 1, 1, '2023-08-20');

-- READ
SELECT * FROM public."Enrollments";

-- UPDATE
UPDATE public."Enrollments"
SET "EnrollmentDate" = '2023-08-21'
WHERE "EnrollmentID" = 3;

-- DELETE
DELETE FROM public."Enrollments"
WHERE "EnrollmentID" = 3;

---Explanation---

---CRUD operations are the four basic actions used to manage data in a database:
--Create: Adds a new record to a table using INSERT.
--Read: Displays records using SELECT.
--Update: Changes an existing record using UPDATE and a condition in WHERE.
--Delete: Removes a record using DELETE and a condition in WHERE.





--Question 2. Retrieve students who enrolled after 2022.


SELECT *
FROM public."Students"
WHERE "EnrollmentDate" >= '2023-01-01';
---Output:---

 Studentid | FirstName | LastName | Email                                               | DateOfBirth | EnrollmentDate | --------- | --------- | -------- | --------------------------------------------------- | ----------- | -------------- |
| 1         | John      | Doe      | [john.doe@email.com](mailto:john.doe@email.com)     | 2004-05-10  | 2023-08-15     |
| 2         | Jane      | Smith    | [jane.smith@email.com](mailto:jane.smith@email.com) | 1999-05-25  | 2023-08-01     |
| 3         | Alex      | Brown    | [alex.brown@email.com](mailto:alex.brown@email.com) | 2003-04-12  | 2023-08-20     |


---Explanation:---

--SELECT * – Retrieves all columns from the table.
--FROM public."Students" – Specifies the Students table.
--WHERE – Filters records based on a condition.
--"EnrollmentDate" >= '2023-01-01' – Retrieves students who enrolled on or
-- after January 1, 2023.

---Result:---
--Three student records were retrieved because all three students
-- enrolled in August 2023.

--Key Learning:---
--I learned how to filter records based on enrollment dates using the
--WHERE clause in PostgreSQL.




--Question 3. Retrieve courses offered by the Mathematics department with
--a limit of 5 courses.

SELECT *
FROM public."Courses"
WHERE "DepartmentID" = 2
LIMIT 5;


---Explanation:---

--SELECT *` – Retrieves all columns from the table.
--FROM public."Courses"` – Specifies the Courses table.
--WHERE` – Filters records based on a condition.
--"DepartmentID" = 2` – Retrieves courses belonging to the Mathematics department.
--LIMIT 5` – Restricts the output to a maximum of 5 records.

---Result:--- 

--Retrieves up to 5 courses offered by the Mathematics department.

---Key Learning:---
--I learned how to filter records using `WHERE` and limit the number of results using `LIMIT` in PostgreSQL.




--Question 4. Get the number of students enrolled in each course,
-- filtering for courses with more than 5 students.
SELECT
    c."CoursesName",
    COUNT(e."StudentID") AS "TotalStudents"
FROM public."Courses" AS c
INNER JOIN public."Enrollments" AS e
    ON c."CoursesID" = e."CourseID"
GROUP BY c."CoursesID", c."CoursesName"
HAVING COUNT(e."StudentID") > 5;

---Output---
--No rows returned.

--COUNT(e."StudentID") – Counts student enrollments for each course.

--INNER JOIN – Combines the Courses and Enrollments tables.

--GROUP BY – Groups enrollments by course.

--HAVING COUNT(e."StudentID") > 5 – Displays only courses with more than
-- 5 student enrollments.

---Result:---

--No courses were returned because the available data contains only 1 
--and 2 enrollments for the respective courses.

--Key Learning:---
--I learned how to use COUNT(), INNER JOIN, GROUP BY, and HAVING to 
--count and filter grouped data in PostgreSQL.




--Question 5. Find students who are enrolled in both Introduction to SQL and Data Structures.
SELECT s.*
FROM public."Students" AS s
WHERE s."Student Id" IN (
    SELECT e."StudentID"
    FROM public."Enrollments" AS e
    INNER JOIN public."Courses" AS c
        ON e."CourseID" = c."CoursesID"
    WHERE c."CoursesName" IN (
        'Introduction to SQL',
        'Data Structures'
    )
    GROUP BY e."StudentID"
    HAVING COUNT(DISTINCT c."CoursesName") = 2);

	---Output: No rows returned.---

---Explanation:--- The query joins the Enrollments and Courses tables to identify
--students enrolled in the specified courses. It groups records by
--student ID and uses HAVING COUNT(DISTINCT ...) = 2 to select students enrolled 
--in both courses.

---Result:---

--No student was found enrolled in both courses based on the current enrollment 
--records.

---Key Learning:---
--Practiced INNER JOIN, subqueries, GROUP BY, HAVING, and COUNT(DISTINCT).|



--Question 6. Find students who are either enrolled in Introduction to SQL or Data Structures.

SELECT DISTINCT s.*
FROM public."Students" AS s
INNER JOIN public."Enrollments" AS e
    ON s."Student Id" = e."StudentID"
INNER JOIN public."Courses" AS c
    ON e."CourseID" = c."CoursesID"
WHERE c."CoursesName" IN (
    'Introduction to SQL',
    'Data Structures');

---OUTPUT---
1	"John"	"Doe"	"john.doe@email.com"	"2004-05-10"	"2023-08-15"
2	"Jane"	"Smith"	"jane.smith@email.com"	"1999-05-25"	"2023-08-01"

---Successfully retrieved students enrolled in either Introduction to SQL 
--Data Structures without duplicate records.

--- Explanation---
---INNER JOIN` — Connects the Students, Enrollments, and Courses tables.
---WHERE ... IN (...)` — Selects students enrolled in either of the specified courses.
---DISTINCT` — Prevents duplicate student records from appearing in the output.

---Key Learning:---
--Learned how to use `INNER JOIN`, `WHERE IN`, and `DISTINCT` to retrieve 
--students enrolled in either of the specified courses while avoiding duplicate records.



--Question 7. Calculate the average number of credits for all courses.

SELECT AVG("Credits") AS "AverageCredits"
FROM public."Courses";

---OUTPUT---

3.5000000000000000

---RESULT---

---Successfully calculated the average number of credits for all courses. 
--The average is 3.5 credits.

---Key Learning:---
--Learned how to use the `AVG()` aggregate function to calculate
-- the average credits of all courses.



--Question 8. Find the maximum salary of instructors in the Computer Science department.
SELECT MAX(i."Salary") AS "MaximumSalary"
FROM public."Instructors" AS i
INNER JOIN public."Departments" AS d
    ON i."DepartmentID" = d."DepartmentID"
WHERE d."DepartmentName" = 'Computer Science';

 --- Output Table
 
| MaximumSalary |
| ------------- |
| 70000.00      |

---Explanation---
--MAX(i."Salary") — Finds the highest salary among instructors.
--INNER JOIN — Connects the Instructors table with the Departments table.
--ON i."DepartmentID" = d."DepartmentID" — Matches instructors with their
-- respective departments.
--WHERE d."DepartmentName" = 'Computer Science' — Filters the records to include
-- only instructors from the Computer Science department.

---Result:---

--Successfully calculated the maximum salary of instructors in the Computer Science
-- department, which is 70000.00.

---Key Learning:---

--Learned how to use the MAX() aggregate function with INNER JOIN and WHERE to 
--find the highest salary in a specific department.



--Question 9. Count the number of students enrolled in each department.

SELECT
    d."DepartmentID",
    d."DepartmentName",
    COUNT(DISTINCT e."StudentID") AS "StudentCount"
FROM public."Departments" d
LEFT JOIN public."Courses" c
    ON c."DepartmentID" = d."DepartmentID"
LEFT JOIN public."Enrollments" e
    ON e."CourseID" = c."CoursesID"
GROUP BY d."DepartmentID", d."DepartmentName"
ORDER BY d."DepartmentID";

--Output:--

| DepartmentID | DepartmentName | StudentCount |
|---:|---|---:|
| 1 | Computer Science | 1 |
| 2 | Mathematics | 1 |
| 3 | Physics | 0 |

---Explanation---

-- COUNT(DISTINCT e."StudentID") — Counts each student once per department.
-- FROM public."Departments" d — Starts with the Departments table.
-- LEFT JOIN public."Courses" c — Includes courses offered by each department.
-- ON c."DepartmentID" = d."DepartmentID" — Matches each course to its department.
-- LEFT JOIN public."Enrollments" e — Includes student enrollments in those courses.
-- ON e."CourseID" = c."CoursesID" — Matches enrollments to their courses.
-- GROUP BY d."DepartmentID", d."DepartmentName" — Calculates a separate count
-- for each department.
-- ORDER BY d."DepartmentID" — Displays departments in DepartmentID order.
-- LEFT JOIN — Keeps departments with no enrolled students; their count is 0.

---RESULT---
--The Computer Science department has 1 enrolled student, the Mathematics department
-- has 1 enrolled student, and the Physics department has **0 enrolled students.

---Key Learning:---

--I learned how to use `JOIN`, `COUNT(DISTINCT ...)`, and `GROUP BY` to 
--count unique students enrolled in courses for each department. Using `LEFT JOIN` also 
--includes departments with no enrolled students, showing their count as zero.


--Question 10. INNER JOIN: Retrieve students and their corresponding courses.
SELECT
    s."Student Id",
    s."FirstName",
    s."LastName",
    c."CoursesID",
    c."CoursesName"
FROM public."Students" s
INNER JOIN public."Enrollments" e
    ON s."Student Id" = e."StudentID"
INNER JOIN public."Courses" c
    ON e."CourseID" = c."CoursesID"
ORDER BY s."Student Id";

----Output:---
| StudentID | FirstName | LastName | CourseID | CourseName |

| 1 | John | Doe | 1 | Introduction to_SQL |
| 2 | Jane | Smith | 2 | DataStructures |

---Result:---

--John Doe is enrolled in Introduction to SQL, and Jane Smith is enrolled in Data Structures.
-- John’s row appears twice in the query result.

---Explanation:---

--The query joins students with their enrollments, then joins those enrollments with courses.
-- Because it uses INNER JOIN, it returns only students who have matching enrollment and course records. The repeated John row means the 
--matching data produces two rows for that student and course.
---Key Learning:---

--I learned how to use INNER JOIN to combine related records from multiple tables and
-- display students with their courses.


 
--Question 11. LEFT JOIN: Retrieve all students and their corresponding courses, if any.

SELECT
    s."Student Id",
    s."FirstName",
    s."LastName",
    c."CoursesID",
    c."CoursesName"
FROM public."Students" s
LEFT JOIN public."Enrollments" e
    ON s."Student Id" = e."StudentID"
LEFT JOIN public."Courses" c
    ON e."CourseID" = c."CoursesID"
ORDER BY s."Student Id";

| StudentID | FirstName | LastName | CourseID | CourseName |
|---:|---|---|---:|---|
| 1 | John | Doe | 1 | Introduction toSQL |
| 1 | John | Doe | 1 | Introduction toSQL |
| 2 | Jane | Smith | 2 | DataStructures |
| 3 | Alex | Brown | --NULL | NULL |

---Result:---

--All three students are labelled `Junior` because their enrollment dates are less than
-- four years before October 16, 2026.

---Explanation:---

--The `CASE` expression checks whether each enrollment date is earlier than the date four 
--years before today. If it is, the student is labelled `Senior`; otherwise, the student is 
--labelled `Junior`.

---Key Learning:---
--I learned how to use `CASE` with a date condition to assign categories to records.



--Question 12. Subquery: Find students enrolled in courses that have more than 10 students.
SELECT
    s."Student Id",
    s."FirstName",
    s."LastName"
FROM public."Students" s
WHERE s."Student Id" IN (
    SELECT e."StudentID"
    FROM public."Enrollments" e
    WHERE e."CourseID" IN (
        SELECT "CourseID"
        FROM public."Enrollments"
        GROUP BY "CourseID"
        HAVING COUNT(DISTINCT "StudentID") > 10
    )
)
ORDER BY s."Student Id";

---OUTPUT---

--No rows returned


---Result:--- 

--No students are returned because the three students shown in the current data 
--cannot make up a course with more than 10 distinct students.


---Explanation:---

--The inner query looks for courses with more than 10 distinct enrolled students. 
--The outer query returns students enrolled in those courses.


---Key Learning:--- 
--I learned how to use subqueries and HAVING to filter groups based on an aggregate count.



--Question 13. Extract the year from the EnrollmentDate of students.


SELECT
    "Student Id",
    "FirstName",
    "LastName",
    EXTRACT(YEAR FROM "EnrollmentDate") AS "EnrollmentYear"
FROM public."Students"
ORDER BY "Student Id";


----OUTPUT---

| StudentID | FirstName | LastName | EnrollmentYear |
|---:|---|---|---:|
| 1 | John | Doe | 2023 |
| 2 | Jane | Smith | 2023 |
| 3 | Alex | Brown | 2023 |

---Result:---

--All three students enrolled in 2023.


---Explanation:--- EXTRACT(YEAR FROM "EnrollmentDate") returns the year part of each
-- student’s enrollment date.


---Key Learning:--- I learned how to extract a specific part of a date using EXTRACT.



--Question 14. Concatenate the instructor's first and last name.

SELECT
    "InstructorID",
    CONCAT("FirstName", ' ', "LastName") AS "InstructorName"
FROM public."Instructors"
ORDER BY "InstructorID";

---Output:---

--The result contains each instructor’s ID and full name. The exact rows depend on 
--the records in your Instructors table.

---Result:---

--Each instructor’s first and last name appear together as one full name.

---Explanation:---

--CONCAT combines the first name, a space, and the last name into one value.

---Key Learning:--- I learned how to combine text from multiple columns using CONCAT.




--Question 15. Calculate the running total of students enrolled in courses.

SELECT
    "EnrollmentID",
    "StudentID",
    "CourseID",
    "EnrollmentDate",
    COUNT(*) OVER (
        ORDER BY "EnrollmentDate", "EnrollmentID"
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS "RunningTotal"
FROM public."Enrollments"
ORDER BY "EnrollmentDate", "EnrollmentID";

---Output:---

--The result contains enrollment ID, student ID, course ID, enrollment date, and running total.
-- The exact rows depend on your Enrollments table.

---Result:---

--The running total increases as each enrollment record is counted in date order.

---Explanation:---

--COUNT(*) OVER (...) counts enrollment rows cumulatively while keeping each enrollment visible.
-- The date and ID determine the order.

---Key Learning:---

--I learned how to use a window function to calculate a running total.


--Question 16. Label students as 'Senior' or 'Junior' based on their year of enrollment. 
--(If the enrollment date is more than 4 years from the current date, 
--put the label 'Senior' otherwise 'Junior')

SELECT
    "Student Id",
    "FirstName",
    "LastName",
    "EnrollmentDate",
    CASE
        WHEN "EnrollmentDate" < CURRENT_DATE - INTERVAL '4 years'
            THEN 'Senior'
        ELSE 'Junior'
    END AS "StudentLevel"
FROM public."Students"
ORDER BY "Student Id";


---Output:---

| StudentID | FirstName | LastName | EnrollmentDate | StudentLevel |
|---:|---|---|---|---|
| 1 | John | Doe | 2023-08-15 | Junior |
| 2 | Jane | Smith | 2023-08-01 | Junior |
| 3 | Alex | Brown | 2023-08-20 | Junior |

---Result:---

--All three students are labelled `Junior` because their enrollment dates are less than four years before October 16, 2026.

---Explanation:---

--The `CASE` expression checks whether each enrollment date is earlier than the date four years before today. If it is, the student is labelled `Senior`; otherwise, the student is labelled `Junior`.

---Key Learning:---

--I learned how to use `CASE` with a date condition to assign categories to records.



