
  
    USE [STG_BBVA];
    USE [STG_BBVA];
    
    

    

    
    USE [STG_BBVA];
    EXEC('
        create view "stg"."stg_sample_submission__dbt_tmp__dbt_tmp_vw" as 

select
    cast(ID as varchar(64)) as ID,
    cast(period as varchar(32)) as period,
    target
from "TR_BI_BBVA"."dbo"."Sample_Submission"
where ID is not null;;
    ')

EXEC('
            SELECT * INTO "STG_BBVA"."stg"."stg_sample_submission__dbt_tmp" FROM "STG_BBVA"."stg"."stg_sample_submission__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS stg.stg_sample_submission__dbt_tmp__dbt_tmp_vw')



    
    use [STG_BBVA];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'stg_stg_sample_submission__dbt_tmp_cci'
        AND object_id=object_id('stg_stg_sample_submission__dbt_tmp')
    )
    DROP index "stg"."stg_sample_submission__dbt_tmp".stg_stg_sample_submission__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX stg_stg_sample_submission__dbt_tmp_cci
    ON "stg"."stg_sample_submission__dbt_tmp"

   


  