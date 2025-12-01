-- Functional Requirements:
-- 1. Fetch customer and product-related information.
-- 2. Join the CUSTOMER table from `raw_data` with the PRODUCT table from `prod_data`.
-- 3. Use CUSTOMER_ID as the join key between the two tables.
-- 4. Select the following fields:
--    - From CUSTOMER: CUSTOMER_ID, FIRST_NAME, LAST_NAME, EMAIL
--    - From PRODUCT: PRODUCT_ID, PRODUCT_NAME, CATEGORY, PRICE, PURCHASE_DATE

SELECT
    *
    from  
{{ ref('customer_info') }} c
join 
{{ ref('prod_info') }} p 
on c.cust_id=p.customer_id