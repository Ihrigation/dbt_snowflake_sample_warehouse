WITH source_supplier AS (
    SELECT * FROM {{ source('learning_database', 'supplier') }}
)
SELECT
    S_SUPPKEY as supplier_key,
    S_NAME as name,
    S_ADDRESS as address,
    S_NATIONKEY as nation_key,
    S_PHONE as phone,
    S_ACCTBAL as account_balance,
    S_COMMENT as comment
FROM source_supplier