
    
    

select
    PeriodKey as unique_field,
    count(*) as n_records

from "MASTER_BBVA"."DW"."dim_tiempo"
where PeriodKey is not null
group by PeriodKey
having count(*) > 1


