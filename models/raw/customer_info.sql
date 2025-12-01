select
    cast(customer_id as number(10,0)) as cust_id,
    cast(first_name as varchar(100)) as f_name,
    cast(last_name as varchar(100)) as l_name,
    cast(gender as varchar(100)) as gender,
    date_of_birth,
    cast(email as varchar(100)) as email,
    phone
from {{ ref('raw_cust','cust') }}
