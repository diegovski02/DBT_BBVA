

with dbt_models as (

    select * from "DBT_ARTIFACTS"."artifacts"."stg_dbt__models"

),

dbt_models_incremental as (

    select *
    from dbt_models

    

),

fields as (

    select
        manifest_model_id,
        command_invocation_id,
        dbt_cloud_run_id,
        artifact_generated_at,
        node_id,
        model_database,
        model_schema,
        name,
        depends_on_nodes,
        package_name,
        model_path,
        checksum,
        model_materialization
    from dbt_models_incremental

)

select * from fields