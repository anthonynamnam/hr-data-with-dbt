{% test assert_email(model, column_name) %}

select {{column_name}}
from {{model}}
where NOT {{column_name}} regexp '.*@.*(.com|.gov|.org)'

{% endtest %}