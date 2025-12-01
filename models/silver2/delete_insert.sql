{{
    config(
        materialized='incremental',
        unique_key='order_id',
        incremental_strategy='delete+insert'
    )
}}

SELECT
  order_id,
  customer_id,
  order_date,
  order_status,
  amount
FROM {{ source('raw_cust', 'orders') }}

{% if is_incremental() %}
-- Filters only recent records during incremental run (e.g., last  days)
-- Reduces data scanned and speeds up merge performance
WHERE order_date >= dateadd(day, -30, current_date)
{% endif %}