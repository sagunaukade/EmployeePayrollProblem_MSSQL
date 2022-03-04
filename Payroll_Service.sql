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

----- Use Aggregate Functions and Group by Gender UC-7----
select Sum(salary) as "TotalSalary",Gender from employee_payroll group by Gender;
select Avg(salary) as "AverageSalary",Gender from employee_payroll group by Gender;
select Min(salary) as "MinimumSalary",Gender from employee_payroll group by Gender;
select Max(salary) as "MaximumSalary",Gender from employee_payroll group by Gender;
select count(salary) as "CountSalary",Gender from employee_payroll group by Gender;

------- Add column department,PhoneNumber and Address UC-8 -------
Alter table employee_payroll
add EmployeePhoneNumber BigInt,EmployeeDepartment varchar(200) not null default 'Publish',Address varchar(200) default 'Not Provided';

Update employee_payroll 
set EmployeePhoneNumber='9842905050',EmployeeDepartment='Editing',Address='Pune,Maharashtra'
where name='Saguna';

Update employee_payroll 
set EmployeePhoneNumber='10987252525',Address='Mumbai,Maharashtra'
where name ='Amruta';

Update employee_payroll 
set EmployeePhoneNumber='9600054540',EmployeeDepartment='Management',Address='Chennai,TN'
where name ='Vaishnvi';

Update employee_payroll 
set EmployeePhoneNumber='8715605050',Address='Bareilly,UP'
where name ='Raghav';

------- Rename Salary to Basic Pay and Add Deduction,Taxable pay, Income Pay, Netpay UC-9 -------
Alter table employee_payroll
add Deduction float,TaxablePay float, IncomeTax float,NetPay float;
Update employee_payroll 
set Deduction=1000
where Gender='F';
Update employee_payroll 
set Deduction=2000
where Gender='M';
update employee_payroll
set NetPay=(BasicPay - Deduction)
update employee_payroll
set TaxablePay=0,IncomeTax=0
select * from employee_payroll;

---- Terissa as part of Sales and Marketing Department UC-10 ----
UPDATE Employee_Payroll
SET EmployeeDepartment = 'Sales' 
WHERE Name = 'Terisa';

INSERT INTO Employee_Payroll
(
    Name,Salary, StartDate , Gender ,EmployeeDepartment
)
VALUES
(
    'Terisa',60000.00,'2018-01-03','F','Marketing'
);
SELECT * FROM Employee_Payroll;

------- Implement the ER Diagram into Payroll Service DB UC-11 -------
CREATE TABLE EmployeeDepartment
(
id int not null,
department VARCHAR(20) not null
);
--insert enteries into the department table
INSERT INTO EmployeeDepartment VALUES
(1, 'Sales'),
(2, 'Sales'),
(3, 'Sales'),
(2,'Marketing');
--creating employee table
CREATE TABLE employee
(
Id INT IDENTITY(1,1) not null,
Name VARCHAR(25) not null,
Gender CHAR(1) not null,
Phone_Number VARCHAR(13) not null,
Address VARCHAR(250) not null DEFAULT 'India',
);
-- insert data into employee table
INSERT INTO employee VALUES
('Bill', 'M', '9424787443', 'New York'),
('Terissa', 'F', '8109322276', 'Atlanta'),
('Charlie', 'M', '9926707344', 'Boston');

CREATE TABLE Payroll
(
Id int not null,
Start date not null,
Basic_pay money not null,
Deduction money,
Taxable_pay money,
Income_tax money,
Net_pay money not null
);
--insert data in payroll
INSERT INTO Payroll VALUES
(1, '2018-01-03', 100000, 10000, 90000, 1000, 89000),
(2, '2019-11-13', 200000, 10000, 190000,3000,187000),
(3, '2020-05-21', 300000, 20000, 280000, 5000, 275000);
select * from EmployeeDepartment
