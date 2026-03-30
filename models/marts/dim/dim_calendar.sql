with datas as (
    -- Gera uma sequência de datas de 2016 a 2019 (período da Olist)
    select *
    from unnest(generate_date_array('2016-01-01', '2019-12-31', interval 1 day)) as data_dia
),

final as (
    select
        data_dia as id_data,
        extract(year from data_dia) as ano,
        extract(month from data_dia) as mes,
        extract(day from data_dia) as dia,
        extract(dayofweek from data_dia) as dia_semana,
        -- Nome do mês para o Dashboard
        format_date('%B', data_dia) as mes_nome,
        -- Identificador de Final de Semana
        case 
            when extract(dayofweek from data_dia) in (1, 7) then true 
            else false 
        end as eh_final_semana
    from datas
)

select * from final