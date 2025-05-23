
    
    

select
    manifest_model_id as unique_field,
    count(*) as n_records

from "DBT_ARTIFACTS"."artifacts"."dim_dbt__models"
where manifest_model_id is not null
group by manifest_model_id
having count(*) > 1


