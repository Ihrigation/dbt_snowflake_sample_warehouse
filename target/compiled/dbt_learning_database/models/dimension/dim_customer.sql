WITH  __dbt__cte__source_customer as (
WITH source_customer AS (
    SELECT * FROM learning_database.raw.raw_customer
)
SELECT
    C_CUSTKEY as customer_key,
    C_NAME as name,
    C_ADDRESS as address,
    C_NATIONKEY as nation_key,
    C_PHONE as phone,
    C_ACCTBAL as account_balance,
    C_MKTSEGMENT as market_segment,
    C_COMMENT as comment
FROM
 source_customer
),customer AS (
    SELECT
    *
    FROM
    __dbt__cte__source_customer
)
SELECT
    RTRIM(customer_key, 9) as customer_key,
    name,
    address,
    nation_key,
    phone,
    account_balance,
    market_segment,
FROM
nation n
LEFT JOIN region r
ON n.region_key = r.region_key