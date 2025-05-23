
  
    USE [MASTER_BBVA];
    USE [MASTER_BBVA];
    
    

    

    
    USE [MASTER_BBVA];
    EXEC('
        create view "DW"."dim_tiempo__dbt_tmp__dbt_tmp_vw" as 

select
    p.PeriodKey as PeriodKey,
    p.period_code as period_code,
    p.month as month
from "STG_BBVA"."stg"."stg_liabilities" as p;
    ')

EXEC('
            SELECT * INTO "MASTER_BBVA"."DW"."dim_tiempo__dbt_tmp" FROM "MASTER_BBVA"."DW"."dim_tiempo__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS DW.dim_tiempo__dbt_tmp__dbt_tmp_vw')



    
    use [MASTER_BBVA];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'DW_dim_tiempo__dbt_tmp_cci'
        AND object_id=object_id('DW_dim_tiempo__dbt_tmp')
    )
    DROP index "DW"."dim_tiempo__dbt_tmp".DW_dim_tiempo__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX DW_dim_tiempo__dbt_tmp_cci
    ON "DW"."dim_tiempo__dbt_tmp"

   


  