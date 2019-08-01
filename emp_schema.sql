-- Drop Tables if Existing
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;


-- Creating Tables
CREATE TABLE departments (
  dept_no VARCHAR (30) NOT NULL PRIMARY KEY,
  dept_name VARCHAR (100) NOT NULL
);

CREATE TABLE dept_emp (
  emp_no INT NOT NULL PRIMARY KEY,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  dept_no VARCHAR (30) NOT NULL,
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  from_date DATE NOT NULL,
  to_date DATE NOT NULL
);

CREATE TABLE dept_manager (
  dept_no VARCHAR (30) NOT NULL,
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  emp_no integer NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  from_date DATE NOT NULL,
  to_date DATE NOT NULL
);

CREATE TABLE employees (
  emp_no integer NOT NULL PRIMARY KEY,
  birth_date DATE NOT NULL,
  first_name VARCHAR (100) NOT NULL,
  last_name VARCHAR (100) NOT NULL,
  gender VARCHAR (1) NOT NULL,
  hire_date DATE NOT NULL
);

CREATE TABLE salaries (
  emp_no integer NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  salary integer NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL
);

CREATE TABLE titles (
  emp_no integer NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  title VARCHAR (100) NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL
);


-- Imported CSV Files Into Corresponding SQL Table
-- Query * Confirming Data has been Updated
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;