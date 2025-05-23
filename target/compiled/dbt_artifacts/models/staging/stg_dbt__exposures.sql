with base as (

    select *
    from "DBT_ARTIFACTS"."artifacts"."stg_dbt__artifacts"

),

manifests as (

    select *
    from base
    where artifact_type = 'manifest.json'

),

flatten as (

    select
        command_invocation_id,
        dbt_cloud_run_id,
        generated_at as artifact_generated_at,
        node.key as node_id,
        node.value:name::string as name,
        to_array(node.value:depends_on:nodes) as depends_on_nodes,
        to_array(node.value:sources:nodes) as depends_on_sources,
        node.value:type::string as type,
        node.value:owner:name::string as owner,
        node.value:maturity::string as maturity,
        node.value:package_name::string as package_name
    from manifests,
    lateral flatten(input => data:exposures) as node

),

surrogate_key as (

    select
        md5(cast(coalesce(cast(command_invocation_id as 
    string
), '') || '-' || coalesce(cast(node_id as 
    string
), '') as 
    string
)) as manifest_model_id,
        command_invocation_id,
        dbt_cloud_run_id,
        artifact_generated_at,
        node_id,
        name,
        depends_on_nodes,
        depends_on_sources,
        type,
        owner,
        maturity,
        package_name
    from flatten

)

select * from surrogate_key