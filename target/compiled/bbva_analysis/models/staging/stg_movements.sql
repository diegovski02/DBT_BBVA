

select
    cast(ID as varchar(64)) as ID,
    cast(period as varchar(32)) as period,
    month,
    type_1,
    type_2,
    type_3,
    type_4
from "TR_BI_BBVA"."dbo"."Movements"
where ID is not null;