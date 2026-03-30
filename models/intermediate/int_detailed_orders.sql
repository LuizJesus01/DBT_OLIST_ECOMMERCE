with orders as (
    select * from {{ ref('stg_orders') }}
)

, orders_items as (
    select * from {{ ref('stg_order_items') }}
)

, total_items_per_order as (
    select
        id_pedido,
        sum(preco_unitario) as total_itens,
        sum(valor_frete) as total_frete,
        sum(preco_unitario + valor_frete) as valor_total_pedido,
        count(id_produto) as qtd_itens_total
    from orders_items
    group by id_pedido
)

, final as (
    select
        p.id_pedido,
        p.id_cliente,
        p.pedido_status,
        p.pedido_data_compra,
        p.pedido_data_entrega_cliente,
        datetime_diff(p.pedido_data_entrega_cliente, p.pedido_data_compra, DAY) as dias_para_entrega,
        i.total_itens,
        i.total_frete,
        i.valor_total_pedido,
        i.qtd_itens_total
    from orders p
    inner join total_items_per_order i on p.id_pedido = i.id_pedido
)

select * from final