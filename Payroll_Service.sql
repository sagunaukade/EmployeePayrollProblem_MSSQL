---- Create Payroll_Service Database UC-1 ----
create database Payroll_Service;
use Payroll_Service;

---- Create Table UC-2 ----
CREATE TABLE Employee_Payroll (
    Id int identity(1,1) primary key,
    Name varchar(200) not null,
    Salary float,
    StartDate date,
); 

---- Insert Values in Table UC-3 ----
insert into employee_payroll (Name, Salary, StartDate) values
('Saguna', 20000.00, '2009-09-05'),
('Amruta', 70000.00, '2014-02-06'),
('Vaishnvi', 90000.00, '2011-01-04'),
('Lavanya', 10000.00, '2019-05-01'),
('Raghav', 30000.00, '2022-02-02');

---- Retrieve employee_payroll data UC-4 ----
select * from Employee_Payroll;

---- Retrieve salary of particular employee and particular date range UC-5 ----
select salary from employee_payroll where Name = 'Lavanya';
select * from employee_payroll where StartDate between cast ('2018-01-01' as date) and GETDATE();

---- Alter And Update Data UC-6 ----
ALTER TABLE Employee_Payroll ADD Gender CHAR(1);
UPDATE Employee_Payroll
SET Gender = 'M' WHERE Name = 'Raghav';
UPDATE Employee_Payroll
SET Gender = 'F' WHERE Name = 'Amruta';

