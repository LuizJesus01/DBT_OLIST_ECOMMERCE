/*snapshot para criar o historico de mudanca de endereco
do cliente, ele cria um schema proprio*/

{% snapshot snsh_customers %}

{{
    config(
      target_database='olist-project-491122',
      target_schema='snapshots',
      unique_key='id_unico_cliente',
      strategy='check',
      check_cols=['cliente_cep_prefixo', 'cliente_cidade', 'cliente_estado'],
    )
}}

select * from {{ ref('dim_customers') }}

{% endsnapshot %}
