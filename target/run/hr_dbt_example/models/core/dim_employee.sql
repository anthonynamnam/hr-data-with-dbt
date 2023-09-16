
  create view `hr`.`dim_employee__dbt_tmp` as (
    

SELECT employee_id, first_name, last_name, phone_number
FROM  `hr`.`employees`
  );