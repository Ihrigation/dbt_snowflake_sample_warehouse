WITH 
orders AS (
    SELECT *
    FROM {{ ref('source_orders') }}
)
SELECT
    order_key,
    customer_key,
    order_status AS order_status_id,
    CASE 
        WHEN order_status = 'O' THEN 'Ordered'
        WHEN order_status = 'F' THEN 'Fulfilled'
        WHEN order_status = 'P' THEN 'Partial'
        ELSE 'Unknown'
    END AS order_status,    
    total_price,
    order_date AS order_date_raw,
    TO_VARCHAR(order_date, 'mm/dd/yyyy') AS order_date_formatted,
    SPLIT_PART(order_priority, '-', 1)AS order_priority_id,
    SPLIT_PART(order_priority, '-', -1)AS order_priority,
    SPLIT_PART(clerk, '#', -1) AS clerk_id,
    shipping_priority
FROM orders