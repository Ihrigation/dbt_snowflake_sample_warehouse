
  create or replace  view learning_database.dev.my_second_dbt_model 
  
   as (
    -- Use the `ref` function to select from other models

select *
from learning_database.dev.my_first_dbt_model
where id = 1
  );
