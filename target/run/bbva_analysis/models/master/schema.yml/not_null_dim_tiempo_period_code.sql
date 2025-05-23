
  
  

  
  USE [TR_BI_BBVA];
  EXEC('create view 

    [dbt_test__audit.testview_5c396d30d75c819eb1be0a67c950e049]
   as 
    
    



select period_code
from "MASTER_BBVA"."DW"."dim_tiempo"
where period_code is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_5c396d30d75c819eb1be0a67c950e049]
  
  ) dbt_internal_test;

  USE [TR_BI_BBVA];
  EXEC('drop view 

    [dbt_test__audit.testview_5c396d30d75c819eb1be0a67c950e049]
  ;')