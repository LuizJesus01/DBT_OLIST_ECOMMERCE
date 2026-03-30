{% macro convert_to_brl(column_name, conversion_rate=1.0) %}

    -- Multiplica o valor pela taxa e arredonda para 2 casas decimais
    round(
        safe_cast({{ column_name }} as float64) * {{ conversion_rate }}, 
        2
    )

{% endmacro %}
