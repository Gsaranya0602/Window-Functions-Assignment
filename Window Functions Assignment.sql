use assignment1;
Window Functions Assignment:
1.Create a table Employees and write a window function to Rank details based on Salary.

CREATE TABLE Employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT,
    department VARCHAR(50)
    );

INSERT INTO Employees (emp_id, emp_name, salary, department) VALUES
(1, 'Arun', 60000, 'HR'),
(2, 'Bala', 50000, 'IT'),
(3, 'Charan', 70000, 'IT'),
(4, 'Divya', 45000, 'Finance'),
(5, 'Elan', 80000, 'Finance'),
(6, 'Farah', 55000, 'HR'),
(7, 'Gokul', 40000, 'IT'),
(8, 'Hari', 75000, 'Finance'),
(9, 'Indu', 65000, 'HR'),
(10, 'Jaya', 48000, 'IT');

select emp_id,emp_name,department,salary,
rank() over(order by salary desc) as salary_rank from employees;

#-- department wise rank based on salary
select emp_id,emp_name,department,salary,
rank() over(partition by department order by salary desc) as salary_rank from employees;

2.Also write a window function to get maximum and minimum Salary

# running max & minimum salary
select emp_id,emp_name,department,salary,
max(salary) over(order by salary ) as max_salary,
min(salary)over(order by salary ) as min_salary 
from employees;

# over all Maximum & Minimum
select emp_id,emp_name,department,salary,
max(salary) over() as max_salary,
min(salary)over() as min_salary 
from employees;

#---Department wise overall Maximum & Minimum Salary

select emp_id,emp_name,department,salary,
max(salary) over(partition by department  ) as max_salary,
min(salary)over(partition by department ) as min_salary 
from employees;