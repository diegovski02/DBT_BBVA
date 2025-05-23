
  
  

  
  USE [TR_BI_BBVA];
  EXEC('create view 

    [dbt_test__audit.testview_443794d1fb6a494a2f8b1c9d1863c02b]
   as 
    
    



select ID
from "MASTER_BBVA"."DW"."dim_customer"
where ID is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_443794d1fb6a494a2f8b1c9d1863c02b]
  
  ) dbt_internal_test;

  USE [TR_BI_BBVA];
  EXEC('drop view 

    [dbt_test__audit.testview_443794d1fb6a494a2f8b1c9d1863c02b]
  ;')