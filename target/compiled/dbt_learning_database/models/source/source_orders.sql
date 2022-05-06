WITH source_orders AS (
    SELECT * FROM learning_database.raw.raw_orders
)
SELECT
    O_ORDERKEY as order_key,
    O_CUSTKEY as customer_key,
    O_ORDERSTATUS as order_status,
    O_TOTALPRICE as total_price,
    O_ORDERDATE as order_date,
    O_ORDERPRIORITY as order_priority,
    O_CLERK as clerk,
    O_SHIPPRIORITY as shipping_priority,
    O_COMMENT as comment
FROM
 source_orders