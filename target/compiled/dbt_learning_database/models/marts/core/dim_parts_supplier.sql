WITH 
partsupp AS (
    SELECT *
    FROM learning_database.dev.source_partsupp
),
part AS (
    SELECT *
    FROM learning_database.dev.source_part
),
supplier AS (
    SELECT*
    FROM learning_database.dev.source_supplier
)
SELECT
    ps.part_key,
    ps.supplier_key,
    ps.available_quantity,
    ps.supply_cost,
    INITCAP(p.name) AS part_name,
    SPLIT_PART(p.mfgr, '#', -1) AS part_manufacturer_id,
    SPLIT_PART(brand, '#', -1) AS part_brand_id,
    INITCAP(p.type) AS part_type,
    INITCAP(p.container) AS part_container,
    p.retail_price AS part_retail_price,
    INITCAP(s.name) AS supplier_name,
    s.address AS supplier_address,
    s.nation_key AS supplier_nation_key,
    s.account_balance AS supplier_account_balance
FROM source_partsupp ps
LEFT JOIN source_part p
    ON ps.part_key = p.part_key
LEFT JOIN source_supplier s
    ON ps.supplier_key = s.supplier_key