select
      count(*) as failures,
      case
        when count(*) <> 0 then 'true'
        else 'false'
      end as should_warn,
      case
        when count(*) <> 0 then 'true'
        else 'false'
      end as should_error
    from (
      
    
    

select
    job_id as unique_field,
    count(*) as n_records

from `hr`.`jobs`
where job_id is not null
group by job_id
having count(*) > 1



      
    ) dbt_internal_test