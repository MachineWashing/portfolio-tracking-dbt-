{% test not_empty(model,column_name) -%}
WITH
validation_errors as (
    SELECT {{column_name}}
    FROM {{ model }}
    WHEN LEN ({{column_name}}) = 0
)
SSELECT * FROM validation_errors

{%- endtest %}