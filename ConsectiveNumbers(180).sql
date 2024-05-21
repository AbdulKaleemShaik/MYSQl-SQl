with sub1 as(select * ,rank() over(partition by num order by id)as seq from Logs ),
sub2 as (select *,cast(id as signed)-cast(seq as signed) as diff from sub1)
select distinct num as ConsecutiveNums from sub2 group by num,diff
having count(*)>=3;

select distinct l1.num as ConsecutiveNums from logs l1
inner join logs l2 on l1.num = l2.num and l1.id+1 = l2.id
inner join logs l3 on l2.num = l3.num and l2.id+1 = l3.id;