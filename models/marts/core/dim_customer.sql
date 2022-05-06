WITH 
customer AS (
    SELECT *
    FROM {{ ref('source_customer') }}
)
SELECT
    customer_key AS customer_key,
    split_part(NAME, '#', 2) AS NAME,
    address,
    nation_key,
    right(phone, 12) AS phone_number,
    account_balance,
    initcap(market_segment) AS market_segment
FROM customer