
    
    

select
    fecha_id as unique_field,
    count(*) as n_records

from "MASTER_BBVA"."DW"."dim_tiempo"
where fecha_id is not null
group by fecha_id
having count(*) > 1


