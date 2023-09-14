create database company_db;

use company_db;

CREATE TABLE Departments (
  Code INTEGER PRIMARY KEY,
  Name varchar(255) NOT NULL ,
  Budget decimal NOT NULL 
);

CREATE TABLE Employees (
  SSN INTEGER PRIMARY KEY,
  Name varchar(255) NOT NULL ,
  LastName varchar(255) NOT NULL ,
  Department INTEGER NOT NULL , 
  foreign key (department) references Departments(Code) 
);

INSERT INTO Departments(Code,Name,Budget) VALUES(14,'IT',65000);
INSERT INTO Departments(Code,Name,Budget) VALUES(37,'Accounting',15000);
INSERT INTO Departments(Code,Name,Budget) VALUES(59,'Human Resources',240000);
INSERT INTO Departments(Code,Name,Budget) VALUES(77,'Research',55000);

INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('123234877','Michael','Rogers',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('152934485','Anand','Manikutty',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('222364883','Carol','Smith',37);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('326587417','Joe','Stevens',37);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('332154719','Mary-Anne','Foster',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('332569843','George','ODonnell',77);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('546523478','John','Doe',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('631231482','David','Smith',77);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('654873219','Zacary','Efron',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('745685214','Eric','Goldsmith',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('845657245','Elizabeth','Doe',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('845657246','Kumar','Swamy',14);



/* **************************************************************************************
**********************  ANSWER ******************************************************  */

select lastname from employees;

select lastname from employees
group by lastname;

select ssn,name,lastname,department from employees
where lastname like "Smith";

select ssn,name,lastname,department from employees
where lastname = 'Smith' or lastname = 'Doe';

select * from employees
where department = 14;

select * from employees
where department in (14,37);

select * from employees
where lastname like "S%";

select sum(budget) from departments;

select department,count(*) as "numbere of employee" from employees
group by department;

select a.*,b.* from employees a
join departments b
on a.department = b.code;

select a.name,a.lastname,b.name,b.budget from employees a
join departments b
on a.department = b.code;

select a.*,b.* from employees a
join departments b
on a.department = b.code
where budget > 60000;

select * from departments
where budget > (select avg(budget) from departments);

select name from departments
where code in (select department from employees
			   group by department
               having count(*) > 2);

select name, lastname,department
from employees
where department =(
select a.code 
from (select * from departments order by budget limit 2) a
order by a.budget desc limit 1);

insert into departments values(11, 'Quality Assurance', 40000);

insert into employees values(847219811, 'Mary', 'Moore', 11);

update departments 
set budget = 0.1 * budget;

update employees
set department = 14
where department = 77;

delete from employees
where department = 14;

delete from employees
where department in(select a.*,b.* from employees a
join departments b
on a.department = b.code
where budget > 60000);

delete from employees;










