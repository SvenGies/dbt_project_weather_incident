{{ config(materialized='view') }}

SELECT 
*
FROM s_svengiesbrecht.flights_all ff 