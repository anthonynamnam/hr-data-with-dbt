{% test assert_email(model, column_name) %}


select {{column_name}}
from {{ model }}
where NOT {{column_name}} regexp '[a-zA-Z0-9]*@[a-zA-Z0-9]*.(.org|.com)'

{% endtest %}