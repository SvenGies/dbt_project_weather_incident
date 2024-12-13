WITH hourly_data AS (
    SELECT * 
    FROM {{ref('staging_weather_hourly')}}
),
add_features AS (
    SELECT *
		, timestamp::DATE AS date -- only time (hours:minutes:seconds) as TIME data type
		, timestamp::TIME AS time -- only time (hours:minutes:seconds) as TIME data type
        , TO_CHAR(timestamp,'HH24:MI') as hour -- time (hours:minutes) as TEXT data type
        , TO_CHAR(timestamp, 'FMmonth') AS month_name -- month name as a text
        , to_char(timestamp, 'Day') AS weekday -- weekday name as text        
        , DATE_PART('day', timestamp) AS date_day
		, date_part('month', timestamp) AS date_month
		, date_part('year', timestamp) AS date_year
		, date_part('week', timestamp) AS cw
    FROM hourly_data
),
add_more_features AS (
    SELECT *
		,(CASE 
			WHEN time BETWEEN time '00:00:00' AND time '06:00:00' THEN 'night'
			WHEN time BETWEEN time '06:00:00' AND time '18:00:00' THEN 'day'
			WHEN time BETWEEN time '06:00:00' AND time '00:00:00' THEN 'evening'
		END) AS day_part
    FROM add_features
)
SELECT *
FROM add_more_features