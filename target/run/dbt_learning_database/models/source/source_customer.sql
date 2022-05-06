
  create or replace  view learning_database.dev.source_customer 
  
   as (
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
  );
