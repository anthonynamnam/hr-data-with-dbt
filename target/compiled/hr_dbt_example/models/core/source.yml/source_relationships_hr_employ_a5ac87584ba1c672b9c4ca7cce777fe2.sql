
    
    

with child as (
    select employee_id as from_field
    from `hr`.`employees`
    where employee_id is not null
),

parent as (
    select job_id as to_field
    from `hr`.`jobs`
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


