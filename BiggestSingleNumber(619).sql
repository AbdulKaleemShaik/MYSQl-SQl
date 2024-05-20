select ifnull((select num from Mynumbers
group by num
having count(num)=1
order by 1 desc limit 1), null) as num