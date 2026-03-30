with pedidos_detalhados as (
    select * from {{ ref('int_detailed_orders') }}
),

clientes as (
    select * from {{ ref('dim_customers') }}
),

calendario as (
    select * from {{ ref('dim_calendar') }}
),

final as (
    select
        p.id_pedido,
        p.id_cliente,
        c.id_unico_cliente,
        c.cliente_cidade,
        c.cliente_estado,
        c.cliente_regiao,
        p.pedido_status,
        p.pedido_data_compra,
        p.pedido_data_entrega_cliente,
        cal.ano as pedido_ano,
        cal.mes_nome as pedido_mes,
        cal.eh_final_semana as pedido_no_fds,
        p.dias_para_entrega,
        p.total_itens,
        p.total_frete,
        p.valor_total_pedido,
        p.qtd_itens_total
    from pedidos_detalhados p
    left join clientes c on p.id_cliente = c.id_cliente_pedido
    left join calendario cal 
        -- Convertendo para DATE para garantir que o join com id_data funcione
    on cast(p.pedido_data_compra as date) = cal.id_data
)

select * from final