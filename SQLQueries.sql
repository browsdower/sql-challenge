-- SQLite
select * from titles

select * from data_salaries

select *  from departments

select * from dept_emp

select * from employees

select * from dept_manager

--List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees AS e
JOIN data_salaries AS s
ON e.emp_no = s.emp_no;


--List employees who were hired in 1986.
SELECT hire_date,strftime('%Y', hire_date) as "Year"
FROM employees
WHERE hire_date = '1986';

SELECT first_name, last_name, hire_date 
FROM employees
WHERE extract(year from hire_date) = '1986';

SELECT * 
FROM employees
WHERE hire_date BETWEEN '01/01/1986' and '12/31/1986'

SELECT * FROM employees
WHERE hire_date >= '01-Jan-1986'
AND hire_date <= '31-Dec-1986';

SELECT * FROM employees 
where (hire_date <= '1986-01-01' AND hire_date >= '1986-01-01')

select * from employees 
WHERE (hire_date BETWEEN '1986-01-01' AND '1986-12-31')
----------------------------------------------


--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT Departments.dept_no, Departments.dept_name, Dept_manager.emp_no, 
employees.first_name, employees.last_name, Dept_manager.from_date, Dept_manager.to_date
FROM Departments
JOIN Dept_manager
ON (Departments.dept_no = Dept_manager.dept_no)
JOIN employees
ON (Dept_manager.emp_no = employees.emp_no);

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, first_name, last_name,dept_name
FROM employees AS e
JOIN dept_emp d
ON e.emp_no = d.emp_no
JOIN departments
ON d.dept_no = departments.dept_no;

--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employees
WHERE(first_name LIKE 'Hercules' AND last_name LIKE 'B%');

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, first_name, last_name, dept_name
FROM employees AS e
JOIN dept_emp AS d
ON e.emp_no = d.emp_no
JOIN departments
ON d.dept_no = departments.dept_no 
WHERE departments.dept_name LIKE 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, first_name, last_name, dept_name
FROM employees AS e
JOIN dept_emp AS d
ON e.emp_no = d.emp_no
JOIN departments
ON d.dept_no = departments.dept_no 
WHERE departments.dept_name LIKE 'Sales'
OR departments.dept_name LIKE  'Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name,
COUNT(last_name) AS "name_count"
FROM employees
GROUP BY
last_name
ORDER BY name_count DESC;