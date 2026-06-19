{{ config(materialized='table') }}

SELECT
    EXCHANGE_HKEY,
    EXCHANGE_CODE,
    EXCHANGE_NAME,
    COUNTRY,
    CITY,
    TRADING_HOURS,
    TIMEZONE
FROM {{ ref('ref_exchange') }}