select
    a.account_number
from
    account as a,
    (select account_number as ac_num, balance as bal from account where branch_name = 'North Town') as a2
where
    a.balance < a2.bal; 
