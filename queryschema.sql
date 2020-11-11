--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Employees.sex, Salaries.salary
FROM Employees
JOIN Salaries ON
	Employees.emp_no = Salaries.emp_no;


--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT Employees.first_name, Employees.last_name, Employees.hire_date
FROM Employees 
	WHERE hire_date <'1987/01/01'
	AND hire_date >='1985/12/31';

--3. List the manager of each department with the following information: department number, 
--	department name, the manager's employee number, last name, first name.
SELECT
	Dept_managers.emp_no,
	Dept_managers.dept_no,
	Employees.last_name,
	Employees.first_name,
	Departments.dept_name
FROM
	Dept_managers
JOIN Departments ON
	Dept_managers.dept_no = Departments.dept_no
JOIN Employees ON
	Dept_managers.emp_no = Employees.emp_no;
	
--4. List the department of each employee with the following information: 
--	employee number, last name, first name, and department name.
SELECT
	Employees.emp_no,
	Employees.last_name,
	Employees.first_name,
	Departments.dept_name
FROM Employees
JOIN Dept_employees ON
	Employees.emp_no = Dept_employees.emp_no
JOIN Departments ON
	Dept_employees.dept_no = Departments.dept_no;
	
--5. List first name, last name, and sex for employees whose first name 
--	is "Hercules" and last names begin with "B."
SELECT *
FROM Employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';
	
--6. List all employees in the Sales department, including their employee number, 
--	last name, first name, and department name.
SELECT 
	Employees.emp_no,
	Employees.last_name,
	Employees.first_name,
	Departments.dept_name
FROM Employees
JOIN Dept_employees ON
	Employees.emp_no = Dept_employees.emp_no
JOIN Departments ON
	Dept_employees.dept_no = Departments.dept_no
WHERE dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their 
--	employee number, last name, first name, and department name.
SELECT
	emp.emp_no,
	emp.last_name,
	emp.first_name,
	dept.dept_name
FROM Employees AS emp
JOIN Dept_employees ON
	emp.emp_no = Dept_employees.emp_no
JOIN Departments AS dept ON
	Dept_employees.dept_no = dept.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

--8. In descending order, list the frequency count of employee last names, i.e., 
--	how many employees share each last name.
SELECT last_name, COUNT(last_name)
FROM Employees
GROUP BY last_name
ORDER BY COUNT(last_name) desc;
