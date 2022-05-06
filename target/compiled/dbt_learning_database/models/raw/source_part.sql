WITH raw_part AS (
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
 raw_part