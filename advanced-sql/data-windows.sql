-- WINDOWS let us apply a function to the rows contained in a result of data
/*
For example:
    what if I want to show everyone in a department and how far away their salary is from their department's average salary?


*/

SELECT
    *,
    MAX(salary) OVER()
FROM salaries
WHERE salary < 70000
LIMIT 100;


-- PARTITION BY
-- the where clause changes where it applies

SELECT
    *,
    AVG(salary) OVER()
FROM salaries;

-- Now what if I want to do average salary by department?
--   I need to JOIN the department table to the salary table

SELECT DISTINCT
    *,
    AVG(salary) OVER(
        PARTITION BY d.dept_name
        )
FROM salaries
JOIN dept_emp as de USING(emp_no)
JOIN departments AS d USING(dept_no);


-- NOW LOOK AT ORDER BY
SELECT DISTINCT
    *,
    AVG(salary) OVER(
        PARTITION BY d.dept_name
        )
FROM salaries
         JOIN dept_emp as de USING(emp_no)
         JOIN departments AS d USING(dept_no)
ORDER BY emp_no;


-- What if we want to get the most recent salary of an employee?
SELECT DISTINCT e.emp_no,
                e.first_name,
                d.dept_name,
                LAST_VALUE(s.from_date) OVER (
                    PARTITION BY e.emp_no
                    ORDER BY s.from_date
                    RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
                    ) as "Change Date",
                LAST_VALUE(s.salary) OVER (
                    PARTITION BY e.emp_no
                    ORDER BY s.from_date
                    RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
                    ) as "Current Salary"
FROM salaries as s
JOIN employees as e USING(emp_no)
JOIN dept_emp as de USING(emp_no)
JOIN departments as d USING(dept_no)

ORDER BY e.emp_no;

SELECT * FROM salaries WHERE emp_no = 10001;f