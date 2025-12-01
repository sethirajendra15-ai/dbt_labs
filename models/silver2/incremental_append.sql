
{{
    config(
        materialized='incremental',
        incremental_strategy = 'append'
    )
}}
SELECT
  order_id,
  customer_id,
  order_date,
  order_status,
  amount
FROM {{ source('raw_cust','orders') }}


{% if is_incremental %}
where order_id > (select max(order_id) from {{ this }})
{% endif %}