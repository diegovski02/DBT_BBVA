

select
    p.PeriodKey as PeriodKey,
    p.period_code as period_code,
    p.month as month
from "STG_BBVA"."stg"."stg_liabilities" as p