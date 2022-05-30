select customer_name
from 
    (select 
        customer_name,
        branch_name
    from
        borrower
    natural join 
        loan
    ) as b1
natural join
    (select 
        branch_name
    from
        loan
    natural join
        borrower
    where
        customer_name = 'Hayes') as b2
where 
    b1.customer_name != 'Hayes';
