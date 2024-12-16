WITH airports_reorder AS (
    SELECT faa
    	   ,name
    	   ,lat
           ,lon
           ,alt
           ,tz
           ,dst
           ,city
    FROM {{ref('staging_airports')}}
    WHERE faa IN ('MSY', 'BTR', 'MIA')
)
SELECT * FROM airports_reorder