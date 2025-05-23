
  
  

  
  USE [TR_BI_BBVA];
  EXEC('create view 

    [dbt_test__audit.testview_10d67616e4d0691e2dfece5c39308489]
   as 
    
    



select ofert_2
from "MASTER_BBVA"."DW"."dim_customer"
where ofert_2 is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_10d67616e4d0691e2dfece5c39308489]
  
  ) dbt_internal_test;

  USE [TR_BI_BBVA];
  EXEC('drop view 

    [dbt_test__audit.testview_10d67616e4d0691e2dfece5c39308489]
  ;')