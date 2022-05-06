WITH  __dbt__cte__source_partsupp as (
WITH source_partsupp AS (
    SELECT * FROM learning_database.raw.raw_partsupp
)
SELECT
    PS_PARTKEY as part_key,
    PS_SUPPKEY as supplier_key,
    PS_AVAILQTY as available_quantity,
    PS_SUPPLYCOST as supply_cost,
    PS_COMMENT as comment
FROM
 source_partsupp
),  __dbt__cte__source_part as (
WITH source_part AS (
    SELECT * FROM learning_database.raw.raw_part
)
SELECT
    P_PARTKEY as part_key,
    P_NAME as name,
    P_MFGR as mfgr,
    P_BRAND as brand,
    P_TYPE as type,
    P_SIZE as size,
    P_CONTAINER as container,
    P_RETAILPRICE as retail_price,
    P_COMMENT as comment
FROM
 source_part
),  __dbt__cte__source_supplier as (
WITH source_supplier AS (
    SELECT * FROM learning_database.raw.raw_supplier
)
SELECT
    S_SUPPKEY as supplier_key,
    S_NAME as name,
    S_ADDRESS as address,
    S_NATIONKEY as nation_key,
    S_PHONE as phone,
    S_ACCTBAL as account_balance,
    S_COMMENT as comment
FROM
 source_supplier
),partsupp AS (
    SELECT
    *
    FROM
    __dbt__cte__source_partsupp
),
part AS (
    SELECT
    *
    FROM
    __dbt__cte__source_part
),
supplier AS (
    SELECT
    *
    FROM
    __dbt__cte__source_supplier
)
SELECT
ps.part_key,
ps.supplier_key,
ps.available_quantity,
ps.supply_cost,
initcap(p.name) as part_name,
split_part(p.mfgr, '#', -1) as part_manufacturer_id,
split_part(brand, '#', -1) as part_brand_id,
initcap(p.type) as part_type,
initcap(p.container) as part_container,
p.retail_price as part_retail_price,
initcap(s.name) as supplier_name,
s.address as supplier_address,
s.nation_key as supplier_nation_key,
s.account_balance as supplier_account_balance
FROM source_partsupp ps
left join source_part p
    on ps.part_key = p.part_key
left join source_supplier s
    on ps.supplier_key = s.supplier_key