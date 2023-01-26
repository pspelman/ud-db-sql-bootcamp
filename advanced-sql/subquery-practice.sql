-- question 1; show all employees older than the average age
SELECT first_name,
       last_name,
       birth_date,
       AGE(birth_date),
       (SELECT AVG(age(birth_date)) FROM employees)
FROM employees
WHERE AGE(birth_date) > (SELECT AVG(age(birth_date))
                         FROM employees)