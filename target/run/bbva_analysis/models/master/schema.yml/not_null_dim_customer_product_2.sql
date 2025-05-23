
  
  

  
  USE [TR_BI_BBVA];
  EXEC('create view 

    [dbt_test__audit.testview_f58d9574668e05fbe07eedbc4ec89d2a]
   as 
    
    



select product_2
from "MASTER_BBVA"."DW"."dim_customer"
where product_2 is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_f58d9574668e05fbe07eedbc4ec89d2a]
  
  ) dbt_internal_test;

  USE [TR_BI_BBVA];
  EXEC('drop view 

    [dbt_test__audit.testview_f58d9574668e05fbe07eedbc4ec89d2a]
  ;')