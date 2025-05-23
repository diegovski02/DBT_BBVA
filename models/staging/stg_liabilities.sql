{{ config(materialized='table') }}

select
    cast(ID as varchar(64)) as PeriodKey,
    cast(period as varchar(32)) as period_code,
    month,
    product_1,
    product_2
from {{ source('raw', 'Liabilities') }}
where ID is not null;
