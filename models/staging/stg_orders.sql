with source as (
    select * from {{ source('olist', 'raw_orders') }}
),

renamed as (
    select
        order_id as id_pedido,
        customer_id as id_cliente,
        order_status as pedido_status,
        safe_cast(order_purchase_timestamp as datetime) as pedido_data_compra,
        safe_cast(order_approved_at as datetime) as pedido_data_aprovado,
        safe_cast(order_delivered_carrier_date as datetime) as pedido_data_entrega_transportadora,
        safe_cast(order_delivered_customer_date as datetime) as pedido_data_entrega_cliente,
        safe_cast(order_estimated_delivery_date as datetime) as pedido_data_entrega_estimada

    from source
    where order_id != 'order_id'
)

select * from renamed