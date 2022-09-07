/* UC1 */
create database payroll_service;
use payroll_service;

/* UC2 */
create table employee_payroll
(
Id INT PRIMARY KEY IDENTITY,
Name VARCHAR(255) NOT NULL,
salary int NOT NULL,
startDate Date
);

/* UC3 */
Insert into employee_payroll values('Shreya',70000,GETDATE());
Insert into employee_payroll values('Chandru',80000,GETDATE());
Insert into employee_payroll values('Vetri',60000,GETDATE());
Insert into employee_payroll values('Srikant',180000,GETDATE());
Insert into employee_payroll values('Ajay',100000,'2018-01-01');

/* UC4 */
Select * from employee_payroll;

/* UC5 */
SELECT salary FROM employee_payroll WHERE name = 'Vetri';

SELECT salary FROM employee_payroll WHERE startDate BETWEEN CAST('2018-01-01' AS DATE) AND GETDATE();

/* UC6 */
ALTER table employee_payroll Add  Gender char ;
UPDATE employee_payroll SET Gender = 'F' where name = 'Shreya';
UPDATE employee_payroll SET Gender = 'M' where name = 'Chandru';
UPDATE employee_payroll SET Gender = 'M' where name = 'Vetri';
UPDATE employee_payroll SET Gender = 'M' where name = 'Srikant';
UPDATE employee_payroll SET Gender = 'M' where name = 'Ajay';
Select * from employee_payroll;

/* UC7 */
INSERT INTO employee_payroll values (6,'Joe',60000,GETDATE(),'F');
Select * from employee_payroll;

SELECT SUM(salary) FROM employee_payroll WHERE Gender = 'F' GROUP BY Gender;
SELECT AVG(salary) FROM employee_payroll WHERE Gender = 'F' GROUP BY Gender;

SELECT SUM(salary) FROM employee_payroll WHERE Gender = 'M' GROUP BY Gender;
SELECT AVG(salary) FROM employee_payroll WHERE Gender = 'M' GROUP BY Gender;

SELECT min(salary) FROM employee_payroll WHERE Gender = 'M' GROUP BY Gender;
SELECT max(salary) FROM employee_payroll WHERE Gender = 'F' GROUP BY Gender;
SELECT max(salary) FROM employee_payroll WHERE Gender = 'M' GROUP BY Gender;
SELECT min(salary) FROM employee_payroll WHERE Gender = 'F' GROUP BY Gender;

SELECT count(salary) FROM employee_payroll WHERE Gender = 'M' GROUP BY Gender;
SELECT count(salary) FROM employee_payroll WHERE Gender = 'F' GROUP BY Gender
