
  
    USE [STG_BBVA];
    USE [STG_BBVA];
    
    

    

    
    USE [STG_BBVA];
    EXEC('
        create view "stg"."stg_liabilities__dbt_tmp__dbt_tmp_vw" as 

select
    cast(ID as varchar(64)) as PeriodKey,
    cast(period as varchar(32)) as period_code,
    month,
    product_1,
    product_2
from "TR_BI_BBVA"."dbo"."Liabilities"
where ID is not null;;
    ')

EXEC('
            SELECT * INTO "STG_BBVA"."stg"."stg_liabilities__dbt_tmp" FROM "STG_BBVA"."stg"."stg_liabilities__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS stg.stg_liabilities__dbt_tmp__dbt_tmp_vw')



    
    use [STG_BBVA];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'stg_stg_liabilities__dbt_tmp_cci'
        AND object_id=object_id('stg_stg_liabilities__dbt_tmp')
    )
    DROP index "stg"."stg_liabilities__dbt_tmp".stg_stg_liabilities__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX stg_stg_liabilities__dbt_tmp_cci
    ON "stg"."stg_liabilities__dbt_tmp"

   


  