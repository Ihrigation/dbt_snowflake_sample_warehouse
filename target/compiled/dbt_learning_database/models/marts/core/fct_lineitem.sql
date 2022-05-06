WITH 
lineitem AS (
    SELECT *
    FROM learning_database.dev.source_lineitem
)
SELECT 
    order_key,
    part_key,
    supplier_key,
    line_number,
    CAST(quantity AS INT) AS quantity,
    extended_price AS total_extended_price,
    SUM(TOTAL_EXTENDED_PRICE) OVER (PARTITION BY SHIP_DATE) AS overall_daily_extended_price,
    ROW_NUMBER() OVER (PARTITION BY ship_date ORDER BY total_extended_price DESC) AS daily_order_extended_price_rank,
    extended_price - (extended_price * discount) AS total_discounted_extended_price,
    CAST(extended_price / quantity AS NUMBER(12,2)) AS extended_price_per_unit,
    discount,
    tax	NUMBER,
    CASE 
        WHEN return_flag = 'R' THEN 'Returned'
        WHEN return_flag = 'N' THEN 'Not returned'
        WHEN return_flag = 'A' THEN 'Accepted'
        ELSE 'Unknown'
    END AS return_status,  
    CASE 
        WHEN line_status = 'O' THEN 'Ordered'
        WHEN line_status = 'F' THEN 'Fulfilled'
        ELSE 'Unknown'
    END AS line_status, 
    ship_date,
    TO_VARCHAR(ship_date, 'mm/dd/yyyy') AS ship_date_formatted,
    commit_date,	
    receipt_date,
    INITCAP(ship_instructions) AS ship_instructions,
    INITCAP(ship_mode) AS ship_mode
FROM lineitem