SELECT
	mrs.flight_date
	,mrs.origin
	,mrs.origin_city
	,mrs.origin_airport
	,mrs.dest
	,mrs.dest_city
	,mrs.dest_airport
	,mrs.avg_delay
	,mrs.max_delay
	,mrs.min_delay
	,mrs.cancelled_tot
	,mrs.diverted_tot
	,pwd.avg_temp_c
	,pwd.min_temp_c
	,pwd.max_temp_c
	,pwd.precipitation_mm
	,pwd.avg_wind_direction
	,pwd.avg_wind_speed_kmh
	,pwd.avg_pressure_hpa
FROM {{ref('mart_route_stats')}} mrs 
JOIN {{ref('prep_weather_daily')}} pwd 
  ON mrs.origin = pwd.airport_code