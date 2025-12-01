{{
    config(
        materialized='view'
        secure=true
    )
}}
select * from {{ ref('delivery_info') }}