SELECT e.f_name AS FName, e.l_name AS LName, e.salary AS Salary, e.dept_id AS DeptId
FROM employee e
WHERE e.salary = (
    SELECT MIN(salary)
    FROM employee
);

SELECT e.*
FROM employee e
WHERE e.emi_id IN (SELECT manager_id FROM department);

SELECT d.dept_id, d.dept_name
FROM department d
JOIN location l ON d.location_id = l.location_id
JOIN country c ON l.country_id = c.country_id
WHERE l.city = 'London';


SELECT e.f_name, e.l_name, d.dept_id
FROM employee e
JOIN department d ON e.dept_id = d.dept_id
WHERE d.dept_name = 'Marketing';

SELECT e.f_name, e.l_name, e.salary, e.dept_id
FROM employee e
WHERE e.salary < (
    SELECT MIN(j.min_salary)
    FROM jobs j
    JOIN department d ON j.job_id = e.job_id
    WHERE d.dept_id >= 70
);


