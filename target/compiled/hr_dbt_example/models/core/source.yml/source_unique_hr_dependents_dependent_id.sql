
    
    

select
    dependent_id as unique_field,
    count(*) as n_records

from `hr`.`dependents`
where dependent_id is not null
group by dependent_id
having count(*) > 1


