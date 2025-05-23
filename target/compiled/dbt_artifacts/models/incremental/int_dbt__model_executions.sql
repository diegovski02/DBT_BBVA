

with model_executions as (

    select *
    from "DBT_ARTIFACTS"."artifacts"."stg_dbt__model_executions"

),

model_executions_incremental as (

    select *
    from model_executions

    

),

fields as (

    select
        model_execution_id,
        command_invocation_id,
        dbt_cloud_run_id,
        artifact_generated_at,
        was_full_refresh,
        node_id,
        thread_id,
        status,
        compile_started_at,
        query_completed_at,
        total_node_runtime,
        rows_affected
    from model_executions_incremental

)

select * from fields