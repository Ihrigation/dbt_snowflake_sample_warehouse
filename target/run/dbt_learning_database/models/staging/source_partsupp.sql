
  create or replace  view learning_database.dev.source_partsupp 
  
   as (
    WITH source_partsupp AS (
    SELECT * FROM learning_database.raw.raw_partsupp
)
SELECT
    PS_PARTKEY as part_key,
    PS_SUPPKEY as supplier_key,
    PS_AVAILQTY as available_quantity,
    PS_SUPPLYCOST as supply_cost,
    PS_COMMENT as comment
FROM source_partsupp
  );
