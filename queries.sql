-- List the following details of each employee: employee number, last name, first name, sex, & salary.
SELECT 	employees.emp_no,
		employees.last_name,
		employees.first_name,
		employees.sex,
		salaries.salary
FROM employees
	LEFT JOIN salaries
		ON (employees.emp_no = salaries.emp_no)
ORDER BY employees.emp_no
;
		
-- List first name, last name, & hire date for employees who were hired in 1986.
SELECT 	employees.first_name,
		employees.last_name,
		employees.hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY employees.hire_date
;

-- List the manager of each department with the following information:
-- department number, department name, manager's employee number, last name, first name.
SELECT 	dept_manager.dept_no,
		departments.dept_name,
		dept_manager.emp_no,
		employees.last_name,
		employees.first_name
FROM dept_manager
	INNER JOIN departments
		ON (dept_manager.dept_no = departments.dept_no)
	INNER JOIN employees
		ON (dept_manager.emp_no = employees.emp_no)
ORDER BY dept_manager.dept_no
;

-- List the department of each employee with the following information:
-- employee number, last name, first name, & department name.
SELECT 	dept_emp.emp_no,
		employees.last_name,
		employees.first_name,
		departments.dept_name
FROM dept_emp
	INNER JOIN employees
		ON (dept_emp.emp_no = employees.emp_no)
	INNER JOIN departments
		ON (dept_emp.dept_no = departments.dept_no)
ORDER BY dept_emp.emp_no
;

-- List first name, last name, and sex 
-- for employees whose first name is 'Hercules' & last name begins with 'B'.
SELECT 	employees.first_name,
		employees.last_name,
		employees.sex
FROM employees
WHERE employees.first_name = 'Hercules' AND employees.last_name LIKE 'B%'
ORDER BY employees.last_name
;

-- List all employees in the 'Sales' department 
-- including their employee number, last name, first name, & department name.
SELECT 	employees.emp_no,
		employees.last_name,
		employees.first_name,
		departments.dept_name
FROM employees
	INNER JOIN dept_emp
		ON (employees.emp_no = dept_emp.emp_no)
	INNER JOIN departments
		ON (dept_emp.dept_no = departments.dept_no)
WHERE departments.dept_name = 'Sales'
ORDER BY employees.emp_no
;

-- List all employees in the 'Sales' and 'Development' departments
-- including their employee number, last name, first name, & department name.
SELECT 	employees.emp_no,
		employees.last_name,
		employees.first_name,
		departments.dept_name
FROM employees
	INNER JOIN dept_emp
		ON (employees.emp_no = dept_emp.emp_no)
	INNER JOIN departments
		ON (dept_emp.dept_no = departments.dept_no)
WHERE departments.dept_name IN ('Sales', 'Development')
ORDER BY employees.emp_no
;

-- In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
SELECT employees.last_name, COUNT (employees.last_name)
FROM employees
GROUP BY employees.last_name
ORDER BY COUNT(employees.last_name) DESC
;