with source as (
    select * from {{ source('olist', 'raw_products') }}
),

renamed as (
    select
        product_id as id_produto,
        coalesce(product_category_name,'nao_informado') as categoria_nome,
        coalesce(safe_cast(product_weight_g as int64), 0) as peso_gramas,
        coalesce(safe_cast(product_length_cm as float64), 0) as comprimento_cm,
        coalesce(safe_cast(product_height_cm as float64), 0) as altura_cm,
        coalesce(safe_cast(product_width_cm as float64), 0) as largura_cm

    from source
    where product_id != 'product_id'
)

select * from renamed