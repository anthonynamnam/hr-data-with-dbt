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
    region_id as unique_field,
    count(*) as n_records

from `hr`.`regions`
where region_id is not null
group by region_id
having count(*) > 1



      
    ) dbt_internal_test