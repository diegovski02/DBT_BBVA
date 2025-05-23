{{ config(materialized='table') }}

select
    c.CustomerKey,
    p.PeriodKey,
    d.dig_1, 
    d.dig_2, 
    d.dig_3, 
    d.dig_4, 
    d.dig_5, 
    d.dig_6, 
    d.dig_7, 
    d.dig_8, 
    d.dig_9, 
    d.dig_10, 
    d.dig_11,
    b.balance_amount, 
    b.days_default,
    l.product_1 as debt_product_1, 
    l.product_2 as debt_product_2,
    m.type_1 as movements_type_1,
    m.type_2 as movements_type_2,
    m.type_3 as movements_type_3,
    m.type_4 as movements_type_4,
    ss.target
from {{ ref('stg_digital_activity') }} as d
join {{ ref('dim_customer') }} as c on d.ID = c.CustomerKey
join {{ ref('dim_tiempo') }} as p on d.period = p.period_code
left join {{ ref('stg_liabilities') }} as l on d.ID = l.PeriodKey
left join {{ ref('stg_movements') }} as m on d.ID = m.ID
left join {{ ref('stg_sample_submission') }} as ss on d.ID = ss.ID
left join {{ ref('stg_balances') }} as b on d.ID = b.ID
