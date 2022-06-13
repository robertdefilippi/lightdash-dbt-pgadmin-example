
  create view "postgres"."analytics"."stg_customers__dbt_tmp" as (
    with source as (
    select * from "postgres"."analytics"."raw_customers"

),

renamed as (

    select
        id as customer_id,
        first_name,
        last_name,
        first_name || ' ' || last_name as full_name

    from source

)

select * from renamed
  );