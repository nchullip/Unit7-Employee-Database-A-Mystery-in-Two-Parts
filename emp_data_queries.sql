--1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT  employees.emp_no, employees.last_name, employees.first_name, employees.gender,salaries.salary
FROM employees 
JOIN salaries 
ON employees.emp_no = salaries.emp_no;


--2. List employees who were hired in 1986.
SELECT emp_no, first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01'
ORDER BY hire_date; 


--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT dept.dept_no, dept.dept_name, dm.emp_no, e.first_name, e.last_name, dm.from_date, dm.to_date
FROM departments as dept
JOIN dept_manager as dm
ON dm.dept_no=dept.dept_no
JOIN employees as e
ON e.emp_no=dm.emp_no;


--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name,e.first_name, dept.dept_name
FROM employees as e
JOIN dept_emp as de
ON de.emp_no=e.emp_no
JOIN departments as dept
ON dept.dept_no=de.dept_no;


--5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name 
FROM employees
WHERE first_name ='Hercules' 
AND last_name LIKE 'B%';


--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, dept.dept_name
FROM employees as e
JOIN dept_emp as de
ON de.emp_no=e.emp_no
JOIN departments as dept
ON dept.dept_no=de.dept_no
WHERE dept_name = 'Sales';


--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name. 
SELECT e.emp_no, e.last_name, e.first_name, dept.dept_name
FROM employees as e
JOIN dept_emp as de
ON de.emp_no=e.emp_no
JOIN departments as dept
ON dept.dept_no=de.dept_no
WHERE dept_name = 'Sales' OR dept_name='Development'
ORDER BY emp_no;


--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) as frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;