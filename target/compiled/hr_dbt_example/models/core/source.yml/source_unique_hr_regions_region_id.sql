
    
    

select
    region_id as unique_field,
    count(*) as n_records

from `hr`.`regions`
where region_id is not null
group by region_id
having count(*) > 1


