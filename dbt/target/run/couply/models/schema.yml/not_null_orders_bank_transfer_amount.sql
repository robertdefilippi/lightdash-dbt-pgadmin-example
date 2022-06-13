select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select bank_transfer_amount
from "postgres"."analytics"."orders"
where bank_transfer_amount is null



      
    ) dbt_internal_test