mysql;
-- Having this mysql; line above throws an error when I run the file
-- using source, but according to the requirements I should include it.

-- Choose the database we are using
USE COMPANY1;

-- List all Employees whose salary is between 1,000 AND 2,000. 
-- Show the Employee Name, Department and Salary
SELECT ENAME, DNAME, SAL 
FROM EMP INNER JOIN DEPT 
ON EMP.DEPTNO = DEPT.DEPTNO 
WHERE SAL BETWEEN 1000 AND 2000;

-- Count the number of people in department 30 who receive a salary 
-- and the number of people who receive a commission
SELECT SUM(case when DEPTNO = 30 AND SAL IS NOT NULL then 1 else 0 end) AS 'Salaried Employees', 
SUM(case when DEPTNO = 30 AND COMM IS NOT NULL then 1 else 0 end) AS 'Commissioned Employees' 
FROM EMP;

-- Find the name and salary of employees in Dallas
SELECT ENAME, SAL 
FROM EMP INNER JOIN DEPT 
ON EMP.DEPTNO = DEPT.DEPTNO 
WHERE LOC = 'Dallas';

-- List all departments that do not have any employees
SELECT DNAME AS 'Dept. with no employees' 
FROM DEPT 
WHERE DEPTNO NOT IN (SELECT DEPTNO FROM EMP);

-- List the department number and average salary of each department
SELECT DEPT.DEPTNO, ROUND(AVG(SAL), 2) AS 'Average Salary' 
FROM DEPT LEFT JOIN EMP 
ON DEPT.DEPTNO = EMP.DEPTNO 
GROUP BY DEPTNO;