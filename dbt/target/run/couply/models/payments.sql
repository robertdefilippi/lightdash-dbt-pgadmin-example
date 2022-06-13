
  create view "postgres"."analytics"."payments__dbt_tmp" as (
    select * from "postgres"."analytics"."stg_payments"
  );