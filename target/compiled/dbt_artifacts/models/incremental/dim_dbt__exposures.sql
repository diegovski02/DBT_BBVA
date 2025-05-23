

with dbt_models as (

    select * from "DBT_ARTIFACTS"."artifacts"."stg_dbt__exposures"

),

dbt_models_incremental as (

    select *
    from dbt_models

    

),

fields as (

     select
        t.manifest_model_id,
        t.command_invocation_id,
        t.dbt_cloud_run_id,
        t.artifact_generated_at,
        t.node_id,
        t.name,
        t.type,
        t.owner,
        t.maturity,
        f.value::string as output_feeds,
        t.package_name
    from dbt_models_incremental as t,
    lateral flatten(input => depends_on_nodes) as f

)

select * from fields