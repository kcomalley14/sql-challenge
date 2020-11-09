DROP TABLE Departments CASCADE;
DROP TABLE Dept_employees CASCADE;
DROP TABLE Dept_managers CASCADE;
DROP TABLE Employees CASCADE;
DROP TABLE Salaries CASCADE;
DROP TABLE Titles CASCADE;

CREATE TABLE Departments (
    dept_no VARCHAR(30)   NOT NULL,
    dept_name VARCHAR(30)   NOT NULL,
    PRIMARY KEY (dept_no)
);

SELECT * FROM Departments;

CREATE TABLE Dept_employees (
    emp_no INT   NOT NULL,
    dept_no VARCHAR(30)   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

SELECT * FROM Dept_employees;

CREATE TABLE Dept_managers (
    dept_no VARCHAR(30)   NOT NULL,
    emp_no INT   NOT NULL,
    	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
		FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

SELECT * FROM Dept_managers;

CREATE TABLE Employees (
    emp_no INT   NOT NULL,
    emp_title_id VARCHAR(30)   NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR(30)   NOT NULL,
    last_name VARCHAR(30)   NOT NULL,
    sex VARCHAR(30)   NOT NULL,
    hire_date DATE   NOT NULL,
    	PRIMARY KEY (emp_no),
		FOREIGN KEY (emp_title_id) REFERENCES Titles(title_id)
);

SELECT * FROM Employees;

CREATE TABLE Salaries (
    emp_no INT   NOT NULL,
    salary INT   NOT NULL,
		FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

SELECT * FROM Salaries;

CREATE TABLE Titles (
    title_id VARCHAR(30)   NOT NULL,
    title VARCHAR(30)   NOT NULL,
    	PRIMARY KEY (title_id)
);

SELECT * FROM Titles;