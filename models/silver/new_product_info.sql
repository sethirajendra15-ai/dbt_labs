{{
    config(
        materialized='ephemeral'
    )
}}
SELECT
    *
    from  
{{ ref('customer_info') }} c
join 
{{ ref('prod_info') }} p 
on c.cust_id=p.customer_id