{{ config(materialized='table') }}

select
    p.PeriodKey as PeriodKey,
    p.period_code as period_code,
    p.month as month
from {{ ref('stg_liabilities') }} as p
