{{ config(materialized='table') }}

select
    cast(ID as varchar(64)) as ID,
    cast(period as varchar(32)) as period,
    cast(product as varchar(32)) as product,
    cast(entity as varchar(32)) as entity,
    month,
    type,
    balance_amount,
    days_default
from {{ source('raw', 'Balances') }}
where ID is not null;
