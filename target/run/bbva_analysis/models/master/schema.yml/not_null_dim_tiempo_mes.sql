
  
  

  
  USE [TR_BI_BBVA];
  EXEC('create view 

    [dbt_test__audit.testview_4609417154887345d6a7453d357826fd]
   as 
    
    



select mes
from "MASTER_BBVA"."DW"."dim_tiempo"
where mes is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_4609417154887345d6a7453d357826fd]
  
  ) dbt_internal_test;

  USE [TR_BI_BBVA];
  EXEC('drop view 

    [dbt_test__audit.testview_4609417154887345d6a7453d357826fd]
  ;')