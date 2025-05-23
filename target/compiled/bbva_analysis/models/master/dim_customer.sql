

select
    c.CustomerKey as CustomerKey,
    c.age as age,
    c.income as income,
    c.time_from_specialized as time_from_specialized,
    c.type_job as type_job,
    c.bureau_risk as bureau_risk,
    c.payroll as payroll,
    c.product_1 as product_1,
    c.product_2 as product_2,
    c.product_3 as product_3,
    c.product_4 as product_4,
    c.ofert_1 as ofert_1,
    c.ofert_2 as ofert_2,
    c.ofert_3 as ofert_3
from "STG_BBVA"."stg"."stg_customers" as c