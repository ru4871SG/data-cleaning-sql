SELECT DISTINCT ride_id, rideable_type, started_at, ended_at, TRIM(start_station_name) AS start_station_name, TRIM(end_station_name) AS end_station_name, start_station_id, end_station_id, start_lat, start_lng, end_lat, end_lng, TRIM(member_casual) AS member_casual, ride_length, total_seconds, day_of_week 
FROM (SELECT *, 
      (hour * 3600) + (minute * 60) + second AS total_seconds
      FROM `project-name.divvy_case_study.divvy_2022_precleaned` 
)
  AS with_total_seconds
WHERE total_seconds >=60 
  AND start_station_name IS NOT NULL
  AND start_station_id IS NOT NULL
  AND end_station_name IS NOT NULL
  AND end_station_id IS NOT NULL
  AND ride_id IS NOT NULL
  AND rideable_type IS NOT NULL
  AND started_at IS NOT NULL
  AND ended_at IS NOT NULL
  AND start_lat IS NOT NULL
  AND start_lng IS NOT NULL
  AND end_lat IS NOT NULL
  AND end_lng IS NOT NULL
  AND member_casual IS NOT NULL
  AND UPPER(start_station_name) != start_station_name
  AND UPPER(end_station_name) != end_station_name
  AND UPPER(start_station_name) NOT LIKE '%TEST%'
  AND UPPER(end_station_name) NOT LIKE '%TEST%'
  AND UPPER(start_station_id) NOT LIKE '%TEST%'
  AND UPPER(end_station_id) NOT LIKE '%TEST%'
ORDER BY started_at

-- Save the result as a new BigQuery table "divvy_2022_postcleaned"