
  
  

  
  USE [TR_BI_BBVA];
  EXEC('create view 

    [dbt_test__audit.testview_b1991d5cb0bafeba6ef3726b8963817c]
   as 
    
    

select
    customer_key as unique_field,
    count(*) as n_records

from "MASTER_BBVA"."DW"."dim_customer"
where customer_key is not null
group by customer_key
having count(*) > 1


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_b1991d5cb0bafeba6ef3726b8963817c]
  
  ) dbt_internal_test;

  USE [TR_BI_BBVA];
  EXEC('drop view 

    [dbt_test__audit.testview_b1991d5cb0bafeba6ef3726b8963817c]
  ;')