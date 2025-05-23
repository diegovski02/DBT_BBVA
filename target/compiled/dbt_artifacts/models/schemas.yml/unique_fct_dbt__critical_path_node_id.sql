
    
    

select
    node_id as unique_field,
    count(*) as n_records

from "DBT_ARTIFACTS"."artifacts"."fct_dbt__critical_path"
where node_id is not null
group by node_id
having count(*) > 1


