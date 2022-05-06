

      create or replace transient table learning_database.dev.dim_geography  as
      (WITH  __dbt__cte__source_nation as (
WITH source_nation AS (
    SELECT * FROM learning_database.raw.raw_nation
)
SELECT
    N_NATIONKEY as nation_key,
    N_NAME	as name,
    N_REGIONKEY as region_key,
    N_COMMENT as comment
FROM
 source_nation
),  __dbt__cte__source_region as (
WITH source_region AS (
    SELECT * FROM learning_database.raw.raw_region
)
SELECT
    R_REGIONKEY as region_key,
    R_NAME as name,
    R_COMMENT as comment
FROM
 source_region
),nation AS (
    SELECT
    *
    FROM
    __dbt__cte__source_nation
),
region AS (
    SELECT
    *
    FROM
    __dbt__cte__source_region
)
SELECT
    n.nation_key,
    n.name as nation_name,
    n.region_key,
    r.name as region_name
FROM
nation n
LEFT JOIN region r
ON n.region_key = r.region_key
      );
    