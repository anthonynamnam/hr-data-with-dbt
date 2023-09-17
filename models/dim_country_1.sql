{{ config(materialized='table') }} -- Create as a Table

SELECT 
    *
FROM  
    {{ source('hr', 'countries') }}
    -- Refer to the source file (source_name: hr & table_name: countries) 
WHERE
    region_id = 1