select max(salary) as "SecondHighestSalary"
from Employee
where salary<(select max(salary)
from Employee);
WITH
    SalaryRanks
    AS
    (
        SELECT
            salary,
            DENSE_RANK() OVER (ORDER BY salary DESC) AS ranks
        FROM
            Employee
    )
SELECT
    IFNULL(
        (SELECT salary
    FROM SalaryRanks
    WHERE ranks = 2 limit 1),
    NULL
) AS SecondHighestSalary;
