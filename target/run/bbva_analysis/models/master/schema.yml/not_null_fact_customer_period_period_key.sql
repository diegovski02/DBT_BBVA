
  
  

  
  USE [TR_BI_BBVA];
  EXEC('create view 

    [dbt_test__audit.testview_9412f681e8ca4405cb3cd62d6875677c]
   as 
    
    



select period_key
from "MASTER_BBVA"."DW"."fact_customer_period"
where period_key is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_9412f681e8ca4405cb3cd62d6875677c]
  
  ) dbt_internal_test;

  USE [TR_BI_BBVA];
  EXEC('drop view 

    [dbt_test__audit.testview_9412f681e8ca4405cb3cd62d6875677c]
  ;')