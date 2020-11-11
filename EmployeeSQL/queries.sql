
-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT * FROM salaries

SELECT s.emp_no, s.salary 
FROM salaries as s
inner join employees as e -- Use inner to for shared values on emp_no
on e.emp_no = s.emp_no

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date FROM employees
WHERE extract(year FROM hire_date) = 1986; --https://www.postgresqltutorial.com/postgresql-extract/

-- 3.List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
--SELECT title_id FROM titles
SELECT e.first_name, e.last_name, e.emp_no, dm.dept_no,d.dept_name
FROM dept_manager as dm
INNER JOIN employees as e
ON e.emp_no = dm.emp_no

INNER JOIN departments as d
ON d.dept_no = dm.dept_no

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
--SELECT COUNT(*)
SELECT e.emp_no, e.last_name, e.first_name
FROM employees AS e
INNER JOIN dept_emp AS de
ON e.emp_no = de.emp_no
INNER JOIN departments AS d
ON de.dept_no = d.dept_no

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT e.first_name, e.last_name, e.sex 
FROM employees as e
WHERE e.first_name LIKE 'Hercules' 
AND e.last_name LIKE 'B%'

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de
ON e.emp_no = de.emp_no
INNER JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE LOWER(d.dept_name) = 'sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
--SELECT COUNT(*)
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de
ON e.emp_no = de.emp_no
INNER JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE LOWER(d.dept_name) = 'sales' OR LOWER(d.dept_name) = 'development';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS freq 
FROM employees 
GROUP BY last_name
ORDER BY freq DESC; 
