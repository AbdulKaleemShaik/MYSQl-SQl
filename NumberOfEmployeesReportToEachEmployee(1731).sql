select e.employee_id, e.name,
    count(m.employee_id) as reports_count,
    round(avg(m.age)) as average_age
from
    employees e join employees m
    on e.employee_id=m.reports_to
group by employee_id
order by employee_id;