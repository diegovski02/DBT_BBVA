

with models as (

    select *
    from "DBT_ARTIFACTS"."artifacts"."dim_dbt__models"

),

model_executions as (

    select *
    from "DBT_ARTIFACTS"."artifacts"."int_dbt__model_executions"

),

model_executions_incremental as (

    select *
    from model_executions

    

),

model_executions_with_materialization as (

    select
        model_executions_incremental.*,
        models.model_materialization,
        models.model_schema,
        models.name
    from model_executions_incremental
    left join models on
        (
            model_executions_incremental.command_invocation_id = models.command_invocation_id
            or model_executions_incremental.dbt_cloud_run_id = models.dbt_cloud_run_id
        )
        and model_executions_incremental.node_id = models.node_id

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
        rows_affected,
        model_materialization,
        model_schema,
        name
    from model_executions_with_materialization

)

select * from fields