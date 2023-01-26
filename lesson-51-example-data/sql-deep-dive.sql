SELECT emp_no FROM public.employees;

-- SELECT emp_no as "Employee #", birth_date AS "Birthday", first_name AS "First Name" FROM public.employees;
SELECT emp_no as 'Employee #', birth_date AS 'Birthday', first_name AS 'First Name' FROM public.employees;


SELECT * FROM titles;

SELECT concat(emp_no, ' ', title) FROM titles;
SELECT concat(emp_no, ' is a ', title) FROM titles;
SELECT concat(emp_no, ' ', first_name, ' ', last_name) as "Employee", title FROM employees JOIN titles ON titles.emp_no;

SELECT concat(titles.emp_no, ' ', first_name, ' ', last_name) as "Employee", title FROM employees JOIN titles ON titles.emp_no=employees.emp_no;


SELECT count(emp_no) FROM employees;
SELECT max(salary) FROM salaries;

SELECT sum(salary) FROM salaries;
