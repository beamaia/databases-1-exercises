select distinct Equipe, Piloto, name as Circuito, Ano
from
    (select Equipe, Piloto, year as Ano, circuitId
    from 
        (select Equipe, concat(forename, ' ', surname) as Piloto, raceId
        from 
            (select name as Equipe, driverId, raceId
            from constructors as c 
            left join (select raceId, driverId, constructorId from results where positionOrder = 1) as t1 
            on c.constructorId = t1.constructorId 
            where c.nationality = 'French') as t2
        left join drivers as d on d.driverId = t2.driverId) as t3
    left join races as r on t3.raceId = r.raceId) as t4
left join
    circuits as c
on
    c.circuitId = t4.circuitId;