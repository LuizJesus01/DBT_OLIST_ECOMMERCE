with source as (
    select * from {{ source('olist', 'raw_customers') }}
),

renamed as (
    select
        customer_id as id_cliente_pedido,
        customer_unique_id as id_unico_cliente,
        customer_zip_code_prefix as cliente_cep_prefixo,
        customer_city as cliente_cidade,
        upper(customer_state) as cliente_estado,
        case 
            when customer_state in ('SP', 'RJ', 'MG', 'ES') then 'Sudeste'
            when customer_state in ('PR', 'SC', 'RS') then 'Sul'
            when customer_state in ('MT', 'MS', 'GO', 'DF') then 'Centro-Oeste'
            when customer_state in ('BA', 'PE', 'CE', 'RN', 'PB', 'AL', 'SE', 'MA', 'PI') then 'Nordeste'
            else 'Norte'
        end as cliente_regiao

    from source
)

select * from renamed
