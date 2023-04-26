{{ config(materialized='view', schema='staging') }}

SELECT org_login, count(1) as cnt
FROM {{ ref('dwh_days') }}
WHERE org_login is not null
GROUP BY org_login
ORDER BY 2 desc
