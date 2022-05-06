WITH source_region AS (
    SELECT * FROM {{ source('learning_database', 'region') }}
)
SELECT
    R_REGIONKEY as region_key,
    R_NAME as name,
    R_COMMENT as comment
FROM source_region