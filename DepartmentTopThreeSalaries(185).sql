select Department, Employee, Salary
from (
    select d.name as Department, e.name as Employee, e.salary as Salary,
        Dense_rank() over (partition by d.name order by e.salary desc ) as ranks
    from Employee e join Department d on
    e.departmentId=d.id
) as rank_list
where ranks<=3;