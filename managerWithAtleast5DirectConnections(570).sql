select e.name from Employee e inner join Employee m 
on e.id=m.managerId 
group by m.managerId 
having count(m.managerId)>=5;

/*
SELECT name FROM Employee
WHERE id in (select managerId from employee 
group by managerId having count(id) >= 5);