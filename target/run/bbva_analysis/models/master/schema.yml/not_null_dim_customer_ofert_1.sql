
  
  

  
  USE [TR_BI_BBVA];
  EXEC('create view 

    [dbt_test__audit.testview_d792bbf1bf974c8571c9fde586be88e4]
   as 
    
    



select ofert_1
from "MASTER_BBVA"."DW"."dim_customer"
where ofert_1 is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_d792bbf1bf974c8571c9fde586be88e4]
  
  ) dbt_internal_test;

  USE [TR_BI_BBVA];
  EXEC('drop view 

    [dbt_test__audit.testview_d792bbf1bf974c8571c9fde586be88e4]
  ;')