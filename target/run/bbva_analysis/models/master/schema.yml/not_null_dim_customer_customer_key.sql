
  
  

  
  USE [TR_BI_BBVA];
  EXEC('create view 

    [dbt_test__audit.testview_2aeb2287131146df9ff93c1b886b86d6]
   as 
    
    



select customer_key
from "MASTER_BBVA"."DW"."dim_customer"
where customer_key is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_2aeb2287131146df9ff93c1b886b86d6]
  
  ) dbt_internal_test;

  USE [TR_BI_BBVA];
  EXEC('drop view 

    [dbt_test__audit.testview_2aeb2287131146df9ff93c1b886b86d6]
  ;')