{{ config(materialized='view') }}

SELECT employee_id, first_name, last_name, phone_number, email
FROM  {{ source('hr', 'employees') }}