
    
    

select
    manifest_model_id || '-' || output_feeds as unique_field,
    count(*) as n_records

from "DBT_ARTIFACTS"."artifacts"."dim_dbt__exposures"
where manifest_model_id || '-' || output_feeds is not null
group by manifest_model_id || '-' || output_feeds
having count(*) > 1


