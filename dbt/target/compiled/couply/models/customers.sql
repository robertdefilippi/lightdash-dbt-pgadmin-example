with customers as (

    select * from "postgres"."analytics"."stg_customers"

),

orders as (

    select * from "postgres"."analytics"."stg_orders"

),

payments as (

    select * from "postgres"."analytics"."stg_payments"

),

customer_orders as (

  select
      customer_id,

      min(order_date) as first_order,
      max(order_date) as most_recent_order,
      count(order_id) as number_of_orders,
      sum(case when status = 'returned' then 1 else 0 end) as number_of_returned_orders,
      sum(case when status = 'completed' then 1 else 0 end) as number_of_completed_orders,
      MAX(order_date) - MIN(order_date) as customer_lifetime_age

  from orders

  group by 1

),

customer_payments as (

  select
      orders.customer_id,
      sum(amount) as total_amount

  from payments

  left join orders using (order_id)

  group by 1

),

final as (

  select
      customers.customer_id,
      customers.first_name,
      customers.last_name,
      customers.full_name,
      customer_orders.first_order,
      customer_orders.most_recent_order,
      customer_orders.number_of_orders,
      customer_orders.number_of_completed_orders,
      customer_orders.number_of_returned_orders,
      customer_payments.total_amount as customer_lifetime_value,
      customer_orders.customer_lifetime_age


  from customers

  left join customer_orders using (customer_id)

  left join customer_payments using (customer_id)

)

select * from final