
    
    

select
    model_execution_id as unique_field,
    count(*) as n_records

from "DBT_ARTIFACTS"."artifacts"."fct_dbt__model_executions"
where model_execution_id is not null
group by model_execution_id
having count(*) > 1


