
    
    

select
    customer_key as unique_field,
    count(*) as n_records

from "MASTER_BBVA"."DW"."dim_customer"
where customer_key is not null
group by customer_key
having count(*) > 1


