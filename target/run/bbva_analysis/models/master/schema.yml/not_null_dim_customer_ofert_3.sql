
  
  

  
  USE [TR_BI_BBVA];
  EXEC('create view 

    [dbt_test__audit.testview_c881718392d6c6212ed7047b4ea2f0c3]
   as 
    
    



select ofert_3
from "MASTER_BBVA"."DW"."dim_customer"
where ofert_3 is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_c881718392d6c6212ed7047b4ea2f0c3]
  
  ) dbt_internal_test;

  USE [TR_BI_BBVA];
  EXEC('drop view 

    [dbt_test__audit.testview_c881718392d6c6212ed7047b4ea2f0c3]
  ;')