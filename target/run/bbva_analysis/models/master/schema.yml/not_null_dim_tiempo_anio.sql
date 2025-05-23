
  
  

  
  USE [TR_BI_BBVA];
  EXEC('create view 

    [dbt_test__audit.testview_d08a254d0877a4165c9625003ab6dfa2]
   as 
    
    



select anio
from "MASTER_BBVA"."DW"."dim_tiempo"
where anio is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_d08a254d0877a4165c9625003ab6dfa2]
  
  ) dbt_internal_test;

  USE [TR_BI_BBVA];
  EXEC('drop view 

    [dbt_test__audit.testview_d08a254d0877a4165c9625003ab6dfa2]
  ;')