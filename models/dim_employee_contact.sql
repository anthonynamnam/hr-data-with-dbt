{{ config(materialized='view') }} -- Create as a View

SELECT 
    employee_id, 
    first_name, 
    last_name, 
    phone_number, 
    email

FROM  
    {{ source('hr', 'employees') }} 
    -- Refer to the source file (source_name: hr & table_name: employees)