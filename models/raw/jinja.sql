{%- set list=['snowflake','dbt','aws'] -%}

select tech from (
{%- for i in list -%}

    select '{{i}}' as tech
    {% if not loop.last %} UNION ALL {%endif%}
{% endfor %}
) as technology
