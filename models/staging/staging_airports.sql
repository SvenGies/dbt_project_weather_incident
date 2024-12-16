{{ config(materialized='view') }}

SELECT * FROM s_svengiesbrecht.staging_airports sa 