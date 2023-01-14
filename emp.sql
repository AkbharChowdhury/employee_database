/*

References:
mysql stored procedures
https://www.youtube.com/watch?v=jVx7SYouZKk

*/

-- 1. Retrieve employee number, NI number, and department number for all employees.
SELECT `EmpNo`, `NINo`, `DeptNo` FROM employee;

-- 2. Retrieve the full names of all employees.
SELECT
    CONCAT(`Firstname`, ' ', `Surname`) AS full_name
FROM
    employee;
-- 3. Retrieve a list of all the distinct employee surnames.
SELECT DISTINCT Surname FROM employee;
-- 4. Retrieve NI numbers for all employees called Smith.
SELECT NINo FROM employee WHERE Surname = 'Smith';
-- 5. Retrieve the NI of employees who do not work in department D2.
SELECT NINo FROM employee WHERE DeptNo !='D2';
-- 6. Retrieve details of employees whose surnames start with the letters Sm.
SELECT * FROM employee WHERE Surname LIKE  'Sm%';
-- 7. Retrieve for each employee their names and their monthly salary.
-- [Assume that the Salary field is the Annual Salary]

SELECT
    Firstname,
    Surname,
    pounds(ROUND(Salary / 12, 2)) monthly_salary
FROM
    employee;

-- 8. Retrieve the average employee salary, the salary of the lowest paid
-- employee, and the salary of the highest paid employee.
-- SELECT
--     AVG(Salary),
--     MIN(Salary),
--     MAX(Salary)
-- FROM
--     employee;

SELECT
    pounds(AVG(Salary)) avg_salary,
    pounds(MIN(Salary)) min_salary,
    pounds(MAX(Salary)) max_salary
FROM
    employee;



-- 9. Retrieve the full names of employees and the names of the departments
-- within which they work.
SELECT
    Firstname,
    Surname,
    d.DeptName
FROM
    employee e
JOIN department d USING (DeptNo);

-- 10. Retrieve the full names of employees, the names of the departments within
-- which they work and their telephone extension.
SELECT
    Firstname,
    Surname,
    d.DeptName,
    t.Extension
FROM
    employee e
JOIN department d USING (DeptNo)
JOIN telephone t USING (EmpNo);

-- MYSQL functions 
 CREATE FUNCTION pounds(amount FLOAT)
 RETURNS VARCHAR(20) DETERMINISTIC
 RETURN CONCAT("£", FORMAT(amount, 2));