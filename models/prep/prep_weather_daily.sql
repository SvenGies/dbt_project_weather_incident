
WITH daily_data AS (
    SELECT * 
    FROM {{ref('staging_weather_daily')}}
),
add_features AS (
    SELECT *
		,date_part('day', date) AS date_day
		,date_part('month', date) AS date_month
		,date_part('year', date) AS date_year
		,date_part('week', date) AS cw
		,to_char(date, 'FMMonth') AS month_name
		,to_char(date, 'Day') AS weekday
    FROM daily_data 
)
SELECT *
FROM add_features
ORDER BY date