
  
  

  
  USE [TR_BI_BBVA];
  EXEC('create view 

    [dbt_test__audit.testview_60b2b02b7b4cf49f18e12aad672eaff9]
   as 
    
    



select product_4
from "MASTER_BBVA"."DW"."dim_customer"
where product_4 is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_60b2b02b7b4cf49f18e12aad672eaff9]
  
  ) dbt_internal_test;

  USE [TR_BI_BBVA];
  EXEC('drop view 

    [dbt_test__audit.testview_60b2b02b7b4cf49f18e12aad672eaff9]
  ;')