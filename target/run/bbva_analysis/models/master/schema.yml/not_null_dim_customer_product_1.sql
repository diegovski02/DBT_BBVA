
  
  

  
  USE [TR_BI_BBVA];
  EXEC('create view 

    [dbt_test__audit.testview_0889b73b014446460230c0908882eb98]
   as 
    
    



select product_1
from "MASTER_BBVA"."DW"."dim_customer"
where product_1 is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_0889b73b014446460230c0908882eb98]
  
  ) dbt_internal_test;

  USE [TR_BI_BBVA];
  EXEC('drop view 

    [dbt_test__audit.testview_0889b73b014446460230c0908882eb98]
  ;')