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