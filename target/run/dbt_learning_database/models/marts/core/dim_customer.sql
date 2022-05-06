

      create or replace transient table learning_database.dev.dim_customer  as
      (WITH 
customer AS (
    SELECT *
    FROM learning_database.dev.source_customer
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
      );
    