{{ config(materialized='table') }}

select
    cast(ID as varchar(64)) as CustomerKey,
    age,
    income,
    time_from_specialized,
    type_job,
    bureau_risk,
    payroll,
    product_1,
    product_2,
    product_3,
    product_4,
    ofert_1,
    ofert_2,
    ofert_3
from {{ source('raw', 'Customers') }}
where ID is not null;
