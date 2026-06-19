WITH
current_from_snapshot as (
    select * EXCLUDE (DBT_SCD_ID, DBT_UPDATED_AT,
                           DBT_VALID_FROM, DBT_VALID_TO)
    from {{ref('SNSH_ABC_BANK_POSITION')}}
    where DBT_VALID_TO is null
)

select
    *,
    POSITION_VALUE - COST_BASE as UNREALIZED_PROFIT,
    ROUND(UNREALIZED_PROFIT / COST_BASE, 5) AS UNREALIZED_PROFIT_PCT
from current_from_snapshot


