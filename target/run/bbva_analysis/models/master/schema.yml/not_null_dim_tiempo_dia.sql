
  
  

  
  USE [TR_BI_BBVA];
  EXEC('create view 

    [dbt_test__audit.testview_e24f8b7807dc4fb0415d4751a3869f66]
   as 
    
    



select dia
from "MASTER_BBVA"."DW"."dim_tiempo"
where dia is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_e24f8b7807dc4fb0415d4751a3869f66]
  
  ) dbt_internal_test;

  USE [TR_BI_BBVA];
  EXEC('drop view 

    [dbt_test__audit.testview_e24f8b7807dc4fb0415d4751a3869f66]
  ;')