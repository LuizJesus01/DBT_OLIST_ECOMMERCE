with clientes as (
    select * from {{ ref('stg_customers') }}
),

final as (
    select
        id_cliente_pedido,
        id_unico_cliente,
        cliente_cep_prefixo,
        cliente_cidade,
        cliente_estado,
        cliente_regiao
    from clientes
)

select * from final
