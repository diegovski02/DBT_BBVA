
    
    



select command_invocation_id
from "DBT_ARTIFACTS"."artifacts"."fct_dbt__run_results"
where command_invocation_id is null


