WITH source_region AS (
    SELECT * FROM learning_database.raw.raw_region
)
SELECT
    R_REGIONKEY as region_key,
    R_NAME as name,
    R_COMMENT as comment
FROM source_region