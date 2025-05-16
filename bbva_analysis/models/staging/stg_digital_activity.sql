{{ config(materialized='table') }}

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
from {{ source('raw', 'Digital_Activity') }}
where ID is not null;
