

with dbt_sources as (

    select * from "DBT_ARTIFACTS"."artifacts"."stg_dbt__sources"

),

dbt_sources_incremental as (

    select *
    from dbt_sources

    

),

fields as (

    select
        manifest_source_id,
        command_invocation_id,
        dbt_cloud_run_id,
        artifact_generated_at,
        node_id,
        name,
        source_name,
        source_schema,
        package_name,
        relation_name,
        source_path
    from dbt_sources_incremental

)

select * from fields