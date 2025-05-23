

select
    cast(ID as varchar(64)) as ID,
    cast(period as varchar(32)) as period,
    target
from "TR_BI_BBVA"."dbo"."Sample_Submission"
where ID is not null;