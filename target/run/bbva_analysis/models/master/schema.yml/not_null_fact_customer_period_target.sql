
  
  

  
  USE [TR_BI_BBVA];
  EXEC('create view 

    [dbt_test__audit.testview_c3b2194a78efd8d392d3021ffc084deb]
   as 
    
    



select target
from "MASTER_BBVA"."DW"."fact_customer_period"
where target is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_c3b2194a78efd8d392d3021ffc084deb]
  
  ) dbt_internal_test;

  USE [TR_BI_BBVA];
  EXEC('drop view 

    [dbt_test__audit.testview_c3b2194a78efd8d392d3021ffc084deb]
  ;')