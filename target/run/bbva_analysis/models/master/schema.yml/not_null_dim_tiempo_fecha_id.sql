
  
  

  
  USE [TR_BI_BBVA];
  EXEC('create view 

    [dbt_test__audit.testview_34a9016f0ff7bac0775ed247d113196a]
   as 
    
    



select fecha_id
from "MASTER_BBVA"."DW"."dim_tiempo"
where fecha_id is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_34a9016f0ff7bac0775ed247d113196a]
  
  ) dbt_internal_test;

  USE [TR_BI_BBVA];
  EXEC('drop view 

    [dbt_test__audit.testview_34a9016f0ff7bac0775ed247d113196a]
  ;')