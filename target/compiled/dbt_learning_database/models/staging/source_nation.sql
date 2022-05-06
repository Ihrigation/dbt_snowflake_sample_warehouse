WITH source_nation AS (
    SELECT * FROM learning_database.raw.raw_nation
)
SELECT
    N_NATIONKEY as nation_key,
    N_NAME	as name,
    N_REGIONKEY as region_key,
    N_COMMENT as comment
FROM source_nation