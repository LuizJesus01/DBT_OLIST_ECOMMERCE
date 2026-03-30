{% docs __overview__ %}

# Documentação Técnica: Projeto Olist

Bem-vindo ao dicionário de dados do DW Olist. 

### Estrutura de Camadas:
- **STAGING:** Tabelas `stg_` que refletem o dado bruto com limpeza de tipos.
- **INTERMEDIATE:** Lógicas de agregação financeira e cálculo de datas (SLA).
- **MARTS:** Tabelas Finais (`fct_` e `dim_`) modeladas em Star Schema para consumo em BI.

### Contato:
Responsável Técnico: Luiz (DBA & Analytics Engineer).

{% enddocs %}