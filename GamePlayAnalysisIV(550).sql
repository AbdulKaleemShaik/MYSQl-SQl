-- # Write your MySQL query statement below
-- with game as (select player_id,device_id,event_date,Games_played,min(event_date) over (partition by Player_id) first from Activity)
-- select round(sum(if(datediff(event_date,first)=1,1,0))/count(distinct player_id),2) fraction from game;

select round(count(distinct a.player_id)/
(select count(distinct player_id) from Activity),2) as fraction 
from Activity a inner join 
( select player_id,min(event_date) min_date from Activity group by 1) as b
on a.player_id=b.player_id
where datediff(a.event_date,b.min_date)=1;