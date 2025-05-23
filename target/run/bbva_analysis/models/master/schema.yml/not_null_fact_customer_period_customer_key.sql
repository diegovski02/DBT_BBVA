
  
  

  
  USE [TR_BI_BBVA];
  EXEC('create view 

    [dbt_test__audit.testview_8f14c09afded3ca82129c929e2d84271]
   as 
    
    



select customer_key
from "MASTER_BBVA"."DW"."fact_customer_period"
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

    [dbt_test__audit.testview_8f14c09afded3ca82129c929e2d84271]
  
  ) dbt_internal_test;

  USE [TR_BI_BBVA];
  EXEC('drop view 

    [dbt_test__audit.testview_8f14c09afded3ca82129c929e2d84271]
  ;')