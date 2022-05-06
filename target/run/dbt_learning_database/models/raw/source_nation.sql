
  create or replace  view learning_database.dev.source_nation 
  
   as (
    WITH raw_nation AS (
    SELECT * FROM learning_database.raw.raw_nation
)
SELECT
    N_NATIONKEY as nation_key,
    N_NAME	as name,
    N_REGIONKEY as region_key,
    N_COMMENT as comment
FROM
 raw_nation
  );
