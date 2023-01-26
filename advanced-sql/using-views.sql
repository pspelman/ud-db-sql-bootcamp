-- A couple types of views
-- MATERIALIZED (keeps the data from the query)
-- NON-MATERIALIZED (they query, not the data that were returned from it)


-- EXAMPLE VIEW: Getting current salary of an employee
SELECT e.emp_no,
       MAX(s.from_date)
FROM salaries as s
         JOIN employees as e USING (emp_no)
         JOIN dept_emp as de USING (emp_no)
         JOIN departments as d USING (dept_no)
GROUP BY e.emp_no
ORDER BY e.emp_no;

-- CREATE A VIEW FOR THE QUERY
-- CREATE VIEW last_salary_change AS
CREATE OR REPLACE VIEW last_salary_change AS
SELECT e.emp_no,
       MAX(s.from_date)
FROM salaries as s
         JOIN employees as e USING (emp_no)
         JOIN dept_emp as de USING (emp_no)
         JOIN departments as d USING (dept_no)
GROUP BY e.emp_no
ORDER BY e.emp_no

-- QUERY THE VIEW LIKE A TABLE
SELECT *
FROM last_salary_change;

-- JOIN it with a table
SELECT *
FROM salaries
         JOIN last_salary_change AS l USING (emp_no)
WHERE from_date = l.max
ORDER BY emp_no;

