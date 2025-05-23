
  
    USE [DBT_ARTIFACTS];
    USE [DBT_ARTIFACTS];
    
    

    

    
    USE [DBT_ARTIFACTS];
    EXEC('
        create view "artifacts"."stg_dbt__artifacts__dbt_tmp__dbt_tmp_vw" as with base as (

    select *
    from "TR_BI_BBVA"."dbt_artifacts"."artifacts"

),

fields as (

    select
        data:metadata:invocation_id::string as command_invocation_id,
        data:metadata:env:DBT_CLOUD_RUN_ID::int as dbt_cloud_run_id,
        generated_at,
        path,
        artifact_type,
        data
    from base

),

deduped as (

    select
        *,
        row_number() over (
            partition by command_invocation_id, artifact_type
            order by generated_at desc
        ) as index
    from fields
    qualify index = 1

),

artifacts as (

    select
        command_invocation_id,
        dbt_cloud_run_id,
        generated_at,
        path,
        artifact_type,
        data
    from deduped

)

select * from artifacts;
    ')

EXEC('
            SELECT * INTO "DBT_ARTIFACTS"."artifacts"."stg_dbt__artifacts__dbt_tmp" FROM "DBT_ARTIFACTS"."artifacts"."stg_dbt__artifacts__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS artifacts.stg_dbt__artifacts__dbt_tmp__dbt_tmp_vw')



    
    use [DBT_ARTIFACTS];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'artifacts_stg_dbt__artifacts__dbt_tmp_cci'
        AND object_id=object_id('artifacts_stg_dbt__artifacts__dbt_tmp')
    )
    DROP index "artifacts"."stg_dbt__artifacts__dbt_tmp".artifacts_stg_dbt__artifacts__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX artifacts_stg_dbt__artifacts__dbt_tmp_cci
    ON "artifacts"."stg_dbt__artifacts__dbt_tmp"

   


  