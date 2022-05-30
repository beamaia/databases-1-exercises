select 
    c.customer_name as customer_name, 
    c.customer_city as customer_city 
from 
    customer as c, 
    (select 
        b.customer_name 
    from 
        loan as l, 
        borrower as b 
    where 
        l.loan_number=b.loan_number and 
        l.branch_name = 'Perryridge') as tb1, 
    (select 
        d.customer_name 
    from 
        account as c, 
        depositor as d 
    where 
        c.account_number = d.account_number and 
        c.branch_name = 'Perryridge') as tb2 
where 
    c.customer_name = tb1.customer_name and 
    c.customer_name = tb2.customer_name;