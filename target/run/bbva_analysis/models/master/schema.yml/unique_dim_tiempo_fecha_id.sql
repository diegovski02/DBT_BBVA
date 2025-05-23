
  
  

  
  USE [TR_BI_BBVA];
  EXEC('create view 

    [dbt_test__audit.testview_b44fc1424d8c61d31f37bd698f94e2e8]
   as 
    
    

select
    fecha_id as unique_field,
    count(*) as n_records

from "MASTER_BBVA"."DW"."dim_tiempo"
where fecha_id is not null
group by fecha_id
having count(*) > 1


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_b44fc1424d8c61d31f37bd698f94e2e8]
  
  ) dbt_internal_test;

  USE [TR_BI_BBVA];
  EXEC('drop view 

    [dbt_test__audit.testview_b44fc1424d8c61d31f37bd698f94e2e8]
  ;')