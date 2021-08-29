
This is a short description of the code in SQL_Lab.sql

# 1 List all Employees whose salary is between 1,000 AND 2,000. Show the Employee Name, Department and Salary
I've chosen to join the EMP and DEPT tables on DEPTNO in order to be able to show the name of the department in my answer. 
I've used an inner join as we only want records where the DEPTNO appears in both tables.
The question asks us to show the employee name, salary and department for those who earn between 1000 and 2000. 
As it is not specified whether it is the department name or department number which is needed, I've chosen name as it is more easily read by the user.
If it was department number that was needed, the join would be unnecessary and we could have queried all three fields from the EMP table.

# 2 Count the number of people in department 30 who receive a salary and the number of people who receive a commission
I've used a case statement to create a boolean field for each of the two sets of conditions: dept = 30 and salary is not null, and dept = 30 and commision is not null.
This creates two new fields called Salaried Employees and Commissioned Employees.
This field is filled with 1s and 0s and so a SUM() of each field adds the 1s to give us the number of employees that fulfill the condition.

# 3 Find the name and salary of employees in Dallas
We are looking for fields from the EMP table but filtered by a value from the DEPT table.
An inner join of DEPT onto EMP will leave us with all the records from the EMP table but with the DNAME and LOC fields added to each one.
We then query this resulting table for ENAME and SAL filtering by LOC = 'Dallas'.

# 4 List all departments that do not have any employees
First, we query all the DEPTNOs from EMP table. 
Then, we want to get the department names whose DEPTNO does not appear in these results.
For ease of reading the table, the result has been projected as 'Dept with no employees'.

# 5 List the department number and average salary of each department
We can use the AVG() function to get the average of the numerical SAL field, the round() function to ensure it is displayed to two decimal points seeing as we are measuring currency. 
We use a LEFT JOIN to ensure that all DEPTNOs from the DEPT table are included in the results, whether they have employees or not.
Group by is often used with mathematical formulae, SUM(), COUNT(), AVG().
This enables us to group the results based on a value from a certain column, in this case DEPTNO.

NOTE: If we had used INNER JOIN like in previous queries we would have go the same figures for DEPTS 10 to 30 but no result for DEPT 40 as it is not included in the EMP table.
