SELECT CEILING(
    AVG(salary) - AVG(CAST(REPLACE(CAST(salary AS CHAR), "0", "") AS SIGNED))
)
FROM Employees
