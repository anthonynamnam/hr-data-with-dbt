
    
    

with child as (
    select region_id as from_field
    from `hr`.`countries`
    where region_id is not null
),

parent as (
    select region_id as to_field
    from `hr`.`regions`
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


