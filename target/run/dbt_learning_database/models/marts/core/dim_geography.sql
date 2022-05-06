

      create or replace transient table learning_database.dev.dim_geography  as
      (WITH 
nation AS (
    SELECT *
    FROM learning_database.dev.source_nation
),
region AS (
    SELECT *
    FROM learning_database.dev.source_region
)
SELECT
    n.nation_key,
    n.name as nation_name,
    n.region_key,
    r.name as region_name
FROM nation n
LEFT JOIN region r
    ON n.region_key = r.region_key
      );
    