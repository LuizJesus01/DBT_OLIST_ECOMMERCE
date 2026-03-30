with source as (
    select * from {{ source('olist', 'raw_order_items') }}
),

renamed as (
    select
        order_id as id_pedido,
        product_id as id_produto,
        seller_id as id_vendedor,
        safe_cast(order_item_id as int64) as item_sequencial,
        safe_cast(shipping_limit_date as datetime) as data_limite_envio,
        {{ convert_to_brl('price') }}  as preco_unitario,
        {{ convert_to_brl('freight_value', 5.50) }} as valor_frete

    from source
    where order_id != 'order_id'
)

select * from renamed