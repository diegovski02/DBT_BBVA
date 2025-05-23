
  
  

  
  USE [TR_BI_BBVA];
  EXEC('create view 

    [dbt_test__audit.testview_fcd7ad804daa69b43007f0b7802f3fe6]
   as 
    
    



select product_3
from "MASTER_BBVA"."DW"."dim_customer"
where product_3 is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_fcd7ad804daa69b43007f0b7802f3fe6]
  
  ) dbt_internal_test;

  USE [TR_BI_BBVA];
  EXEC('drop view 

    [dbt_test__audit.testview_fcd7ad804daa69b43007f0b7802f3fe6]
  ;')