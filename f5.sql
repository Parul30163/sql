SELECT e.FName, e.LName, e.Salary, e.DeptId
FROM Employee e
WHERE e.Salary = (
    SELECT MIN(Salary)
    FROM Employee
    WHERE DeptId = e.DeptId
);