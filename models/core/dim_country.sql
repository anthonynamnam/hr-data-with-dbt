{{ config(materialized='table') }}

SELECT *
FROM  {{ source('hr', 'countries') }}