
  
    USE [STG_BBVA];
    USE [STG_BBVA];
    
    

    

    
    USE [STG_BBVA];
    EXEC('
        create view "stg"."stg_digital_activity__dbt_tmp__dbt_tmp_vw" as 

select
    cast(ID as varchar(64)) as ID,
    cast(period as varchar(32)) as period,
    month,
    dig_1,
    dig_2,
    dig_3,
    dig_4,
    dig_5,
    dig_6,
    dig_7,
    dig_8,
    dig_9,
    dig_10,
    dig_11
from "TR_BI_BBVA"."dbo"."Digital_Activity"
where ID is not null;;
    ')

EXEC('
            SELECT * INTO "STG_BBVA"."stg"."stg_digital_activity__dbt_tmp" FROM "STG_BBVA"."stg"."stg_digital_activity__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS stg.stg_digital_activity__dbt_tmp__dbt_tmp_vw')



    
    use [STG_BBVA];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'stg_stg_digital_activity__dbt_tmp_cci'
        AND object_id=object_id('stg_stg_digital_activity__dbt_tmp')
    )
    DROP index "stg"."stg_digital_activity__dbt_tmp".stg_stg_digital_activity__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX stg_stg_digital_activity__dbt_tmp_cci
    ON "stg"."stg_digital_activity__dbt_tmp"

   


  