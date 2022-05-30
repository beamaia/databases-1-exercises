select distinct t1.nationality
from 
    (select distinct nationality 
    from results natural join drivers 
    where positionOrder <= 3) as t1
left join
    constructors as c
on 
    t1.nationality = c.nationality
where 
    c.constructorId is null;