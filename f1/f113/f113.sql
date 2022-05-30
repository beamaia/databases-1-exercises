select name as Equipe, Aparicoes
from 
    (select t4.qtd as Aparicoes, constructorId
    from
        (select count(raceId) as qtd, constructorId
        from (select distinct raceId, constructorId from results) as t1 group by constructorId) as t4
    JOIN
    (select min(qtd) as qtd
    from
        (select count(raceId) as qtd, constructorId
        from (select distinct raceId, constructorId from results) as t1 group by constructorId) as t2) as t3
    on 
        t4.qtd = t3.qtd) as t5
natural JOIN
    constructors